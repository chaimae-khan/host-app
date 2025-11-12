$(document).ready(function () {
    // Dynamic script and CSS loading
    var datatablesScript = document.createElement('script');
    datatablesScript.src = 'https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js';
    document.head.appendChild(datatablesScript);

    var datatablesCssLink = document.createElement('link');
    datatablesCssLink.rel = 'stylesheet';
    datatablesCssLink.href = 'https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css';
    document.head.appendChild(datatablesCssLink);

    // Wait for DataTables to load
    setTimeout(function() {
        initializeDataTable();
    }, 500);

    // Initialize dependent dropdowns
    initializeDropdowns();
    
    // Initialize nature toggle
    initializeNatureToggle();
    
    // Initialize produit fini handlers
    initializeProduitFiniHandlers();
    initializeStockCostCalculation();  

    // DataTable Initialization
    function initializeDataTable() {
        try {
            // Destroy existing DataTable if it exists
            if ($.fn.DataTable.isDataTable('.TablePertes')) {
                $('.TablePertes').DataTable().destroy();
            }
            
            // Initialize DataTable
            var tablePertes = $('.TablePertes').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: pertes_url,
                    data: function(d) {
                        // Add filter parameters if needed
                        d.filter_status = $('#filter_status').val();
                        d.filter_categorie = $('#filter_categorie').val();
                        d.filter_subcategorie = $('#filter_subcategorie').val();
                    },
                    dataSrc: function (json) {
                        if (json.data.length === 0) {
                            $('.paging_full_numbers').css('display', 'none');
                        }
                        return json.data;
                    },
                    error: function(xhr, error, thrown) {
                        console.error('DataTables error:', error, thrown);
                        new AWN().alert("Erreur de chargement des données", { durations: { alert: 5000 } });
                    }
                },
                columns: [
                        { data: 'nature', name: 'pt.nature' },
                        { data: 'designation', name: 'pt.designation' },
                        { 
                            data: 'cout_total', 
                            name: 'pt.cout_total',
                            render: function(data, type, row) {
                                if (data) {
                                    return parseFloat(data).toFixed(2) + ' DH';
                                }
                                return '-';
                            }
                        },
                        { 
                            data: 'date_perte', 
                            name: 'pt.date_perte',
                            render: function(data) {
                                if (data) {
                                    const date = new Date(data);
                                    return date.toLocaleDateString('fr-FR');
                                }
                                return '';
                            }
                        },
                        { 
                            data: 'status_badge', 
                            name: 'pt.status',
                            orderable: false,
                            searchable: false
                        },
                        { data: 'username', name: 'us.prenom' },
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
                }
            });
        } catch (error) {
            console.error("Erreur d'initialisation du DataTable:", error);
            new AWN().alert("Erreur d'initialisation du tableau", { durations: { alert: 5000 } });
        }
    }

    // Initialize Nature Toggle (Stock vs Produit Fini)
  // Initialize Nature Toggle (Stock vs Produit Fini)
