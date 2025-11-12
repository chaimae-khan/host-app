@extends('dashboard.index')

@section('dashboard')
<!-- External Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">

<!-- TomSelect for multi-select -->
<link href="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/css/tom-select.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/js/tom-select.complete.min.js"></script>

<!-- JS Variables -->
<script>
    var csrf_token = "{{ csrf_token() }}";
    var addPerte_url = "{{ url('addPerte') }}";
    var pertes_url = "{{ url('pertes') }}";
    var getSubcategories_url = "{{ url('getSubcategories') }}";
    var getProductsBySubcategory_url = "{{ url('getProductsBySubcategory') }}";
    var GetCategorieByClass = "{{ url('GetCategorieByClass') }}";
    var viewPerte_url = "{{ url('viewPerte') }}";
    var changeStatusPerte_url = "{{ url('changeStatusPerte') }}";
    var deletePerte_url = "{{ url('deletePerte') }}";
    var getPlatsByType_url = "{{ route('pertes.plats.by.type', ':type') }}";
    var getPlatComposition_url = "{{ route('pertes.plat.composition', ':id') }}";
    var getProductPrice_url = "{{ url('getProductPrice') }}";
</script>
<script src="{{ asset('js/perte/script.js') }}"></script>

<style>
.composition-table {
    font-size: 0.9rem;
}
.composition-table th {
    background-color: #f8f9fa;
    font-weight: 600;
}
.total-cost-display {
    background-color: #e7f3ff;
    padding: 15px;
    border-radius: 8px;
    margin-top: 15px;
}
.total-cost-display h6 {
    margin-bottom: 10px;
    color: #0d6efd;
}
.cost-detail {
    display: flex;
    justify-content: space-between;
    padding: 5px 0;
}
</style>

