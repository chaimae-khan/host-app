<?php

namespace App\Http\Controllers;

use App\Models\Perte;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Unite;
use App\Models\Stock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Hashids\Hashids;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\User;

class PerteController extends Controller
{
    /**
     * Display a listing of pertes
     */
public function index(Request $request)
{
    if ($request->ajax()) {
        $user = Auth::user();
        
        $pertes = DB::table('pertes as pt')
            ->leftJoin('users as us', 'pt.id_user', '=', 'us.id')
            ->leftJoin('products as p', 'pt.id_product', '=', 'p.id')
            ->leftJoin('plats as pl', 'pt.id_plat', '=', 'pl.id')
            ->whereNull('pt.deleted_at');  // ✅ Filter out soft-deleted pertes
        
        // ✅ Role-based filtering
        if ($user->hasRole('Chargé d\'inventaire')) {
            // Show only pertes with reference starting with PSNAL (non-alimentaire stock)
            $pertes->where('pt.reference', 'LIKE', 'PSNAL%');
        } elseif ($user->hasRole('Directeur des études')) {
            // Show only pertes with nature = 'produit fini'
            $pertes->where('pt.nature', 'produit fini');
        }
        
        $pertes = $pertes->select(
                'pt.id',
                'pt.reference',
                'pt.nature',
                'pt.classe',
                'pt.quantite',
                'pt.nombre_plats',
                'pt.cout_total',
                'pt.date_perte',
                'pt.status',
                'pt.cause',
                'pt.circonstances',
                'pt.created_at',
                DB::raw('CONCAT(us.prenom, " ", us.nom) as username'),
                DB::raw('COALESCE(p.name, pl.name, pt.designation) as designation')
            )
            ->orderBy('pt.created_at', 'desc');

        return DataTables::of($pertes)
            ->addColumn('status_badge', function ($perte) {
                $statusColors = [
                    'Création' => 'secondary',
                    'Visa Directeur' => 'info',
                    'Visa Chargé' => 'info',
                    'Visa Économe' => 'primary',
                    'Validé' => 'success',
                    'Visa Magasinier' => 'warning',
                    'Refusé' => 'danger',
                    'Annuler' => 'dark'
                ];
                
                $color = $statusColors[$perte->status] ?? 'secondary';
                return '<span class="badge bg-' . $color . '">' . $perte->status . '</span>';
            })
            ->addColumn('action', function ($perte) {
                $hashids = new \Hashids\Hashids();
                $encodedId = $hashids->encode($perte->id);
                
                $actions = '';
                
                // Detail/Eye Button - Show details page
                if (auth()->user()->can('Pertes-voir')) {
                    $actions .= '<a href="' . route('pertes.show', $perte->id) . '" 
                                   class="btn btn-sm bg-info-subtle me-1" 
                                   title="Voir les détails">
                                    <i class="fa-solid fa-eye text-info"></i>
                                </a>';
                }
                
                // PDF Button - Download PDF
                if (auth()->user()->can('Pertes-voir')) {
                    $actions .= '<a href="' . route('facture.perte', $encodedId) . '" 
                                   class="btn btn-sm btn-warning me-1" 
                                   target="_blank"
                                   title="Télécharger PDF">
                                    <i class="fa-solid fa-file-pdf"></i>
                                </a>';
                }
                
                // Edit Button
                 if (auth()->user()->can('Pertes-modifier')) {
        $isMagasinier = auth()->user()->hasRole('Magasinier');
        
        if (!($isMagasinier && $perte->status === 'Visa Magasinier')) {
            $actions .= '<button class="btn btn-sm btn-primary me-1 edit-perte-btn" 
                                 data-id="' . $perte->id . '"
                                 title="Modifier">
                            <i class="fa-solid fa-edit"></i>
                        </button>';
        }
    }
                
                // Delete Button
                if (auth()->user()->can('Pertes-supprimer')) {
                    $actions .= '<button class="btn btn-sm btn-danger deletePerte" 
                                         data-id="' . $perte->id . '"
                                         title="Supprimer">
                                    <i class="fa-solid fa-trash"></i>
                                </button>';
                }
                
                return $actions ?: '<span class="text-muted">Aucune action</span>';
            })
            ->rawColumns(['status_badge', 'action'])
            ->make(true);
    }

    // Get classes for the filter dropdown
    $class = DB::table('categories')
        ->select('classe')
        ->distinct()
        ->orderBy('classe')
        ->get();

    return view('pertes.index', compact('class'));
}

    /**
     * Check if user can edit a perte based on role and current status
     */
private function canUserEditPerte($perte)
{
    $user = auth()->user();
    $status = $perte->status;
    $nature = $perte->nature;
    $classe = $perte->classe;
    $classeUpper = strtoupper(trim($classe ?? ''));
    
    // Helper to check if alimentaire (contains ALIMENTAIRE but not NON)
    $isAlimentaire = (stripos($classeUpper, 'ALIMENTAIRE') !== false && stripos($classeUpper, 'NON') === false);
    $isNonAlimentaire = ($classeUpper === 'NON ALIMENTAIRE');
    
    // Administrator can edit any perte (except Visa Magasinier which is final)
    if ($user->hasRole('Administrateur') && $status !== 'Visa Magasinier') {
        return true;
    }
    
    // Directeur des études - can approve from "En attente" to "Visa Directeur"
    if ($user->hasRole('Directeur des études') && $status == 'En attente') {
        // Only for produit fini or alimentaire stock
        if ($nature == 'produit fini' || ($nature == 'stock' && $isAlimentaire)) {
            return true;
        }
    }
    
    // Chargé d'inventaire - can approve from "En attente" to "Visa Chargé" 
    // Only for non-alimentaire stock
    if ($user->hasRole('Chargé d\'inventaire') && 
        $status == 'En attente' && 
        $nature == 'stock' && 
        $isNonAlimentaire) {
        return true;
    }
    
    // Magasinier (Économe) - can approve from previous visa to "Visa Économe"
    if ($user->hasRole('Magasinier')) {
        // From Visa Directeur to Visa Économe (for produit fini and alimentaire)
        if ($status == 'Visa Directeur') {
            return true;
        }
        
        // From Visa Chargé to Visa Économe (for non-alimentaire)
        if ($status == 'Visa Chargé') {
            return true;
        }
        
        // From Validé to Visa Magasinier (final step for all)
        if ($status == 'Validé') {
            return true;
        }
    }
    
    // Users with Pertes-valider permission - can validate from "Visa Économe" to "Validé"
    if ($user->can('Pertes-valider') && $status == 'Visa Économe') {
        return true;
    }
    
    return false;
}

