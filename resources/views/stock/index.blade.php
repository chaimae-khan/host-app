@extends('dashboard.index')

@section('dashboard')
<script src="{{ asset('js/stock/script.js') }}"></script>
<script>
    var csrf_token = "{{ csrf_token() }}";
    var stockUrl = "{{ url('stock') }}";
    var alertCountUrl = "{{ url('stock/alert-count') }}";
    var stockExportExcelUrl = "{{ url('stock/export-excel') }}";
    var stockExportPdfUrl = "{{ url('stock/export-pdf') }}";
    var getSubcategories_url = "{{ url('stock/subcategories') }}";
    var GetCategorieByClass = "{{ url('stock/categories-by-class') }}";
    var searchProductNames_url = "{{ url('stock/search-product-names') }}";
     var GetProductByCategoryAndFamille = "{{url('GetProductByCategoryAndFamille')}}";
     var GetCategooryAndProduct = "{{url('GetCategooryAndProduct')}}";
    var GetFamilleAndProduct = "{{url('GetFamilleAndProduct')}}";
</script>
<div class="content-page">
    <div class="content">

        <!-- Start Content-->
        <div class="container-fluid">

            <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
                <div class="flex-grow-1">
                    <h4 class="fs-18 fw-semibold m-0">Gestion de Stock</h4>
                </div>
                
                <div class="text-end">
                    <ol class="breadcrumb m-0 py-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">Applications</a></li>
                        <li class="breadcrumb-item active">Stock</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="alert alert-warning alert-dismissible fade" role="alert" id="stock-alert" style="display: none;">
                                <strong><i class="fa-solid fa-triangle-exclamation me-2"></i>Attention!</strong> 
                                la quantité de <span id="alert-count">0</span> produit(s) est presque épuisée.
                                <span id="product-names"></span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                                                    
                            <div class="table-responsive">
<!-- Filter Section -->
<div class="row mb-3">
    {{-- <div class="col-md-3">
        <label for="filter_class" class="form-label">Classe</label>
        <select class="form-select" id="filter_class" name="filter_class">
            <option value="">Toutes les classes</option>
            @foreach($class as $cl)
                <option value="{{ $cl->classe }}">{{ $cl->classe }}</option>
            @endforeach
        </select>
    </div>
    
    <div class="col-md-3">
        <label for="filter_categorie" class="form-label">Catégorie</label>
        <select class="form-select" id="filter_categorie" name="filter_categorie">
            <option value="">Toutes les catégories</option>
        </select>
    </div>
    
    <div class="col-md-3">
        <label for="filter_subcategorie" class="form-label">Famille</label>
        <select class="form-select" id="filter_subcategorie" name="filter_subcategorie">
            <option value="">Toutes les familles</option>
        </select>
    </div>
    
    <div class="col-md-3">
        <label for="filter_designation" class="form-label">Désignation</label>
        <div class="position-relative">
            <input type="text" class="form-control" id="filter_designation" 
                   placeholder="Rechercher un produit...">
            <div id="designation_suggestions" class="list-group position-absolute w-100" 
                 style="z-index: 1000; display: none; max-height: 200px; overflow-y: auto;">
            </div>
        </div>
    </div> --}}
    <div class="col-md-3">
        <div class="form-group">
            <label for="" class="form-label">Class</label>
            <select name="" id="dropdownclass" class="form-select">
                <option value="0">Sélectionner un class</option>
                @foreach ($class as $item)
                    <option value="{{ $item->classe }}">{{ $item->classe }}</option>
                @endforeach
            </select>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <label for="" class="form-label">Catégorie</label>
            <select name="" id="dropdowncategory" class="form-select"></select>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <label for="" class="form-label">Famille</label>
            <select name="" id="dropdownFamille" class="form-select"></select>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <label for="product_selector" class="form-label">Produit</label>
            <select class="form-select" id="product_selector">
                <option value="">Sélectionner un produit</option>
                @foreach ($products as $product)
                    <option value="{{ $product->id }}">{{ $product->name }}</option>
                @endforeach
            </select>
        </div>
    </div>
