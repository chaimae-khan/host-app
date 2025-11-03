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
        .month-title {
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 8px;
            font-weight: bold;
            font-size: 14px;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 4px;
            text-align: center;
            font-size: 9px;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .week-header td {
            background-color: #f8f9fa;
            font-weight: bold;
            text-align: center;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .page-break {
            page-break-after: always;
        }
        .month-section {
            page-break-inside: avoid;
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
            function findCategoryCost($categoryCosts, $categoryName, $keywords) {
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
        @endphp
        
        @foreach($data['months_data'] as $monthIndex => $monthData)
            @php
                // Group days by week
                $weeks = [];
                foreach ($monthData['data']['days_data'] as $day) {
                    $dateParts = explode('/', $day['date']);
                    $dayDate = \Carbon\Carbon::createFromDate($dateParts[2], $dateParts[1], $dateParts[0]);
                    
                    // Get week start and end
                    $weekStart = $dayDate->copy()->startOfWeek(\Carbon\Carbon::MONDAY);
                    $weekEnd = $dayDate->copy()->endOfWeek(\Carbon\Carbon::SUNDAY);
                    
                    $weekKey = $weekStart->format('d') . ' au ' . $weekEnd->format('d F Y');
                    
                    if (!isset($weeks[$weekKey])) {
                        $weeks[$weekKey] = [];
                    }
                    
                    $weeks[$weekKey][] = $day;
                }
                
                // Sort weeks chronologically
                ksort($weeks);
            @endphp
            
            <div class="month-section {{ ($monthIndex > 0 && $monthIndex % 2 == 0) ? 'page-break' : '' }}">
                <div class="month-title">{{ $monthData['month'] }}</div>
                
                <!-- Month Table -->
                <table>
                    <thead>
                        <tr>
                            <th>Journée du</th>
                            <th>Coût unitaire</th>
                            <th>Légumes/Fruits</th>
                            <th>Volailles/Œufs</th>
                            <th>Poisson</th>
                            <th>Épicerie/Laitiers</th>
                            <th>Viandes</th>
                            <th>Coût total</th>
                            <th>Effectif</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($weeks as $weekKey => $days)
                            <tr class="week-header">
                                <td colspan="9">Semaine du {{ $weekKey }}</td>
                            </tr>
                            
                            @foreach($days as $day)
                                @php
                                    // Get day name
                                    $dateParts = explode('/', $day['date']);
                                    $dayDate = \Carbon\Carbon::createFromDate($dateParts[2], $dateParts[1], $dateParts[0]);
                                    $dayName = $dayDate->translatedFormat('l');
                                    
                                    // Extract costs
                                    $costs = [];
                                    foreach ($categoryMappings as $displayName => $keywords) {
                                        $costs[$displayName] = 0;
                                        
                                        foreach ($day['category_costs'] as $category) {
                                            if (findCategoryCost([$category], $displayName, $keywords) > 0) {
                                                $costs[$displayName] += $category['total_cost'];
                                            }
                                        }
                                    }
                                @endphp
                                
                                <tr>
                                    <td>{{ $dayName }} {{ $day['date'] }}</td>
                                    <td>{{ $day['prix_moyen'] > 0 ? number_format($day['prix_moyen'], 2) : '-' }}</td>
                                    <td>{{ $costs['Légumes et Fruits'] > 0 ? number_format($costs['Légumes et Fruits'], 2) : '-' }}</td>
                                    <td>{{ $costs['Volailles et Œufs'] > 0 ? number_format($costs['Volailles et Œufs'], 2) : '-' }}</td>
                                    <td>{{ $costs['Poisson Frais'] > 0 ? number_format($costs['Poisson Frais'], 2) : '-' }}</td>
                                    <td>{{ $costs['Épicerie et Produits Laitiers'] > 0 ? number_format($costs['Épicerie et Produits Laitiers'], 2) : '-' }}</td>
                                    <td>{{ $costs['Viandes'] > 0 ? number_format($costs['Viandes'], 2) : '-' }}</td>
                                    <td>{{ $day['total_cost'] > 0 ? number_format($day['total_cost'], 2) : '-' }}</td>
                                    <td>{{ $day['total_people'] }}</td>
                                </tr>
                            @endforeach
                        @endforeach
                    </tbody>
                </table>
            </div>
        @endforeach
    </div>
    
    <!-- Footer with logo -->
    <div class="footer">
        <img src="data:image/png;base64,{{ $imageData_bottom }}" alt="Footer">
    </div>
</body>
</html>