    /**
     * Get products by subcategory
     */
    public function getProductsBySubcategory($subcategoryId)
    {
        try {
            $validator = Validator::make(
                ['subcategory_id' => $subcategoryId],
                ['subcategory_id' => 'required|integer|exists:sub_categories,id']
            );

            if ($validator->fails()) {
                return response()->json([
                    'status' => 400,
                    'message' => 'ID de famille invalide',
                    'products' => []
                ], 400);
            }

            $products = Product::where('id_subcategorie', $subcategoryId)
                ->with(['unite'])
                ->select('id', 'name', 'id_unite')
                ->orderBy('name', 'asc')
                ->get();
            
            Log::info('Products retrieved', [
                'subcategory_id' => $subcategoryId,
                'count' => $products->count()
            ]);
            
            return response()->json([
                'status' => 200,
                'products' => $products
            ]);
        } catch (\Exception $e) {
            Log::error('Erreur lors de la récupération des produits', [
                'subcategory_id' => $subcategoryId,
                'error_message' => $e->getMessage(),
                'error_trace' => $e->getTraceAsString()
            ]);
            
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la récupération des produits',
                'products' => []
            ], 500);
        }
    }

    /**
     * Generate reference for perte
     */
   private function generateReference($nature, $classe)
{
    $currentMonth = date('m');
    $currentYear = date('Y');
    $monthYear = $currentMonth . $currentYear;
    
    // ✅ Normalize classe for comparison
    $classeUpper = strtoupper(trim($classe ?? ''));
    
    // Determine prefix based on nature and classe
    if ($nature === 'produit fini') {
        $prefix = 'PSAL';
        $suffix = '/PF';
        $classeKey = 'Alimentaire';
    } else if ($nature === 'stock' && $classeUpper === 'DENREES ALIMENTAIRES') {
        $prefix = 'PSAL';
        $suffix = '/MP';
        $classeKey = 'Alimentaire';
    } else if ($nature === 'stock' && $classeUpper === 'NON ALIMENTAIRE') {
        $prefix = 'PSNAL';  // ✅ Correct prefix for Non alimentaire
        $suffix = '';
        $classeKey = 'Non alimentaire';
    } else {
        $prefix = 'PS';
        $suffix = '';
        $classeKey = $classe ?? 'default';
    }
    
    // Get next numero_serie for this type and month
    $nextNumeroSerie = DB::table('pertes')
        ->where(function($query) use ($nature, $classeKey) {
            if ($nature === 'produit fini') {
                $query->where('nature', 'produit fini');
            } else {
                $query->where('nature', 'stock')
                      ->where('classe', $classeKey);
            }
        })
        ->whereRaw('MONTH(date_perte) = ?', [$currentMonth])
        ->whereRaw('YEAR(date_perte) = ?', [$currentYear])
        ->selectRaw('IFNULL(MAX(numero_serie), 0) + 1 as next_numero')
        ->value('next_numero');
    
    $numeroFormatted = str_pad($nextNumeroSerie, 3, '0', STR_PAD_LEFT);
    
    $reference = $prefix . $numeroFormatted . '-' . $monthYear . $suffix;
    
    return [
        'reference' => $reference,
        'numero_serie' => $nextNumeroSerie
    ];
}

    /**
     * Store a newly created perte
     */
 public function store(Request $request)
{
    if (!auth()->user()->can('Pertes-ajouter')) {
        return response()->json([
            'status' => 403,
            'message' => 'Vous n\'avez pas la permission d\'ajouter des pertes'
        ], 403);
    }
    
    $rules = [];
    if($request->nature === 'produit fini')
    {
        $rules['produit_fini_type'] = 'required|in:Entrée,Suite,Dessert,Accompagnement,Autres';
        $rules['id_plat'] = 'required|exists:plats,id';
        $rules['nombre_plats'] = 'required|integer|min:1';
        $rules['cause'] = 'required|string';
        $rules['circonstances'] = 'nullable|string';
        $rules['nature'] = 'required|string|in:stock,produit fini';
        $rules['date_perte'] = 'required|date';
    }
    else
    {
        $rules['id_product'] = 'required|exists:products,id';
        $rules['quantite'] = 'required|numeric|min:0.01';
        $rules['classe'] = 'required|string|max:255';
        $rules['id_category'] = 'required|exists:categories,id';
        $rules['id_subcategorie'] = 'required|exists:sub_categories,id';
        $rules['nature'] = 'required|string|in:stock,produit fini';
        $rules['date_perte'] = 'required|date';
        $rules['cause'] = 'required|string';
        $rules['circonstances'] = 'nullable|string';
        
        // N° Inv is required only for Non alimentaire stock
        if ($request->classe === 'Non alimentaire') {
            $rules['n_inv'] = 'required|string';
        }
    }
    
    $validator = Validator::make($request->all(), $rules, [
        'required' => 'Le champ :attribute est requis.',
        'numeric' => 'Le champ :attribute doit être un nombre.',
        'exists' => 'La valeur sélectionnée pour :attribute est invalide.',
        'date' => 'Le champ :attribute doit être une date valide.',
        'min' => 'Le champ :attribute doit être au moins :min.',
        'in' => 'La valeur sélectionnée est invalide.',
    ]);
    
    if ($validator->fails()) {
        return response()->json([
            'status' => 400,
            'errors' => $validator->messages(),
        ], 400);
    }

    try {
        DB::beginTransaction();
        
        $perteData = [
            'nature' => $request->nature,
            'date_perte' => $request->date_perte,
            'cause' => $request->cause,
            'circonstances' => $request->circonstances,
            'status' => 'En attente',
            'id_user' => Auth::id(),
        ];

        if ($request->nature === 'stock') {
            // Stock loss
            $product = Product::with(['unite'])->find($request->id_product);
            
            if (!$product) {
                DB::rollBack();
                return response()->json([
                    'status' => 404,
                    'message' => 'Produit non trouvé',
                ], 404);
            }
            
            // Calculate cost for stock
            $coutTotal = $product->price_achat * $request->quantite;
            
            // Generate reference
            $refData = $this->generateReference($request->nature, $request->classe);
            
            $perteData['reference'] = $refData['reference'];
            $perteData['numero_serie'] = $refData['numero_serie'];
            $perteData['id_category'] = $request->id_category;
            $perteData['id_subcategorie'] = $request->id_subcategorie;
            $perteData['classe'] = $request->classe;
            $perteData['id_product'] = $product->id;
            $perteData['id_unite'] = $product->id_unite;
            $perteData['designation'] = $product->name;
            $perteData['quantite'] = $request->quantite;
            $perteData['cout_total'] = $coutTotal;
            $perteData['produit_fini_type'] = null;
            $perteData['id_plat'] = null;
            $perteData['nombre_plats'] = null;
            $perteData['n_inv'] = $request->n_inv;
            
        } else if ($request->nature === 'produit fini') {
            // Produit fini loss
            $plat = DB::table('plats')->where('id', $request->id_plat)->first();
            
            if (!$plat) {
                DB::rollBack();
                return response()->json([
                    'status' => 404,
                    'message' => 'Plat non trouvé',
                ], 404);
            }
            
            // Calculate total cost
            $composition = DB::table('ligne_plat as lp')
                ->join('products as p', 'p.id', '=', 'lp.idproduit')
                ->where('lp.id_plat', $request->id_plat)
                ->whereNull('lp.deleted_at')
                ->select(DB::raw('SUM(lp.qte * p.price_achat) as cout_unitaire'))
                ->first();
            
            $coutUnitaire = $composition->cout_unitaire ?? 0;
            $coutTotal = $coutUnitaire * $request->nombre_plats;
            
            // Generate reference for produit fini (always alimentaire)
            $refData = $this->generateReference($request->nature, 'Alimentaire');
            
            $perteData['reference'] = $refData['reference'];
            $perteData['numero_serie'] = $refData['numero_serie'];
            $perteData['id_category'] = null;
            $perteData['id_subcategorie'] = null;
            $perteData['classe'] = null;
            $perteData['id_product'] = null;
            $perteData['id_plat'] = $plat->id;
            $perteData['id_unite'] = null;
            $perteData['designation'] = $plat->name;
            $perteData['quantite'] = 0;
            $perteData['produit_fini_type'] = $request->produit_fini_type;
            $perteData['nombre_plats'] = $request->nombre_plats;
            $perteData['cout_total'] = $coutTotal;
            $perteData['n_inv'] = null;
        }
        
        $perte = Perte::create($perteData);
        
        // ✅ SEND NOTIFICATIONS AFTER CREATION
        $currentUser = User::find(Auth::id());
        $currentUserName = $currentUser->prenom . ' ' . $currentUser->nom;
        $viewUrl = route('pertes.show', $perte->id);
        
        // ✅ Determine who to notify based on reference prefix
        if (strpos($perteData['reference'], 'PSNAL') === 0) {
            // Non Alimentaire - Notify Chargé d'inventaire
            $chargeUsers = User::whereHas('roles', function($query) {
                $query->where('name', 'Chargé d\'inventaire');
            })->get();
            
            foreach ($chargeUsers as $charge) {
                $charge->notify(new \App\Notifications\SystemNotification([
                    'message' => 'Nouvelle perte ' . $perteData['reference'] . ' déclarée par ' . $currentUserName,
                    'status' => 'En attente',
                    'view_url' => $viewUrl
                ]));
            }
        } else {
            // Alimentaire - Notify Directeur des études
            $directeurUsers = User::whereHas('roles', function($query) {
                $query->where('name', 'Directeur des études');
            })->get();
            
            foreach ($directeurUsers as $directeur) {
                $directeur->notify(new \App\Notifications\SystemNotification([
                    'message' => 'Nouvelle perte ' . $perteData['reference'] . ' déclarée par ' . $currentUserName,
                    'status' => 'En attente',
                    'view_url' => $viewUrl
                ]));
            }
        }
        
        // ✅ Always notify Administrateur and Économe
        $adminEconomeUsers = User::whereHas('roles', function($query) {
            $query->whereIn('name', ['Administrateur', 'Économe']);
        })->get();
        
        foreach ($adminEconomeUsers as $user) {
            $user->notify(new \App\Notifications\SystemNotification([
                'message' => 'Nouvelle perte ' . $perteData['reference'] . ' déclarée par ' . $currentUserName,
                'status' => 'En attente',
                'view_url' => $viewUrl
            ]));
        }
        
        DB::commit();
        
        return response()->json([
            'status' => 200,
            'message' => 'Perte déclarée avec succès avec la référence: ' . $perteData['reference'],
        ]);
        
    } catch (\Exception $e) {
        DB::rollBack();
        
        Log::error('Error creating perte: ' . $e->getMessage(), [
            'request' => $request->all(),
            'trace' => $e->getTraceAsString()
        ]);
        
        return response()->json([
            'status' => 500,
            'message' => 'Une erreur est survenue. Veuillez réessayer.',
        ], 500);
    }
}

    /**
     * Show the perte details
     */
    public function show($id)
    {
        try {
            $perte = Perte::with(['product', 'category', 'subcategory', 'unite', 'user'])
                ->findOrFail($id);
            
            return view('pertes.detail', compact('perte'));
            
        } catch (\Exception $e) {
            return redirect()->route('pertes.index')
                ->with('error', 'Perte non trouvée');
        }
    }

    /**
     * Get perte for editing/viewing
     */
    public function edit($id)
    {
        try {
            $perte = Perte::with(['product', 'category', 'subcategory', 'unite', 'user'])
                ->findOrFail($id);
            
            return response()->json($perte);
            
        } catch (\Exception $e) {
            Log::error('Error fetching perte: ' . $e->getMessage());
            
            return response()->json([
                'status' => 404,
                'message' => 'Perte non trouvée'
            ], 404);
        }
    }

    /**
     * Change status of a perte (visa workflow and validation)
     */
