//command js file 
$(document).ready(function () {
    // Helper function to format menu names for display
    function formatMenuName(menuType) {
        if (menuType === 'Menu eleves') {
            return 'Menu standard';
        }
        return menuType;
    }


   
   let Formateur = 0;
Formateur = $('#DropDown_formateur').val();

function ClearAllProductTmp()
{
    console.log('🧹 Clearing tmp vente on page load for Formateur:', Formateur);
    
    $.ajax({
        type: "POST",  // ✅ Changed to POST
        url: cleanTmpVente,  // ✅ Changed from ClearTmpVente to cleanTmpVente
        data: 
        {
            _token: csrf_token,  // ✅ Added CSRF token
            id_formateur: Formateur  // ✅ Changed parameter name
        },
        dataType: "json",
        success: function (response) 
        {
            if(response.status == 200)
            {
                console.log('✅ Cleared tmp vente on page load. Rows deleted:', response.deleted_count);
            }   
        },
        error: function(xhr, status, error) {
            console.error('❌ Error clearing tmp vente on page load:', error);
            console.error('Response:', xhr.responseText);
        }
    });    
} 


    ClearAllProductTmp();
    // Initialize tables for this user
    /* if (Formateur != 0) {
        initializeTableTmpVente('.TableTmpVente', Formateur);
        GetTotalTmpByFormateurAndUserScript(Formateur);
    } */
    
    $('.linkCallModalAddProduct').on('click', function(e) {
        $('#ModalAddProduct').modal("show");
        $('#ModalAddVente').modal("hide");
    });

    function GetTotalTmpByFormateurAndUserScript(Formateur) {
        console.log("Getting total for demandeur ID:", Formateur);
        
        $.ajax({
            type: "GET",
            url: GetTotalTmpByFormateurAndUser,
            data: {
                'id_formateur': Formateur,
            },
            dataType: "json",
            success: function(response) {
                if(response.status == 200) {
                    $('.TotalByFormateurAndUser').text(response.total + " DH");
                    console.log("Total updated successfully:", response.total);
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching total:", error);
                console.error("Status:", status);
                console.error("Response:", xhr.responseText);
            }
        });
    }
    
    // Initialize dependent dropdowns
    initializeDropdowns();

    // Keep track of active DataTables to prevent duplication
    let activeDataTables = {
        tmpVente: null,
        productSearch: null
    };

    // Keep track of AJAX requests in progress to prevent duplicate submissions
    let ajaxInProgress = {
        deleteRowTmp: false,
        postInTmpVente: false,
        updateQteTmp: false,
        saveVente: false,
        updateVente: false,
        changeStatusVente: false,
        deleteVente: false,
        addProduct: false
    };

    function loadSubcategories(categorySelector, subcategorySelector, selectedValue = null) {
        var categoryId = $(categorySelector).val();
        var subcategorySelect = $(subcategorySelector);
        
        // Reset subcategory dropdown
        subcategorySelect.empty().append('<option value="">Sélectionner une famille</option>');
        
        if (!categoryId) {
            console.warn('Aucune catégorie sélectionnée');
            return;
        }

        $.ajax({
            url: getSubcategories_url + "/" + categoryId,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                console.log("Réponse des sous-catégories:", response);
                
                if (response.status === 200 && response.subcategories.length > 0) {
                    $.each(response.subcategories, function(key, subcategory) {
                        subcategorySelect.append(
                            `<option value="${subcategory.id}">${subcategory.name}</option>`
                        );
                    });
                    
                    // Set selected value if provided
                    if (selectedValue) {
                        subcategorySelect.val(selectedValue);
                    }
                } else {
                    console.warn('Aucune sous-catégorie trouvée');
                    new AWN().warning("Aucune famille trouvée pour cette catégorie", { durations: { warning: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement des sous-catégories:", error);
                new AWN().alert("Impossible de charger les familles", { durations: { alert: 5000 } });
            }
        });
    }

    // Load Rayons Function
    function loadRayons(localSelector, rayonSelector, selectedValue = null) {
        var localId = $(localSelector).val();
        var rayonSelect = $(rayonSelector);
        
        // Reset rayon dropdown
        rayonSelect.empty().append('<option value="">Sélectionner un rayon</option>');
        
        if (!localId) {
            console.warn('Aucun local sélectionné');
            return;
        }

        $.ajax({
            url: getRayons_url + "/" + localId,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                console.log("Réponse des rayons:", response);
                
                if (response.status === 200 && response.rayons.length > 0) {
                    $.each(response.rayons, function(key, rayon) {
                        rayonSelect.append(
                            `<option value="${rayon.id}">${rayon.name}</option>`
                        );
                    });
                    
                    // Set selected value if provided
                    if (selectedValue) {
                        rayonSelect.val(selectedValue);
                    }
                } else {
                    console.warn('Aucun rayon trouvé');
                    new AWN().warning("Aucun rayon trouvé pour ce local", { durations: { warning: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement des rayons:", error);
                new AWN().alert("Impossible de charger les rayons", { durations: { alert: 5000 } });
            }
        });
    }

    // Initialize Dropdowns
    function initializeDropdowns() {
        // Category change - load subcategories
        $('#id_categorie, #edit_id_categorie').on('change', function() {
            var targetCategory = $(this).attr('id') === 'id_categorie' 
                ? '#id_subcategorie' 
                : '#edit_id_subcategorie';
            
            loadSubcategories(
                '#' + $(this).attr('id'), 
                targetCategory
            );
        });
        
        // Local change - load rayons
        $('#id_local, #edit_id_local').on('change', function() {
            var targetLocal = $(this).attr('id') === 'id_local' 
                ? '#id_rayon' 
                : '#edit_id_rayon';
            
            loadRayons(
                '#' + $(this).attr('id'), 
                targetLocal
            );
        });
    }

    function initializeTableTmpVente(selector, IdFormateur) {
        console.log("Initializing tmp vente table for demandeur ID:", IdFormateur);
        
        // Properly destroy DataTable if it exists
        if (activeDataTables.tmpVente) {
            activeDataTables.tmpVente.destroy();
            activeDataTables.tmpVente = null;
        }
        
        // Reinitialize DataTable
        activeDataTables.tmpVente = $(selector).DataTable({
            select: true,
            processing: true,
            serverSide: true,
            destroy: true,
            autoWidth: false,
            ajax: {
                url: GetTmpVenteByFormateur,
                data: function(d) {
                    d.id_formateur = IdFormateur;
                },
                dataType: 'json',
                type: 'GET',
                error: function(xhr, error, code) {
                    console.error('Error occurred while fetching temp vente: ', error);
                    console.error('XHR Response:', xhr.responseText);
                }
            },
            columns: [
                { data: 'name', name: 'name', title: 'Produit' },
                { data: 'qte', name: 'qte', title: 'Quantité' },
                { data: 'formateur_name', name: 'formateur_name', title: 'Formateur' },
                { 
                    data: 'action', 
                    name: 'action',
                    title: 'Action', 
                    orderable: false, 
                    searchable: false
                }
            ],
            rowCallback: function(row, data, index) {
                $(row).attr('id', data.id);
            },
            language: {
                "sInfo": "Affichage de l'élément _START_ à _END_ sur _TOTAL_ éléments",
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
            drawCallback: function() {
                console.log("Table drawn successfully");
            }
        });
        
        // Re-attach event handlers for the edit and delete buttons
        attachTableEventHandlers(selector, IdFormateur);
    
        return activeDataTables.tmpVente;
    }
    
    // Extract event handlers to a separate function for cleaner code
    function attachTableEventHandlers(selector, IdFormateur) {
        // Edit button event
        $(selector).off('click', '.EditTmp').on('click', '.EditTmp', function(e) {
            e.preventDefault();
            
            let IdTmp = $(this).attr('data-id');
            let Qtetmp = $(this).closest('tr').find('td:eq(1)').text();
            
            // Store the current formateur ID in the modal or a data attribute
            $('#ModalEditQteTmp').data('formateur-id', IdFormateur);
            
            $('#ModalEditQteTmp').modal('show');
            $('#BtnUpdateQteTmp').attr('data-id', IdTmp); 
            $('#QteTmp').val(Qtetmp);   
        });
    
        // Delete button event
        $(selector).off('click', '.DeleteTmp').on('click', '.DeleteTmp', function(e) {
            e.preventDefault();
            
            // If already processing a delete request, ignore this click
            if (ajaxInProgress.deleteRowTmp) {
                return;
            }
            
            let IdTmp = $(this).attr('data-id');
            let deleteButton = $(this);
            
            // Mark delete operation as in progress and disable the button
            ajaxInProgress.deleteRowTmp = true;
            deleteButton.prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin text-danger"></i>');
            
            $.ajax({
                type: "POST",
                url: DeleteRowsTmpVente,
                data: {
                    '_token': csrf_token,
                    'id': IdTmp,
                },
                dataType: "json",
                success: function(response) {
                    // Mark delete operation as complete
                    ajaxInProgress.deleteRowTmp = false;
                    
                    if(response.status == 200) {
                        new AWN().success(response.message, {durations: {success: 5000}});
                        
                        // Use the stored IdFormateur
                        initializeTableTmpVente(selector, IdFormateur);
                        GetTotalTmpByFormateurAndUserScript(IdFormateur);
                    }
                },
                error: function(xhr, status, error) {
                    // Mark delete operation as complete and restore the button
                    ajaxInProgress.deleteRowTmp = false;
                    deleteButton.prop('disabled', false).html('<i class="fa-solid fa-trash text-danger"></i>');
                    
                    console.error("Error deleting item:", error);
                    console.error("Response:", xhr.responseText);
                    new AWN().alert("Erreur lors de la suppression", {durations: {alert: 5000}});
                }
            });
        });
    }

 function initializeTableProduct(selector, data) {
    // Properly destroy DataTable if it exists
    if (activeDataTables.productSearch) {
        activeDataTables.productSearch.destroy();
        activeDataTables.productSearch = null;
    }

    // Initialize DataTable
    activeDataTables.productSearch = $(selector).DataTable({
        select: true,
        data: data,
        destroy: true,
        processing: true,
        serverSide: false,
        autoWidth: false,
        columns: [
            { data: 'name', title: 'Produit' },
            { data: 'quantite', title: 'Quantité' },
            { data: 'seuil', title: 'Seuil' },
            { data: 'name_local', title: 'Local' }
        ],
        rowCallback: function(row, data, index) {
            $(row).attr('id', data.id); 
        },
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
        }
    });

    // ✅ NEW: Remove old click handler and add new one for quantity modal
    $(selector + ' tbody').off('click', 'tr');
    
    $(selector + ' tbody').on('click', 'tr', function(e) {
        e.preventDefault();
        
        let id = $(this).attr('id');
        let Formateur = $('#DropDown_formateur').val();
        let productName = $(this).find('td:eq(0)').text(); // Get product name from first column
        
        if (!id || id === '') {
            console.warn('No ID found for this row');
            return;
        }
        
        if (Formateur == 0) {
            new AWN().alert('Veuillez sélectionner un demandeur', {durations: {alert: 5000}});
            return false;
        }
        
        // ✅ Show the quantity modal instead of auto-adding
        $('#ModalEditQteTmp').modal('show');
        
        // Store product ID and name in modal for later use
        $('#ModalEditQteTmp').data('product-id', id);
        $('#ModalEditQteTmp').data('product-name', productName);
        $('#ModalEditQteTmp').data('formateur-id', Formateur);
        
        // Reset quantity input to 1 by default
        $('#QteTmp').val(1);
        
        // Update modal title to show product name
        $('#modalTitleId').text('Ajouter ' + productName);
    });
    
    return activeDataTables.productSearch;
}
            
    // Product search functionality
   let searchTimeoutt = null;

$('.input_products').on('input', function (e) {
    e.preventDefault();

    clearTimeout(searchTimeoutt); // Cancel previous timer

    let name_product = $('.input_products').val().trim();
    let category = $("#filter_categorie").val();
    let filter_subcategorie = $('#filter_subcategorie').val();
    let type_commande = $('#type_commande').val();
    let Formateur = $('#DropDown_formateur').val();

    if (Formateur == 0) {
        new AWN().alert('Veuillez sélectionner un demandeur', { durations: { alert: 5000 } });
        return false;
    }

    // If input is empty → send AJAX to load all products
    if (name_product === '') {
        sendAjaxRequest(name_product, category, filter_subcategorie, type_commande);
        return; // stop here (no need debounce)
    }

    // Otherwise → search with debounce
    searchTimeoutt = setTimeout(function () {
        sendAjaxRequest(name_product, category, filter_subcategorie, type_commande);
    }, 400);
});


// 🔹 Reusable AJAX function
function sendAjaxRequest(name_product, category, filter_subcategorie, type_commande) {
    // Visual feedback
    $('.input_products').prop('disabled', true);
    $('.TableProductVente_wrapper').addClass('opacity-50');

    $.ajax({
        type: "GET",
        url: getProduct,
        data: {
            product: name_product,
            category: category,
            filter_subcategorie: filter_subcategorie,
            type_commande: type_commande,
        },
        dataType: "json",
        success: function (response) {
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');

            if (response.status == 200) {
                initializeTableProduct('.TableProductVente', response.data);
            } else {
                new AWN().info("Aucun produit trouvé.", { durations: { info: 3000 } });
                $('.TableProductVente').DataTable().clear().draw();
            }
        },
        error: function (xhr, status, error) {
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');

            console.error("Error searching for product:", error);
            console.error("Response:", xhr.responseText);

            try {
                const errorData = JSON.parse(xhr.responseText);
                new AWN().alert(errorData.message || "Erreur lors de la recherche", { durations: { alert: 5000 } });
            } catch (e) {
                new AWN().alert("Erreur lors de la recherche", { durations: { alert: 5000 } });
            }
        }
    });
}



function initializeTableVenteDataTable() {
    try {
        if ($.fn.DataTable.isDataTable('.TableVente')) {
            $('.TableVente').DataTable().destroy();
        }
        
        var TableVente = $('.TableVente').DataTable({
            order : [[13 , 'desc']], // ✅ Updated: was 12, now 13 because we added numero_serie column
            processing: true,
            serverSide: true,
            ajax: {
                url: Vente,
                dataSrc: function (json) {
                    setTimeout(() => {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').hide();
                        }
                    }, 100);
                    return json.data;
                },
                error: function(xhr, error, thrown) {
                    console.log('DataTables error: ' + error + ' ' + thrown);
                    console.log(xhr);
                }
            },
            columns: [
                // ✅ COLUMN 0: Numero de Serie
                { 
                    data: 'numero_serie', 
                    name: 'numero_serie',
                    title: 'N° Série',
                    render: function(data, type, row) {
                        // Display with prefix based on type
                        let prefix = row.type_commande === 'Alimentaire' ? 'A-' : 'NA-';
                        return prefix + data;
                    }
                },
                // COLUMN 1: Demandeur
                { data: 'formateur_name', name: 'formateur_name' },
                // COLUMN 2: Total
                { data: 'total', name: 'total' },
                // COLUMN 3: Statut
                {
                    data : 'status',
                    name : 'status',
                    render :function(data , type ,row)
                    {
                        if(data === 'Validation')
                        {
                            return 'Réception';
                        }
                        else if(data === 'Réception')
                        {
                            return 'Validation';
                        }
                        return data;
                    }
                },
                // COLUMN 4: Type Commande
                { data: 'type_commande', name: 'type_commande' },
                // COLUMN 5: Type Menu
                { 
                    data: 'type_menu', 
                    name: 'type_menu',
                    render: function(data, type, row) {
                        return formatMenuName(data);
                    }
                },
                // COLUMN 6: Élèves
                { data: 'eleves', name: 'eleves' },
                // COLUMN 7: Personnel
                { data: 'personnel', name: 'personnel' },
                // COLUMN 8: Invités
                { data: 'invites', name: 'invites' },
                // COLUMN 9: Divers
                { data: 'divers', name: 'divers' },
                // COLUMN 10: Date d'utilisation
                { 
                    data: 'date_usage', 
                    name: 'date_usage',
                    render: function(data, type, row) {
                        if (data && data !== '') {
                            return moment(data).format('DD/MM/YYYY');
                        }
                        return '-';
                    }
                },
                // COLUMN 11: Créé par
                { data: 'name', name: 'name' },
                // COLUMN 12: Créé le
                { data: 'created_at', name: 'created_at' },
                // COLUMN 13: Action
                { data: 'action', name: 'action', orderable: false, searchable: false }
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
            drawCallback: function() {
                ajaxInProgress = {
                    deleteRowTmp: false,
                    postInTmpVente: false,
                    updateQteTmp: false,
                    saveVente: false,
                    updateVente: false,
                    changeStatusVente: false,
                    deleteVente: false,
                    addProduct: false
                };
            }
        });

    } catch (error) {
        console.error("Error initializing DataTable:", error);
    }
}
    initializeTableVenteDataTable();
    
    // Updated toggleQuantityFieldsAndMenu function with menu attributes support
    function toggleQuantityFieldsAndMenu() {
        var commandType = $('#type_commande').val();
       
        if(commandType !=0)
        {
            $.ajax({
                type: "get",
                url: getcategorybytypemenu,
                data: 
                {
                    type_commande : commandType,
                },
                dataType: "json",
                success: function (response) 
                {
                    if(response.status == 200)
                    {
                        $('#filter_categorie').empty();
                        $.each(response.data, function (index, value) 
                        { 
                            $('#filter_categorie').append(`<option value=${value.id}>${value.name}</option>`)     
                        });
                    }    
                }
            });
        }
        else
        {
           $('#filter_categorie').empty(); 
        }
        
        if (commandType === 'Alimentaire') {
            // Show quantity fields, menu and menu attributes for Alimentaire
            $('#quantity_fields_container').show();
            $('#menu_container').show();
            $('#menu_attributes_container').show(); // Show menu attributes
            $('#type_menu').val('Menu eleves').prop('disabled', false);
            
            // Enable menu attribute fields
            $('#entree').prop('disabled', false);
            $('#plat_principal').prop('disabled', false);
            $('#accompagnement').prop('disabled', false);
            $('#dessert').prop('disabled', false);

            
        } else {
            // Hide quantity fields, menu and menu attributes for Non Alimentaire and Fournitures et matériels
            $('#quantity_fields_container').hide();
            $('#menu_container').hide();
            $('#menu_attributes_container').hide(); // Hide menu attributes
            
            // Reset values of quantity fields to 0
            $('#eleves').val(0);
            $('#personnel').val(0);
            $('#invites').val(0);
            $('#divers').val(0);
            
            // Set the menu to empty value
            $('#type_menu').val('').prop('disabled', true);
            
            // Reset and disable menu attribute fields
            $('#entree').val('').prop('disabled', true);
            $('#plat_principal').val('').prop('disabled', true);
            $('#accompagnement').val('').prop('disabled', true);
            $('#dessert').val('').prop('disabled', true);
        }
    }

    $('#type_commande').on('change', function() {
        toggleQuantityFieldsAndMenu();
    });

    // Initialize the fields based on the current selection when page loads
    $(document).ready(function() {
        toggleQuantityFieldsAndMenu();
        $('#type_commande').on('change', function() {
            toggleQuantityFieldsAndMenu();
        });
    });

    // Add event listener for type_commande change
    $('#type_commande').on('change', function() {
        toggleQuantityFieldsAndMenu();
    });

    // Wrap the quantity fields in a container div for easier toggling
    $('#eleves, #personnel, #invites, #divers').closest('.row').wrapAll('<div class="quantity-fields-container"></div>');
    
    // Wrap the menu field in a container div
    $('#type_menu').closest('.form-group').wrapAll('<div class="menu-container"></div>');
    
    // Add a null option to the type_menu dropdown
    if (!$('#type_menu option[value="null"]').length) {
        $('#type_menu').append('<option value="null" style="display:none;">Aucun menu</option>');
    }
    
    // Initialize the fields based on the current selection
    toggleQuantityFieldsAndMenu();
    
$('#BtnSaveVente').on('click', function(e) {
    e.preventDefault();
    
    // If already processing a save request, ignore this click
    if (ajaxInProgress.saveVente) {
        return;
    }
    
    // Validate the form fields
    const Formateur = $('#DropDown_formateur').val();
    if (Formateur == 0) {
        new AWN().alert('Veuillez sélectionner un demandeur', {durations: {alert: 5000}});
        return false;
    }
    
    const commandType = $('#type_commande').val();
    if (!commandType) {
        new AWN().alert('Veuillez sélectionner un type de commande', {durations: {alert: 5000}});
        return false;
    }
    
    // Mark save operation as in progress and disable the button
    ajaxInProgress.saveVente = true;
    $('#BtnSaveVente').prop('disabled', true).text('Enregistrement...');
    
    // Prepare data object with required fields
    const requestData = {
        '_token': csrf_token,
        'id_formateur': Formateur,
        'type_commande': commandType
    };
    
    // ADD DATE_USAGE FIELD - Always include this field regardless of command type
    const dateUsage = $('#date_usage').val();
    requestData.date_usage = dateUsage && dateUsage.trim() !== '' ? dateUsage : null;
    
    // Only include menu and quantity fields if command type is Alimentaire
    if (commandType === 'Alimentaire') {
        
        const typeMenu = $('#type_menu').val();
        requestData.type_menu = typeMenu && typeMenu.trim() !== '' ? typeMenu : null;
        
        requestData.eleves = $('#eleves').val() || 0;
        requestData.personnel = $('#personnel').val() || 0;
        requestData.invites = $('#invites').val() || 0;
        requestData.divers = $('.divers').val() || 0;
       
        // Add menu attributes - convert empty strings to null
        const entree = $('#entree').val();
        const platPrincipal = $('#plat_principal').val();
        const accompagnement = $('#accompagnement').val();
        const dessert = $('#dessert').val();
        
        /* requestData.entree = entree && entree.trim() !== '' ? entree : null; */
        requestData.entree = (Array.isArray(entree) ? entree.join(',') : entree)?.trim() || null;
        requestData.plat_principal = (Array.isArray(platPrincipal) ? platPrincipal.join(',') : platPrincipal)?.trim() || null;
        requestData.accompagnement = (Array.isArray(accompagnement) ? accompagnement.join(',') : accompagnement)?.trim() || null;
        requestData.dessert = (Array.isArray(dessert) ? dessert.join(',') : dessert)?.trim() || null;

        /* requestData.plat_principal = platPrincipal && platPrincipal.trim() !== '' ? platPrincipal : null;
        requestData.accompagnement = accompagnement && accompagnement.trim() !== '' ? accompagnement : null;
        requestData.dessert = dessert && dessert.trim() !== '' ? dessert : null; */
    } else {
       
        
        // For non-food commands, explicitly set null values (not empty strings)
        requestData.type_menu = null;
        requestData.eleves = 0;
        requestData.personnel = 0;
        requestData.invites = 0;
        requestData.divers = 0;
        requestData.entree = null;
        requestData.plat_principal = null;
        requestData.accompagnement = null;
        requestData.dessert = null;
    }
    
    $.ajax({
        type: "POST",
        url: StoreVente,
        data: requestData,
        dataType: "json",
        success: function(response) {
            // Mark save operation as complete and re-enable the button
            ajaxInProgress.saveVente = false;
            $('#BtnSaveVente').prop('disabled', false).text('Enregistrer');
            
            if(response.status == 200) {
                new AWN().success(response.message, {durations: {success: 5000}});
                
                // Clear product search table
                if ($.fn.DataTable.isDataTable('.TableProductVente')) {
                    $('.TableProductVente').DataTable().clear().draw();
                }
                
                // Clear temporary items table
                if ($.fn.DataTable.isDataTable('.TableTmpVente')) {
                    $('.TableTmpVente').DataTable().clear().draw();
                }
                
                // Reset the total display
                $('.TotalByFormateurAndUser').text("0.00 DH");
                
                // Clear all the fields including menu attributes
                $('#eleves').val(0);
                $('#personnel').val(0);
                $('#invites').val(0);
                $('#divers').val(0);
                $('#entree').val('');
                $('#plat_principal').val('');
                $('#accompagnement').val('');
                $('#dessert').val('');
                // ADD THIS LINE - Clear date_usage field
                $('#date_usage').val('');
                
                // Reset type_commande to default
                $('#type_commande').val('Alimentaire');
                
                // Reset type_menu to default
                $('#type_menu').val('Menu eleves');
                
                // Reset the form visibility based on default values
                toggleQuantityFieldsAndMenu();
                
                // Reinitialize the main table
                initializeTableVenteDataTable();
                
                // Hide the modal
                $('#ModalAddVente').modal("hide");
            } else if(response.status == 400) {
                $('.validationVente').html("");
                $('.validationVente').addClass('alert alert-danger');
                $.each(response.errors, function(key, list_err) {
                    $('.validationVente').append('<li>' + list_err + '</li>');
                });
            }
            else if(response.status == 600)
            {
                new AWN().alert(response.message , {durations: {alert: 5000}});
            }
            else {
                new AWN().alert(response.message || "Une erreur est survenue", {durations: {alert: 5000}});
            }
        },
        
        error: function(xhr, status, error) {
            // Mark save operation as complete and re-enable the button
            ajaxInProgress.saveVente = false;
            $('#BtnSaveVente').prop('disabled', false).text('Enregistrer');
            
            console.error("Error saving sale:", error);
            
            try {
                const response = JSON.parse(xhr.responseText);
                if (response.errors) {
                    $('.validationVente').html("");
                    $('.validationVente').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationVente').append('<li>' + list_err + '</li>');
                    });
                } else {
                    new AWN().alert(response.message || "Une erreur est survenue lors de l'enregistrement", {durations: {alert: 5000}});
                }
            } catch (e) {
                new AWN().alert("Une erreur est survenue lors de l'enregistrement", {durations: {alert: 5000}});
            }
        }
    });
});
function validateDateUsage() {
    const dateUsage = $('#date_usage').val();
    if (dateUsage) {
        const selectedDate = new Date(dateUsage);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Reset time to start of day
        
        if (selectedDate < today) {
            new AWN().warning('La date d\'usage ne peut pas être antérieure à aujourd\'hui', {durations: {warning: 5000}});
            return false;
        }
    }
    return true;
}
$(document).ready(function() {
    $('#date_usage').on('change', function() {
        validateDateUsage();
    });
});
    // Update quantity in tmp vente
// Add/Update quantity in tmp vente from product selection modal
$('#BtnUpdateQteTmp').off('click').on('click', function(e) {
    e.preventDefault();
    
    // Check if this is being called from product selection or from temp vente edit
    let productId = $('#ModalEditQteTmp').data('product-id');
    let tempVenteId = $(this).attr('data-id');
    
    // If we have a product-id, this is a new addition from product table
    if (productId) {
        let Qte = $('#QteTmp').val();
        let Formateur = $('#ModalEditQteTmp').data('formateur-id');
        
        if(Qte <= 0) {
            new AWN().alert("La quantité doit être supérieure à zéro", {durations: {alert: 5000}});
            return false;
        }
        
        // Disable button to prevent double-clicks
        $('#BtnUpdateQteTmp').prop('disabled', true).text('Enregistrement...');
        
        // Add product to temp vente with specified quantity
        $.ajax({
            type: "POST",
            url: PostInTmpVente,
            data: {
                '_token': csrf_token,
                'idproduit': productId,
                'id_formateur': Formateur,
                'qte': Qte  // Add the quantity parameter
            },
            dataType: "json",
            success: function(response) {
                $('#BtnUpdateQteTmp').prop('disabled', false).text('Sauvegarder');
                
                if (response.status == 200) {
                    if (response.type === 'success') {
                        new AWN().success(response.details, {
                            labels: { success: response.message },
                            durations: {success: 5000}
                        });
                    } else {
                        new AWN().success(response.message, {durations: {success: 5000}});
                    }
                    
                    // Refresh the TmpVente table
                    initializeTableTmpVente('.TableTmpVente', Formateur);
                    GetTotalTmpByFormateurAndUserScript(Formateur);
                    
                    // Close the modal and clear data
                    $('#ModalEditQteTmp').modal('hide');
                    $('#ModalEditQteTmp').removeData('product-id');
                    $('#ModalEditQteTmp').removeData('product-name');
                    
                } else if (response.status == 400) {
                    if (response.type === 'error') {
                        new AWN().warning(response.details, {
                            labels: { warning: response.message },
                            durations: {warning: 5000}
                        });
                    } else {
                        new AWN().alert(response.message || 'Une erreur est survenue', {durations: {alert: 5000}});
                    }
                }
            },
            error: function(xhr, status, error) {
                $('#BtnUpdateQteTmp').prop('disabled', false).text('Sauvegarder');
                console.error("Error adding product:", error);
                
                try {
                    const errorData = JSON.parse(xhr.responseText);
                    if (errorData.type === 'error') {
                        new AWN().alert(errorData.details, {
                            labels: { alert: errorData.message },
                            durations: {alert: 5000}
                        });
                    } else {
                        new AWN().alert(errorData.message || "Impossible d'ajouter le produit", {durations: {alert: 5000}});
                    }
                } catch (e) {
                    new AWN().alert("Impossible d'ajouter le produit", {durations: {alert: 5000}});
                }
            }
        });
        
    } 
    // Otherwise, this is an update to existing temp vente item
    else if (tempVenteId) {
        // If already processing an update request, ignore this click
        if (ajaxInProgress.updateQteTmp) {
            return;
        }
        
        let Qte = $('#QteTmp').val();
        let currentFormateur = $('#DropDown_formateur').val();
        
        if(Qte <= 0) {
            new AWN().alert("La quantité doit être supérieure à zéro", {durations: {alert: 5000}});
            return false;
        }
        
        // Mark update operation as in progress and disable the button
        ajaxInProgress.updateQteTmp = true;
        $('#BtnUpdateQteTmp').prop('disabled', true).text('Enregistrement...');
        
        $.ajax({
            type: "POST",
            url: UpdateQteTmpVente,
            data: {
                '_token': csrf_token,
                'qte': Qte,
                'id': tempVenteId,
            },
            dataType: "json",
            success: function(response) {
                ajaxInProgress.updateQteTmp = false;
                $('#BtnUpdateQteTmp').prop('disabled', false).text('Sauvegarder');
                
                if(response.status == 200) {
                    new AWN().success(response.details, {
                        labels: { success: response.message },
                        durations: {success: 5000}
                    });
                    
                    initializeTableTmpVente('.TableTmpVente', currentFormateur);
                    GetTotalTmpByFormateurAndUserScript(currentFormateur);
                    $('#ModalEditQteTmp').modal('hide');
                }
                else if(response.status == 400) {
                    if(response.message === 'ERROR') {
                        new AWN().warning(response.details, {
                            labels: { warning: response.message },
                            durations: {warning: 5000}
                        });
                    } else {
                        $('.validationUpdateQteTmp').html("");
                        $('.validationUpdateQteTmp').addClass('alert alert-danger');
                        $.each(response.errors, function(key, list_err) {
                            $('.validationUpdateQteTmp').append('<li>' + list_err + '</li>');
                        });
                    }
                }
            },
            error: function(xhr, status, error) {
                ajaxInProgress.updateQteTmp = false;
                $('#BtnUpdateQteTmp').prop('disabled', false).text('Sauvegarder');
                
                console.error("Error updating quantity:", error);
                
                try {
                    const response = JSON.parse(xhr.responseText);
                    if(response.message === 'ERROR') {
                        new AWN().alert(response.details, {
                            labels: { alert: response.message },
                            durations: {alert: 5000}
                        });
                    } else {
                        new AWN().alert("Impossible de modifier la quantité", {durations: {alert: 5000}});
                    }
                } catch (e) {
                    new AWN().alert("Impossible de modifier la quantité", {durations: {alert: 5000}});
                }
            }
        });
    }
});

    // Edit Vente functionality
    $('.TableVente tbody').on('click', '.bg-primary-subtle', function(e) {
        e.preventDefault();
        $('#ModalEditVente').modal("show");
        var idVente = $(this).attr('data-id');
        var status = $(this).closest('tr').find('td:eq(2)').text();
        $('#BtnChangeStatusVente').attr('data-id', idVente);
        
        // Get vente details from server
        $.ajax({
            type: "GET",
            url: EditVente + '/' + idVente,
            dataType: "json",
            success: function (response) {
                if(response) {
                    $('#StatusVente').val(response.status);
                    $('#BtnUpdateVente').attr('data-id', idVente);
                }
                else {
                    new AWN().warning("Impossible de récupérer les détails de la commande", {durations: {warning: 5000}});
                }
            },
            error: function() {
                new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
            }
        });
    });
// Show/hide motif_refus field based on status selection
$('#StatusVente').on('change', function() {
    var selectedStatus = $(this).val();
    
    if (selectedStatus === 'Refus') {
        $('#motif_refus_container').show();
        $('#motif_refus').prop('required', true);
    } else {
        $('#motif_refus_container').hide();
        $('#motif_refus').prop('required', false);
        $('#motif_refus').val(''); // Clear the textarea when hiding
    }
});

// Also handle when modal is shown - check current status
$('#ModalEditVente').on('shown.bs.modal', function() {
    var currentStatus = $('#StatusVente').val();
    if (currentStatus === 'Refus') {
        $('#motif_refus_container').show();
        $('#motif_refus').prop('required', true);
    } else {
        $('#motif_refus_container').hide();
        $('#motif_refus').prop('required', false);
    }
});
    // Update Vente functionality

$('#BtnUpdateVente').on('click', function(e) {
    e.preventDefault();
    
    if (ajaxInProgress.updateVente) {
        return;
    }
    
    let id = $(this).attr('data-id');
    let status = $('#StatusVente').val();
    let motif_refus = $('#motif_refus').val();
    
    // Validate motif_refus if status is Refus
    if (status === 'Refus' && (!motif_refus || motif_refus.trim() === '')) {
        new AWN().warning('Veuillez indiquer le motif de refus', {durations: {warning: 5000}});
        return;
    }
    
    ajaxInProgress.updateVente = true;
    $('#BtnUpdateVente').prop('disabled', true).text('Traitement...');
    
    let requestData = {
        '_token': csrf_token,
        'id': id,
        'status': status
    };
    
    // Add motif_refus to request if status is Refus
    if (status === 'Refus') {
        requestData.motif_refus = motif_refus;
    }

    if(status == 'Annuler')
    {
        $.ajax({
            type: "post",
            url: annulerCommande,
            data: requestData,
            dataType: "json",
            success: function (response) 
            {
                if(response.status == 200)
                {
                    $('#BtnUpdateVente').prop('disabled', false).text('Mettre à jour');
                    $('#ModalEditVente').modal('hide');
                    $('.TableVente').DataTable().ajax.reload();
                }    
            }
        });
        return false;
        
    }
    
    if (status === 'Validation' || status === 'Visé') {
        $.ajax({
            type: "POST",
            url: ChangeStatusVente,
            data: requestData,
            dataType: "json",
            success: function(response) 
            {
                ajaxInProgress.updateVente = false;
                $('#BtnUpdateVente').prop('disabled', false).text('Mettre à jour');
                
                if (response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalEditVente').modal('hide');
                    $('.TableVente').DataTable().ajax.reload();
                }
                else if (response.status == 400)
                {
                    new AWN().warning(response.message , {durations: {warning: 5000}});
                }
                else {
                    new AWN().warning(response.message || "Une erreur est survenue", {durations: {warning: 5000}});
                }
            },
            error: function(xhr, status, error) {
                ajaxInProgress.updateVente = false;
                $('#BtnUpdateVente').prop('disabled', false).text('Mettre à jour');
                console.error('Error:', xhr.responseText);
                new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
            }
        });
    } else {
        $.ajax({
            type: "POST",
            url: UpdateVente,
            data: requestData,
            dataType: "json",
            success: function(response) {
                ajaxInProgress.updateVente = false;
                $('#BtnUpdateVente').prop('disabled', false).text('Mettre à jour');
                
                if (response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalEditVente').modal('hide');
                    $('.TableVente').DataTable().ajax.reload();
                } else {
                    new AWN().warning(response.message || "Une erreur est survenue", {durations: {warning: 5000}});
                }
            },
            error: function(xhr, status, error) {
                ajaxInProgress.updateVente = false;
                $('#BtnUpdateVente').prop('disabled', false).text('Mettre à jour');
                
                try {
                    const response = JSON.parse(xhr.responseText);
                    if (response.status === 400 && response.errors) {
                        const errorMessages = Object.values(response.errors).flat().join('<br>');
                        new AWN().warning(errorMessages, {durations: {warning: 5000}});
                    } else if (response.status === 404) {
                        new AWN().warning(response.message, {durations: {warning: 5000}});
                    } else {
                        new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
                    }
                } catch (e) {
                    console.error("Error parsing response:", e);
                    new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
                }
            }
        });
    }
});
   // Change Status Vente functionality
   $('#BtnChangeStatusVente').off('click').on('click', function(e) {
       e.preventDefault();
       
       // If already processing a status change request, ignore this click
       if (ajaxInProgress.changeStatusVente) {
           return;
       }
       
       let status = $('#StatusVente').val();
       let IdVente = $(this).attr('data-id');
       
       if(status == 0) {
           new AWN().alert("Erreur: Ne choisissez pas la première option.", { durations: { alert: 5000 } });
           return false;
       }
       
       // Mark change status operation as in progress and disable the button
       ajaxInProgress.changeStatusVente = true;
       $('#BtnChangeStatusVente').prop('disabled', true).text('Traitement...');
       
       $.ajax({
           type: "POST",
           url: ChangeStatusVente,
           data: {
               'id': IdVente,
               'status': status,
               '_token': csrf_token,
           },
           dataType: "json",
           success: function(response) {
               // Mark change status operation as complete and re-enable the button
               ajaxInProgress.changeStatusVente = false;
               $('#BtnChangeStatusVente').prop('disabled', false).text('Changer le statut');
               
               if(response.status == 200) {
                   $('#ModalEditVente').modal("hide");
                   new AWN().success(response.message, { durations: { success: 5000 } });
                   initializeTableVenteDataTable();
               } else if(response.status == 400) {
                   new AWN().warning(response.message, { durations: { warning: 5000 } });
               } else {
                   new AWN().alert(response.message || "Une erreur est survenue", { durations: { alert: 5000 } });
               }
           },
           error: function(xhr, status, error) {
               // Mark change status operation as complete and re-enable the button
               ajaxInProgress.changeStatusVente = false;
               $('#BtnChangeStatusVente').prop('disabled', false).text('Changer le statut');
               
               console.error('AJAX error:', status, error);
               console.error('Response:', xhr.responseText);
               
               try {
                   var response = JSON.parse(xhr.responseText);
                   new AWN().alert(response.message || "Une erreur est survenue", { durations: { alert: 5000 } });
               } catch(e) {
                   new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
               }
           }
       });
   });

    // Delete Vente functionality
    $('.TableVente tbody').on('click', '.DeleteVente', function(e) {
        e.preventDefault();
        
        // If already processing a delete request, ignore this click
        if (ajaxInProgress.deleteVente) {
            return;
        }
        
        var idVente = $(this).attr('data-id');
        let notifier = new AWN();
        let deleteButton = $(this);
        
        let onOk = () => {
            // Mark delete operation as in progress and disable the button
            ajaxInProgress.deleteVente = true;
            deleteButton.prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin text-danger"></i>');
            
            $.ajax({
                type: "post",
                url: "DeleteVente",
                data: {
                    id: idVente,
                    _token: csrf_token,
                },
                dataType: "json",
                success: function (response) {
                    // Mark delete operation as complete
                    ajaxInProgress.deleteVente = false;
                    
                    if(response.status == 200) {
                        new AWN().success(response.message, {durations: {success: 5000}});
                        $('.TableVente').DataTable().ajax.reload();
                    }   
                    else if(response.status == 404) {
                        // Re-enable the button if item not found
                        deleteButton.prop('disabled', false).html('<i class="fa-solid fa-trash text-danger"></i>');
                        new AWN().warning(response.message, {durations: {warning: 5000}});
                    }  
                },
                error: function() {
                    // Mark delete operation as complete and re-enable the button
                    ajaxInProgress.deleteVente = false;
                    deleteButton.prop('disabled', false).html('<i class="fa-solid fa-trash text-danger"></i>');
                    
                    new AWN().alert("Une erreur est survenue, veuillez réessayer.", { durations: { alert: 5000 } });
                }
            });
        };
        
        let onCancel = () => {
            notifier.info('Annulation de la suppression');
        };
        
        notifier.confirm(
            'Êtes-vous sûr de vouloir supprimer cette commande ?',
            onOk,
            onCancel,
            {
                labels: {
                    confirm: 'Supprimer',
                    cancel: 'Annuler'
                }
            }
        );
    });

    // Add product functionality
    $('#BtnAddProduct').on('click', function(e) {
        e.preventDefault();
        
        // If already processing an add product request, ignore this click
        if (ajaxInProgress.addProduct) {
            return;
        }
        
        // Create a FormData object to handle file uploads
        let formData = new FormData($('#FormAddProduct')[0]);
        
        // Mark add product operation as in progress and disable the button
        ajaxInProgress.addProduct = true;
        $('#BtnAddProduct').prop('disabled', true).text('Enregistrement...');
        
        $.ajax({
            type: "POST",
            url: AddProduct,
            data: formData,
            processData: false,  // Tell jQuery not to process the data
            contentType: false,  // Tell jQuery not to set contentType
            dataType: "json",
            success: function(response) {
                // Mark add product operation as complete and re-enable the button
                ajaxInProgress.addProduct = false;
                $('#BtnAddProduct').prop('disabled', false).text('Sauvegarder');
                
                if(response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    
                    // Clear the form
                    $('#FormAddProduct')[0].reset();
                    $('#photo_preview').html('').hide(); // Clear photo preview
                    
                    // Close product modal and reopen vente modal
                    $('#ModalAddProduct').modal("hide");
                    setTimeout(function() {
                        $('#ModalAddVente').modal("show");
                    }, 200);
                    
                    // Optional: refresh product search if needed
                    let searchTerm = $('.input_products').val();
                    if (searchTerm && searchTerm.trim() !== '') {
                        $.ajax({
                            type: "GET",
                            url: getProduct,
                            data: { product: searchTerm },
                            dataType: "json",
                            success: function(searchResponse) {
                                if (searchResponse.status == 200) {
                                    initializeTableProduct('.TableProductVente', searchResponse.data);
                                }
                            }
                        });
                    }
                } else if(response.status == 400) {
                    // Handle validation errors
                    $('.validationAddProduct').html("");
                    $('.validationAddProduct').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationAddProduct').append('<li>' + list_err + '</li>');
                    });
                } else {
                    new AWN().alert(response.message || "Une erreur est survenue", {durations: {alert: 5000}});
                }
            },
            error: function(xhr, status, error) {
                // Mark add product operation as complete and re-enable the button
                ajaxInProgress.addProduct = false;
                $('#BtnAddProduct').prop('disabled', false).text('Sauvegarder');
                
                console.error("Error saving product:", error);
                
                try {
                    const errorResponse = JSON.parse(xhr.responseText);
                    if (errorResponse.errors) {
                        $('.validationAddProduct').html("");
                        $('.validationAddProduct').addClass('alert alert-danger');
                        $.each(errorResponse.errors, function(key, list_err) {
                            $('.validationAddProduct').append('<li>' + list_err + '</li>');
                        });
                    } else {
                        new AWN().alert(errorResponse.message || "Une erreur est survenue lors de l'enregistrement", {durations: {alert: 5000}});
                    }
                } catch (e) {
                    new AWN().alert("Une erreur est survenue lors de l'enregistrement", {durations: {alert: 5000}});
                }
            }
        });
    });

    // Photo preview functionality 
    $('#photo').on('change', function() {
        let file = this.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function(e) {
                $('#photo_preview').html('<img src="' + e.target.result + '" class="img-fluid" style="max-height: 150px;">').show();
            }
            reader.readAsDataURL(file);
        } else {
            $('#photo_preview').html('').hide();
        }
    });
    // ============================================
// FILTER FUNCTIONALITY FOR VENTE
// ============================================

// Handle class filter change
$('#filter_class').on('change', function() {
    var selectedClass = $(this).val();
    
    // Reset dependent dropdowns
    $('#filter_categorie').empty().append('<option value="">Toutes les catégories</option>');
    $('#filter_subcategorie').empty().append('<option value="">Toutes les familles</option>');
    
    if (selectedClass) {
        // Fetch categories for selected class
        $.ajax({
            url: '/vente/categories-by-class',
            type: 'GET',
            data: { class: selectedClass },
            dataType: 'json',
            success: function(response) {
                if (response.status === 200 && response.data.length > 0) {
                    $.each(response.data, function(key, category) {
                        $('#filter_categorie').append(
                            '<option value="' + category.id + '">' + category.name + '</option>'
                        );
                    });
                } else {
                    new AWN().info("Aucune catégorie trouvée pour cette classe", {
                        durations: { info: 3000 }
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error("Error loading categories:", error);
                new AWN().alert("Erreur lors du chargement des catégories", {
                    durations: { alert: 5000 }
                });
            }
        });
    }
});

// Handle category filter change
$('#filter_categorie').on('change', function() {
    var categoryId = $(this).val();
    let name_product = $('.input_products').val().trim();
    
    // Reset subcategory dropdown FIRST
    $('#filter_subcategorie').empty().append('<option value="">Toutes les familles</option>');
    
    if (categoryId) {
        // Visual feedback during search
        $('.input_products').prop('disabled', true);
        $('.TableProductVente_wrapper').addClass('opacity-50');
        
        // Fetch subcategories for selected category
        $.get('/vente/subcategories/' + categoryId, function(response) {
            if (response.status === 200 && response.subcategories.length > 0) {
                $.each(response.subcategories, function(key, subcategory) {
                    $('#filter_subcategorie').append(
                        '<option value="' + subcategory.id + '">' + subcategory.name + '</option>'
                    );
                });
            } else {
                new AWN().info("Aucune famille trouvée pour cette catégorie", {
                    durations: { info: 3000 }
                });
            }
        }).fail(function(xhr, status, error) {
            console.error("Error loading subcategories:", error);
            new AWN().alert("Erreur lors du chargement des familles", {
                durations: { alert: 5000 }
            });
        });
        
        // NOW fetch products with ONLY category (no subcategory filter)
        $.get(getProduct, { 
            product: name_product,
            filter_subcategorie: '',  // ← EMPTY! Just category filter
            category: categoryId ,
            type_commande : $('#type_commande').val(),
        }, function(secondResponse) {
            if (secondResponse.status === 200) {
                $('.input_products').prop('disabled', false);
                $('.TableProductVente_wrapper').removeClass('opacity-50');
                initializeTableProduct('.TableProductVente', secondResponse.data);
                $('.input_products').val(""); 
            } else {
                $('.input_products').prop('disabled', false);
                $('.TableProductVente_wrapper').removeClass('opacity-50');
                new AWN().info("Aucun produit trouvé.", {durations: {info: 5000}});
            }
        }).fail(function(xhr, status, error) {
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');
            console.error("Error in second request:", error);
            new AWN().alert("Erreur lors du deuxième chargement", {
                durations: { alert: 5000 }
            });
        });
    }
});

// When user selects a subcategory, refine the product search
$('#filter_subcategorie').on('change', function() {
    var subcategoryId = $(this).val();
    var categoryId = $('#filter_categorie').val();
    let name_product = $('.input_products').val().trim();
    
    if (subcategoryId) {
        // Visual feedback
        $('.input_products').prop('disabled', true);
        $('.TableProductVente_wrapper').addClass('opacity-50');
        
        $.get(getProduct, { 
            product: name_product,
            filter_subcategorie: subcategoryId,
            category: categoryId 
        }, function(response) {
            if (response.status === 200) {
                $('.input_products').prop('disabled', false);
                $('.TableProductVente_wrapper').removeClass('opacity-50');
                initializeTableProduct('.TableProductVente', response.data);
            } else {
                $('.input_products').prop('disabled', false);
                $('.TableProductVente_wrapper').removeClass('opacity-50');
                new AWN().info("Aucun produit trouvé.", {durations: {info: 5000}});
            }
        }).fail(function(xhr, status, error) {
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');
            console.error("Error loading products:", error);
            new AWN().alert("Erreur lors du chargement des produits", {
                durations: { alert: 5000 }
            });
        });
    }
});

// Handle designation (product name) filter with autocomplete
let searchTimeout;
$('#filter_designation').on('keyup', function() {
    clearTimeout(searchTimeout);
    
    var query = $(this).val().trim();
    
    if (query.length < 2) {
        $('#designation_suggestions').hide().empty();
        return;
    }
    
    searchTimeout = setTimeout(function() {
        $.ajax({
            url: '/vente/search-products',
            type: 'GET',
            data: { query: query },
            dataType: 'json',
            success: function(response) {
                if (response.status === 200 && response.products.length > 0) {
                    var suggestionsHtml = '';
                    $.each(response.products, function(key, product) {
                        suggestionsHtml += '<a href="#" class="list-group-item list-group-item-action product-suggestion" data-name="' + product.name + '">' + product.name + '</a>';
                    });
                    $('#designation_suggestions').html(suggestionsHtml).show();
                } else {
                    $('#designation_suggestions').hide().empty();
                }
            },
            error: function(xhr, status, error) {
                console.error("Error searching products:", error);
            }
        });
    }, 300); // Wait 300ms after user stops typing
});

// Handle click on suggestion
$(document).on('click', '.product-suggestion', function(e) {
    e.preventDefault();
    var productName = $(this).data('name');
    $('#filter_designation').val(productName);
    $('#designation_suggestions').hide().empty();
    
    // Trigger search with selected product
    triggerProductSearch();
});

// Hide suggestions when clicking outside
$(document).on('click', function(e) {
    if (!$(e.target).closest('#filter_designation, #designation_suggestions').length) {
        $('#designation_suggestions').hide();
    }
});

// Function to trigger product search with filters
function triggerProductSearch() {
    let Formateur = $('#DropDown_formateur').val();
    if (Formateur == 0) {
        new AWN().alert('Veuillez sélectionner un demandeur', {durations: {alert: 5000}});
        return false;
    }
    
    // Get filter values
    let filterClass = $('#filter_class').val();
    let filterCategorie = $('#filter_categorie').val();
    let filterSubcategorie = $('#filter_subcategorie').val();
    let filterDesignation = $('#filter_designation').val().trim();
    
    // Build search parameters
    let searchParams = {};
    
    if (filterClass) searchParams.filter_class = filterClass;
    if (filterCategorie) searchParams.filter_categorie = filterCategorie;
    if (filterSubcategorie) searchParams.filter_subcategorie = filterSubcategorie;
    if (filterDesignation) searchParams.product = filterDesignation;
    
    // If no filters are set, show warning
    if (Object.keys(searchParams).length === 0) {
        new AWN().warning('Veuillez saisir au moins un critère de recherche', {
            durations: {warning: 5000}
        });
        return false;
    }
    
    // Visual feedback during search
    $('.input_products').prop('disabled', true);
    $('.TableProductVente_wrapper').addClass('opacity-50');
    
    $.ajax({
        type: "GET",
        url: getProduct,
        data: searchParams,
        dataType: "json",
        success: function(response) {
            // Re-enable input and remove visual feedback
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');
            
            if (response.status == 200) {
                if (response.data.length > 0) {
                    initializeTableProduct('.TableProductVente', response.data);
                    new AWN().success(response.data.length + ' produit(s) trouvé(s)', {
                        durations: {success: 3000}
                    });
                } else {
                    initializeTableProduct('.TableProductVente', []);
                    new AWN().info("Aucun produit trouvé avec ces critères", {
                        durations: {info: 5000}
                    });
                }
            } else {
                new AWN().info("Aucun produit trouvé.", {durations: {info: 5000}});
            }
        },
        error: function(xhr, status, error) {
            // Re-enable input and remove visual feedback
            $('.input_products').prop('disabled', false);
            $('.TableProductVente_wrapper').removeClass('opacity-50');
            
            console.error("Error searching for product:", error);
            console.error("Response:", xhr.responseText);
            
            try {
                const errorData = JSON.parse(xhr.responseText);
                new AWN().alert(errorData.message || "Erreur lors de la recherche", {
                    durations: {alert: 5000}
                });
            } catch (e) {
                new AWN().alert("Erreur lors de la recherche", {
                    durations: {alert: 5000}
                });
            }
        }
    });
}

// Trigger search when filters change
$('#filter_class, #filter_categorie, #filter_subcategorie').on('change', function() {
    // Only trigger search if at least one filter is set or designation has value
    if ($(this).val() || $('#filter_designation').val().trim()) {
        triggerProductSearch();
    }
});

// Trigger search when pressing Enter in designation field
$('#filter_designation').on('keydown', function(e) {
    if (e.keyCode === 13) {
        e.preventDefault();
        $('#designation_suggestions').hide();
        triggerProductSearch();
    }
});

// ============================================
// MODAL CLEANUP ON CLOSE - SINGLE HANDLER
// ============================================

$('#ModalAddVente').on('hidden.bs.modal', function () {
    console.log('🔴 Modal hidden.bs.modal event triggered');
    
    let Formateur = $('#DropDown_formateur').val();
    console.log('Formateur ID:', Formateur);
    
    if (!Formateur || Formateur == 0) {
        console.warn('⚠️ No formateur selected, skipping cleanup');
        return;
    }
    
    // Check if cleanTmpVente URL is defined
    if (typeof cleanTmpVente === 'undefined') {
        console.error('❌ cleanTmpVente URL is not defined!');
        return;
    }
    
    console.log('📡 Calling cleanTmpVente with URL:', cleanTmpVente);
    
    // Clear the tmp_vente table in database
    $.ajax({
        type: "POST",
        url: cleanTmpVente,
        data: {
            _token: csrf_token,
            id_formateur: Formateur  // ✅ Correct parameter name
        },
        dataType: "json",
        success: function(response) {
            console.log('✅ AJAX Success:', response);
            
            if(response.status == 200) {
                console.log('✅ Database cleaned. Rows deleted:', response.deleted_count);
                
                // DESTROY and REINITIALIZE the DataTable
                if (activeDataTables.tmpVente) {
                    console.log('Destroying tmpVente DataTable...');
                    activeDataTables.tmpVente.destroy();
                    activeDataTables.tmpVente = null;
                }
                
                // Clear the table body HTML
                $('.TableTmpVente tbody').empty();
                console.log('✅ Table body cleared');
                
                // Reinitialize the table with empty data
                console.log('Reinitializing table...');
                initializeTableTmpVente('.TableTmpVente', Formateur);
                
                // Reset the product search DataTable
                if (activeDataTables.productSearch) {
                    console.log('Clearing product search table...');
                    activeDataTables.productSearch.clear().draw();
                }
                
                // Reset form inputs
                $('#type_commande').val('Alimentaire');
                $('#type_menu').val('Menu eleves');
                $('#eleves').val('0');
                $('#personnel').val('0');
                $('#invites').val('0');
                $('#divers').val('0');
                $('#date_usage').val('');
                console.log('✅ Form inputs reset');
                
                // Clear TomSelect selections
                if (typeof tomselect_entree !== 'undefined' && tomselect_entree) {
                    tomselect_entree.clear();
                    console.log('✅ TomSelect entree cleared');
                }
                if (typeof tomselect_principal !== 'undefined' && tomselect_principal) {
                    tomselect_principal.clear();
                    console.log('✅ TomSelect principal cleared');
                }
                if (typeof tomselect_dessert !== 'undefined' && tomselect_dessert) {
                    tomselect_dessert.clear();
                    console.log('✅ TomSelect dessert cleared');
                }
                
                // Clear and reset filters
                $('#filter_categorie').val('').empty().append('<option value="">Toutes les catégories</option>');
                $('#filter_subcategorie').val('').empty().append('<option value="">Toutes les familles</option>');
                $('.input_products').val('');
                console.log('✅ Filters cleared');
                
                // Reset total display
                $('.TotalByFormateurAndUser').text('0.00 DH');
                console.log('✅ Total reset');
                
                // Clear validation messages
                $('.validationVente').empty().removeClass('alert alert-danger');
                
                console.log('✅ Modal cleanup complete');
            } else {
                console.error('❌ Cleanup failed with status:', response.status);
            }
        },
        error: function(xhr, status, error) {
            console.error('❌ AJAX Error:', error);
            console.error('Status:', status);
            console.error('Response:', xhr.responseText);
            console.error('Status Code:', xhr.status);
        }
    });
});

// Handle when user clicks "Fermer" button specifically
$('#ModalAddVente .btn-secondary[data-bs-dismiss="modal"]').on('click', function() {
    $('#ModalAddVente').modal('hide');
});
// Add this to the END of your existing script.js file
// Replace the entire "VIEW COMMAND DETAILS" section with this clean version

// ============================================
// VIEW COMMAND DETAILS MODAL HANDLER - WITH EDIT ICON
// ============================================

$('.TableVente tbody').on('click', '.ViewCommandDetails', function(e) {
    e.preventDefault();
    
    let venteId = $(this).attr('data-id');
    let row = $(this).closest('tr');
    let rowData = $('.TableVente').DataTable().row(row).data();
    
    $('#ModalViewCommand').modal('show');
    $('#ModalViewCommand').data('vente-id', venteId);
    
    // Populate command info
    let prefix = rowData.type_commande === 'Alimentaire' ? 'A-' : 'NA-';
    let year = new Date().getFullYear();
    $('#view_numero_serie').text(prefix + rowData.numero_serie + '/' + rowData.type_commande + '/' + year);
    $('#view_formateur').text(rowData.formateur_name);
    $('#view_type_commande').text(rowData.type_commande);
    
    // Status badge
    let badgeClass = 'bg-secondary';
    let statusText = rowData.status;
    switch(rowData.status) {
        case 'Création': badgeClass = 'bg-info'; break;
        case 'Visa Directeur': badgeClass = 'bg-primary'; break;
        case 'Visa Économe': badgeClass = 'bg-warning'; break;
        case 'Visa Chargé': badgeClass = 'bg-info'; break;
        case 'Validation': badgeClass = 'bg-success'; statusText = 'Réception'; break;
        case 'Réception': badgeClass = 'bg-success'; statusText = 'Validation'; break;
        case 'Refus': badgeClass = 'bg-danger'; break;
        case 'Livraison': badgeClass = 'bg-primary'; break;
        case 'Visé': badgeClass = 'bg-secondary'; break;
        case 'Annuler': badgeClass = 'bg-dark'; break;
    }
    $('#view_status').removeClass().addClass('badge ' + badgeClass).text(statusText);
    $('#view_total').text(parseFloat(rowData.total).toFixed(2) + ' DH');
    
    if (rowData.date_usage) {
        $('#view_date_usage').text(moment(rowData.date_usage).format('DD/MM/YYYY'));
    } else {
        $('#view_date_usage').text('-');
    }
    
    // Handle Alimentaire vs Non Alimentaire
    if (rowData.type_commande === 'Alimentaire') {
        $('#quantity_info_container, #menu_details_container').show();
        let menuName = rowData.type_menu === 'Menu eleves' ? 'Menu standard' : rowData.type_menu;
        $('#view_type_menu').text(menuName || '-');
        $('#view_eleves').text(rowData.eleves || 0);
        $('#view_personnel').text(rowData.personnel || 0);
        $('#view_invites').text(rowData.invites || 0);
        $('#view_divers').text(rowData.divers || 0);
    } else {
        $('#quantity_info_container, #menu_details_container').hide();
        $('#view_type_menu').text('-');
    }
    
    // Load products table
    $('#TableViewCommandProductss tbody').html(
        '<tr><td colspan="8" class="text-center"><i class="fa-solid fa-spinner fa-spin"></i> Chargement...</td></tr>'
    );
    
    $.ajax({
        type: "GET",
        url: showventeByUpdate,
        data: { venteId: venteId },
        dataType: "json",
        success: function(response) {
            if (response.status == 200) {
                if ($.fn.DataTable.isDataTable('#TableViewCommandProductss')) {
                    $('#TableViewCommandProductss').DataTable().clear().destroy();
                }
                
                $('#TableViewCommandProductss tbody').empty();
                
                $('#TableViewCommandProductss').DataTable({
                    data: response.data,
                    columns: [
                        { data: null, render: (d, t, r, m) => m.row + 1 },
                        { data: 'name_product' },
                        { data: 'newquantet', render: d => `<span class="badge bg-primary">${d}</span>` },
                        { 
                            data: 'qte',
                            render: (data, type, row) => `<span class="badge bg-success qte-display" data-qte="${data}">${data}</span>`
                        },
                        { 
                            data: 'qtestock',
                            render: (data, type, row) => {
                                let cls = data <= row.seuil ? 'text-danger fw-bold' : 
                                         data <= row.seuil * 1.5 ? 'text-warning fw-bold' : 'text-success';
                                let badge = data <= row.seuil ? ' <span class="badge bg-danger ms-1">Bas</span>' : 
                                           data <= row.seuil * 1.5 ? ' <span class="badge bg-warning ms-1">Moyen</span>' : '';
                                return `<span class="${cls}">${data}${badge}</span>`;
                            }
                        },
                        { data: 'seuil' },
                        { data: 'local', render: d => `<span class="badge bg-secondary">${d}</span>` },
                        { 
                            data: null,
                            orderable: false,
                            render: (data, type, row) => `
                                <button class="btn btn-sm btn-primary edit-qte-btn" 
                                        data-id="${row.id}" 
                                        data-qte="${row.qte}"
                                        data-stock="${row.qtestock}">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                            `
                        }
                    ],
                    language: {
                        "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_",
                        "sSearch": "Rechercher:",
                        "sZeroRecords": "Aucun élément",
                        "oPaginate": { "sNext": "Suivant", "sPrevious": "Précédent" }
                    },
                    paging: true,
                    pageLength: 10
                });
                
                if (rowData.type_commande === 'Alimentaire') {
                    $('#view_entree').text(rowData.entree || '-');
                    $('#view_plat_principal').text(rowData.plat_principal || '-');
                    $('#view_dessert').text(rowData.dessert || '-');
                }
            }
        }
    });
});

// ============================================
// EDIT BUTTON - Click to make quantity editable
// ============================================
$(document).on('click', '.edit-qte-btn', function(e) {
    e.preventDefault();
    
    let $btn = $(this);
    let $row = $btn.closest('tr');
    let $cell = $row.find('td').eq(3); // Quantité Livrée column
    
    let idLigneVente = $btn.data('id');
    let currentQte = $btn.data('qte');
    let stock = $btn.data('stock');
    
    // Replace badge with input
    $cell.html(`
        <input type="number" 
               class="form-control form-control-sm qte-input" 
               value="${currentQte}" 
               data-id="${idLigneVente}"
               data-original="${currentQte}"
               data-stock="${stock}"
               min="0" 
               step="0.01"
               style="width: 80px;">
    `);
    
    // Focus the input
    $cell.find('input').focus().select();
    
    // Hide edit button, show checkmark to indicate it's editable
    $btn.html('<i class="fa-solid fa-check text-success"></i>').removeClass('btn-primary').addClass('btn-success');
});

// Validate quantity input
$(document).on('input', '.qte-input', function() {
    let val = parseFloat($(this).val());
    let stock = parseFloat($(this).data('stock'));
    
    if (isNaN(val) || val < 0) {
        $(this).addClass('is-invalid').attr('title', 'Quantité invalide');
    } else if (val > stock) {
        $(this).addClass('is-invalid').attr('title', `Stock insuffisant. Disponible: ${stock}`);
    } else {
        $(this).removeClass('is-invalid').removeAttr('title');
    }
});

// Save all quantities button
$(document).on('click', '#BtnSaveAllQuantities', function(e) {
    e.preventDefault();
    
    let changedItems = [];
    let hasErrors = false;
    
    // Collect all edited inputs
    $('.qte-input').each(function() {
        let $input = $(this);
        let newVal = parseFloat($input.val());
        let original = parseFloat($input.data('original'));
        let stock = parseFloat($input.data('stock'));
        let idLigneVente = $input.data('id');
        
        // Validate
        if (isNaN(newVal) || newVal < 0) {
            $input.addClass('is-invalid');
            hasErrors = true;
            new AWN().alert('Quantité invalide', { durations: { alert: 3000 } });
            return false;
        }
        
        if (newVal > stock) {
            $input.addClass('is-invalid');
            hasErrors = true;
            new AWN().alert(`Stock insuffisant pour la ligne. Disponible: ${stock}`, { durations: { alert: 5000 } });
            return false;
        }
        
        // Only save if changed
        if (newVal !== original) {
            changedItems.push({
                id_ligne_vente: idLigneVente,
                qte_livree: newVal
            });
        }
    });
    
    if (hasErrors) {
        return;
    }
    
    if (changedItems.length === 0) {
        new AWN().info('Aucune modification détectée', { durations: { info: 3000 } });
        $('#ModalViewCommand').modal('hide');
        return;
    }
    
    let $btn = $(this);
    $btn.prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin"></i> Enregistrement...');
    
    $.ajax({
        type: "POST",
        url: updateLigneQuantityUrl,
        data: { 
            _token: csrf_token, 
            items: changedItems 
        },
        dataType: "json",
        success: function(response) {
            if (response.status === 200) {
                new AWN().success(response.message || 'Quantités mises à jour avec succès', { 
                    durations: { success: 3000 } 
                });
                
                // Close modal
                $('#ModalViewCommand').modal('hide');
                
                // Optional: Refresh main table
                // $('.TableVente').DataTable().ajax.reload();
                
            } else {
                $btn.prop('disabled', false).html('<i class="fa-solid fa-save"></i> Sauvegarder');
                new AWN().alert(response.message || 'Erreur lors de la mise à jour', { 
                    durations: { alert: 5000 } 
                });
            }
        },
        error: function(xhr) {
            $btn.prop('disabled', false).html('<i class="fa-solid fa-save"></i> Sauvegarder');
            
            let errorMsg = 'Erreur lors de la mise à jour';
            try {
                let response = JSON.parse(xhr.responseText);
                errorMsg = response.message || response.details || errorMsg;
            } catch(e) {
                console.error('Cannot parse error');
            }
            
            new AWN().alert(errorMsg, { durations: { alert: 5000 } });
        }
    });
});

// Keyboard shortcut: Enter to save
$(document).on('keydown', '.qte-input', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault();
        $('#BtnSaveAllQuantities').click();
    }
});

// Clean up modal when closed
$('#ModalViewCommand').on('hidden.bs.modal', function() {
    $('#view_numero_serie, #view_formateur, #view_type_commande, #view_date_usage, #view_type_menu, #view_eleves, #view_personnel, #view_invites, #view_divers, #view_entree, #view_plat_principal, #view_dessert').text('');
    $('#view_status').removeClass().addClass('badge').text('');
    $('#view_total').text('0.00 DH');
    
    if ($.fn.DataTable.isDataTable('#TableViewCommandProductss')) {
        $('#TableViewCommandProductss').DataTable().clear().destroy();
    }
    
    $('#TableViewCommandProductss tbody').html('');
    $('#quantity_info_container, #menu_details_container').hide();
});
});