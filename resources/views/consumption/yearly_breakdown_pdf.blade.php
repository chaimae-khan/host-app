<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reporting Annuel {{ $year }}@if(isset($type_menu) && $type_menu !== 'all') - {{ $type_menu === 'Menu eleves' ? 'Menu standard' : $type_menu }}@endif</title>
    <style>
        * {
            font-family: DejaVu Sans !important;
        }
        @page {
            size: a4;
            margin: 0;
            padding: 0;
        }
        body {
            margin: 0;
            padding: 0;
            font-size: 10px;
        }
        .header img, .footer img {
            width: 100%;
            display: block;
        }
        .container {
            padding: 15px;
        }
        .title {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin: 15px 0;
        }
        .subtitle {
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            margin: 10px 0;
            color: #666;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 6px;
            text-align: center;
            font-size: 10px;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .total-row {
            background-color: #e9ecef;
            font-weight: bold;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .page-break {
            page-break-after: always;
        }
    </style>
</head>
<body>
    <!-- Header with logo -->
    <div class="header">
        <img src="data:image/png;base64,{{ $imageData_top }}" alt="Header">
    </div>
    
    <div class="container">
        <!-- Main Title -->
        <div class="title">
            Consommation de l'année {{ $year }}
            @if(isset($type_menu) && $type_menu !== 'all')
                <div class="subtitle">
                    @if($type_menu === 'Menu eleves')
                        Menu standard
                    @else
                        {{ $type_menu }}
                    @endif
                </div>
            @endif
        </div>
        
        @php
            // Define category mappings for lookup
            $categoryMappings = [
                'Légumes et Fruits' => ['légumes', 'fruits', 'légume', 'fruit'],
                'Volailles et Œufs' => ['volaille', 'oeuf', 'œuf', 'poulet', 'poule'],
                'Poisson Frais' => ['poisson'],
                'Épicerie et Produits Laitiers' => ['épicerie', 'lait', 'laitier', 'fromage', 'yaourt'],
                'Viandes' => ['viande', 'boeuf', 'bœuf', 'agneau', 'veau']
            ];
            
            // Function to find category cost
            function findCategoryCostYearly($categoryCosts, $categoryName, $keywords) {
                $total = 0;
                foreach ($categoryCosts as $category) {
                    $catName = strtolower($category['name']);
                    foreach ($keywords as $keyword) {
                        if (str_contains($catName, $keyword) || 
                            str_contains(strtolower($categoryName), $catName)) {
                            $total += $category['total_cost'];
                            break;
                        }
                    }
                }
                return $total;
            }
            
            // Initialize year totals for categories
            $yearCategoryCosts = [];
            foreach ($categoryMappings as $displayName => $keywords) {
                $yearCategoryCosts[$displayName] = 0;
            }
        @endphp
        
        <!-- Yearly Summary Table -->
        <table>
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
            <tbody>
                @foreach($data['months_data'] as $monthData)
                    @php
                        // Calculate category costs for the entire month
                        $monthCosts = [];
                        foreach ($categoryMappings as $displayName => $keywords) {
                            $monthCosts[$displayName] = 0;
                        }
                        
                        // Aggregate all category costs from all days in the month
                        foreach ($monthData['data']['days_data'] as $day) {
                            foreach ($day['category_costs'] as $category) {
                                foreach ($categoryMappings as $displayName => $keywords) {
                                    if (findCategoryCostYearly([$category], $displayName, $keywords) > 0) {
                                        $monthCosts[$displayName] += $category['total_cost'];
                                        $yearCategoryCosts[$displayName] += $category['total_cost'];
                                    }
                                }
                            }
                        }
                        
                        // Get month totals
                        $monthTotals = $monthData['data']['month_totals'];
                    @endphp
                    
                    <tr>
                        <td>{{ $monthData['month'] }}</td>
                        <td>{{ $monthTotals['prix_moyen'] > 0 ? number_format($monthTotals['prix_moyen'], 2) : '-' }}</td>
                        <td>{{ $monthCosts['Légumes et Fruits'] > 0 ? number_format($monthCosts['Légumes et Fruits'], 2) : '-' }}</td>
                        <td>{{ $monthCosts['Volailles et Œufs'] > 0 ? number_format($monthCosts['Volailles et Œufs'], 2) : '-' }}</td>
                        <td>{{ $monthCosts['Poisson Frais'] > 0 ? number_format($monthCosts['Poisson Frais'], 2) : '-' }}</td>
                        <td>{{ $monthCosts['Épicerie et Produits Laitiers'] > 0 ? number_format($monthCosts['Épicerie et Produits Laitiers'], 2) : '-' }}</td>
                        <td>{{ $monthCosts['Viandes'] > 0 ? number_format($monthCosts['Viandes'], 2) : '-' }}</td>
                        <td>{{ $monthTotals['total_cost'] > 0 ? number_format($monthTotals['total_cost'], 2) : '-' }}</td>
                        <td>{{ $monthTotals['total_people'] }}</td>
                    </tr>
                @endforeach
                
                <!-- Year Total Row -->
                <tr class="total-row">
                    <td>TOTAL ANNUEL</td>
                    <td>{{ $data['year_totals']['prix_moyen'] > 0 ? number_format($data['year_totals']['prix_moyen'], 2) : '-' }}</td>
                    <td>{{ $yearCategoryCosts['Légumes et Fruits'] > 0 ? number_format($yearCategoryCosts['Légumes et Fruits'], 2) : '-' }}</td>
                    <td>{{ $yearCategoryCosts['Volailles et Œufs'] > 0 ? number_format($yearCategoryCosts['Volailles et Œufs'], 2) : '-' }}</td>
                    <td>{{ $yearCategoryCosts['Poisson Frais'] > 0 ? number_format($yearCategoryCosts['Poisson Frais'], 2) : '-' }}</td>
                    <td>{{ $yearCategoryCosts['Épicerie et Produits Laitiers'] > 0 ? number_format($yearCategoryCosts['Épicerie et Produits Laitiers'], 2) : '-' }}</td>
                    <td>{{ $yearCategoryCosts['Viandes'] > 0 ? number_format($yearCategoryCosts['Viandes'], 2) : '-' }}</td>
                    <td>{{ $data['year_totals']['total_cost'] > 0 ? number_format($data['year_totals']['total_cost'], 2) : '-' }}</td>
                    <td>{{ $data['year_totals']['total_people'] }}</td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <!-- Footer with logo -->
    <div class="footer">
        <img src="data:image/png;base64,{{ $imageData_bottom }}" alt="Footer">
    </div>
</body>
</html>