function initializeNatureToggle() {
    $('#natureDropDown').on('change', function() {
        let nature = $(this).val();
        
        if (nature === 'stock') {
            // Show stock and classe/categorie sections
            $('#classeCategorieSection').show();
            $('#stockSection').show();
            $('#produitFiniSection').hide();
            $('#compositionSection').hide();
            $('#stockCostSection').hide();
            
            // Make stock fields required
            $('#Class_Categorie_Perte').prop('required', true);
            $('#Categorie_Class_Perte').prop('required', true);
            $('#id_subcategorie_perte').prop('required', true);
            $('#id_product_perte').prop('required', true);
            $('#quantite_stock').prop('required', true);
            
            // Make produit fini fields not required
            $('#produit_fini_type').prop('required', false);
            $('#id_plat').prop('required', false);
            $('#nombre_plats').prop('required', false);
            
            // Clear produit fini fields
            $('#produit_fini_type').val('');
            $('#id_plat').empty().append('<option value="">Sélectionner un plat</option>');
            $('#nombre_plats').val('1');
            
        } else if (nature === 'produit fini') {
            // Hide classe/categorie section, show produit fini section
            $('#classeCategorieSection').hide();
            $('#stockSection').hide();
            $('#produitFiniSection').show();
            $('#stockCostSection').hide();
            
            // Make produit fini fields required
            $('#produit_fini_type').prop('required', true);
            $('#id_plat').prop('required', true);
            $('#nombre_plats').prop('required', true);
            
            // Make stock fields not required
            $('#Class_Categorie_Perte').prop('required', false);
            $('#Categorie_Class_Perte').prop('required', false);
            $('#id_subcategorie_perte').prop('required', false);
            $('#id_product_perte').prop('required', false);
            $('#quantite_stock').prop('required', false);
            
            // Clear stock fields
            $('#Class_Categorie_Perte').val('');
            $('#Categorie_Class_Perte').empty().append('<option value="">Sélectionner une catégorie</option>');
            $('#id_subcategorie_perte').empty().append('<option value="">Sélectionner une famille</option>');
            $('#id_product_perte').val('');
            $('#unite_display_perte').val('');
            $('#quantite_stock').val('');
            
        } else {
            // No nature selected - hide all
            $('#classeCategorieSection').hide();
            $('#stockSection').hide();
            $('#produitFiniSection').hide();
            $('#compositionSection').hide();
            $('#stockCostSection').hide();
        }
    });
}


// Add this new function after initializeNatureToggle
function initializeStockCostCalculation() {
    // When product changes, get price and show cost section
    $('#id_product_perte').on('change', function() {
        var productId = $(this).val();
        $('#stockCostSection').hide();
        
        if (!productId) {
            return;
        }
        
        // Get product price - FIXED URL
        $.ajax({
            url: getProductPrice_url + '/' + productId,  // Changed this line
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                if (response.status === 200 && response.price) {
                    $('#stock_prix_unitaire').text(parseFloat(response.price).toFixed(2));
                    $('#stock_prix_unitaire').data('price', response.price);
                    
                    // Calculate if quantity exists
                    var quantity = parseFloat($('#quantite_stock').val()) || 0;
                    if (quantity > 0) {
                        calculateStockCost();
                        $('#stockCostSection').show();
                    }
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement du prix:", error);
            }
        });
    });
    
    // When quantity changes, calculate cost
    $('#quantite_stock').on('input', function() {
        var quantity = parseFloat($(this).val()) || 0;
        var price = parseFloat($('#stock_prix_unitaire').data('price')) || 0;
        
        if (quantity > 0 && price > 0) {
            calculateStockCost();
            $('#stockCostSection').show();
        } else {
            $('#stockCostSection').hide();
        }
    });
}

function calculateStockCost() {
    var price = parseFloat($('#stock_prix_unitaire').data('price')) || 0;
    var quantity = parseFloat($('#quantite_stock').val()) || 0;
    var total = price * quantity;
    
    $('#stock_quantite_display').text(quantity.toFixed(2));
    $('#stock_cout_total').text(total.toFixed(2));
}