</div>

<div class="row mb-3">
    <div class="col-12">
        <button type="button" class="btn btn-secondary" id="btn_reset_filter">
            <i class="fa-solid fa-filter-circle-xmark me-1"></i> Réinitialiser les filtres
        </button>
    </div>
</div>
                                <div class="datatable-wrapper datatable-loading no-footer sortable fixed-height fixed-columns">
                                    
                                    <div class="datatable-container">
                                        <table class="table datatable datatable-table TableStock w-100">
    <thead>
    <tr>
        <th data-sortable="true">Nom du Produit</th>
        <th data-sortable="true">Unité</th>
        <th data-sortable="true">Catégorie</th>
        <th data-sortable="true">Famille</th>
        <th data-sortable="true">Emplacement</th>
        <th data-sortable="true" style="display: none;">Taux TVA</th>
        <th data-sortable="true">Stock</th>
        <th data-sortable="false">Statut</th>
    </tr>
</thead>
       
                                            <tbody>
                                                <!-- Table content will be dynamically generated -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#dropdownclass').on('change', function (e) {
    e.preventDefault(); // optional, useful if inside a form

    let selectedClass = $(this).val();

    if (selectedClass == 0 || selectedClass === "") {
        alert("Please select a class");
        return false;
    }

    $.ajax({
        type: "GET",
        url: GetCategooryAndProduct,
        data: { class: selectedClass },
        dataType: "json",
        success: function (response) {
            if (response.status == 200) 
            {
                let $dropdowncategory = $('#dropdowncategory');
                $dropdowncategory.empty();
                $dropdowncategory.append('<option value="0">Please select category</option>');

                $.each(response.Categorys, function (index, value) {
                    $dropdowncategory.append(
                        '<option value="' + value.id + '">' + value.name + '</option>'
                    );
                });

                let $product_selector = $('#product_selector');
                $product_selector.empty();
                $product_selector.append('<option value="0">Sélectionner un produit</option>');

                $.each(response.ProductByClass, function (index, value) {
                    $product_selector.append(
                        '<option value="' + value.id + '">' + value.name + '</option>'
                    );
                });

                /**** */
                if ($.fn.DataTable.isDataTable('.TableStock')) 
                {
                    $('.TableStock').DataTable().destroy();
                }
                var tableStock = $('.TableStock').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: 'Copier',
                            exportOptions: {
                                columns: ':visible'
                            }
                        },
                        {
                            text: 'Exporter Excel',
                            className: 'btn-export-all',
                            action: function (e, dt, button, config) {
                                // Get visible columns
                                var visibleColumnsIndices = [];
                                dt.columns().every(function (index) {
                                    if (dt.column(index).visible()) {
                                        visibleColumnsIndices.push(index);
                                    }
                                });
                                
                                // Redirect to server-side export with visible columns as parameter
                                window.location.href = stockExportExcelUrl + '?columns=' + visibleColumnsIndices.join(',');
                            }
                        },
                    {
                        text: 'Exporter PDF',
                        className: 'btn-export-all',
                        action: function (e, dt, button, config) {
                            // Get visible columns
                            var visibleColumnsIndices = [];
                            dt.columns().every(function (index) {
                                if (dt.column(index).visible()) {
                                    visibleColumnsIndices.push(index);
                                }
                            });
                            
                            // Redirect to server-side export with visible columns as parameter
                            window.location.href = stockExportPdfUrl + '?columns=' + visibleColumnsIndices.join(',');
                        }
                    },
                    {
                        extend: 'colvis',
                        text: 'Colonnes'
                    }
                ],
                processing: true,
                serverSide: true,
                ajax: {
                    url: stockUrl,
                    data: function(d) {
                        // Add filter parameters
                        d.filter_class = selectedClass;
                       
                    },
                    dataSrc: function (json) {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').css('display', 'none');
                        }
                        return json.data;
                    },
                    error: function(xhr, error, thrown) {
                        console.log('DataTables error: ' + error + ' ' + thrown);
                        console.log(xhr);
                    }
                },
                columns: 
                [
                    { data: 'name', name: 'p.name' },
                    { data: 'unite_name', name: 'u.name' },
                    { data: 'categorie', name: 'c.name' },
                    { data: 'famille', name: 'sc.name' },
                    { data: 'emplacement', name: 'p.emplacement' },
                    { data: 'quantite', name: 'quantite' },
                    { 
                        data: 'status', 
                        name: 'status', 
                        orderable: false, 
                        searchable: false
                    }
                ],
                language: {
                    "sInfo": "",
                    "sInfoEmpty": "Affichage de l'élément 0 à 0 sur 0 élément",
                    "sInfoFiltered": "(filtré à partir de _MAX_ éléments au total)",
                    "sLengthMenu": "Afficher _MENU_ éléments",
                    "sLoadingRecords": "Chargement...",
                    "sProcessing": "Traitement...",
                    "sSearch": "Rechercher :",
                    "sZeroRecords": "Aucun élément correspondant trouvé",
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sLast": "Dernier",
                        "sNext": "Suivant",
                        "sPrevious": "Précédent"
                    }
                },
                createdRow: function(row, data, dataIndex) {
                    if (parseInt(data.quantite) <= parseInt(data.seuil)) {
                        $(row).addClass('bg-danger-subtle text-danger');
                        
                        $(row).attr('data-bs-toggle', 'tooltip');
                        $(row).attr('data-bs-placement', 'top');
                        $(row).attr('title', 'Attention : la quantité de ce produit est presque épuisée.');
                    }
                },
                drawCallback: function() {
                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                    tooltipTriggerList.map(function (tooltipTriggerEl) {
                        return new bootstrap.Tooltip(tooltipTriggerEl);
                    });
                }
            });
                /**/
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", error);
        }
    });
});