public function changeStatus(Request $request)
{
    try {
        $data = $request->all();
        Log::info('changeStatus called with data:', $data);

        $perte = Perte::find($data['id']);
        
        if (!$perte) {
            return response()->json([
                'status' => 404,
                'message' => 'Perte non trouvée'
            ], 404);
        }

        $oldStatus = $perte->status;
        $newStatus = $data['status'];
        $user = auth()->user();

        Log::info('Permission check details:', [
            'user_id' => $user->id,
            'user_roles' => $user->roles->pluck('name')->toArray(),
            'perte_id' => $perte->id,
            'perte_nature' => $perte->nature,
            'perte_classe_raw' => $perte->classe,
            'perte_classe_upper' => strtoupper(trim($perte->classe ?? '')),
            'old_status' => $oldStatus,
            'new_status' => $newStatus,
        ]);

        // Handle "Annuler" status
        if ($newStatus == 'Annuler') {
            return $this->handleAnnulerStatus($perte, $oldStatus);
        }

        // Handle "Refusé" status
        if ($newStatus == 'Refusé') {
            return $this->handleRefuseStatus($perte, $data);
        }

        // Handle visa workflow statuses
        if (in_array($newStatus, ['Visa Directeur', 'Visa Économe', 'Visa Chargé', 'Validé', 'Visa Magasinier'])) {
            // Verify user has permission for this transition
            $canChangeStatus = $this->canUserChangeToStatus($perte, $oldStatus, $newStatus, $user);
            
            if (!$canChangeStatus) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Vous n\'avez pas la permission pour cette action ou la transition de statut n\'est pas valide'
                ], 403);
            }
            
            // If moving to "Visa Magasinier", reduce stock
            if ($newStatus === 'Visa Magasinier') {
                return $this->validateAndReduceStock($perte);
            } else {
                // Just update status without modifying stock
                $perte->status = $newStatus;
                $perte->refusal_reason = null;
                $perte->save();
                
                Log::info('Perte status updated', [
                    'perte_id' => $perte->id,
                    'old_status' => $oldStatus,
                    'new_status' => $newStatus
                ]);
                
                // ✅ SEND NOTIFICATIONS BASED ON NEW STATUS
                $currentUser = User::find(Auth::id());
                $currentUserName = $currentUser->prenom . ' ' . $currentUser->nom;
                $creatorUser = User::find($perte->id_user);
                $viewUrl = route('pertes.show', $perte->id);
                
                // ✅ Always notify the creator about status changes
                if ($creatorUser) {
                    $creatorUser->notify(new \App\Notifications\SystemNotification([
                        'message' => 'Votre déclaration de perte ' . $perte->reference . ' a changé de statut: ' . $newStatus,
                        'status' => $newStatus,
                        'view_url' => $viewUrl
                    ]));
                }
                
                // ✅ Send notifications based on new status
                switch ($newStatus) {
                    case 'Visa Directeur':
                        // Notify Économe after Directeur visa
                        $economeUsers = User::whereHas('roles', function($query) {
                            $query->where('name', 'Économe');
                        })->get();
                        
                        foreach ($economeUsers as $econome) {
                            $econome->notify(new \App\Notifications\SystemNotification([
                                'message' => 'Perte ' . $perte->reference . ' visée par le Directeur des études - en attente de votre visa',
                                'status' => 'Visa Directeur',
                                'view_url' => $viewUrl
                            ]));
                        }
                        break;
                        
                    case 'Visa Chargé':
                        // Notify Économe after Chargé visa
                        $economeUsers = User::whereHas('roles', function($query) {
                            $query->where('name', 'Économe');
                        })->get();
                        
                        foreach ($economeUsers as $econome) {
                            $econome->notify(new \App\Notifications\SystemNotification([
                                'message' => 'Perte ' . $perte->reference . ' visée par le Chargé d\'inventaire - en attente de votre visa',
                                'status' => 'Visa Chargé',
                                'view_url' => $viewUrl
                            ]));
                        }
                        break;
                        
                    case 'Visa Économe':
                        // Notify Administrateur after Économe visa
                        $adminUsers = User::whereHas('roles', function($query) {
                            $query->where('name', 'Administrateur');
                        })->get();
                        
                        foreach ($adminUsers as $admin) {
                            $admin->notify(new \App\Notifications\SystemNotification([
                                'message' => 'Perte ' . $perte->reference . ' visée par l\'Économe - prête pour validation',
                                'status' => 'Visa Économe',
                                'view_url' => $viewUrl
                            ]));
                        }
                        break;
                        
                    case 'Validé':
                        // Notify Magasinier after validation
                        $magasinierUsers = User::whereHas('roles', function($query) {
                            $query->where('name', 'Magasinier');
                        })->get();
                        
                        foreach ($magasinierUsers as $magasinier) {
                            $magasinier->notify(new \App\Notifications\SystemNotification([
                                'message' => 'Perte ' . $perte->reference . ' a été validée - action requise',
                                'status' => 'Validé',
                                'view_url' => $viewUrl
                            ]));
                        }
                        break;
                }
                
                return response()->json([
                    'status' => 200,
                    'message' => 'Statut mis à jour avec succès'
                ]);
            }
        }
        
        return response()->json([
            'status' => 400,
            'message' => 'Statut invalide'
        ], 400);
        
    } catch (\Exception $e) {
        Log::error('Error in changeStatus: ' . $e->getMessage(), [
            'trace' => $e->getTraceAsString()
        ]);
        
        return response()->json([
            'status' => 500,
            'message' => 'Une erreur est survenue: ' . $e->getMessage()
        ]);
    }
}

    /**
     * Handle Annuler status
     */
    private function handleAnnulerStatus($perte, $oldStatus)
    {
        DB::beginTransaction();
        
        try {
            // Only restore stock if it was previously validated (Visa Magasinier)
            if ($oldStatus === 'Visa Magasinier') {
                if ($perte->nature === 'stock' && $perte->id_product) {
                    DB::table('stock')
                        ->where('id_product', $perte->id_product)
                        ->update([
                            'quantite' => DB::raw("quantite + {$perte->quantite}"),
                            'updated_at' => now()
                        ]);
                } else if ($perte->nature === 'produit fini' && $perte->id_plat) {
                    $composition = DB::table('ligne_plat')
                        ->where('id_plat', $perte->id_plat)
                        ->whereNull('deleted_at')
                        ->get();
                    
                    foreach ($composition as $ligne) {
                        $quantiteARestaurer = $ligne->qte * $perte->nombre_plats;
                        
                        DB::table('stock')
                            ->where('id_product', $ligne->idproduit)
                            ->update([
                                'quantite' => DB::raw("quantite + {$quantiteARestaurer}"),
                                'updated_at' => now()
                            ]);
                    }
                }
            }
            
            $perte->status = 'Annuler';
            $perte->save();
            
            DB::commit();
            
            return response()->json([
                'status' => 200,
                'message' => 'Perte annulée avec succès'
            ]);
            
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error canceling perte: ' . $e->getMessage());
            
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de l\'annulation: ' . $e->getMessage()
            ]);
        }
    }

    /**
     * Handle Refuse status
     */
    private function handleRefuseStatus($perte, $data)
    {
        if (empty($data['refusal_reason'])) {
            return response()->json([
                'status' => 400,
                'message' => 'Le motif de refus est requis'
            ], 400);
        }
        
        $perte->status = 'Refusé';
        $perte->refusal_reason = $data['refusal_reason'];
        $perte->save();
        
        Log::info('Perte refused with reason: "' . $data['refusal_reason'] . '" for perte ID: ' . $perte->id);
        
        return response()->json([
            'status' => 200,
            'message' => 'Perte refusée avec succès'
        ]);
    }

    /**
     * Handle visa workflow
     */
    private function handleVisaWorkflow($perte, $oldStatus, $newStatus, $user)
    {
        // Verify user has permission for this transition
        $canChangeStatus = $this->canUserChangeToStatus($perte, $oldStatus, $newStatus, $user);
        
        if (!$canChangeStatus) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission pour cette action ou la transition de statut n\'est pas valide'
            ], 403);
        }
        
        // If moving to "Visa Magasinier", reduce stock
        if ($newStatus === 'Visa Magasinier') {
            return $this->validateAndReduceStock($perte);
        } else {
            // Just update status without modifying stock
            $perte->status = $newStatus;
            $perte->refusal_reason = null;
            $perte->save();
            
            Log::info('Perte status updated', [
                'perte_id' => $perte->id,
                'old_status' => $oldStatus,
                'new_status' => $newStatus
            ]);
            
            return response()->json([
                'status' => 200,
                'message' => 'Statut mis à jour avec succès'
            ]);
        }
    }

    /**
     * Check if user can change to a specific status
     */

