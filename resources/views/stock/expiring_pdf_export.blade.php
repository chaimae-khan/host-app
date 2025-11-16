<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Produits en Expiration Export</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 10px;
            margin: 20px;
        }
        h1 {
            text-align: center;
            font-size: 16px;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 6px 4px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 9px;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            font-size: 8px;
        }
        .expired-row {
            background-color: rgba(0, 0, 0, 0.15);
        }
        .expiring-soon-row {
            background-color: rgba(220, 53, 69, 0.15);
            color: #dc3545;
        }
        .expiring-warning-row {
            background-color: rgba(255, 193, 7, 0.15);
        }
        .badge-dark {
            color: #fff;
            background-color: #343a40;
            padding: 2px 4px;
            border-radius: 3px;
            font-size: 8px;
        }
        .badge-danger {
            color: #fff;
            background-color: #dc3545;
            padding: 2px 4px;
            border-radius: 3px;
            font-size: 8px;
        }
        .badge-warning {
            color: #000;
            background-color: #ffc107;
            padding: 2px 4px;
            border-radius: 3px;
            font-size: 8px;
        }
        .text-left {
            text-align: left;
        }
        .text-right {
            text-align: right;
        }
        
        /* Column-specific styling */
        .col-name {
            max-width: 120px;
            text-align: left;
            word-wrap: break-word;
        }
        .col-code {
            max-width: 80px;
            font-family: monospace;
            font-size: 8px;
        }
        .col-number {
            text-align: center;
        }
        .col-date {
            font-size: 8px;
        }
        
        @page {
            margin: 15mm;
        }
    </style>
</head>
<body>
    <h1>GESTOCK TOUARGA - Produits en Expiration - Date: {{ $date }}</h1>
    
    <table>
        <thead>
            <tr>
                @foreach($columns as $index => $column)
                <th class="
                    @if(in_array($columnData[$index], ['name'])) col-name
                    @elseif(in_array($columnData[$index], ['code_article'])) col-code
                    @elseif(in_array($columnData[$index], ['quantite'])) col-number
                    @elseif(in_array($columnData[$index], ['date_expiration', 'created_at'])) col-date
                    @endif
                ">{{ $column }}</th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach($products as $product)
                <tr @if($product['days_until_expiry'] < 0) class="expired-row"
                    @elseif($product['days_until_expiry'] <= 3) class="expiring-soon-row"
                    @else class="expiring-warning-row"
                    @endif>
                    @foreach($columnData as $index => $field)
                        <td class="
                            @if($field == 'name') col-name text-left
                            @elseif($field == 'code_article') col-code
                            @elseif($field == 'quantite') col-number
                            @elseif(in_array($field, ['date_expiration', 'created_at'])) col-date
                            @else text-center
                            @endif
                        ">
                            @if($field == 'expiry_status')
                                @if($product['days_until_expiry'] < 0)
                                    <span class="badge-dark">{{ $product[$field] ?? '-' }}</span>
                                @elseif($product['days_until_expiry'] <= 3)
                                    <span class="badge-danger">{{ $product[$field] ?? '-' }}</span>
                                @else
                                    <span class="badge-warning">{{ $product[$field] ?? '-' }}</span>
                                @endif
                            @elseif($field == 'photo_display')
                                @if(isset($product[$field]) && $product[$field] == 'Oui')
                                    <span style="color: #28a745;">●</span>
                                @else
                                    <span style="color: #dc3545;">○</span>
                                @endif
                            @else
                                {{ $product[$field] ?? '-' }}
                            @endif
                        </td>
                    @endforeach
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>