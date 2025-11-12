@extends('dashboard.index')

@section('dashboard')
<div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="/home">Accueil</a></li>
                                <li class="breadcrumb-item active">Analyse Annuelle des Coûts</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Analyse Annuelle des Coûts par Mois</h4>
                    </div>
                </div>
            </div>

            <!-- Filters card -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Filtres</h4>
                            
                            <form id="yearlyBreakdownForm" class="row g-3">
                                <div class="col-md-6">
                                    <label for="year" class="form-label">Année</label>
                                    <select class="form-select" id="year" name="year" required>
                                        <!-- Years will be populated by JavaScript -->
                                    </select>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="type_menu" class="form-label">Type de Menu</label>
                                    <select class="form-select" id="type_menu" name="type_menu" required>
                                        <option value="Menu eleves" selected>Menu standard</option>
                                        <option value="Menu specials">Menu specials</option>
                                        <option value="Menu d'application">Menu d'application</option>
                                    </select>
                                </div>
                                
                                <!-- Hidden Type de Commande input -->
                                <input type="hidden" id="type_commande" name="type_commande" value="Alimentaire">
                                
                                <div class="col-12 mt-3">
                                    <button type="submit" class="btn btn-primary" id="btnSearch">
                                        <i class="fa fa-search"></i> Rechercher
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- No data message -->
            <div class="row" id="noDataMessage" style="display: none;">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-exclamation-circle fa-3x text-warning mb-3"></i>
                            <h4>Aucune donnée trouvée pour cette année et ces critères.</h4>
                            <p>Veuillez essayer une autre année ou d'autres filtres.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Yearly Report -->