$('#dropdowncategory').on('change', function (e) {
    e.preventDefault(); 

   
    let selectedCategory= $(this).val(); 

    

    if (selectedCategory == 0 || selectedCategory === "") {
        alert("Please select a categories");
        return false;
    }

    $.ajax({
        type: "GET",
        url: GetFamilleAndProduct,
        data: 
        { 
           
            category : selectedCategory
        },
        dataType: "json",
        success: function (response) {
            if (response.status == 200) 
            {
                let $dropdownFamille = $('#dropdownFamille');
                $dropdownFamille.empty();
                $dropdownFamille.append('<option value="0">Please select famille</option>');

                $.each(response.Famille, function (index, value) {
                    $dropdownFamille.append(
                        '<option value="' + value.id + '">' + value.name + '</option>'
                    );
                });

                let $product_selector = $('#product_selector');
                $product_selector.empty();
                $product_selector.append('<option value="0">Sélectionner un produit</option>');

                $.each(response.ProductByCategory, function (index, value) {
                    $product_selector.append(
                        '<option value="' + value.id + '">' + value.name + '</option>'
                    );
                });
                /****** */
                if ($.fn.DataTable.isDataTable('.TableStock')) 
                {
                    $('.TableStock').DataTable().destroy();
                }
                var tableStock = $('.TableStock').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: 'Copier',
                            exportOptions: {
                                columns: ':visible'
                            }
                        },
                        {
                            text: 'Exporter Excel',
                            className: 'btn-export-all',
                            action: function (e, dt, button, config) {
                                // Get visible columns
                                var visibleColumnsIndices = [];
                                dt.columns().every(function (index) {
                                    if (dt.column(index).visible()) {
                                        visibleColumnsIndices.push(index);
                                    }
                                });
                                
                                // Redirect to server-side export with visible columns as parameter
                                window.location.href = stockExportExcelUrl + '?columns=' + visibleColumnsIndices.join(',');
                            }
                        },
                    {
                        text: 'Exporter PDF',
                        className: 'btn-export-all',
                        action: function (e, dt, button, config) {
                            // Get visible columns
                            var visibleColumnsIndices = [];
                            dt.columns().every(function (index) {
                                if (dt.column(index).visible()) {
                                    visibleColumnsIndices.push(index);
                                }
                            });
                            
                            // Redirect to server-side export with visible columns as parameter
                            window.location.href = stockExportPdfUrl + '?columns=' + visibleColumnsIndices.join(',');
                        }
                    },
                    {
                        extend: 'colvis',
                        text: 'Colonnes'
                    }
                ],
                processing: true,
                serverSide: true,
                ajax: {
                    url: stockUrl,
                    data: function(d) {
                        // Add filter parameters
                        d.filter_categorie = selectedCategory;
                       
                    },
                    dataSrc: function (json) {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').css('display', 'none');
                        }
                        return json.data;
                    },
                    error: function(xhr, error, thrown) {
                        console.log('DataTables error: ' + error + ' ' + thrown);
                        console.log(xhr);
                    }
                },
                columns: 
                [
                    { data: 'name', name: 'p.name' },
                    { data: 'unite_name', name: 'u.name' },
                    { data: 'categorie', name: 'c.name' },
                    { data: 'famille', name: 'sc.name' },
                    { data: 'emplacement', name: 'p.emplacement' },
                    { data: 'quantite', name: 'quantite' },
                    { 
                        data: 'status', 
                        name: 'status', 
                        orderable: false, 
                        searchable: false
                    }
                ],
                language: {
                    "sInfo": "",
                    "sInfoEmpty": "Affichage de l'élément 0 à 0 sur 0 élément",
                    "sInfoFiltered": "(filtré à partir de _MAX_ éléments au total)",
                    "sLengthMenu": "Afficher _MENU_ éléments",
                    "sLoadingRecords": "Chargement...",
                    "sProcessing": "Traitement...",
                    "sSearch": "Rechercher :",
                    "sZeroRecords": "Aucun élément correspondant trouvé",
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sLast": "Dernier",
                        "sNext": "Suivant",
                        "sPrevious": "Précédent"
                    }
                },
                createdRow: function(row, data, dataIndex) {
                    if (parseInt(data.quantite) <= parseInt(data.seuil)) {
                        $(row).addClass('bg-danger-subtle text-danger');
                        
                        $(row).attr('data-bs-toggle', 'tooltip');
                        $(row).attr('data-bs-placement', 'top');
                        $(row).attr('title', 'Attention : la quantité de ce produit est presque épuisée.');
                    }
                },
                drawCallback: function() {
                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                    tooltipTriggerList.map(function (tooltipTriggerEl) {
                        return new bootstrap.Tooltip(tooltipTriggerEl);
                    });
                }
            });
                /* */

            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", error);
        }
    });
});

