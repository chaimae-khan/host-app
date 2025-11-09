@extends('dashboard.index')

@section('dashboard')

<script src="{{asset('js/plat_composition/script.js')}}"></script>
<script>
    var csrf_token = "{{csrf_token()}}";
    var getPlatsByTypeForComposition = "{{url('getPlatsByTypeForComposition')}}";
    var getProductForPlat = "{{url('getProductForPlat')}}";
    var PostInTmpPlat = "{{url('PostInTmpPlat')}}";
    var GetTmpPlatByPlatId = "{{url('GetTmpPlatByPlatId')}}";
    var StorePlatComposition = "{{url('StorePlatComposition')}}";
    var PlatComposition = "{{url('plat-composition')}}";
    var UpdateQteTmpPlat = "{{url('UpdateQteTmpPlat')}}";
    var DeleteRowsTmpPlat = "{{url('DeleteRowsTmpPlat')}}";
    var EditPlatComposition = "{{url('EditPlatComposition')}}";
    var UpdatePlatComposition = "{{url('UpdatePlatComposition')}}";
    var DeletePlatComposition = "{{url('DeletePlatComposition')}}";
    var getcategorybytypemenu = "{{ url('getcategorybytypemenu') }}"
    var getProduct = "{{url('getProduct')}}";
    var ExportCompositionExcel = "{{url('exportCompositionExcel')}}";
    var ExportCompositionPdf = "{{url('exportCompositionPdf')}}";
    var ExportCompositionDetailedPdf = "{{url('exportCompositionDetailedPdf')}}"; 
    var ImportCompositionExcel = "{{url('importCompositionExcel')}}";
    var DownloadImportTemplate = "{{url('downloadImportTemplate')}}"; // ← ADD THIS
</script>

<style>
    .TableProductPlat tbody tr:hover {
        cursor: pointer; 
    }
</style>

<div class="content-page"> 
    <div class="content">
        <div class="container-fluid">
            <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
                <div class="flex-grow-1">
                    <h4 class="fs-18 fw-semibold m-0">Composition des plats</h4>
                </div>
                
                <div class="text-end">
                    <ol class="breadcrumb m-0 py-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Applications</a></li>
                        <li class="breadcrumb-item active">Composition Plats</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="mb-3 d-flex flex-wrap gap-2">
                                @can('Plats-ajoute')
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalAddPlatComposition">
                                    <i class="fa-solid fa-plus"></i> Composer un plat
                                </button>
                                <button class="btn btn-info" id="BtnImportCompositionExcel">
                                    <i class="fa-solid fa-file-import"></i> Importer Excel
                                </button>
                                @endcan
                                
                                <button class="btn btn-success" id="BtnExportCompositionExcel">
                                    <i class="fa-solid fa-file-excel"></i> Exporter Excel
                                </button>
                                
                                <button class="btn btn-danger" id="BtnExportCompositionPdf">
                                    <i class="fa-solid fa-file-pdf"></i> Exporter PDF
                                </button>
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table datatable TablePlatComposition">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Nom du plat</th>
                                            <th scope="col">Ingrédients</th>
                                            <th scope="col">Quantité</th>
                                            <th scope="col">Unite</th>
                                            <th scope="col">Nombre de couvert</th>
                                            <th scope="col">Créé le</th>
                                            <th scope="col">Action</th>    
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Add Plat Composition -->
        @can('Plats-ajoute')
        <div class="modal fade" id="ModalAddPlatComposition" tabindex="-1" aria-hidden="true">
            <!-- ... existing modal content ... -->
        </div>
        @endcan

        <!-- Modal Edit Quantity -->
        <div class="modal fade" id="ModalEditQteTmpPlat" tabindex="-1">
            <!-- ... existing modal content ... -->
        </div>

        <!-- Modal Edit Plat Composition -->
        @can('Plats-modifier')
        <div class="modal fade" id="ModalEditPlatComposition" tabindex="-1">
            <!-- ... existing modal content ... -->
        </div>
        @endcan

        <!-- ========== ADD THIS IMPORT MODAL HERE ========== -->
        <div class="modal fade" id="ModalImportComposition" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">
                            <i class="fa-solid fa-file-import me-2"></i>Importer compositions depuis Excel
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Instructions -->
                      

                        <!-- Download Template Button -->
                        <!-- <div class="mb-4 text-center">
                            <button type="button" class="btn btn-success btn-lg" id="BtnDownloadTemplate">
                                <i class="fa-solid fa-download me-2"></i>Télécharger le modèle Excel
                            </button>
                        </div> -->

                        <hr>

                        <!-- File Upload Section -->
                        <div class="mb-3">
                            <label for="import_file" class="form-label fw-bold">
                                <i class="fa-solid fa-file-excel me-2"></i>Sélectionner le fichier Excel
                            </label>
                            <div class="input-group">
                                <input type="file" 
                                       class="form-control" 
                                       id="import_file" 
                                       accept=".xlsx,.xls"
                                       required>
                                <label class="input-group-text" for="import_file">
                                    <i class="fa-solid fa-folder-open"></i>
                                </label>
                            </div>
                            <small class="form-text text-muted">
                                Formats acceptés: .xlsx, .xls (Max: 10 Mo)
                            </small>
                        </div>
                          <div class="alert alert-info">
                            <h6 class="alert-heading">
                                <i class="fa-solid fa-info-circle me-2"></i>Instructions d'importation
                            </h6>
                            <ol class="mb-0">
                                <li>Téléchargez le modèle Excel en cliquant sur le bouton ci-dessous</li>
                                <li>Remplissez le fichier avec vos données:
                                    <ul>
                                        <li><strong>Nom du plat:</strong> Doit correspondre à un plat existant</li>
                                        <li><strong>Ingrédients:</strong> Nom du produit (doit exister)</li>
                                        <li><strong>Quantité:</strong> Valeur numérique positive</li>
                                        <li><strong>Unité:</strong> Doit exister dans le système (g, kg, L, ml, etc.)</li>
                                        <li><strong>Nombre de couvert:</strong> Nombre entier >= 1</li>
                                    </ul>
                                </li>
                                <li>Téléversez le fichier rempli</li>
                                <li>Cliquez sur "Importer"</li>
                            </ol>
                        </div>

                        <!-- Selected File Display -->
                        <!-- <div id="file-selected" class="mb-3">
                            <div class="alert alert-secondary d-flex align-items-center" style="display: none;" id="file-info">
                                <i class="fa-solid fa-file-excel text-success fs-3 me-3"></i>
                                <div>
                                    <strong>Fichier sélectionné:</strong><br>
                                    <span id="file-name-display"></span>
                                </div>
                            </div>
                        </div> -->

                        <!-- Import Result -->
                        <div id="import-result"></div>

                        <!-- Warning about existing data -->
                        <div class="alert alert-warning mt-3">
                            <i class="fa-solid fa-exclamation-triangle me-2"></i>
                            <strong>Attention:</strong> Si une composition existe déjà pour le même plat et produit, 
                            elle sera mise à jour avec les nouvelles valeurs.
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            <i class="fa-solid fa-times me-2"></i>Annuler
                        </button>
                        <button type="button" class="btn btn-primary" id="BtnConfirmImport" disabled>
                            <i class="fa-solid fa-file-import me-2"></i>Importer
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
#file-name-display {
    font-family: monospace;
    color: #0d6efd;
}

#import-result ul {
    max-height: 200px;
    overflow-y: auto;
}

.modal-header.bg-primary {
    background-color: #0d6efd !important;
}
</style>

@endsection