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

            <!-- Results Container -->
            <div class="row" id="resultsContainer" style="display: none;">
                <div class="col-12">
                    <!-- Results will be dynamically inserted here -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Yearly Report -->
<div class="modal fade" id="ModalYearlyReport" tabindex="-1" aria-labelledby="ModalYearlyReportLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalYearlyReportLabel">Consommation de l'année</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <div id="yearlyReportContent">
                    <!-- Content will be populated here -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary no-print" data-bs-dismiss="modal">Fermer</button>
                <button type="button" class="btn btn-primary no-print" id="btnExportPDF" style="display: none;">
                    <i class="fa fa-file-pdf"></i> Exporter PDF
                </button>
            </div>
        </div>
    </div>
</div>

<style>
    .month-card {
        margin-bottom: 30px;
        page-break-inside: avoid;
    }
    
    .month-title {
        background-color: #007bff;
        color: white;
        padding: 10px;
        text-align: center;
        font-weight: bold;
        font-size: 18px;
    }
    
    .monthly-table {
        border-collapse: collapse;
        width: 100%;
    }
    
    .monthly-table th, 
    .monthly-table td {
        border: 1px solid #000;
        padding: 8px;
        text-align: center;
    }
    
    .monthly-table th {
        background-color: #f2f2f2;
    }
    
    .week-header {
        background-color: #f8f9fa;
        font-weight: bold;
    }
    
    .fa-spinner {
        animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
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
                    $('#resultsContainer').hide();
                    $('#btnExportPDF').hide();
                },
                success: function(response) {
                    console.log('Response:', response); // Debug log
                    if (response.status == 200 && response.data.months_data.length > 0) {
                        displayYearlyReport(response.data);
                        $('#resultsContainer').show();
                        $('#btnExportPDF').show();
                        $('#noDataMessage').hide();
                    } else {
                        $('#noDataMessage').show();
                        $('#resultsContainer').hide();
                        $('#btnExportPDF').hide();
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error:", error);
                    new AWN().alert("Erreur lors de la récupération des données");
                    $('#noDataMessage').show();
                    $('#resultsContainer').hide();
                    $('#btnExportPDF').hide();
                },
                complete: function() {
                    $('#btnSearch').prop('disabled', false);
                    $('#btnSearch').html('<i class="fa fa-search"></i> Rechercher');
                }
            });
        });

        // Function to display yearly report data
        function displayYearlyReport(data) {
            const container = $('#resultsContainer .col-12');
            container.empty();
            
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
                const monthCard = $('<div>').addClass('card month-card');
                const monthCardBody = $('<div>').addClass('card-body');
                
                // Month title
                monthCardBody.append(`<div class="month-title">${monthData.month}</div>`);
                
                // Group days by week
                const groupedDays = groupDaysByWeek(monthData.data.days_data);
                
                // Create table
                const table = $('<table>').addClass('table table-bordered monthly-table');
                const thead = $(`
                    <thead>
                        <tr>
                            <th>Journée du</th>
                            <th>Coût unitaire par stagiaire</th>
                            <th>Légumes et Fruits</th>
                            <th>Volailles et Œufs</th>
                            <th>Poisson Frais</th>
                            <th>Épicerie et Produits Laitiers</th>
                            <th>Viandes</th>
                            <th>Coût total de la journée</th>
                            <th>Effectif</th>
                        </tr>
                    </thead>
                `);
                
                const tbody = $('<tbody>');
                
                Object.keys(groupedDays).forEach(weekKey => {
                    const days = groupedDays[weekKey];
                    
                    // Add week header
                    tbody.append(`
                        <tr>
                            <td colspan="9" class="text-center week-header">Semaine du ${weekKey}</td>
                        </tr>
                    `);
                    
                    // Add each day in week
                    days.forEach(day => {
                        const row = buildDayRow(day, categoryMappings);
                        tbody.append(row);
                    });
                });
                
                table.append(thead).append(tbody);
                monthCardBody.append(table);
                
                // Add month totals
                const monthTotals = monthData.data.month_totals;
                monthCardBody.append(`
                    <div class="row mt-3">
                        <div class="col-md-4">
                            <strong>Coût Total du Mois:</strong> ${formatCost(monthTotals.total_cost)} DH
                        </div>
                        <div class="col-md-4">
                            <strong>Total Effectif:</strong> ${monthTotals.total_people}
                        </div>
                        <div class="col-md-4">
                            <strong>Prix Moyen:</strong> ${formatCost(monthTotals.prix_moyen)} DH
                        </div>
                    </div>
                `);
                
                monthCard.append(monthCardBody);
                container.append(monthCard);
            });
            
            // Add year totals at the end
            const yearTotals = data.year_totals;
            const yearCard = $('<div>').addClass('card mt-3');
            const yearCardBody = $('<div>').addClass('card-body');
            yearCardBody.append(`
                <h4 class="text-center mb-3">Totaux de l'Année ${data.year}</h4>
                <div class="row">
                    <div class="col-md-4 text-center">
                        <h5>Coût Total</h5>
                        <p class="h3 text-primary">${formatCost(yearTotals.total_cost)} DH</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <h5>Total Effectif</h5>
                        <p class="h3 text-info">${yearTotals.total_people}</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <h5>Prix Moyen</h5>
                        <p class="h3 text-success">${formatCost(yearTotals.prix_moyen)} DH</p>
                    </div>
                </div>
            `);
            yearCard.append(yearCardBody);
            container.append(yearCard);
        }
        
        // Function to group days by week
        function groupDaysByWeek(days) {
            const weeks = {};
            
            days.forEach(day => {
                const dateParts = day.date.split('/');
                const dayDate = new Date(dateParts[2], parseInt(dateParts[1])-1, parseInt(dateParts[0]));
                
                const firstDayOfWeek = new Date(dayDate);
                const day_of_week = dayDate.getDay() || 7;
                if (day_of_week !== 1)
                    firstDayOfWeek.setDate(dayDate.getDate() - (day_of_week - 1));
                
                const lastDayOfWeek = new Date(firstDayOfWeek);
                lastDayOfWeek.setDate(firstDayOfWeek.getDate() + 6);
                
                const weekKey = `${formatDateFr(firstDayOfWeek)} au ${formatDateFr(lastDayOfWeek)}`;
                
                if (!weeks[weekKey]) {
                    weeks[weekKey] = [];
                }
                
                weeks[weekKey].push(day);
            });
            
            Object.keys(weeks).forEach(weekKey => {
                weeks[weekKey].sort((a, b) => {
                    const dateA = parseFrDate(a.date);
                    const dateB = parseFrDate(b.date);
                    return dateA - dateB;
                });
            });
            
            return weeks;
        }
        
        // Build a table row for a day
        function buildDayRow(day, categoryMappings) {
            const dateParts = day.date.split('/');
            const dayDate = new Date(dateParts[2], parseInt(dateParts[1])-1, parseInt(dateParts[0]));
            const dayNames = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
            const dayName = dayNames[dayDate.getDay()];
            
            const costs = {};
            for (const displayName in categoryMappings) {
                costs[displayName] = 0;
                const keywords = categoryMappings[displayName];
                
                for (const category of day.category_costs) {
                    if (keywords.some(keyword => 
                        category.name.toLowerCase().includes(keyword.toLowerCase()) ||
                        displayName.toLowerCase().includes(category.name.toLowerCase())
                    )) {
                        costs[displayName] += parseFloat(category.total_cost);
                    }
                }
            }
            
            return `
                <tr>
                    <td>${dayName} ${day.date}</td>
                    <td>${formatCost(day.prix_moyen)}</td>
                    <td>${formatCost(costs['Légumes et Fruits'])}</td>
                    <td>${formatCost(costs['Volailles et Œufs'])}</td>
                    <td>${formatCost(costs['Poisson Frais'])}</td>
                    <td>${formatCost(costs['Épicerie et Produits Laitiers'])}</td>
                    <td>${formatCost(costs['Viandes'])}</td>
                    <td>${formatCost(day.total_cost)}</td>
                    <td>${day.total_people}</td>
                </tr>
            `;
        }
        
        // Helper function to format a date as DD Month YYYY in French
        function formatDateFr(date) {
            const day = date.getDate();
            const monthNames = [
                'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
                'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
            ];
            const month = monthNames[date.getMonth()];
            const year = date.getFullYear();
            
            return `${day} ${month} ${year}`;
        }
        
        // Helper function to parse a date string in DD/MM/YYYY format
        function parseFrDate(dateStr) {
            const parts = dateStr.split('/');
            return new Date(parts[2], parts[1] - 1, parts[0]);
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