<div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <!-- Page Title -->
            <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
                <div class="flex-grow-1">
                    <h4 class="fs-18 fw-semibold m-0">Gestion des Pertes</h4>
                </div>
                
                <div class="text-end">
                    <ol class="breadcrumb m-0 py-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Applications</a></li>
                        <li class="breadcrumb-item active">Pertes</li>
                    </ol>
                </div>
            </div>

            <!-- Pertes List -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Add Perte Button -->
                            <div class="mb-3">
                                @can('Pertes-ajouter')
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalAddPerte">
                                    <i class="fa-solid fa-plus"></i> Déclarer une perte
                                </button>
                                @endcan
                            </div>
                            
                            <!-- Pertes Table -->
                            <div class="table-responsive">
                                <table class="table datatable TablePertes">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Classe</th>
                                            <th>Catégorie</th>
                                            <th>Famille</th>
                                            <th>Désignation</th>
                                            <th>Quantité</th>
                                            <th>Unité</th>
                                            <th>Nature</th>
                                            <th>Type Produit</th>
                                            <th>Coût Total</th>
                                            <th>Date de perte</th>
                                            <th>Statut</th>
                                            <th>Déclaré par</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Data will be loaded by DataTables -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Add Perte -->
            @can('Pertes-ajouter')
            <div class="modal fade" id="ModalAddPerte" tabindex="-1" aria-labelledby="ModalAddPerteLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModalAddPerteLabel">Déclarer une perte</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Validation Errors -->
                            <ul class="validationAddPerte"></ul>

                            <!-- Add Perte Form -->
                         <form id="FormAddPerte">
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-6">
            <!-- Nature de la perte - MOVED TO TOP -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Nature de la perte <span class="text-danger">*</span></label>
                        <select name="nature" class="form-control" id="natureDropDown" required>
                            <option value="">Sélectionner la nature</option>
                            <option value="stock">Stock</option>
                            <option value="produit fini">Produit fini</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Date de la perte <span class="text-danger">*</span></label>
                        <input type="date" name="date_perte" id="date_perte" class="form-control" required max="{{ date('Y-m-d') }}">
                    </div>
                </div>
            </div>

            <!-- Classe, Catégorie et Famille - CONDITIONAL -->
            <div id="classeCategorieSection" class="row mb-3" style="display: none;">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Classe <span class="text-danger">*</span></label>
                        <select name="classe" id="Class_Categorie_Perte" class="form-control">
                            <option value="">Sélectionner une classe</option>
                            @foreach($class as $item)
                            <option value="{{ $item->classe }}">{{ $item->classe }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Catégorie <span class="text-danger">*</span></label>
                        <select name="id_category" id="Categorie_Class_Perte" class="form-control">
                            <option value="">Sélectionner une catégorie</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Famille <span class="text-danger">*</span></label>
                        <select name="id_subcategorie" id="id_subcategorie_perte" class="form-control">
                            <option value="">Sélectionner une famille</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Stock Section -->
            <div id="stockSection" style="display: none;">
                <div class="card border-primary mb-3">
                    <div class="card-header bg-primary text-white">
                        <i class="fa-solid fa-boxes-stacked"></i> Perte de Stock
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Produit <span class="text-danger">*</span></label>
                                    <select name="id_product" id="id_product_perte" class="form-control">
                                        <option value="">Sélectionner un produit</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Unité</label>
                                    <input type="text" id="unite_display_perte" class="form-control" readonly disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Quantité perdue <span class="text-danger">*</span></label>
                                    <input type="number" step="0.01" name="quantite" id="quantite_stock" class="form-control" min="0.01">
                                </div>
                            </div>
                        </div>
                        <!-- Cost Display for Stock -->
                        <div id="stockCostSection" style="display: none;">
                            <div class="total-cost-display">
                                <h6><i class="fa-solid fa-calculator"></i> Calcul du Coût</h6>
                                <div class="cost-detail">
                                    <span>Prix unitaire:</span>
                                    <strong><span id="stock_prix_unitaire">0.00</span> DH</strong>
                                </div>
                                <div class="cost-detail">
                                    <span>Quantité perdue:</span>
                                    <strong><span id="stock_quantite_display">0</span></strong>
                                </div>
                                <hr>
                                <div class="cost-detail">
                                    <span class="fs-5"><strong>Coût Total:</strong></span>
                                    <span class="fs-4 text-danger"><strong><span id="stock_cout_total">0.00</span> DH</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Produit Fini Section -->
            <div id="produitFiniSection" style="display: none;">
                <div class="card border-success mb-3">
                    <div class="card-header bg-success text-white">
                        <i class="fa-solid fa-utensils"></i> Perte de Produit Fini
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Type de produit fini <span class="text-danger">*</span></label>
                                    <select name="produit_fini_type" id="produit_fini_type" class="form-select">
                                        <option value="">Sélectionner un type</option>
                                        <option value="Entrée">Entrée</option>
                                        <option value="Suite">Plat Principal</option>
                                        <option value="Dessert">Dessert</option>
                                        <option value="Accompagnement">Accompagnement</option>
                                        <option value="Autres">Autres</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nom du plat <span class="text-danger">*</span></label>
                                    <select name="id_plat" id="id_plat" class="form-select">
                                        <option value="">Sélectionner un plat</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Nombre de plats perdus <span class="text-danger">*</span></label>
                                    <input type="number" name="nombre_plats" id="nombre_plats" class="form-control" min="1" value="1">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cause -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Cause / Raison <span class="text-danger">*</span></label>
                        <textarea name="cause" class="form-control" rows="3" required placeholder="Décrivez la raison de la perte..."></textarea>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column - Composition & Cost (for Produit Fini only) -->
        <div class="col-md-6">
            <div id="compositionSection" style="display: none;">
                <div class="card border-info">
                    <div class="card-header bg-info text-white">
                        <i class="fa-solid fa-list-check"></i> Composition du Plat
                    </div>
                    <div class="card-body">
                        <div class="alert alert-info">
                            <i class="fa-solid fa-info-circle"></i> 
                            <strong>Plat sélectionné:</strong> <span id="selected_plat_name">-</span>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-sm composition-table">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Qté/plat</th>
                                        <th>Unité</th>
                                        <th>Prix Unit.</th>
                                        <th>Coût</th>
                                    </tr>
                                </thead>
                                <tbody id="composition_body">
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">
                                            <i class="fa-solid fa-hourglass-half"></i> Sélectionnez un plat pour voir sa composition
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="total-cost-display">
                            <h6><i class="fa-solid fa-calculator"></i> Calcul du Coût Total</h6>
                            <div class="cost-detail">
                                <span>Coût par plat:</span>
                                <strong><span id="cout_unitaire">0.00</span> DH</strong>
                            </div>
                            <div class="cost-detail">
                                <span>Nombre de plats perdus:</span>
                                <strong><span id="display_nombre_plats">1</span></strong>
                            </div>
                            <hr>
                            <div class="cost-detail">
                                <span class="fs-5"><strong>Coût Total de la Perte:</strong></span>
                                <span class="fs-4 text-danger"><strong><span id="cout_total">0.00</span> DH</strong></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                            <button type="button" class="btn btn-primary" id="BtnAddPerte">Déclarer la perte</button>
                        </div>
                    </div>
                </div>
            </div>
            @endcan

            <!-- Modal Edit Status Perte (Validate/Refuse) -->
            @can('Pertes-valider')
            <div class="modal fade" id="editPerteModal" tabindex="-1" aria-labelledby="editPerteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editPerteModalLabel">Modifier le statut de la perte</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form id="editPerteForm">
                            <div class="modal-body">
                                <input type="hidden" id="edit_perte_id" name="id">
                                
                                <div class="mb-3">
                                    <label for="edit_perte_status" class="form-label">Statut <span class="text-danger">*</span></label>
                                    <select class="form-select" id="edit_perte_status" name="status" required>
                                        <option value="">-- Sélectionner un statut --</option>
                                        <option value="En attente">En attente</option>
                                        <option value="Validé">Validé</option>
                                        <option value="Refusé">Refusé</option>
                                    </select>
                                    <span id="edit_perte_status_error" class="text-danger"></span>
                                </div>

                                <!-- Refusal Reason Field (Hidden by default) -->
                                <div class="mb-3" id="perte_refusal_reason_group" style="display: none;">
                                    <label for="edit_perte_refusal_reason" class="form-label">Motif de refus <span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="edit_perte_refusal_reason" name="refusal_reason" rows="3" 
                                              placeholder="Veuillez expliquer la raison du refus..."></textarea>
                                    <small class="form-text text-muted">Ce champ est obligatoire lorsque le statut est "Refusé"</small>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                                <button type="submit" class="btn btn-primary">Mettre à jour</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            @endcan

        </div>
    </div>
</div>

@endsection