private function canUserChangeToStatus($perte, $oldStatus, $newStatus, $user)
{
    $nature = $perte->nature;
    $classe = $perte->classe;
    $classeUpper = strtoupper(trim($classe ?? ''));
    
    // Helper to check if alimentaire (contains ALIMENTAIRE but not NON)
    $isAlimentaire = (stripos($classeUpper, 'ALIMENTAIRE') !== false && stripos($classeUpper, 'NON') === false);
    $isNonAlimentaire = ($classeUpper === 'NON ALIMENTAIRE');
    
    // Administrator can change to any valid status (except back to En attente)
    if ($user->hasRole('Administrateur')) {
        $validStatuses = ['Visa Directeur', 'Visa Économe', 'Visa Chargé', 'Validé', 'Visa Magasinier', 'Refusé', 'Annuler'];
        return in_array($newStatus, $validStatuses);
    }
    
    // Directeur des études: En attente → Visa Directeur
    // (for produit fini or alimentaire stock only)
    if ($user->hasRole('Directeur des études') && 
        $oldStatus === 'En attente' && 
        $newStatus === 'Visa Directeur') {
        if ($nature === 'produit fini' || ($nature === 'stock' && $isAlimentaire)) {
            return true;
        }
    }
    
    // Chargé d'inventaire: En attente → Visa Chargé 
    // (for non-alimentaire stock only)
    if ($user->hasRole('Chargé d\'inventaire') && 
        $oldStatus === 'En attente' && 
        $newStatus === 'Visa Chargé' &&
        $nature === 'stock' &&
        $isNonAlimentaire) {
        return true;
    }
    
    // Économe role - can give Visa Économe
    if ($user->hasRole('Économe') && 
        in_array($oldStatus, ['Visa Directeur', 'Visa Chargé']) && 
        $newStatus === 'Visa Économe') {
        return true;
    }
    
    // Magasinier role - can give Visa Économe AND Visa Magasinier
    if ($user->hasRole('Magasinier')) {
        // Can give Visa Économe (from Visa Directeur or Visa Chargé)
        if (in_array($oldStatus, ['Visa Directeur', 'Visa Chargé']) && 
            $newStatus === 'Visa Économe') {
            return true;
        }
        
        // Can give Visa Magasinier (from Validé)
        if ($oldStatus === 'Validé' && $newStatus === 'Visa Magasinier') {
            return true;
        }
    }
    
    // Users with Pertes-valider: Visa Économe → Validé
    if ($user->can('Pertes-valider') && 
        $oldStatus === 'Visa Économe' && 
        $newStatus === 'Validé') {
        return true;
    }
    
    // Allow Refusé and Annuler for authorized users
    if (in_array($newStatus, ['Refusé', 'Annuler'])) {
        if ($user->hasRole(['Directeur des études', 'Chargé d\'inventaire', 'Économe', 'Magasinier', 'Administrateur'])) {
            return true;
        }
    }
    
    return false;
}

    /**
     * Validate and reduce stock
     */
