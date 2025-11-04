<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reporting Mois {{ $month }} - Tous menus</title>
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
            font-size: 12px;
        }
        .header img {
            width: 100%;
            display: block;
        }
        .footer img {
            width: 100%;
            display: block;
        }
        .container {
            padding: 20px;
        }
        .title {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin: 10px 0 20px 0;
        }
        .menu-section {
            page-break-before: always;
        }
        .menu-section:first-child {
            page-break-before: avoid;
        }
        .menu-separator {
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            margin: 15px 0;
            padding: 10px;
            background-color: #e0e0e0;
            border: 2px solid #333;
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
    </style>
</head>
<body>
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
    
    <!-- Loop through each menu type -->
    @foreach($all_menus_data as $menuIndex => $menuData)
        <div class="menu-section">
            <!-- Header -->
            <div class="header">
                <img src="data:image/png;base64,{{ $imageData_top }}" alt="Header">
            </div>
            
            <div class="container">
                <!-- Main Title -->
                <div class="title">{{ $report_title }}</div>
                
                <!-- Menu Type Separator -->
                <div class="menu-separator">
                    @if($menuData['menu_type'] === 'Menu eleves')
                        Menu standard
                    @else
                        {{ $menuData['menu_type'] }}
                    @endif
                </div>
                
                <!-- Table for this menu -->
                <table>
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
                    <tbody>
                        @php
                            // Group days by week for this menu
                            $weeks = [];
                            foreach ($menuData['data']['days_data'] as $day) {
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
                        
                        @foreach($weeks as $weekKey => $days)
                            <tr class="week-header">
                                <td colspan="9">la Semaine du {{ $weekKey }}</td>
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
            
            <!-- Footer -->
            <div class="footer">
                <img src="data:image/png;base64,{{ $imageData_bottom }}" alt="Footer">
            </div>
        </div>
    @endforeach
</body>
</html>