function calculateStockCost() {
    var price = parseFloat($('#stock_prix_unitaire').data('price')) || 0;
    var quantity = parseFloat($('#quantite_stock').val()) || 0;
    var total = price * quantity;
    
    $('#stock_quantite_display').text(quantity.toFixed(2));
    $('#stock_cout_total').text(total.toFixed(2));
}

    // Initialize Produit Fini Handlers
    function initializeProduitFiniHandlers() {
        // When produit fini type changes, load plats
        $('#produit_fini_type').on('change', function() {
            let type = $(this).val();
            
            // Clear plat dropdown
            $('#id_plat').empty().append('<option value="">Sélectionner un plat</option>');
            $('#compositionSection').hide();
            $('#composition_body').html('<tr><td colspan="5" class="text-center text-muted"><i class="fa-solid fa-hourglass-half"></i> Sélectionnez un plat pour voir sa composition</td></tr>');
            
            if (!type) {
                return;
            }
            
            // Map type to plat type
            let platType = type;
            if (type === 'Suite') {
                platType = 'Plat Principal';
            }
            
            // Load plats by type
            let url = getPlatsByType_url.replace(':type', encodeURIComponent(platType));
            
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    if (response.status === 200 && response.plats.length > 0) {
                        $.each(response.plats, function(key, plat) {
                            $('#id_plat').append(
                                `<option value="${plat.id}">${plat.name}</option>`
                            );
                        });
                    } else {
                        new AWN().info("Aucun plat trouvé pour ce type", { durations: { info: 3000 } });
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Erreur de chargement des plats:", error);
                    new AWN().alert("Impossible de charger les plats", { durations: { alert: 5000 } });
                }
            });
        });
        
        // When plat changes, load composition
        $('#id_plat').on('change', function() {
            let platId = $(this).val();
            
            if (!platId) {
                $('#compositionSection').hide();
                $('#composition_body').html('<tr><td colspan="5" class="text-center text-muted"><i class="fa-solid fa-hourglass-half"></i> Sélectionnez un plat pour voir sa composition</td></tr>');
                return;
            }
            
            loadPlatComposition(platId);
        });
        
        // When nombre_plats changes, recalculate total
        $('#nombre_plats').on('input', function() {
            let nombrePlats = parseInt($(this).val()) || 1;
            let coutUnitaire = parseFloat($('#cout_unitaire').text()) || 0;
            let coutTotal = nombrePlats * coutUnitaire;
            
            $('#display_nombre_plats').text(nombrePlats);
            $('#cout_total').text(coutTotal.toFixed(2));
        });
    }

    // Load Plat Composition
    function loadPlatComposition(platId) {
        let url = getPlatComposition_url.replace(':id', platId);
        
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                if (response.status === 200) {
                    // Show composition section
                    $('#compositionSection').show();
                    
                    // Set plat name
                    $('#selected_plat_name').text(response.plat.name);
                    
                    // Clear and populate composition table
                    $('#composition_body').empty();
                    
                    if (response.composition && response.composition.length > 0) {
                        $.each(response.composition, function(key, item) {
                            let row = `
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${parseFloat(item.quantite_requise).toFixed(2)}</td>
                                    <td>${item.unite}</td>
                                    <td>${parseFloat(item.price_achat).toFixed(2)} DH</td>
                                    <td><strong>${parseFloat(item.cout_unitaire).toFixed(2)} DH</strong></td>
                                </tr>
                            `;
                            $('#composition_body').append(row);
                        });
                    } else {
                        $('#composition_body').html('<tr><td colspan="5" class="text-center text-muted">Aucune composition trouvée</td></tr>');
                    }
                    
                    // Set cost values
                    let coutUnitaire = parseFloat(response.cout_total_unitaire);
                    let nombrePlats = parseInt($('#nombre_plats').val()) || 1;
                    let coutTotal = coutUnitaire * nombrePlats;
                    
                    $('#cout_unitaire').text(coutUnitaire.toFixed(2));
                    $('#display_nombre_plats').text(nombrePlats);
                    $('#cout_total').text(coutTotal.toFixed(2));
                    
                } else {
                    new AWN().alert(response.message || "Erreur lors du chargement de la composition", { durations: { alert: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement de la composition:", error);
                new AWN().alert("Impossible de charger la composition du plat", { durations: { alert: 5000 } });
            }
        });
    }

    // Initialize Dropdowns
    function initializeDropdowns() {
        // Class change - load categories for ADD form
        $('#Class_Categorie_Perte').on('change', function() {
            let className = $(this).val();
            let categorySelect = $('#Categorie_Class_Perte');
            let subcategorySelect = $('#id_subcategorie_perte');
            let productSelect = $('#id_product_perte');
            
            // Reset dependent dropdowns
            categorySelect.empty().append('<option value="">Sélectionner une catégorie</option>');
            subcategorySelect.empty().append('<option value="">Sélectionner une famille</option>');
            productSelect.empty().append('<option value="">Sélectionner un produit</option>');
            $('#unite_display_perte').val('');
            
            if (className) {
                loadCategoriesByClass(className, categorySelect);
            }
        });
        
        // Category change - load subcategories
        $('#Categorie_Class_Perte').on('change', function() {
            loadSubcategories('#Categorie_Class_Perte', '#id_subcategorie_perte');
            $('#id_product_perte').empty().append('<option value="">Sélectionner un produit</option>');
            $('#unite_display_perte').val('');
        });
        
        // Subcategory change - load products
        $('#id_subcategorie_perte').on('change', function() {
            loadProducts('#id_subcategorie_perte', '#id_product_perte');
            $('#unite_display_perte').val('');
        });
        
        // Product change - display unite
        $('#id_product_perte').on('change', function() {
            var selectedOption = $(this).find('option:selected');
            var uniteName = selectedOption.data('unite');
            $('#unite_display_perte').val(uniteName || '');
        });
    }

    // Load Categories by Class
    function loadCategoriesByClass(className, categorySelect) {
        $.ajax({
            type: "GET",
            url: GetCategorieByClass,
            data: { class: className },
            dataType: "json",
            success: function (response) {
                if (response.status === 200) {
                    categorySelect.empty().append('<option value="">Sélectionner une catégorie</option>');
                    $.each(response.data, function(index, item) {
                        categorySelect.append('<option value="' + item.id + '">' + item.name + '</option>');
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement des catégories:", error);
                new AWN().alert("Impossible de charger les catégories", { durations: { alert: 5000 } });
            }
        });
    }

    // Load Subcategories Function
    function loadSubcategories(categorySelector, subcategorySelector, selectedValue = null) {
        var categoryId = $(categorySelector).val();
        var subcategorySelect = $(subcategorySelector);
        
        // Reset subcategory dropdown
        subcategorySelect.empty().append('<option value="">Sélectionner une famille</option>');
        
        if (!categoryId) {
            return;
        }

        $.ajax({
            url: getSubcategories_url + "/" + categoryId,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
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
                    new AWN().warning("Aucune famille trouvée pour cette catégorie", { durations: { warning: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement des sous-catégories:", error);
                new AWN().alert("Impossible de charger les familles", { durations: { alert: 5000 } });
            }
        });
    }

    // Load Products Function
    function loadProducts(subcategorySelector, productSelector, selectedValue = null) {
        var subcategoryId = $(subcategorySelector).val();
        var productSelect = $(productSelector);
        
        // Reset product dropdown
        productSelect.empty().append('<option value="">Sélectionner un produit</option>');
        
        if (!subcategoryId) {
            return;
        }

        $.ajax({
            url: getProductsBySubcategory_url + "/" + subcategoryId,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                if (response.status === 200 && response.products.length > 0) {
                    $.each(response.products, function(key, product) {
                        var uniteName = product.unite ? product.unite.name : '';
                        productSelect.append(
                            `<option value="${product.id}" data-unite="${uniteName}">${product.name}</option>`
                        );
                    });
                    
                    // Set selected value if provided
                    if (selectedValue) {
                        productSelect.val(selectedValue);
                        // Trigger change to update unite display
                        productSelect.trigger('change');
                    }
                } else {
                    new AWN().warning("Aucun produit trouvé pour cette famille", { durations: { warning: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                console.error("Erreur de chargement des produits:", error);
                new AWN().alert("Impossible de charger les produits", { durations: { alert: 5000 } });
            }
        });
    }

    // Add Perte Handler
    $('#BtnAddPerte').on('click', function(e) {
        e.preventDefault();
        
        let formData = new FormData($('#FormAddPerte')[0]);
        formData.append('_token', csrf_token);

        $('#BtnAddPerte').prop('disabled', true).text('Enregistrement...');

        $.ajax({
            type: "POST",
            url: addPerte_url,
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (response) {
                $('#BtnAddPerte').prop('disabled', false).text('Déclarer la perte');
                
                if(response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalAddPerte').modal('hide');
                    $('.TablePertes').DataTable().ajax.reload();
                    resetPerteForm();
                } else if(response.status == 400) {
                    $('.validationAddPerte').html("");
                    $('.validationAddPerte').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationAddPerte').append('<li>' + list_err + '</li>');
                    });
                    
                    setTimeout(() => {
                        $('.validationAddPerte').fadeOut('slow', function() {
                            $(this).html("").removeClass('alert alert-danger').show();
                        });
                    }, 5000);
                } else {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                $('#BtnAddPerte').prop('disabled', false).text('Déclarer la perte');
                
                // Handle validation errors
                if (xhr.status === 400 && xhr.responseJSON && xhr.responseJSON.errors) {
                    let errorMessages = [];
                    $.each(xhr.responseJSON.errors, function(key, list_err) {
                        errorMessages.push(list_err);
                    });
                    new AWN().alert(errorMessages.join('<br>'), { durations: { alert: 8000 } });
                } else {
                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        new AWN().alert(xhr.responseJSON.message, { durations: { alert: 5000 } });
                    } else {
                        new AWN().alert("Une erreur est survenue", { durations: { alert: 5000 } });
                    }
                }
            }
        });
    });

    // Reset form function
    function resetPerteForm() {
        $('#FormAddPerte')[0].reset();
        $('#unite_display_perte').val('');
        $('#stockSection').show();
        $('#produitFiniSection').hide();
        $('#compositionSection').hide();
        $('#composition_body').html('<tr><td colspan="5" class="text-center text-muted"><i class="fa-solid fa-hourglass-half"></i> Sélectionnez un plat pour voir sa composition</td></tr>');
        $('#cout_unitaire').text('0.00');
        $('#display_nombre_plats').text('1');
        $('#cout_total').text('0.00');
        $('.validationAddPerte').html("").removeClass('alert alert-danger');
    }

    // Reset form when modal is closed
    $('#ModalAddPerte').on('hidden.bs.modal', function() {
        resetPerteForm();
    });

    // Edit Perte Status Handler - Show Modal
    $('.TablePertes tbody').on('click', '.edit-perte-btn', function(e) {
        e.preventDefault();
        
        var perteId = $(this).attr('data-id');
        
        // Fetch perte data for editing
        $.ajax({
            type: "GET",
            url: viewPerte_url + "/" + perteId,
            dataType: "json",
            success: function(response) {
                if (response.status === 403) {
                    new AWN().alert("Vous n'avez pas la permission de modifier cette perte.", {durations: {alert: 5000}});
                    return;
                }
                
                // Populate the edit modal
                $('#edit_perte_id').val(response.id);
                $('#edit_perte_status').val(response.status);
                
                // Show/hide refusal reason field based on current status
                togglePerteRefusalReasonField(response.status);
                
                // If status is already 'Refusé', populate the refusal reason
                if (response.status === 'Refusé' && response.refusal_reason) {
                    $('#edit_perte_refusal_reason').val(response.refusal_reason);
                }
                
                $('#editPerteModal').modal('show');
            },
            error: function(xhr, status, error) {
                console.error('Error fetching perte data:', xhr.responseText);
                
                try {
                    var errorResponse = JSON.parse(xhr.responseText);
                    if (errorResponse.status === 403) {
                        new AWN().alert("Vous n'avez pas la permission de modifier cette perte.", {durations: {alert: 5000}});
                    } else {
                        new AWN().alert("Erreur lors du chargement des données", {durations: {alert: 5000}});
                    }
                } catch(e) {
                    new AWN().alert("Erreur lors du chargement des données", {durations: {alert: 5000}});
                }
            }
        });
    });

    // Handle status change in edit modal
    $('#edit_perte_status').on('change', function() {
        var selectedStatus = $(this).val();
        togglePerteRefusalReasonField(selectedStatus);
    });

    // Function to show/hide refusal reason field
    function togglePerteRefusalReasonField(status) {
        if (status === 'Refusé') {
            $('#perte_refusal_reason_group').show();
            $('#edit_perte_refusal_reason').attr('required', true);
        } else {
            $('#perte_refusal_reason_group').hide();
            $('#edit_perte_refusal_reason').attr('required', false);
            $('#edit_perte_refusal_reason').val(''); // Clear the field
        }
    }

    // Handle edit form submission
    $('#editPerteForm').on('submit', function(e) {
        e.preventDefault();
        
        var formData = {
            id: $('#edit_perte_id').val(),
            status: $('#edit_perte_status').val(),
            refusal_reason: $('#edit_perte_refusal_reason').val(),
            _token: csrf_token
        };
        
        // Validate refusal reason if status is 'Refusé'
        if (formData.status === 'Refusé' && !formData.refusal_reason.trim()) {
            new AWN().alert("Le motif de refus est requis pour le statut 'Refusé'", {durations: {alert: 5000}});
            return;
        }
        
        $('#editPerteForm button[type="submit"]').prop('disabled', true).text('Mise à jour...');
        
        $.ajax({
            type: "POST",
            url: changeStatusPerte_url,
            data: formData,
            dataType: "json",
            success: function(response) {
                $('#editPerteForm button[type="submit"]').prop('disabled', false).text('Mettre à jour');
                
                if (response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#editPerteModal').modal('hide');
                    // Reload the DataTable
                    $('.TablePertes').DataTable().ajax.reload();
                } else if (response.status == 400) {
                    // Handle validation errors
                    $('#edit_perte_status_error').text('');
                    if (response.errors && response.errors.status) {
                        $('#edit_perte_status_error').text(response.errors.status[0]);
                    }
                    new AWN().alert("Erreur de validation", {durations: {alert: 5000}});
                } else {
                    new AWN().alert(response.message || "Une erreur est survenue", {durations: {alert: 5000}});
                }
            },
            error: function(xhr, status, error) {
                $('#editPerteForm button[type="submit"]').prop('disabled', false).text('Mettre à jour');
                
                console.error('Error updating perte:', xhr.responseText);
                
                try {
                    var errorResponse = JSON.parse(xhr.responseText);
                    if (errorResponse.status === 403) {
                        new AWN().alert("Vous n'avez pas la permission de modifier cette perte.", {durations: {alert: 5000}});
                    } else {
                        new AWN().alert(errorResponse.message || "Erreur lors de la mise à jour", {durations: {alert: 5000}});
                    }
                } catch(e) {
                    new AWN().alert("Erreur lors de la mise à jour", {durations: {alert: 5000}});
                }
            }
        });
    });
    
    // Reset modal when it's hidden
    $('#editPerteModal').on('hidden.bs.modal', function() {
        $('#editPerteForm')[0].reset();
        $('#edit_perte_status_error').text('');
        $('#perte_refusal_reason_group').hide();
        $('#edit_perte_refusal_reason').attr('required', false);
    });

    // Delete Perte Handler
    $('.TablePertes tbody').on('click', '.deletePerte', function(e) {
        e.preventDefault();
        var perteId = $(this).attr('data-id');
        let notifier = new AWN();

        let onOk = () => {
            $.ajax({
                type: "POST",
                url: deletePerte_url,
                data: {
                    id: perteId,
                    _token: csrf_token,
                    _method: 'DELETE'
                },
                dataType: "json",
                success: function (response) {
                    if(response.status == 200) {
                        notifier.success(response.message, {durations: {success: 5000}});
                        $('.TablePertes').DataTable().ajax.reload();
                    } else if (response.status == 400) {
                        notifier.alert(response.message, {durations: {alert: 5000}});
                    } else {
                        notifier.alert(response.message || "Une erreur est survenue", {durations: {alert: 5000}});
                    }
                },
                error: function(xhr) {
                    if (xhr.status === 403) {
                        notifier.alert("Vous n'avez pas la permission de supprimer des pertes", { durations: { alert: 5000 } });
                    } else if (xhr.responseJSON && xhr.responseJSON.message) {
                        notifier.alert(xhr.responseJSON.message, { durations: { alert: 5000 } });
                    } else {
                        notifier.alert("Erreur lors de la suppression", { durations: { alert: 5000 } });
                    }
                }
            });
        };

        let onCancel = () => {
            notifier.info('Suppression annulée');
        };

        notifier.confirm(
            'Voulez-vous vraiment supprimer cette perte ?',
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

});