$('#dropdownFamille').on('change',function(e)
{
    e.preventDefault(); 
    let category = $('#dropdowncategory').val();
    let dropdownFamille = $(this).val();

    if (category == 0 || category === "") {
        alert("Please select a categories");
        return false;
    }

    if (dropdownFamille == 0 || dropdownFamille === "") {
        alert("Please select a famille");
        return false;
    }
    $.ajax({ 
        type: "get",
        url: GetProductByCategoryAndFamille,
        data:
        {
            category : category,
            Famille  : dropdownFamille,
        },
        dataType: "json",
        success: function (response) 
        {
            if(response.status == 200)
            {
                let $product_selector = $('#product_selector');
                $product_selector.empty();
                $product_selector.append('<option value="0">Sélectionner un produit</option>');

                $.each(response.ProductByCategoryAndFamille, function (index, value) {
                    $product_selector.append(
                        '<option value="' + value.id + '">' + value.name + '</option>'
                    );
                });

                /* */
                 if ($.fn.DataTable.isDataTable('.TableStock')) 
                {
                    $('.TableStock').DataTable().destroy();
                }
                var tableStock = $('.TableStock').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: 'Copier',
                            exportOptions: {
                                columns: ':visible'
                            }
                        },
                        {
                            text: 'Exporter Excel',
                            className: 'btn-export-all',
                            action: function (e, dt, button, config) {
                                // Get visible columns
                                var visibleColumnsIndices = [];
                                dt.columns().every(function (index) {
                                    if (dt.column(index).visible()) {
                                        visibleColumnsIndices.push(index);
                                    }
                                });
                                
                                // Redirect to server-side export with visible columns as parameter
                                window.location.href = stockExportExcelUrl + '?columns=' + visibleColumnsIndices.join(',');
                            }
                        },
                    {
                        text: 'Exporter PDF',
                        className: 'btn-export-all',
                        action: function (e, dt, button, config) {
                            // Get visible columns
                            var visibleColumnsIndices = [];
                            dt.columns().every(function (index) {
                                if (dt.column(index).visible()) {
                                    visibleColumnsIndices.push(index);
                                }
                            });
                            
                            // Redirect to server-side export with visible columns as parameter
                            window.location.href = stockExportPdfUrl + '?columns=' + visibleColumnsIndices.join(',');
                        }
                    },
                    {
                        extend: 'colvis',
                        text: 'Colonnes'
                    }
                ],
                processing: true,
                serverSide: true,
                ajax: {
                    url: stockUrl,
                    data: function(d) {
                        // Add filter parameters
                        d.filter_subcategorie = dropdownFamille;
                       
                    },
                    dataSrc: function (json) {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').css('display', 'none');
                        }
                        return json.data;
                    },
                    error: function(xhr, error, thrown) {
                        console.log('DataTables error: ' + error + ' ' + thrown);
                        console.log(xhr);
                    }
                },
                columns: 
                [
                    { data: 'name', name: 'p.name' },
                    { data: 'unite_name', name: 'u.name' },
                    { data: 'categorie', name: 'c.name' },
                    { data: 'famille', name: 'sc.name' },
                    { data: 'emplacement', name: 'p.emplacement' },
                    { data: 'quantite', name: 'quantite' },
                    { 
                        data: 'status', 
                        name: 'status', 
                        orderable: false, 
                        searchable: false
                    }
                ],
                language: {
                    "sInfo": "",
                    "sInfoEmpty": "Affichage de l'élément 0 à 0 sur 0 élément",
                    "sInfoFiltered": "(filtré à partir de _MAX_ éléments au total)",
                    "sLengthMenu": "Afficher _MENU_ éléments",
                    "sLoadingRecords": "Chargement...",
                    "sProcessing": "Traitement...",
                    "sSearch": "Rechercher :",
                    "sZeroRecords": "Aucun élément correspondant trouvé",
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sLast": "Dernier",
                        "sNext": "Suivant",
                        "sPrevious": "Précédent"
                    }
                },
                createdRow: function(row, data, dataIndex) {
                    if (parseInt(data.quantite) <= parseInt(data.seuil)) {
                        $(row).addClass('bg-danger-subtle text-danger');
                        
                        $(row).attr('data-bs-toggle', 'tooltip');
                        $(row).attr('data-bs-placement', 'top');
                        $(row).attr('title', 'Attention : la quantité de ce produit est presque épuisée.');
                    }
                },
                drawCallback: function() {
                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                    tooltipTriggerList.map(function (tooltipTriggerEl) {
                        return new bootstrap.Tooltip(tooltipTriggerEl);
                    });
                }
            });
                /* */
            }    
        }
    });
});