<div class="modal fade" id="ModalYearlyReport" tabindex="-1" aria-labelledby="ModalYearlyReportLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalYearlyReportLabel">Consommation de l'année</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <div id="printSection" class="table-responsive">
                    <div id="yearlyReportContent">
                        <table class="table table-bordered" id="yearlyReportTable">
                            <thead>
                                <tr>
                                    <th>Mois</th>
                                    <th>Coût unitaire par stagiaire</th>
                                    <th>Légumes et Fruits</th>
                                    <th>Volailles et Œufs</th>
                                    <th>Poisson Frais</th>
                                    <th>Épicerie et Produits Laitiers</th>
                                    <th>Viandes</th>
                                    <th>Coût total du mois</th>
                                    <th>Effectif</th>
                                </tr>
                            </thead>
                            <tbody id="yearlyReportBody">
                                <!-- Data will be populated here -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary no-print" data-bs-dismiss="modal">Fermer</button>
                <button type="button" class="btn btn-primary no-print" id="btnExportPDF">
                    <i class="fa fa-file-pdf"></i> Exporter PDF
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    /* Styling to match the monthly breakdown */
    #yearlyReportTable {
        border-collapse: collapse;
        width: 100%;
    }
    
    #yearlyReportTable th, 
    #yearlyReportTable td {
        border: 1px solid #000;
        padding: 8px;
        text-align: center;
    }
    
    #yearlyReportTable th {
        background-color: #f2f2f2;
    }
    
    .month-row {
        background-color: #f8f9fa;
        font-weight: bold;
    }
    
    /* Add print styles */
    @media print {
        body * {
            visibility: hidden;
        }
        #printSection, #printSection * {
            visibility: visible;
        }
        #printSection {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
        }
        .no-print {
            display: none !important;
        }
    }
    
    .table-responsive {
        overflow-x: auto;
    }
    
    .fa-spinner {
        animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    
    /* Make the modal wider */
    @media (min-width: 992px) {
        .modal-xl {
            max-width: 95%;
        }
    }
</style>

<script type="text/javascript">
    // Define URLs for API endpoints
    const getYearlyBreakdownData_url = "{{ route('get.yearly.breakdown') }}";
    const exportYearlyBreakdownPDF_url = "{{ route('export.yearly.breakdown.pdf') }}";
    
    $(document).ready(function() {
        // Populate years dropdown (last 5 years + current year + next year)
        const currentYear = new Date().getFullYear();
        const yearSelect = $('#year');
        for (let year = currentYear + 1; year >= currentYear - 5; year--) {
            yearSelect.append(`<option value="${year}" ${year === currentYear ? 'selected' : ''}>${year}</option>`);
        }
        
        // Handle form submission
        $('#yearlyBreakdownForm').on('submit', function(e) {
            e.preventDefault();
            
            const year = $('#year').val();
            const typeMenu = $('#type_menu').val();
            const typeCommande = $('#type_commande').val();
            
            if (!year) {
                new AWN().alert('Veuillez sélectionner une année');
                return;
            }
            
            $.ajax({
                type: "GET",
                url: getYearlyBreakdownData_url,
                data: {
                    year: year,
                    type_menu: typeMenu,
                    type_commande: typeCommande
                },
                dataType: "json",
                beforeSend: function() {
                    $('#btnSearch').prop('disabled', true);
                    $('#btnSearch').html('<i class="fa fa-spinner fa-spin"></i> Chargement...');
                    $('#noDataMessage').hide();
                },
                success: function(response) {
                    console.log('Response:', response);
                    if (response.status == 200 && response.data.months_data.length > 0) {
                        displayYearlyReport(response.data);
                        $('#ModalYearlyReport').modal('show');
                        $('#noDataMessage').hide();
                    } else {
                        $('#noDataMessage').show();
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                    new AWN().alert("Erreur lors de la récupération des données");
                    $('#noDataMessage').show();
                },
                complete: function() {
                    $('#btnSearch').prop('disabled', false);
                    $('#btnSearch').html('<i class="fa fa-search"></i> Rechercher');
                }
            });
        });

        // Function to display yearly report data
        function displayYearlyReport(data) {
            // Set report title in modal
            $('#ModalYearlyReportLabel').text('Consommation de l\'année ' + data.year);
            
            // Clear and rebuild the table body
            const tbody = $('#yearlyReportBody');
            tbody.empty();
            
            // Define category mappings
            const categoryMappings = {
                'Légumes et Fruits': ['légumes', 'fruits', 'légume', 'fruit'],
                'Volailles et Œufs': ['volaille', 'oeuf', 'œuf', 'poulet', 'poule'],
                'Poisson Frais': ['poisson'],
                'Épicerie et Produits Laitiers': ['épicerie', 'lait', 'laitier', 'fromage', 'yaourt'],
                'Viandes': ['viande', 'boeuf', 'bœuf', 'agneau', 'veau']
            };
            
            // Process each month
            data.months_data.forEach(monthData => {
                // Calculate category costs for the entire month
                const costs = {};
                for (const displayName in categoryMappings) {
                    costs[displayName] = 0;
                }
                
                // Aggregate all category costs from all days in the month
                monthData.data.days_data.forEach(day => {
                    day.category_costs.forEach(category => {
                        for (const displayName in categoryMappings) {
                            const keywords = categoryMappings[displayName];
                            if (keywords.some(keyword => 
                                category.name.toLowerCase().includes(keyword.toLowerCase()) ||
                                displayName.toLowerCase().includes(category.name.toLowerCase())
                            )) {
                                costs[displayName] += parseFloat(category.total_cost);
                            }
                        }
                    });
                });
                
                // Get month totals
                const monthTotals = monthData.data.month_totals;
                
                // Build the month row
                const row = $(`
                    <tr>
                        <td>${monthData.month}</td>
                        <td>${formatCost(monthTotals.prix_moyen)}</td>
                        <td>${formatCost(costs['Légumes et Fruits'])}</td>
                        <td>${formatCost(costs['Volailles et Œufs'])}</td>
                        <td>${formatCost(costs['Poisson Frais'])}</td>
                        <td>${formatCost(costs['Épicerie et Produits Laitiers'])}</td>
                        <td>${formatCost(costs['Viandes'])}</td>
                        <td>${formatCost(monthTotals.total_cost)}</td>
                        <td>${monthTotals.total_people}</td>
                    </tr>
                `);
                
                tbody.append(row);
            });
            
            // Add year totals row at the end
            const yearTotals = data.year_totals;
            
            // Calculate total category costs for the year
            const yearCategoryCosts = {};
            for (const displayName in categoryMappings) {
                yearCategoryCosts[displayName] = 0;
            }
            
            data.months_data.forEach(monthData => {
                monthData.data.days_data.forEach(day => {
                    day.category_costs.forEach(category => {
                        for (const displayName in categoryMappings) {
                            const keywords = categoryMappings[displayName];
                            if (keywords.some(keyword => 
                                category.name.toLowerCase().includes(keyword.toLowerCase()) ||
                                displayName.toLowerCase().includes(category.name.toLowerCase())
                            )) {
                                yearCategoryCosts[displayName] += parseFloat(category.total_cost);
                            }
                        }
                    });
                });
            });
            
            const totalRow = $(`
                <tr style="font-weight: bold; background-color: #e9ecef;">
                    <td>TOTAL ANNUEL</td>
                    <td>${formatCost(yearTotals.prix_moyen)}</td>
                    <td>${formatCost(yearCategoryCosts['Légumes et Fruits'])}</td>
                    <td>${formatCost(yearCategoryCosts['Volailles et Œufs'])}</td>
                    <td>${formatCost(yearCategoryCosts['Poisson Frais'])}</td>
                    <td>${formatCost(yearCategoryCosts['Épicerie et Produits Laitiers'])}</td>
                    <td>${formatCost(yearCategoryCosts['Viandes'])}</td>
                    <td>${formatCost(yearTotals.total_cost)}</td>
                    <td>${yearTotals.total_people}</td>
                </tr>
            `);
            
            tbody.append(totalRow);
        }
        
        // Helper function to format cost values
        function formatCost(value) {
            if (!value || parseFloat(value) === 0) {
                return '-';
            }
            return parseFloat(value).toFixed(2);
        }
        
        // PDF Export functionality
        $('#btnExportPDF').on('click', function(e) {
            e.preventDefault();
            
            const year = $('#year').val();
            const typeMenu = $('#type_menu').val();
            const typeCommande = $('#type_commande').val();
            
            if (!year) {
                new AWN().alert('Veuillez sélectionner une année');
                return;
            }
            
            const form = document.createElement('form');
            form.method = 'GET';
            form.action = exportYearlyBreakdownPDF_url;
            
            const fields = {
                year: year,
                type_menu: typeMenu,
                type_commande: typeCommande
            };
            
            for (const [key, value] of Object.entries(fields)) {
                const hidden = document.createElement('input');
                hidden.type = 'hidden';
                hidden.name = key;
                hidden.value = value;
                form.appendChild(hidden);
            }
            
            document.body.appendChild(form);
            form.submit();
            document.body.removeChild(form);
        });
    });
</script>

@endsection