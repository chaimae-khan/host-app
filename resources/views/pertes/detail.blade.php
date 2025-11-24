@extends('dashboard.index')

@section('dashboard')

<style>
    .info-card {
        border-left: 4px solid #007bff;
    }
    .table-responsive {
        overflow-x: auto;
    }
    .badge-lg {
        font-size: 1rem;
        padding: 0.5rem 1rem;
    }
    .detail-label {
        font-weight: 600;
        color: #6c757d;
    }
    .detail-value {
        font-weight: 500;
        color: #212529;
    }
    .perte-info-section {
        background: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
    }
    .action-buttons {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }
</style>

<div class="content-page"> 
    <div class="content">
        <!-- Début du contenu -->
        <div class="container-fluid">

            <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
                <div class="flex-grow-1">
                    <h4 class="fs-18 fw-semibold m-0">Détails de la Perte {{ $perte->reference }}</h4>
                </div>
                
                <div class="text-end">
                    <ol class="breadcrumb m-0 py-0">
                        <li class="breadcrumb-item"><a href="{{ route('pertes.index') }}">Pertes</a></li>
                        <li class="breadcrumb-item active">Détails</li>
                    </ol>
                </div>
            </div>

            <!-- Back Button -->
            <div class="row mb-3">
                <div class="col-12">
                    <a href="{{ route('pertes.index') }}" class="btn btn-secondary">
                        <i class="fa-solid fa-arrow-left me-1"></i> Retour à la liste
                    </a>
                </div>
            </div>

            <!-- Status Card -->
            <!-- <div class="row mb-3">
                <div class="col-12">
                    <div class="perte-info-section">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <div class="detail-label mb-2">Statut de la perte</div>
                                <div>
                                    @if($perte->status == 'En attente')
                                        <span class="badge bg-warning text-dark badge-lg">
                                            <i class="fa-solid fa-clock me-1"></i> En attente
                                        </span>
                                    @elseif($perte->status == 'Visa Directeur')
                                        <span class="badge bg-info badge-lg">
                                            <i class="fa-solid fa-check-circle me-1"></i> Visa Directeur
                                        </span>
                                    @elseif($perte->status == 'Visa Chargé')
                                        <span class="badge bg-info badge-lg">
                                            <i class="fa-solid fa-check-circle me-1"></i> Visa Chargé
                                        </span>
                                    @elseif($perte->status == 'Visa Économe')
                                        <span class="badge bg-primary badge-lg">
                                            <i class="fa-solid fa-check-circle me-1"></i> Visa Économe
                                        </span>
                                    @elseif($perte->status == 'Validé')
                                        <span class="badge bg-success badge-lg">
                                            <i class="fa-solid fa-check me-1"></i> Validé
                                        </span>
                                    @elseif($perte->status == 'Visa Magasinier')
                                        <span class="badge bg-success badge-lg">
                                            <i class="fa-solid fa-check-double me-1"></i> Visa Magasinier
                                        </span>
                                    @elseif($perte->status == 'Refusé')
                                        <span class="badge bg-danger badge-lg">
                                            <i class="fa-solid fa-times me-1"></i> Refusé
                                        </span>
                                    @elseif($perte->status == 'Annuler')
                                        <span class="badge bg-dark badge-lg">
                                            <i class="fa-solid fa-ban me-1"></i> Annulé
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-4 text-end">
                                <div class="detail-label mb-2">Date de la perte</div>
                                <div class="detail-value">
                                    <i class="fa-solid fa-calendar-xmark me-1"></i>
                                    {{ \Carbon\Carbon::parse($perte->date_perte)->format('d/m/Y') }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->

            <!-- Declaration Information Card -->
            <div class="row mt-3">
                <div class="col-12">
                    <div class="card info-card">
                        <div class="card-header bg-info text-white">
                            <h5 class="mb-0">
                                <i class="fa-solid fa-info-circle me-2"></i>Informations de Déclaration
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-md-6 mb-2">
                                    <span class="detail-label">Déclaré par:</span>
                                    <div class="detail-value">
                                        <i class="fa-solid fa-user me-1"></i>{{ $perte->user->prenom ?? '' }} {{ $perte->user->nom ?? 'N/A' }}
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <span class="detail-label">Date de déclaration:</span>
                                    <div class="detail-value">
                                        <i class="fa-solid fa-calendar-plus me-1"></i>{{ \Carbon\Carbon::parse($perte->created_at)->format('d/m/Y H:i') }}
                                    </div>
                                </div>
                            </div>

                            @if($perte->status == 'Refusé' && $perte->refusal_reason)
                            <hr>
                            <div class="row">
                                <div class="col-12">
                                    <div class="alert alert-danger">
                                        <h6 class="alert-heading">
                                            <i class="fa-solid fa-exclamation-triangle me-2"></i>Motif de refus:
                                        </h6>
                                        <p class="mb-0">{{ $perte->refusal_reason }}</p>
                                    </div>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            <!-- ✅ Status History Section - FIXED -->
            @php
                // Get status history from audits
                $statusHistory = DB::table('audits as a')
                    ->leftJoin('users as u', 'u.id', '=', 'a.user_id')
                    ->select(
                        'a.new_values',
                        'a.created_at',
                        DB::raw("CONCAT(COALESCE(u.prenom, ''), ' ', COALESCE(u.nom, '')) as user_name")
                    )
                    ->where('a.auditable_type', 'App\\Models\\Perte')
                    ->where('a.auditable_id', $perte->id)
                    ->where('a.event', 'updated')
                    ->whereRaw("JSON_EXTRACT(a.new_values, '$.status') IS NOT NULL")
                    ->orderBy('a.created_at', 'asc')
                    ->get()
                    ->map(function($audit) {
                        $newValues = json_decode($audit->new_values, true);
                        return (object)[
                            'status' => $newValues['status'] ?? null,
                            'date' => $audit->created_at,
                            'user_name' => $audit->user_name ?: 'Système'
                        ];
                    })
                    ->filter(function($item) {
                        return !is_null($item->status);
                    });

                // Add creation record (En attente status)
                $creatorUser = DB::table('users')
                    ->where('id', $perte->id_user)
                    ->select(DB::raw("CONCAT(prenom, ' ', nom) as name"))
                    ->first();
                
                $creationRecord = (object)[
                    'status' => 'En attente',
                    'date' => $perte->created_at,
                    'user_name' => $creatorUser ? $creatorUser->name : 'Système'
                ];
                
                // Merge creation with other status changes
                $statusHistory = collect([$creationRecord])->merge($statusHistory);
            @endphp

            @if($statusHistory->count() > 0)
            <div class="card card-body">
                <h5 class="card-title border p-2 bg-light rounded-2">
                    <i class="mdi mdi-history"></i> Historique des changements de statut
                </h5>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-light">
                            <tr>
                                <th width="30%">Statut</th>
                                <th width="40%">Date de changement</th>
                                <th width="30%">Modifié par</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($statusHistory as $change)
                            <tr>
                                <td>
                                    @if ($change->status == 'En attente')
                                        <span class="badge bg-warning">{{$change->status}}</span>
                                    @elseif ($change->status == 'Visa Directeur')
                                        <span class="badge bg-info">{{$change->status}}</span>
                                    @elseif ($change->status == 'Visa Chargé')
                                        <span class="badge bg-info">{{$change->status}}</span>
                                    @elseif ($change->status == 'Visa Économe')
                                        <span class="badge bg-primary">{{$change->status}}</span>
                                    @elseif ($change->status == 'Validé')
                                        <span class="badge bg-success">{{$change->status}}</span>
                                    @elseif ($change->status == 'Visa Magasinier')
                                        <span class="badge bg-success">{{$change->status}}</span>
                                    @elseif ($change->status == 'Refusé')
                                        <span class="badge bg-danger">{{$change->status}}</span>
                                    @elseif ($change->status == 'Annuler')
                                        <span class="badge bg-dark">{{$change->status}}</span>
                                    @else
                                        <span class="badge bg-secondary">{{$change->status}}</span>
                                    @endif
                                </td>
                                <td>
                                    <i class="mdi mdi-calendar-clock"></i>
                                    {{ \Carbon\Carbon::parse($change->date)->format('d/m/Y H:i:s') }}
                                </td>
                                <td>
                                    <i class="mdi mdi-account"></i>
                                    {{ $change->user_name }}
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @endif

            <!-- Product Information Card -->
            <div class="row">
                <div class="col-12">
                    <div class="card info-card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">
                                @if($perte->nature == 'stock')
                                    <i class="fa-solid fa-boxes-stacked me-2"></i>Informations de la Perte de Stock
                                @else
                                    <i class="fa-solid fa-utensils me-2"></i>Informations de la Perte de Produit Fini
                                @endif
                            </h5>
                        </div>
                        <div class="card-body">
                            @if($perte->nature == 'stock')
                                <!-- Stock Loss Information -->
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Classe:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-layer-group me-1"></i>{{ $perte->classe }}
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Catégorie:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-folder me-1"></i>{{ $perte->category->name ?? 'N/A' }}
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Famille:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-folder-open me-1"></i>{{ $perte->subcategory->name ?? 'N/A' }}
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Produit:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-tag me-1"></i><strong>{{ $perte->designation }}</strong>
                                        </div>
                                    </div>
                                </div>

                                @if($perte->n_inv)
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">N° Inv:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-barcode me-1"></i>{{ $perte->n_inv }}
                                        </div>
                                    </div>
                                </div>
                                @endif

                                <hr>

                                <div class="row mb-3">
                                    <div class="col-md-4 mb-3">
                                        <span class="detail-label">Quantité perdue:</span>
                                        <div class="detail-value mt-1">
                                            <span class="badge bg-danger badge-lg">{{ number_format($perte->quantite, 2) }}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <span class="detail-label">Unité:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-balance-scale me-1"></i>{{ $perte->unite->name ?? 'N/A' }}
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <span class="detail-label">Coût de la perte:</span>
                                        <div class="detail-value">
                                            <span class="badge bg-danger badge-lg">
                                                <i class="fa-solid fa-coins me-1"></i>{{ number_format($perte->cout_total ?? 0, 2) }} DH
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            @else
                                <!-- Produit Fini Loss Information -->
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Type de produit fini:</span>
                                        <div class="detail-value">
                                            <span class="badge bg-info badge-lg">
                                                <i class="fa-solid fa-utensils me-1"></i>{{ $perte->produit_fini_type ?? 'N/A' }}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Nom du plat:</span>
                                        <div class="detail-value">
                                            <i class="fa-solid fa-tag me-1"></i><strong>{{ $perte->designation }}</strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Nombre de plats perdus:</span>
                                        <div class="detail-value mt-1">
                                            <span class="badge bg-danger badge-lg">{{ $perte->nombre_plats ?? 0 }} plat(s)</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <span class="detail-label">Coût total de la perte:</span>
                                        <div class="detail-value">
                                            <span class="badge bg-danger badge-lg">
                                                <i class="fa-solid fa-coins me-1"></i>{{ number_format($perte->cout_total ?? 0, 2) }} DH
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- ✅ FIXED: Composition Section for Produit Fini -->
                                @if($perte->id_plat)
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <h6 class="text-primary mb-3">
                                                <i class="fa-solid fa-list-check me-2"></i>Composition du Plat
                                            </h6>
                                            <div class="table-responsive">
                                                <table class="table table-sm table-bordered">
                                                    <thead class="table-light">
                                                        <tr>
                                                            <th>Produit</th>
                                                            <th>Qté/plat</th>
                                                            <th>Unité</th>
                                                            <th>Prix Unit.</th>
                                                            <th>Coût/plat</th>
                                                            <th>Qté Totale Perdue</th>
                                                            <th>Coût Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @php
                                                            $composition = DB::table('ligne_plat as lp')
                                                                ->join('products as p', 'p.id', '=', 'lp.idproduit')
                                                                ->join('unite as u', 'u.id', '=', 'p.id_unite')
                                                                ->where('lp.id_plat', $perte->id_plat)
                                                                ->whereNull('lp.deleted_at')
                                                                ->select(
                                                                    'p.name as product_name',
                                                                    'lp.qte as quantite_par_plat',
                                                                    'u.name as unite_name',
                                                                    'p.price_achat',
                                                                    DB::raw('lp.qte * p.price_achat as cout_unitaire')
                                                                )
                                                                ->get();
                                                            
                                                            $nombrePlats = $perte->nombre_plats ?? 1;
                                                        @endphp
                                                        
                                                        @forelse($composition as $item)
                                                            @php
                                                                $qteTotale = $item->quantite_par_plat * $nombrePlats;
                                                                $coutTotal = $item->cout_unitaire * $nombrePlats;
                                                            @endphp
                                                            <tr>
                                                                <td>{{ $item->product_name }}</td>
                                                                <td>{{ number_format($item->quantite_par_plat, 2) }}</td>
                                                                <td>{{ $item->unite_name }}</td>
                                                                <td>{{ number_format($item->price_achat, 2) }} DH</td>
                                                                <td>{{ number_format($item->cout_unitaire, 2) }} DH</td>
                                                                <td><strong>{{ number_format($qteTotale, 2) }}</strong></td>
                                                                <td><strong class="text-danger">{{ number_format($coutTotal, 2) }} DH</strong></td>
                                                            </tr>
                                                        @empty
                                                            <tr>
                                                                <td colspan="7" class="text-center text-muted">Aucune composition disponible</td>
                                                            </tr>
                                                        @endforelse
                                                    </tbody>
                                                    @if($composition->count() > 0)
                                                    <tfoot class="table-light">
                                                        <tr>
                                                            <th colspan="6" class="text-end">Total de la perte:</th>
                                                            <th class="text-danger">{{ number_format($perte->cout_total ?? 0, 2) }} DH</th>
                                                        </tr>
                                                    </tfoot>
                                                    @endif
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            @endif

                            <hr>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <span class="detail-label">Nature:</span>
                                    <div class="detail-value">
                                        <i class="fa-solid fa-clipboard-list me-1"></i>{{ ucfirst($perte->nature) }}
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <span class="detail-label">Date de la perte:</span>
                                    <div class="detail-value">
                                        <i class="fa-solid fa-calendar-xmark me-1"></i>{{ \Carbon\Carbon::parse($perte->date_perte)->format('d/m/Y') }}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 mb-3">
                                    <span class="detail-label">Cause / Raison:</span>
                                    <div class="detail-value mt-2">
                                        <div class="alert alert-light border">
                                            <i class="fa-solid fa-comment-dots me-1"></i>{{ $perte->cause }}
                                        </div>
                                    </div>
                                </div>
                                
                                @if($perte->circonstances)
                                <div class="col-12 mb-3">
                                    <span class="detail-label">Circonstances:</span>
                                    <div class="detail-value mt-2">
                                        <div class="alert alert-light border">
                                            <i class="fa-solid fa-info-circle me-1"></i>{{ $perte->circonstances }}
                                        </div>
                                    </div>
                                </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

@endsection