$('#product_selector').on('change',function(e)
{
    e.preventDefault();
    let product = $(this).val();
    let productText="";
    if(product == 0)
    {
        alert("Please selected porduct")
        return false;   
    }
    else
    {
         productText = $(this).find("option:selected").text();
    }

     if ($.fn.DataTable.isDataTable('.TableStock')) 
                {
                    $('.TableStock').DataTable().destroy();
                }
                var tableStock = $('.TableStock').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: 'Copier',
                            exportOptions: {
                                columns: ':visible'
                            }
                        },
                        {
                            text: 'Exporter Excel',
                            className: 'btn-export-all',
                            action: function (e, dt, button, config) {
                                // Get visible columns
                                var visibleColumnsIndices = [];
                                dt.columns().every(function (index) {
                                    if (dt.column(index).visible()) {
                                        visibleColumnsIndices.push(index);
                                    }
                                });
                                
                                // Redirect to server-side export with visible columns as parameter
                                window.location.href = stockExportExcelUrl + '?columns=' + visibleColumnsIndices.join(',');
                            }
                        },
                    {
                        text: 'Exporter PDF',
                        className: 'btn-export-all',
                        action: function (e, dt, button, config) {
                            // Get visible columns
                            var visibleColumnsIndices = [];
                            dt.columns().every(function (index) {
                                if (dt.column(index).visible()) {
                                    visibleColumnsIndices.push(index);
                                }
                            });
                            
                            // Redirect to server-side export with visible columns as parameter
                            window.location.href = stockExportPdfUrl + '?columns=' + visibleColumnsIndices.join(',');
                        }
                    },
                    {
                        extend: 'colvis',
                        text: 'Colonnes'
                    }
                ],
                processing: true,
                serverSide: true,
                ajax: {
                    url: stockUrl,
                    data: function(d) {
                        // Add filter parameters
                        d.filter_designation = productText;
                       
                    },
                    dataSrc: function (json) {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').css('display', 'none');
                        }
                        return json.data;
                    },
                    error: function(xhr, error, thrown) {
                        console.log('DataTables error: ' + error + ' ' + thrown);
                        console.log(xhr);
                    }
                },
                columns: 
                [
                    { data: 'name', name: 'p.name' },
                    { data: 'unite_name', name: 'u.name' },
                    { data: 'categorie', name: 'c.name' },
                    { data: 'famille', name: 'sc.name' },
                    { data: 'emplacement', name: 'p.emplacement' },
                    { data: 'quantite', name: 'quantite' },
                    { 
                        data: 'status', 
                        name: 'status', 
                        orderable: false, 
                        searchable: false
                    }
                ],
                language: {
                    "sInfo": "",
                    "sInfoEmpty": "Affichage de l'élément 0 à 0 sur 0 élément",
                    "sInfoFiltered": "(filtré à partir de _MAX_ éléments au total)",
                    "sLengthMenu": "Afficher _MENU_ éléments",
                    "sLoadingRecords": "Chargement...",
                    "sProcessing": "Traitement...",
                    "sSearch": "Rechercher :",
                    "sZeroRecords": "Aucun élément correspondant trouvé",
                    "oPaginate": {
                        "sFirst": "Premier",
                        "sLast": "Dernier",
                        "sNext": "Suivant",
                        "sPrevious": "Précédent"
                    }
                },
                createdRow: function(row, data, dataIndex) {
                    if (parseInt(data.quantite) <= parseInt(data.seuil)) {
                        $(row).addClass('bg-danger-subtle text-danger');
                        
                        $(row).attr('data-bs-toggle', 'tooltip');
                        $(row).attr('data-bs-placement', 'top');
                        $(row).attr('title', 'Attention : la quantité de ce produit est presque épuisée.');
                    }
                },
                drawCallback: function() {
                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                    tooltipTriggerList.map(function (tooltipTriggerEl) {
                        return new bootstrap.Tooltip(tooltipTriggerEl);
                    });
                }
            });
    
});
</script>

<style>
    /* Stock table styles */
    .TableStock tr.bg-danger-subtle {
        background-color: rgba(var(--bs-danger-rgb), 0.15) !important;
    }
    
    .TableStock tr.bg-danger-subtle td {
        color: var(--bs-danger) !important;
        font-weight: 500;
    }
    
    .badge.bg-danger {
        white-space: nowrap;
    }
    
    .badge.bg-success {
        white-space: nowrap;
    }
</style>
@endsection