private function validateAndReduceStock($perte)
{
    DB::beginTransaction();
    
    try {
        if ($perte->nature === 'stock') {
            $stock = Stock::where('id_product', $perte->id_product)->first();
            
            if (!$stock) {
                throw new \Exception('Stock non trouvé pour ce produit');
            }
            
            if ($stock->quantite < $perte->quantite) {
                throw new \Exception('Quantité en stock insuffisante. Stock disponible: ' . $stock->quantite);
            }
            
            $stock->quantite -= $perte->quantite;
            $stock->save();
            
            Log::info('Stock reduced', [
                'product_id' => $perte->id_product,
                'quantity_reduced' => $perte->quantite,
                'new_stock' => $stock->quantite
            ]);
            
        } else if ($perte->nature === 'produit fini') {
            $composition = DB::table('ligne_plat')
                ->where('id_plat', $perte->id_plat)
                ->whereNull('deleted_at')
                ->get();
            
            if ($composition->isEmpty()) {
                throw new \Exception('Aucune composition trouvée pour ce plat');
            }
            
            // First, check if all ingredients have enough stock
            foreach ($composition as $ligne) {
                $stock = Stock::where('id_product', $ligne->idproduit)->first();
                
                if (!$stock) {
                    $product = DB::table('products')->where('id', $ligne->idproduit)->first();
                    throw new \Exception('Stock non trouvé pour le produit: ' . ($product ? $product->name : 'ID '.$ligne->idproduit));
                }
                
                $quantiteNecessaire = $ligne->qte * $perte->nombre_plats;
                
                if ($stock->quantite < $quantiteNecessaire) {
                    $product = DB::table('products')->where('id', $ligne->idproduit)->first();
                    throw new \Exception('Quantité insuffisante pour: ' . ($product ? $product->name : 'ID '.$ligne->idproduit) . ' (Disponible: ' . $stock->quantite . ', Nécessaire: ' . $quantiteNecessaire . ')');
                }
            }
            
            // Then, reduce stock for each ingredient
            foreach ($composition as $ligne) {
                $stock = Stock::where('id_product', $ligne->idproduit)->first();
                $quantiteNecessaire = $ligne->qte * $perte->nombre_plats;
                
                $stock->quantite -= $quantiteNecessaire;
                $stock->save();
                
                Log::info('Stock reduced for product in plat', [
                    'product_id' => $ligne->idproduit,
                    'quantity_reduced' => $quantiteNecessaire,
                    'new_stock' => $stock->quantite
                ]);
            }
        }
        
        // Update perte status
        $perte->status = 'Visa Magasinier';
        $perte->refusal_reason = null;
        $perte->save();
        
        // ✅ SEND NOTIFICATIONS FOR VISA MAGASINIER
        $currentUser = User::find(Auth::id());
        $creatorUser = User::find($perte->id_user);
        $viewUrl = route('pertes.show', $perte->id);
        
        // Notify creator
        if ($creatorUser) {
            $creatorUser->notify(new \App\Notifications\SystemNotification([
                'message' => 'Votre déclaration de perte ' . $perte->reference . ' a reçu le visa Magasinier',
                'status' => 'Visa Magasinier',
                'view_url' => $viewUrl
            ]));
        }
        
        // Notify Administrateur that process is complete
        $adminUsers = User::whereHas('roles', function($query) {
            $query->where('name', 'Administrateur');
        })->get();
        
        foreach ($adminUsers as $admin) {
            $admin->notify(new \App\Notifications\SystemNotification([
                'message' => 'Perte ' . $perte->reference . ' finalisée avec visa Magasinier',
                'status' => 'Visa Magasinier',
                'view_url' => $viewUrl
            ]));
        }
        
        DB::commit();
        
        Log::info('Perte validated with Visa Magasinier', ['perte_id' => $perte->id]);
        
        return response()->json([
            'status' => 200,
            'message' => 'Visa Magasinier accordé avec succès. Stock mis à jour.'
        ]);
        
    } catch (\Exception $e) {
        DB::rollBack();
        Log::error('Error in validation process: ' . $e->getMessage());
        
        return response()->json([
            'status' => 500,
            'message' => 'Erreur lors de la validation: ' . $e->getMessage()
        ]);
    }
}

    /**
     * Delete a perte
     */
    public function destroy(Request $request)
    {
        if (!auth()->user()->can('Pertes-supprimer')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de supprimer des pertes'
            ], 403);
        }

        try {
            DB::beginTransaction();
            
            $perte = Perte::find($request->id);
            
            if (!$perte) {
                return response()->json([
                    'status' => 404,
                    'message' => 'Perte non trouvée'
                ], 404);
            }
            
            // Check if perte can be deleted
            if ($perte->status === 'Visa Magasinier') {
                return response()->json([
                    'status' => 400,
                    'message' => 'Impossible de supprimer une perte avec visa magasinier (stock déjà réduit)'
                ], 400);
            }
            
            $perte->delete();
            
            DB::commit();
            
            Log::info('Perte deleted. ID: ' . $request->id);
            
            return response()->json([
                'status' => 200,
                'message' => 'Perte supprimée avec succès'
            ]);
            
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error deleting perte: ' . $e->getMessage());
            
            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue lors de la suppression'
            ], 500);
        }
    }

    /**
     * Get plats by type
     */
    public function getPlatsByType($type)
    {
        try {
            $plats = DB::table('plats')
                ->where('type', $type)
                ->whereNull('deleted_at')
                ->select('id', 'name')
                ->orderBy('name', 'asc')
                ->get();
            
            return response()->json([
                'status' => 200,
                'plats' => $plats
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching plats by type', [
                'type' => $type,
                'error' => $e->getMessage()
            ]);
            
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la récupération des plats',
                'plats' => []
            ], 500);
        }
    }

    /**
     * Get plat composition
     */
    public function getPlatComposition($platId)
    {
        try {
            $plat = DB::table('plats')->where('id', $platId)->first();
            
            if (!$plat) {
                return response()->json([
                    'status' => 404,
                    'message' => 'Plat non trouvé'
                ], 404);
            }
            
            $composition = DB::table('ligne_plat as lp')
                ->join('products as p', 'p.id', '=', 'lp.idproduit')
                ->join('unite as u', 'u.id', '=', 'p.id_unite')
                ->where('lp.id_plat', $platId)
                ->whereNull('lp.deleted_at')
                ->select(
                    'p.id',
                    'p.name',
                    'lp.qte as quantite_requise',
                    'u.name as unite',
                    'p.price_achat',
                    DB::raw('lp.qte * p.price_achat as cout_unitaire')
                )
                ->get();
            
            $coutTotal = $composition->sum('cout_unitaire');
            
            return response()->json([
                'status' => 200,
                'plat' => [
                    'id' => $plat->id,
                    'name' => $plat->name,
                    'type' => $plat->type
                ],
                'composition' => $composition,
                'cout_total_unitaire' => number_format($coutTotal, 2, '.', '')
            ]);
            
        } catch (\Exception $e) {
            Log::error('Error fetching plat composition', [
                'plat_id' => $platId,
                'error' => $e->getMessage()
            ]);
            
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la récupération de la composition',
            ], 500);
        }
    }

    /**
     * Get product price
     */
    public function getProductPrice($productId)
    {
        try {
            $product = Product::findOrFail($productId);
            
            return response()->json([
                'status' => 200,
                'price' => $product->price_achat
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => 404,
                'message' => 'Produit non trouvé',
                'price' => null
            ], 404);
        }
    }
