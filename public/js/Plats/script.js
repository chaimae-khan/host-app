$(document).ready(function () {
    var datatablesScript = document.createElement('script');
    datatablesScript.src = 'https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js';
    document.head.appendChild(datatablesScript);

    var datatablesCssLink = document.createElement('link');
    datatablesCssLink.rel = 'stylesheet';
    datatablesCssLink.href = 'https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css';
    document.head.appendChild(datatablesCssLink);

    setTimeout(function() {
        initializeDataTable();
    }, 500);

    function initializeDataTable() {
        try {
            if ($.fn.DataTable.isDataTable('.TablePlats')) {
                $('.TablePlats').DataTable().destroy();
            }
            
            var tablePlats = $('.TablePlats').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: plats,
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
                    { data: 'name', name: 'p.name' },
                    { data: 'type', name: 'p.type' },
                    { data: 'username', name: 'username' },
                    { 
                        data: 'created_at', 
                        name: 'p.created_at',
                        render: function(data) {
                            if (data) {
                                const date = new Date(data);
                                return date.toLocaleDateString('fr-FR') + ' ' + date.toLocaleTimeString('fr-FR', {hour: '2-digit', minute:'2-digit'});
                            }
                            return '<span class="text-muted">Non définie</span>';
                        }
                    },
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

            // Edit Plat Handler
            $('.TablePlats tbody').on('click', '.editPlat', function(e) {
                e.preventDefault();
                var platId = $(this).attr('data-id');
                
                $(this).prop('disabled', true);
                
                $.ajax({
                    type: "GET",
                    url: editPlat + "/" + platId,
                    dataType: "json",
                    success: function(response) {
                        $('.editPlat').prop('disabled', false);
                        $('#ModalEditPlat').modal("show");
                        $('.validationEditPlat').html("").removeClass('alert alert-danger');
                        
                        $('#id').val(response.id);
                        $('#name').val(response.name);
                        $('#type').val(response.type);
                    },
                    error: function(xhr, status, error) {
                        $('.editPlat').prop('disabled', false);
                        let errorMessage = "Erreur de chargement du plat";
                        
                        try {
                            var errorResponse = JSON.parse(xhr.responseText);
                            if (errorResponse && errorResponse.message) {
                                errorMessage = errorResponse.message;
                            }
                        } catch(e) {
                            errorMessage = "Le format de la réponse est invalide.";
                        }
                        
                        new AWN().alert(errorMessage, { durations: { alert: 5000 } });
                    }
                });
            });

            // Delete Plat Handler
            $('.TablePlats tbody').on('click', '.deletePlat', function(e) {
                e.preventDefault();
                var platId = $(this).attr('data-id');
                let notifier = new AWN();

                let onOk = () => {
                    $.ajax({
                        type: "POST",
                        url: DeletePlat,
                        data: {
                            id: platId,
                            _token: csrf_token,
                        },
                        dataType: "json",
                        success: function (response) {
                            if(response.status == 200) {
                                notifier.success(response.message, {durations: {success: 5000}});
                                $('.TablePlats').DataTable().ajax.reload();
                            } else {
                                notifier.alert(response.message, {durations: {alert: 5000}});
                            }
                        },
                        error: function(xhr) {
                            notifier.alert("Erreur lors de la suppression", { durations: { alert: 5000 } });
                        }
                    });
                };

                let onCancel = () => {
                    notifier.info('Suppression annulée');
                };

                notifier.confirm(
                    'Voulez-vous vraiment supprimer ce plat ?',
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
        } catch (error) {
            console.error("Erreur d'initialisation du DataTable:", error);
            new AWN().alert("Erreur d'initialisation du tableau", { durations: { alert: 5000 } });
        }
    }

    // Add Plat Handler
    $('#BtnAddPlat').on('click', function(e) {
        e.preventDefault();
        
        let formData = new FormData($('#FormAddPlat')[0]);
        formData.append('_token', csrf_token);

        $('#BtnAddPlat').prop('disabled', true).text('Enregistrement...');

        $.ajax({
            type: "POST",
            url: AddPlat,
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (response) {
                $('#BtnAddPlat').prop('disabled', false).text('Sauvegarder');
                
                if(response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalAddPlat').modal('hide');
                    $('.TablePlats').DataTable().ajax.reload();
                    $('#FormAddPlat')[0].reset();
                } else if(response.status == 400) {
                    $('.validationAddPlat').html("");
                    $('.validationAddPlat').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationAddPlat').append('<li>' + list_err + '</li>');
                    });
                    
                    setTimeout(() => {
                        $('.validationAddPlat').fadeOut('slow', function() {
                            $(this).html("").removeClass('alert alert-danger').show();
                        });
                    }, 5000);
                } else if(response.status == 422) {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                } else {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                $('#BtnAddPlat').prop('disabled', false).text('Sauvegarder');
                
                if (xhr.status === 400 && xhr.responseJSON && xhr.responseJSON.errors) {
                    let errorMessages = [];
                    $.each(xhr.responseJSON.errors, function(key, list_err) {
                        errorMessages.push(list_err);
                    });
                    new AWN().alert(errorMessages.join('<br>'), { durations: { alert: 8000 } });
                } else if (xhr.status === 422 && xhr.responseJSON) {
                    new AWN().alert(xhr.responseJSON.message, { durations: { alert: 5000 } });
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

    // Update Plat Handler
    $('#BtnUpdatePlat').on('click', function(e) {
        e.preventDefault();
        
        let formData = new FormData($('#FormUpdatePlat')[0]);
        formData.append('_token', csrf_token);
        formData.append('id', $('#id').val());
        
        $('#BtnUpdatePlat').prop('disabled', true).text('Mise à jour...');
        
        $.ajax({
            type: "POST",
            url: UpdatePlat,
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function(response) {
                $('#BtnUpdatePlat').prop('disabled', false).text('Mettre à jour');
                
                if (response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalEditPlat').modal('hide');
                    $('.TablePlats').DataTable().ajax.reload();
                } else if (response.status == 400) {
                    $('.validationEditPlat').html("");
                    $('.validationEditPlat').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationEditPlat').append('<li>' + list_err + '</li>');
                    });
                    
                    setTimeout(() => {
                        $('.validationEditPlat').fadeOut('slow', function() {
                            $(this).html("").removeClass('alert alert-danger').show();
                        });
                    }, 5000);
                } else if (response.status == 422) {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                } else {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                }
            },
            error: function(xhr) {
                $('#BtnUpdatePlat').prop('disabled', false).text('Mettre à jour');
                
                if (xhr.status === 400 && xhr.responseJSON && xhr.responseJSON.errors) {
                    let errorMessages = [];
                    $.each(xhr.responseJSON.errors, function(key, list_err) {
                        errorMessages.push(list_err);
                    });
                    new AWN().alert(errorMessages.join('<br>'), { durations: { alert: 8000 } });
                } else if (xhr.status === 422 && xhr.responseJSON) {
                    new AWN().alert(xhr.responseJSON.message, { durations: { alert: 5000 } });
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

    // Import Plat Handler
    $(document).on('click', '#BtnImportPlat', function(e) {
        e.preventDefault();
        
        let formData = new FormData($('#FormImportPlat')[0]);
        formData.append('_token', csrf_token);

        if ($('#import_file').val() == '') {
            new AWN().warning('Veuillez sélectionner un fichier.', {durations: {warning: 5000}});
            return;
        }

        $('#BtnImportPlat').prop('disabled', true).text('Importation en cours...');

        $.ajax({
            type: "POST",
            url: ImportPlat,
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (response) {
                $('#BtnImportPlat').prop('disabled', false).text('Importer');
                
                if(response.status == 200) {
                    new AWN().success(response.message, {durations: {success: 5000}});
                    $('#ModalImportPlat').modal('hide');
                    $('.TablePlats').DataTable().ajax.reload();
                    $('#FormImportPlat')[0].reset();
                } else if(response.status == 400) {
                    $('.validationImportPlat').html("");
                    $('.validationImportPlat').addClass('alert alert-danger');
                    $.each(response.errors, function(key, list_err) {
                        $('.validationImportPlat').append('<li>' + list_err + '</li>');
                    });
                    
                    setTimeout(() => {
                        $('.validationImportPlat').fadeOut('slow', function() {
                            $(this).html("").removeClass('alert alert-danger').show();
                        });
                    }, 5000);
                } else if (response.status == 500) {
                    new AWN().alert(response.message, { durations: { alert: 5000 } });
                }
            },
            error: function(xhr, status, error) {
                $('#BtnImportPlat').prop('disabled', false).text('Importer');
                
                if (xhr.status === 403) {
                    new AWN().warning(xhr.responseJSON.message, {durations: {warning: 5000}});
                } else {
                    try {
                        var errorResponse = JSON.parse(xhr.responseText);
                        if (errorResponse && errorResponse.message) {
                            new AWN().alert(errorResponse.message, { durations: { alert: 5000 } });
                        } else {
                            new AWN().alert("Une erreur est survenue", { durations: { alert: 5000 } });
                        }
                    } catch (e) {
                        new AWN().alert("Une erreur est survenue", { durations: { alert: 5000 } });
                    }
                }
            }
        });
    });
    // Add this to your existing script.js file

// Export Excel Handler
$(document).on('click', '#BtnExportExcel', function(e) {
    e.preventDefault();
    
    // Get selected columns (all columns by default)
    const selectedColumns = '0,1,2,3'; // name, type, username, created_at
    
    // Create form and submit
    const form = $('<form>', {
        'method': 'POST',
        'action': ExportPlatsExcel
    });
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': '_token',
        'value': csrf_token
    }));
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': 'columns',
        'value': selectedColumns
    }));
    
    $('body').append(form);
    form.submit();
    form.remove();
    
    new AWN().success('Export Excel en cours...', {durations: {success: 3000}});
});

// Export PDF Handler
$(document).on('click', '#BtnExportPdf', function(e) {
    e.preventDefault();
    
    // Get selected columns (all columns by default)
    const selectedColumns = '0,1,2,3'; // name, type, username, created_at
    
    // Create form and submit
    const form = $('<form>', {
        'method': 'POST',
        'action': ExportPlatsPdf
    });
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': '_token',
        'value': csrf_token
    }));
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': 'columns',
        'value': selectedColumns
    }));
    
    $('body').append(form);
    form.submit();
    form.remove();
    
    new AWN().success('Export PDF en cours...', {durations: {success: 3000}});
});

// Optional: Export with column selection modal
function openExportModal(format) {
    const columns = [
        { index: 0, name: 'Nom', checked: true },
        { index: 1, name: 'Type', checked: true },
        { index: 2, name: 'Créé par', checked: true },
        { index: 3, name: 'Créé le', checked: true }
    ];
    
    let checkboxes = '';
    columns.forEach(col => {
        checkboxes += `
            <div class="form-check">
                <input class="form-check-input export-column" type="checkbox" 
                       value="${col.index}" id="col${col.index}" ${col.checked ? 'checked' : ''}>
                <label class="form-check-label" for="col${col.index}">
                    ${col.name}
                </label>
            </div>
        `;
    });
    
    const modalHtml = `
        <div class="modal fade" id="ModalExportPlats" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Exporter vers ${format}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>Sélectionnez les colonnes à exporter:</p>
                        ${checkboxes}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-primary" id="BtnConfirmExport" data-format="${format}">
                            Exporter
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;
    
    // Remove existing modal if present
    $('#ModalExportPlats').remove();
    
    // Add modal to body and show
    $('body').append(modalHtml);
    $('#ModalExportPlats').modal('show');
}

// Confirm export with selected columns
$(document).on('click', '#BtnConfirmExport', function() {
    const format = $(this).data('format');
    const selectedColumns = [];
    
    $('.export-column:checked').each(function() {
        selectedColumns.push($(this).val());
    });
    
    if (selectedColumns.length === 0) {
        new AWN().warning('Veuillez sélectionner au moins une colonne', {durations: {warning: 3000}});
        return;
    }
    
    const exportUrl = format === 'Excel' ? ExportPlatsExcel : ExportPlatsPdf;
    
    const form = $('<form>', {
        'method': 'POST',
        'action': exportUrl
    });
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': '_token',
        'value': csrf_token
    }));
    
    form.append($('<input>', {
        'type': 'hidden',
        'name': 'columns',
        'value': selectedColumns.join(',')
    }));
    
    $('body').append(form);
    form.submit();
    form.remove();
    
    $('#ModalExportPlats').modal('hide');
    new AWN().success(`Export ${format} en cours...`, {durations: {success: 3000}});
});
});