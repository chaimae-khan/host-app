<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Liste des Plats</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .header h1 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }
        
        .header p {
            margin: 5px 0;
            color: #666;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th {
            background-color: #f0f0f0;
            padding: 10px;
            text-align: center;
            font-weight: bold;
            border: 1px solid #ddd;
        }
        
        td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 10px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Liste des Plats</h1>
        <p>Date d'exportation: {{ $date }}</p>
        <p>Total: {{ count($plats) }} plat(s)</p>
    </div>
    
    <table>
        <thead>
            <tr>
                @foreach($columns as $column)
                    <th>{{ $column }}</th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach($plats as $plat)
                <tr>
                    @foreach($columnData as $field)
                        <td>{{ $plat[$field] ?? '' }}</td>
                    @endforeach
                </tr>
            @endforeach
        </tbody>
    </table>
    
    <div class="footer">
        <p>Document généré automatiquement - {{ $date }}</p>
    </div>
</body>
</html>