public function FacturePerte($id)
{
    if (!auth()->user()->can('Pertes-voir')) {
        abort(403, 'Vous n\'avez pas la permission de voir cette facture');
    }
    
    $hashids = new Hashids();
    $decoded = $hashids->decode($id);

    if (empty($decoded)) {
        abort(404);
    }

    $id = $decoded[0];
    
    $perte = DB::table('pertes')->where('id', $id)->first();
    
    if (!$perte) {
        abort(404);
    }
    
    // ✅ FIX: Show N° Inv column if reference starts with PSNAL
    $showNInv = (strpos($perte->reference, 'PSNAL') === 0);
    
    // Get user who declared the perte (creator)
    $declarant = DB::table('users')->where('id', $perte->id_user)->first();
    
    // Get product details if it's a stock loss
    $productDetails = null;
    $qte_avant_perte = null;
    $qte_apres_perte = null;
    
    if ($perte->nature === 'stock' && $perte->id_product) {
        // Get product info
        $productDetails = DB::table('products as p')
            ->leftJoin('unite as u', 'p.id_unite', '=', 'u.id')
            ->where('p.id', $perte->id_product)
            ->select('p.name', 'u.name as unite_name', 'p.price_achat')
            ->first();
        
        // Get CURRENT stock quantity
        $currentStock = DB::table('stock')
            ->where('id_product', $perte->id_product)
            ->value('quantite') ?? 0;
        
        // Calculate quantities based on status
        if ($perte->status === 'Visa Magasinier') {
            // Stock already reduced
            $qte_apres_perte = $currentStock; // Current = After
            $qte_avant_perte = $currentStock + $perte->quantite; // Before = After + Lost
        } else {
            // Stock NOT reduced yet
            $qte_avant_perte = $currentStock; // Current = Before
            $qte_apres_perte = $currentStock; // Same (no change yet)
        }
    }
    
    // Get plat details if it's a produit fini loss
    $platDetails = null;
    $compositionDetails = [];
    
    if ($perte->nature === 'produit fini' && $perte->id_plat) {
        $platDetails = DB::table('plats')->where('id', $perte->id_plat)->first();
        
        // Get composition WITH stock quantities
        $compositionDetails = DB::table('ligne_plat as lp')
            ->join('products as p', 'lp.idproduit', '=', 'p.id')
            ->leftJoin('unite as u', 'p.id_unite', '=', 'u.id')
            ->leftJoin('stock as s', 's.id_product', '=', 'p.id')
            ->where('lp.id_plat', $perte->id_plat)
            ->select(
                'p.id as product_id',
                'p.name',
                'lp.qte',
                'u.name as unite_name',
                'lp.nombre_couvert',
                'p.price_achat',
                DB::raw('(lp.qte * p.price_achat) as cout_unitaire'),
                's.quantite as current_stock'
            )
            ->get()
            ->map(function($item) use ($perte) {
                $quantitePerdue = $item->qte * $perte->nombre_plats;
                
                // Calculate quantities based on status
                if ($perte->status === 'Visa Magasinier') {
                    // Stock already reduced
                    $item->qte_apres_perte = $item->current_stock ?? 0;
                    $item->qte_avant_perte = ($item->current_stock ?? 0) + $quantitePerdue;
                } else {
                    // Stock NOT reduced yet
                    $item->qte_avant_perte = $item->current_stock ?? 0;
                    $item->qte_apres_perte = $item->current_stock ?? 0;
                }
                
                return $item;
            });
    }
    
    // Get signature history FROM AUDITS
    $getHistorique_sig = DB::table('audits as a')
        ->leftJoin('users as u', 'u.id', '=', 'a.user_id')
        ->select(
            'a.new_values',
            'a.created_at',
            DB::raw("CONCAT(COALESCE(u.prenom, ''), ' ', COALESCE(u.nom, '')) as name"),
            'u.signature'
        )
        ->where('a.auditable_type', 'App\\Models\\Perte')
        ->where('a.auditable_id', $id)
        ->where('a.event', 'updated')
        ->whereRaw("JSON_EXTRACT(a.new_values, '$.status') IS NOT NULL")
        ->orderBy('a.created_at', 'asc')
        ->get()
        ->map(function($audit) {
            $newValues = json_decode($audit->new_values, true);
            $status = $newValues['status'] ?? null;
            
            // Process signature if exists
            $signatureBase64 = null;
            if (!empty($audit->signature) && file_exists(public_path($audit->signature))) {
                $signatureBase64 = base64_encode(file_get_contents(public_path($audit->signature)));
            }
            
            return (object)[
                'status' => $status,
                'created_at' => $audit->created_at,
                'name' => $audit->name ?: 'Système',
                'signature' => $signatureBase64
            ];
        })
        ->filter(function($item) {
            return !is_null($item->status);
        });
    
    // Add creation record (En attente status) - from creator
    $creatorUser = DB::table('users')
        ->where('id', $perte->id_user)
        ->select(DB::raw("CONCAT(prenom, ' ', nom) as name"), 'signature')
        ->first();
    
    $creatorSignatureBase64 = null;
    if ($creatorUser && !empty($creatorUser->signature) && file_exists(public_path($creatorUser->signature))) {
        $creatorSignatureBase64 = base64_encode(file_get_contents(public_path($creatorUser->signature)));
    }
    
    $creationRecord = (object)[
        'status' => 'En attente',
        'created_at' => $perte->created_at,
        'name' => $creatorUser ? $creatorUser->name : 'Système',
        'signature' => $creatorSignatureBase64
    ];
    
    // Merge creation with other status changes
    $getHistorique_sig = collect([$creationRecord])->merge($getHistorique_sig);

    // Load images
    $imagePath = public_path('images/logo_top.png');
    $imageData = base64_encode(file_get_contents($imagePath));
    $logo_bottom = public_path('images/logo_bottom.png');
    $imageData_bottom = base64_encode(file_get_contents($logo_bottom));
    
    // Render view
    $html = view('pertes.facture', compact(
        'perte',
        'declarant',
        'productDetails',
        'qte_avant_perte',
        'qte_apres_perte',
        'platDetails',
        'compositionDetails',
        'imageData',
        'imageData_bottom',
        'getHistorique_sig',
        'showNInv'  // ✅ Pass this to the view
    ))->render();

    $pdf = Pdf::loadHTML($html)->output();

    $headers = [
        "Content-type" => "application/pdf",
    ];
    
    return response()->streamDownload(
        fn() => print($pdf),
        "FicheDeclarationPerte.pdf",
        $headers
    );
}
}