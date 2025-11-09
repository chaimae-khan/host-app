<?php

namespace App\Http\Controllers;

use App\Models\Plat;
use App\Models\Product;
use App\Models\TempPlat;
use App\Models\LignePlat;
use App\Models\Unite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class PlatCompositionController extends Controller
{
    /**
     * Display a listing of plat compositions
     */
   public function index(Request $request)
{
    if (!auth()->user()->can('Plats')) {
        abort(403, 'Vous n\'avez pas la permission d\'accéder à cette page');
    }

    $countPlat = Plat::count();
    if ($countPlat == 0) {
        return view('Error.index')
            ->withErrors('Vous n\'avez pas de plats. Veuillez d\'abord créer des plats.');
    }

    $countProduct = Product::count();
    if ($countProduct == 0) {
        return view('Error.index')
            ->withErrors('Vous n\'avez pas de produits.');
    }

    if ($request->ajax()) {
        $Data_Plat = DB::table('plats as p')
            ->join('users as us', 'us.id', '=', 'p.iduser')
            ->join('ligne_plat as l', 'l.id_plat', '=', 'p.id')
            ->join('products as pro', 'pro.id', '=', 'l.idproduit')
            ->join('unite as u', 'u.id', '=', 'pro.id_unite')
            ->select(
                'l.id',
                'p.id as plat_id',  // ← ADD THIS LINE
                'pro.name',
                'p.name as nom_plat',
                DB::raw("CONCAT(us.prenom, ' ', us.nom) as created_by"),
                'l.created_at',
                'l.qte',
                'l.nombre_couvert',
                'u.name as unite'
            )
            ->whereNull('l.deleted_at')
            ->orderBy('l.id', 'desc');

        return DataTables::of($Data_Plat)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $btn = '';

                if (auth()->user()->can('Plats-modifier')) {
                    // ✅ USE plat_id INSTEAD OF ligne_plat id
                    $btn .= '<a href="#" class="btn btn-sm bg-primary-subtle me-1 editPlatComposition"
                                data-id="' . $row->plat_id . '">
                                <i class="fa-solid fa-pen-to-square text-primary"></i>
                            </a>';
                }

                // if (auth()->user()->can('Plats')) {
                //     $btn .= '<a href="' . url('ShowPlatDetail/' . $row->plat_id) . '" 
                //                 class="btn btn-sm bg-success-subtle me-1" 
                //                 target="_blank">
                //                 <i class="fa-solid fa-eye text-success"></i>
                //             </a>';
                // }

                if (auth()->user()->can('Plats-supprimer')) {
                    // ✅ USE plat_id FOR DELETE TOO
                    $btn .= '<a href="#" class="btn btn-sm bg-danger-subtle deletePlatComposition"
                                data-id="' . $row->plat_id . '">
                                <i class="fa-solid fa-trash text-danger"></i>
                            </a>';
                }

                return $btn;
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    $plats = Plat::all();
    $unites = Unite::all();

    return view('plat_composition.index')
        ->with('plats', $plats)
        ->with('unites', $unites);
}

    /**
     * Get plats by type
     */
    public function getPlatsByTypeForComposition(Request $request)
    {
        $type = $request->type;
        $plats = Plat::where('type', $type)
            ->whereNull('deleted_at')
            ->get();

        return response()->json([
            'status' => 200,
            'data' => $plats,
        ]);
    }

    /**
     * Search for products
     */
    public function getProductForPlat(Request $request)
    {
        $name_product = $request->product;

        if ($request->ajax()) {
            $Data_Product = DB::table('products as p')
                ->join('stock as s', 'p.id', '=', 's.id_product')
                ->join('locals as l', 'p.id_local', '=', 'l.id')
                ->join('unite as u', 'p.id_unite', '=', 'u.id')
                ->where('p.name', 'like', '%' . $name_product . '%')
                ->whereNull('p.deleted_at')
                ->select(
                    'p.name',
                    's.quantite',
                    'p.seuil',
                    'l.name as name_local',
                    'p.id',
                    'u.id as id_unite',
                    'u.name as unite_name'
                )
                ->get();

            return response()->json([
                'status' => 200,
                'data' => $Data_Product
            ]);
        }
    }

    /**
     * Store product in temporary table
     */
    public function PostInTmpPlat(Request $request)
    {
        if (!auth()->user()->can('Plats-ajoute')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission d\'ajouter des compositions de plats'
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            'idproduit' => 'required|exists:products,id',
            'id_plat' => 'required|exists:plats,id',
            'id_unite' => 'required|exists:unite,id',
            'qte' => 'required|numeric|min:0.01',
            'nombre_couvert' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->messages(),
            ], 400);
        }

        $data = $request->all();
        $data['id_user'] = Auth::user()->id;

        DB::beginTransaction();

        try {
            $existingProduct = TempPlat::where('idproduit', $data['idproduit'])
                ->where('id_plat', $data['id_plat'])
                ->where('id_user', $data['id_user'])
                ->first();

            if ($existingProduct) {
                $existingProduct->qte += $data['qte'];
                $existingProduct->save();
                DB::commit();

                return response()->json([
                    'status' => 200,
                    'message' => 'Quantité mise à jour avec succès',
                ]);
            } else {
                TempPlat::create($data);
                DB::commit();

                return response()->json([
                    'status' => 200,
                    'message' => 'Produit ajouté avec succès',
                ]);
            }
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue. Veuillez réessayer.',
                'error' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Get temporary plat composition by plat ID
     */
    public function GetTmpPlatByPlatId(Request $request)
    {
        $Data = DB::table('temp_plat as t')
            ->join('plats as pl', 't.id_plat', '=', 'pl.id')
            ->join('products as p', 't.idproduit', '=', 'p.id')
            ->join('unite as u', 't.id_unite', '=', 'u.id')
            ->join('users as us', 't.id_user', '=', 'us.id')
            ->where('t.id_plat', '=', $request->id_plat)
            ->where('t.id_user', '=', Auth::user()->id)
            ->whereNull('p.deleted_at')
            ->select(
                't.id',
                'p.name as product_name',
                'pl.name as plat_name',
                't.qte',
                'u.name as unite_name',
                't.nombre_couvert'
            );

        return DataTables::of($Data)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $btn = '';

                $btn .= '<a href="#" class="btn btn-sm bg-primary-subtle me-1 EditTmpPlat"
                            data-id="' . $row->id . '">
                            <i class="fa-solid fa-pen-to-square text-primary"></i>
                        </a>';

                $btn .= '<a href="#" class="btn btn-sm bg-danger-subtle DeleteTmpPlat"
                            data-id="' . $row->id . '">
                            <i class="fa-solid fa-trash text-danger"></i>
                        </a>';

                return $btn;
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    /**
     * Store plat composition
     */
    public function StorePlatComposition(Request $request)
    {
        if (!auth()->user()->can('Plats-ajoute')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission d\'ajouter des compositions de plats'
            ], 403);
        }

        $userId = Auth::id();
        $platId = $request->id_plat;

        // Retrieve temporary plat data
        $TempPlat = TempPlat::where('id_user', $userId)
            ->where('id_plat', $platId)
            ->get();

        if ($TempPlat->isEmpty()) {
            return response()->json([
                'status' => 400,
                'message' => 'Aucun produit trouvé pour ce plat'
            ]);
        }

        DB::beginTransaction();

        try {
            // Insert plat composition details
            foreach ($TempPlat as $item) {
                LignePlat::create([
                    'id_user' => $userId,
                    'id_plat' => $item->id_plat,
                    'idproduit' => $item->idproduit,
                    'id_unite' => $item->id_unite,
                    'qte' => $item->qte,
                    'nombre_couvert' => $item->nombre_couvert,
                ]);
            }

            // Delete temporary plat records
            TempPlat::where('id_user', $userId)
                ->where('id_plat', $platId)
                ->delete();

            DB::commit();

            return response()->json([
                'status' => 200,
                'message' => 'Composition de plat ajoutée avec succès'
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue lors de l\'enregistrement',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update quantity in temp table
     */
    public function UpdateQteTmpPlat(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'qte' => 'required|numeric|min:0.01',
            'nombre_couvert' => 'required|integer|min:1',
        ], [
            'required' => 'Le champ :attribute est requis.',
            'numeric' => 'Le champ :attribute doit être un nombre.',
            'min' => 'Le champ :attribute doit être supérieur à :min.',
        ], [
            'qte' => 'quantité',
            'nombre_couvert' => 'nombre de couverts',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->messages(),
            ], 400);
        }

        $TempPlat = TempPlat::where('id', $request->id)->update([
            'qte' => $request->qte,
            'nombre_couvert' => $request->nombre_couvert,
        ]);

        if ($TempPlat) {
            return response()->json([
                'status' => 200,
                'message' => 'Mise à jour effectuée avec succès.'
            ]);
        }
    }

    /**
     * Delete row from temp table
     */
    public function DeleteRowsTmpPlat(Request $request)
    {
        $TempPlat = TempPlat::where('id', $request->id)->delete();

        if ($TempPlat) {
            return response()->json([
                'status' => 200,
                'message' => 'Suppression effectuée avec succès.'
            ]);
        }
    }

  public function edit($id)
{
    if (!auth()->user()->can('Plats-modifier')) {
        return response()->json([
            'status' => 403,
            'message' => 'Vous n\'avez pas la permission de modifier'
        ], 403);
    }

    // ✅ Find the PLAT by ID
    $plat = Plat::find($id);

    if (!$plat) {
        return response()->json([
            'status' => 404,
            'message' => 'Plat non trouvé'
        ], 404);
    }

    // ✅ Get ALL ligne_plat records for this PLAT
    $lignePlats = LignePlat::where('id_plat', $id)
                           ->whereNull('deleted_at')  // ← Add this safety check
                           ->get();

    // Clear existing temp data for this user and plat
    TempPlat::where('id_user', Auth::id())
            ->where('id_plat', $id)
            ->delete();

    // Load ALL data into temp table
    foreach ($lignePlats as $ligne) {
        TempPlat::create([
            'id_user' => Auth::id(),
            'id_plat' => $ligne->id_plat,
            'idproduit' => $ligne->idproduit,
            'id_unite' => $ligne->id_unite,
            'qte' => $ligne->qte,
            'nombre_couvert' => $ligne->nombre_couvert,
        ]);
    }

    return response()->json([
        'status' => 200,
        'plat' => $plat,
        'compositions_count' => $lignePlats->count()  // ← DEBUG: Check how many loaded
    ]);
}

    /**
     * Update plat composition
     */
    public function update(Request $request)
    {
        if (!auth()->user()->can('Plats-modifier')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de modifier'
            ], 403);
        }

        $platId = $request->id_plat;
        $userId = Auth::id();

        $plat = Plat::find($platId);

        if (!$plat) {
            return response()->json([
                'status' => 404,
                'message' => 'Plat non trouvé'
            ], 404);
        }

        // Get temp data
        $TempPlat = TempPlat::where('id_user', $userId)
            ->where('id_plat', $platId)
            ->get();

        if ($TempPlat->isEmpty()) {
            return response()->json([
                'status' => 400,
                'message' => 'Aucun produit trouvé pour ce plat'
            ]);
        }

        DB::beginTransaction();

        try {
            // Delete existing ligne_plat records
            LignePlat::where('id_plat', $platId)->delete();

            // Insert new records from temp
            foreach ($TempPlat as $item) {
                LignePlat::create([
                    'id_user' => $userId,
                    'id_plat' => $item->id_plat,
                    'idproduit' => $item->idproduit,
                    'id_unite' => $item->id_unite,
                    'qte' => $item->qte,
                    'nombre_couvert' => $item->nombre_couvert,
                ]);
            }

            // Clear temp table
            TempPlat::where('id_user', $userId)
                ->where('id_plat', $platId)
                ->delete();

            DB::commit();

            return response()->json([
                'status' => 200,
                'message' => 'Composition de plat mise à jour avec succès',
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la mise à jour',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete plat composition
     */
    public function destroy(Request $request)
    {
        if (!auth()->user()->can('Plats-supprimer')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de supprimer'
            ], 403);
        }

        $platId = $request->id;

        DB::beginTransaction();

        try {
            // Delete ligne_plat records
            LignePlat::where('id_plat', $platId)->delete();

            DB::commit();

            return response()->json([
                'status' => 200,
                'message' => 'Composition de plat supprimée avec succès'
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue lors de la suppression'
            ], 500);
        }
    }

    /**
     * Show plat detail
     */
    public function ShowPlatDetail($id)
    {
        if (!auth()->user()->can('Plats')) {
            abort(403, 'Vous n\'avez pas la permission de voir ce détail');
        }

        $plat = Plat::findOrFail($id);

        $Data_LignePlat = DB::table('ligne_plat as l')
            ->join('products as p', 'l.idproduit', '=', 'p.id')
            ->join('unite as u', 'l.id_unite', '=', 'u.id')
            ->whereNull('p.deleted_at')
            ->select('p.name', 'l.qte', 'u.name as unite_name', 'l.nombre_couvert')
            ->where('l.id_plat', $id)
            ->get();

        return view('plat_composition.detail', compact('plat', 'Data_LignePlat'));
    }
    /**
 * Get column information by index
 */
private function getColumnByIndex($index)
{
    $columns = [
        0 => ['field' => 'nom_plat', 'title' => 'Nom du plat', 'data' => 'nom_plat'],
        1 => ['field' => 'name', 'title' => 'Ingrédients', 'data' => 'name'],
        2 => ['field' => 'qte', 'title' => 'Quantité', 'data' => 'qte'],
        3 => ['field' => 'unite', 'title' => 'Unité', 'data' => 'unite'],
        4 => ['field' => 'nombre_couvert', 'title' => 'Nombre de couvert', 'data' => 'nombre_couvert'],
        5 => ['field' => 'created_by', 'title' => 'Créé par', 'data' => 'created_by'],
        6 => ['field' => 'created_at', 'title' => 'Créé le', 'data' => 'created_at'],
    ];
    
    return $columns[$index] ?? null;
}

/**
 * Export plat compositions to Excel with selected columns
 */
public function exportExcel(Request $request)
{
    // if (!auth()->user()->can('Plats-exporter')) {
    //     return response()->json([
    //         'status' => 403,
    //         'message' => 'Vous n\'avez pas la permission d\'exporter'
    //     ], 403);
    // }

    // Parse columns from request
    $selectedColumnIndices = [];
    if ($request->has('columns')) {
        $selectedColumnIndices = explode(',', $request->input('columns'));
    } else {
        // Default to all columns if none specified
        $selectedColumnIndices = range(0, 6);
    }
    
    // Get column information for selected columns
    $selectedColumns = [];
    $columnTitles = [];
    $columnData = [];
    
    foreach ($selectedColumnIndices as $index) {
        $column = $this->getColumnByIndex(intval($index));
        if ($column) {
            $selectedColumns[] = $column['field'];
            $columnTitles[] = $column['title'];
            $columnData[] = $column['data'];
        }
    }
    
    // Get all plat composition data
    $compositionData = DB::table('plats as p')
        ->join('users as us', 'us.id', '=', 'p.iduser')
        ->join('ligne_plat as l', 'l.id_plat', '=', 'p.id')
        ->join('products as pro', 'pro.id', '=', 'l.idproduit')
        ->join('unite as u', 'u.id', '=', 'pro.id_unite')
        ->select(
            'l.id',
            'pro.name',
            'p.name as nom_plat',
            DB::raw("CONCAT(us.prenom, ' ', us.nom) as created_by"),
            'l.created_at',
            'l.qte',
            'l.nombre_couvert',
            'u.name as unite'
        )
        ->whereNull('l.deleted_at')
        ->orderBy('l.id', 'desc')
        ->get();
    
    // Create new Spreadsheet object
    $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    
    // Set header row with selected columns
    $colIndex = 'A';
    foreach ($columnTitles as $title) {
        $sheet->setCellValue($colIndex . '1', $title);
        $colIndex++;
    }
    
    // Style header row
    $headerStyle = [
        'font' => [
            'bold' => true,
        ],
        'alignment' => [
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'startColor' => [
                'rgb' => 'EEEEEE',
            ],
        ],
    ];
    
    $sheet->getStyle('A1:' . chr(64 + count($columnTitles)) . '1')->applyFromArray($headerStyle);
    
    // Add data rows
    $row = 2;
    foreach ($compositionData as $composition) {
        $colIndex = 'A';
        
        foreach ($columnData as $field) {
            $value = '';
            
            if ($field === 'created_at') {
                $value = $composition->created_at ? date('d/m/Y H:i', strtotime($composition->created_at)) : '';
            } elseif ($field === 'qte') {
                $value = number_format($composition->qte, 2);
            } else {
                $value = $composition->{$field} ?? '';
            }
            
            $sheet->setCellValue($colIndex . $row, $value);
            $colIndex++;
        }
        
        // Center align all data cells
        $sheet->getStyle('A' . $row . ':' . chr(64 + count($columnTitles)) . $row)
            ->getAlignment()
            ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        
        $row++;
    }
    
    // Auto size columns
    foreach (range('A', chr(64 + count($columnTitles))) as $column) {
        $sheet->getColumnDimension($column)->setAutoSize(true);
    }
    
    // Create writer
    $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
    
    // Set headers for download
    $fileName = 'Composition_Plats - ' . date('d-m-Y') . '.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename="' . $fileName . '"');
    header('Cache-Control: max-age=0');
    
    // Save file to output
    $writer->save('php://output');
    exit;
}

/**
 * Export plat compositions to PDF with selected columns
 */
public function exportPdf(Request $request)
{
    // if (!auth()->user()->can('Plats-exporter')) {
    //     return response()->json([
    //         'status' => 403,
    //         'message' => 'Vous n\'avez pas la permission d\'exporter'
    //     ], 403);
    // }

    // Parse columns from request
    $selectedColumnIndices = [];
    if ($request->has('columns')) {
        $selectedColumnIndices = explode(',', $request->input('columns'));
    } else {
        // Default to all columns if none specified
        $selectedColumnIndices = range(0, 6);
    }
    
    // Get column information for selected columns
    $selectedColumns = [];
    $columnTitles = [];
    $columnData = [];
    
    foreach ($selectedColumnIndices as $index) {
        $column = $this->getColumnByIndex(intval($index));
        if ($column) {
            $selectedColumns[] = $column['field'];
            $columnTitles[] = $column['title'];
            $columnData[] = $column['data'];
        }
    }
    
    // Get all plat composition data
    $compositionData = DB::table('plats as p')
        ->join('users as us', 'us.id', '=', 'p.iduser')
        ->join('ligne_plat as l', 'l.id_plat', '=', 'p.id')
        ->join('products as pro', 'pro.id', '=', 'l.idproduit')
        ->join('unite as u', 'u.id', '=', 'pro.id_unite')
        ->select(
            'l.id',
            'pro.name',
            'p.name as nom_plat',
            DB::raw("CONCAT(us.prenom, ' ', us.nom) as created_by"),
            'l.created_at',
            'l.qte',
            'l.nombre_couvert',
            'u.name as unite'
        )
        ->whereNull('l.deleted_at')
        ->orderBy('l.id', 'desc')
        ->get();
    
    // Transform data for view with selected columns
    $compositions = [];
    foreach ($compositionData as $composition) {
        $compositionItem = [];
        
        // Add only selected fields
        foreach ($columnData as $field) {
            if ($field === 'created_at') {
                $compositionItem[$field] = $composition->created_at ? date('d/m/Y H:i', strtotime($composition->created_at)) : '';
            } elseif ($field === 'qte') {
                $compositionItem[$field] = number_format($composition->qte, 2);
            } else {
                $compositionItem[$field] = $composition->{$field} ?? '';
            }
        }
        
        $compositions[] = $compositionItem;
    }
    
    // Generate PDF
    $pdf = \PDF::loadView('plat_composition.pdf_export', [
        'compositions' => $compositions,
        'columns' => $columnTitles,
        'columnData' => $columnData,
        'date' => date('d/m/Y')
    ]);
    
    // Make PDF landscape and A4
    $pdf->setPaper('a4', 'landscape');
    
    // Download PDF
    return $pdf->download('Composition_Plats - ' . date('d-m-Y') . '.pdf');
}

/**
 * Export detailed plat composition grouped by plat
 */
public function exportDetailedPdf(Request $request)
{
    // if (!auth()->user()->can('Plats-exporter')) {
    //     return response()->json([
    //         'status' => 403,
    //         'message' => 'Vous n\'avez pas la permission d\'exporter'
    //     ], 403);
    // }

    // Get all plats with their compositions
    $plats = DB::table('plats as p')
        ->join('users as us', 'us.id', '=', 'p.iduser')
        ->select(
            'p.id',
            'p.name',
            'p.type',
            DB::raw("CONCAT(us.prenom, ' ', us.nom) as created_by"),
            'p.created_at'
        )
        ->whereExists(function($query) {
            $query->select(DB::raw(1))
                  ->from('ligne_plat as l')
                  ->whereRaw('l.id_plat = p.id')
                  ->whereNull('l.deleted_at');
        })
        ->whereNull('p.deleted_at')
        ->orderBy('p.type')
        ->orderBy('p.name')
        ->get();

    $platsData = [];
    foreach ($plats as $plat) {
        $ingredients = DB::table('ligne_plat as l')
            ->join('products as pro', 'pro.id', '=', 'l.idproduit')
            ->join('unite as u', 'u.id', '=', 'pro.id_unite')
            ->select(
                'pro.name',
                'l.qte',
                'u.name as unite',
                'l.nombre_couvert'
            )
            ->where('l.id_plat', $plat->id)
            ->whereNull('l.deleted_at')
            ->whereNull('pro.deleted_at')
            ->get();

        $platsData[] = [
            'plat' => $plat,
            'ingredients' => $ingredients
        ];
    }
    
    // Generate PDF
    $pdf = \PDF::loadView('plat_composition.pdf_detailed', [
        'platsData' => $platsData,
        'date' => date('d/m/Y')
    ]);
    
    // Make PDF A4 portrait
    $pdf->setPaper('a4', 'portrait');
    
    // Download PDF
    return $pdf->download('Composition_Plats_Detaillee - ' . date('d-m-Y') . '.pdf');
}
/**
 * Import plat compositions from Excel
 * 
 * Expected Excel structure:
 * Column A: Nom du plat
 * Column B: Ingrédients (product name)
 * Column C: Quantité
 * Column D: Unité
 * Column E: Nombre de couvert
 * Column F: Créé par (optional, for reference)
 * Column G: Créé le (optional, for reference)
 */
public function importExcel(Request $request)
{
    if (!auth()->user()->can('Plats-ajoute')) {
        return response()->json([
            'status' => 403,
            'message' => 'Vous n\'avez pas la permission d\'importer'
        ], 403);
    }

    $validator = Validator::make($request->all(), [
        'file' => 'required|mimes:xlsx,xls|max:10240', // 10MB max
    ], [
        'file.required' => 'Veuillez sélectionner un fichier',
        'file.mimes' => 'Le fichier doit être au format Excel (.xlsx ou .xls)',
        'file.max' => 'Le fichier ne doit pas dépasser 10 Mo',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => 400,
            'errors' => $validator->messages(),
        ], 400);
    }

    DB::beginTransaction();

    try {
        $file = $request->file('file');
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($file->getRealPath());
        $sheet = $spreadsheet->getActiveSheet();
        
        $totalRows = $sheet->getHighestRow();
        $importedCount = 0;
        $errorRows = [];
        $warnings = [];
        
        // Skip header row (row 1)
        for ($row = 2; $row <= $totalRows; $row++) {
            try {
                // Read row data
                $nomPlat = trim($sheet->getCell('A' . $row)->getValue());
                $ingredientName = trim($sheet->getCell('B' . $row)->getValue());
                $qte = $sheet->getCell('C' . $row)->getValue();
                $uniteName = trim($sheet->getCell('D' . $row)->getValue());
                $nombreCouvert = $sheet->getCell('E' . $row)->getValue();
                
                // Skip empty rows
                if (empty($nomPlat) && empty($ingredientName)) {
                    continue;
                }
                
                // Validate required fields
                if (empty($nomPlat)) {
                    $errorRows[] = "Ligne $row: Nom du plat manquant";
                    continue;
                }
                
                if (empty($ingredientName)) {
                    $errorRows[] = "Ligne $row: Nom de l'ingrédient manquant";
                    continue;
                }
                
                if (empty($qte) || !is_numeric($qte) || $qte <= 0) {
                    $errorRows[] = "Ligne $row: Quantité invalide ($qte)";
                    continue;
                }
                
                if (empty($uniteName)) {
                    $errorRows[] = "Ligne $row: Unité manquante";
                    continue;
                }
                
                if (empty($nombreCouvert) || !is_numeric($nombreCouvert) || $nombreCouvert < 1) {
                    $errorRows[] = "Ligne $row: Nombre de couverts invalide ($nombreCouvert)";
                    continue;
                }
                
                // Find the plat by name
                $plat = Plat::where('name', 'LIKE', $nomPlat)
                    ->whereNull('deleted_at')
                    ->first();
                
                if (!$plat) {
                    $errorRows[] = "Ligne $row: Plat '$nomPlat' introuvable";
                    continue;
                }
                
                // Find the product by name
                $product = Product::where('name', 'LIKE', $ingredientName)
                    ->whereNull('deleted_at')
                    ->first();
                
                if (!$product) {
                    $errorRows[] = "Ligne $row: Produit '$ingredientName' introuvable";
                    continue;
                }
                
                // Find the unite by name
                $unite = Unite::where('name', 'LIKE', $uniteName)->first();
                
                if (!$unite) {
                    $errorRows[] = "Ligne $row: Unité '$uniteName' introuvable";
                    continue;
                }
                
                // Check if this composition already exists
                $existingLigne = LignePlat::where('id_plat', $plat->id)
                    ->where('idproduit', $product->id)
                    ->whereNull('deleted_at')
                    ->first();
                
                if ($existingLigne) {
                    // Update existing composition
                    $existingLigne->update([
                        'id_unite' => $unite->id,
                        'qte' => $qte,
                        'nombre_couvert' => $nombreCouvert,
                        'id_user' => Auth::id(),
                    ]);
                    $warnings[] = "Ligne $row: Composition mise à jour pour '$nomPlat' - '$ingredientName'";
                } else {
                    // Create new composition
                    LignePlat::create([
                        'id_user' => Auth::id(),
                        'id_plat' => $plat->id,
                        'idproduit' => $product->id,
                        'id_unite' => $unite->id,
                        'qte' => $qte,
                        'nombre_couvert' => $nombreCouvert,
                    ]);
                }
                
                $importedCount++;
                
            } catch (\Exception $e) {
                $errorRows[] = "Ligne $row: Erreur - " . $e->getMessage();
            }
        }
        
        DB::commit();
        
        $message = "$importedCount composition(s) importée(s) avec succès";
        
        if (count($warnings) > 0) {
            $message .= ". " . count($warnings) . " mise(s) à jour";
        }
        
        if (count($errorRows) > 0) {
            $message .= ". " . count($errorRows) . " erreur(s)";
        }
        
        return response()->json([
            'status' => 200,
            'message' => $message,
            'imported' => $importedCount,
            'warnings' => $warnings,
            'errors' => $errorRows,
        ]);
        
    } catch (\Exception $e) {
        DB::rollBack();
        
        return response()->json([
            'status' => 500,
            'message' => 'Erreur lors de l\'importation: ' . $e->getMessage(),
        ], 500);
    }
}

/**
 * Download import template
 */
public function downloadImportTemplate()
{
    // Create new Spreadsheet
    $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    
    // Set headers
    $headers = [
        'Nom du plat',
        'Ingrédients',
        'Quantité',
        'Unité',
        'Nombre de couvert',
        'Créé par',
        'Créé le'
    ];
    
    $colIndex = 'A';
    foreach ($headers as $header) {
        $sheet->setCellValue($colIndex . '1', $header);
        $colIndex++;
    }
    
    // Style header row
    $headerStyle = [
        'font' => [
            'bold' => true,
            'color' => ['rgb' => 'FFFFFF'],
        ],
        'alignment' => [
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'startColor' => [
                'rgb' => '4472C4',
            ],
        ],
    ];
    
    $sheet->getStyle('A1:G1')->applyFromArray($headerStyle);
    
    // Add sample data
    $sampleData = [
        ['Salade César', 'Laitue', '100', 'g', '1', '', ''],
        ['Salade César', 'Poulet', '150', 'g', '1', '', ''],
        ['Salade César', 'Parmesan', '30', 'g', '1', '', ''],
        ['Pizza Margherita', 'Farine', '200', 'g', '1', '', ''],
        ['Pizza Margherita', 'Tomate', '100', 'g', '1', '', ''],
        ['Pizza Margherita', 'Mozzarella', '150', 'g', '1', '', ''],
    ];
    
    $row = 2;
    foreach ($sampleData as $data) {
        $colIndex = 'A';
        foreach ($data as $value) {
            $sheet->setCellValue($colIndex . $row, $value);
            $colIndex++;
        }
        $row++;
    }
    
    // Add instructions in a comment
    $sheet->getComment('A1')->getText()->createTextRun(
        "Instructions d'importation:\n" .
        "1. Nom du plat: Le nom doit correspondre exactement à un plat existant\n" .
        "2. Ingrédients: Le nom du produit doit exister dans la base de données\n" .
        "3. Quantité: Valeur numérique positive\n" .
        "4. Unité: L'unité doit exister (ex: g, kg, L, ml, pcs)\n" .
        "5. Nombre de couvert: Nombre entier >= 1\n" .
        "6-7. Optionnels: Pour référence uniquement"
    );
    
    // Auto size columns
    foreach (range('A', 'G') as $column) {
        $sheet->getColumnDimension($column)->setAutoSize(true);
    }
    
    // Create writer
    $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
    
    // Set headers for download
    $fileName = 'Template_Import_Composition_Plats.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename="' . $fileName . '"');
    header('Cache-Control: max-age=0');
    
    // Save file to output
    $writer->save('php://output');
    exit;
}
}