@php
    header('Content-Type: text/html; charset=UTF-8');
    
    // Determine designation based on nature
    if ($perte->nature === 'stock' && $productDetails) {
        $designation = $productDetails->name;
    } elseif ($perte->nature === 'produit fini' && $platDetails) {
        $designation = $platDetails->name;
    } else {
        $designation = $perte->designation ?? 'Non spécifié';
    }
    
    // Get current date for footer
    $currentDate = date('d/m/Y');
    $currentDateTime = date('d/m/Y H:i:s');
@endphp
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Fiche de Déclaration de Perte</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            font-family: DejaVu Sans !important;
        }
       
        @page {
            size: a4;
            margin: 0;
            padding: 0;
        }
        
        .invoice-container {
            position: relative;
            border: none;
            padding: 20px;
            background-color: #ffffff; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        }
        
        .container {
            display: flex;
            width: 98%;
            margin: 20px;
            box-sizing: border-box;
        }
        
        #tableDetail {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }
        
        #tableDetail th,
        #tableDetail td {
            border: 1px solid;
            padding: 8px;
            text-align: left;
            font-size: 10px;
        }
        
        #tableDetail th {
            background-color: #f2f2f2;
            font-weight: bold;
            font-size: 11px;
        }
        
        .invoice-footer {
            text-transform: uppercase;
            white-space: nowrap;
            margin-top: 5px;
            bottom: 12px;
            position: absolute;
        }
        
        .title-centered {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin: 10px 0;
            color: #2c5aa0;
        }
        
        .perte-info {
            margin: 5px 20px;
            font-size: 11px;
        }
        
        .perte-info div {
            margin: 2px 0;
        }
        
        .highlight-yellow {
            background-color: yellow;
            padding: 2px 4px;
        }
    </style>
</head>
<body>
   @php
    // Determine designation based on nature
    if ($perte->nature === 'stock' && $productDetails) {
        $designation = $productDetails->name;
    } elseif ($perte->nature === 'produit fini' && $platDetails) {
        $designation = $platDetails->name;
    } else {
        $designation = $perte->designation ?? 'Non spécifié';
    }
    
    // Get current date for footer
    $currentDate = date('d/m/Y');
    $currentDateTime = date('d/m/Y H:i:s');
    
    // ✅ $showNInv is now passed from the controller - no need to redefine it here
@endphp

    <div class="invoice-container">
        {{-- TOP IMAGE --}}
        <img src="data:image/png;base64,{{ $imageData }}" alt="" width="750px">
       
        <div class="container">
            <div style="display: flex;justify-content: center;text-align: center;width: 100%;">
                <h3 class="title-centered">FICHE DE DÉCLARATION DE PERTE DE STOCK</h3>
            </div>
        </div>
        
        {{-- PERTE INFO --}}
        <div class="perte-info">
            <div><strong>Réf :</strong> {{ $perte->reference }} 
                @if($perte->nature === 'produit fini')
                    <span class="highlight-yellow">(Pour alimentaire produit fini)</span>
                @elseif($perte->classe === 'Alimentaire')
                    <span class="highlight-yellow">(Pour alimentaire matière première)</span>
                @endif
            </div>
            @if($perte->nature === 'produit fini' && $platDetails)
                <div><strong>Nom du plat :</strong> {{ $platDetails->name }} ({{ $perte->nombre_plats }} plat(s))</div>
            @endif
            <div><strong>Date de perte :</strong> {{ $perte->date_perte ? \Carbon\Carbon::parse($perte->date_perte)->format('d/m/Y') : 'Non spécifié' }}</div>
            <div><strong>Date de saisie :</strong> {{ \Carbon\Carbon::parse($perte->created_at)->format('d/m/Y H:i:s') }}</div>
        </div>
        
        <div>
            <div class="container">
                {{-- PERTE DETAILS TABLE --}}
                <table id="tableDetail" style="margin-top: 10px">
                    <thead>
                        <tr>
                            <th style="text-align: center">Designation</th>
                            @if($showNInv)
                                <th style="text-align: center">N° Inv</th>
                            @endif
                            <th style="text-align: center">Qté Av perte</th>
                            <th style="text-align: center">Qté perdue</th>
                            <th style="text-align: center">Unité</th>
                            <th style="text-align: center">Valeur unitaire (DH)</th>
                            <th style="text-align: center">Valeur totale (DH)</th>
                            <th style="text-align: center">Qté en stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if($perte->nature === 'stock')
                            {{-- STOCK LOSS - Single Row --}}
                            <tr>
                                <td style="text-align: center">{{ $designation }}</td>
                                @if($showNInv)
                                    <td style="text-align: center">{{ $perte->n_inv ?? '-' }}</td>
                                @endif
                                <td style="text-align: center">{{ number_format($qte_avant_perte ?? 0, 2, '.', '') }}</td>
                                <td style="text-align: center">{{ number_format($perte->quantite ?? 0, 2, '.', '') }}</td>
                                <td style="text-align: center">{{ $productDetails->unite_name ?? '-' }}</td>
                                <td style="text-align: center">{{ number_format($productDetails->price_achat ?? 0, 2, '.', '') }}</td>
                                <td style="text-align: center">{{ number_format($perte->cout_total ?? 0, 2, '.', '') }}</td>
                                <td style="text-align: center">
                                    @if($perte->status === 'Visa Magasinier')
                                        {{ number_format($qte_apres_perte ?? 0, 2, '.', '') }}
                                    @else
                                        -
                                    @endif
                                </td>
                            </tr>
                            
                            {{-- Empty rows --}}
                            @for ($i = 0; $i < 2; $i++)
                                <tr>
                                    <td style="text-align: center">&nbsp;</td>
                                    @if($showNInv)
                                        <td style="text-align: center">&nbsp;</td>
                                    @endif
                                    <td style="text-align: center">&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                </tr>
                            @endfor
                            
                        @elseif($perte->nature === 'produit fini')
                            {{-- PRODUIT FINI - Show each product in composition --}}
                            @if($compositionDetails && count($compositionDetails) > 0)
                                @foreach($compositionDetails as $item)
                                    <tr>
                                        <td style="text-align: center">{{ $item->name }}</td>
                                        <td style="text-align: center">{{ number_format($item->qte_avant_perte, 2, '.', '') }}</td>
                                        <td style="text-align: center">{{ number_format($item->qte * $perte->nombre_plats, 2, '.', '') }}</td>
                                        <td style="text-align: center">{{ $item->unite_name ?? '-' }}</td>
                                        <td style="text-align: center">{{ number_format($item->price_achat ?? 0, 2, '.', '') }}</td>
                                        <td style="text-align: center">{{ number_format($item->cout_unitaire * $perte->nombre_plats, 2, '.', '') }}</td>
                                        <td style="text-align: center">
                                            @if($perte->status === 'Visa Magasinier')
                                                {{ number_format($item->qte_apres_perte, 2, '.', '') }}
                                            @else
                                                -
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                                
                                {{-- Add empty rows if needed to reach 3 rows minimum --}}
                                @for ($i = count($compositionDetails); $i < 3; $i++)
                                    <tr>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                    </tr>
                                @endfor
                            @else
                                {{-- No composition found --}}
                                <tr>
                                    <td colspan="7" style="text-align: center">Aucune composition disponible</td>
                                </tr>
                                @for ($i = 0; $i < 2; $i++)
                                    <tr>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                        <td style="text-align: center">&nbsp;</td>
                                    </tr>
                                @endfor
                            @endif
                        @endif
                    </tbody>
                </table>

                {{-- CAUSE AND CIRCUMSTANCES --}}
                <div style="margin-top: 15px; font-size: 11px;">
                    <div><strong>Cause de la perte :</strong> {{ $perte->cause ?? 'Non spécifié' }}</div>
                    <div style="margin-top: 5px;"><strong>Circonstances de la perte :</strong> {{ $perte->circonstances ?? 'Non spécifié' }}</div>
                </div>

                {{-- SIGNATURE TABLE --}}
                <table id="tableDetail" style="margin-top: 30px; width: 100%; border-collapse: collapse;">
                    <thead>
                        <tr>
                            <th style="text-align: center; padding: 10px;">Constateur de la perte</th>
                            
                            @if($perte->classe === 'Alimentaire' || $perte->nature === 'produit fini')
                                <th style="text-align: center; padding: 10px;">Visa DDE</th>
                            @else
                                <th style="text-align: center; padding: 10px;">Visa Chargé d'inventaire</th>
                            @endif
                            
                            <th style="text-align: center; padding: 10px;">Visa Économe</th>
                            <th style="text-align: center; padding: 10px;">Validation Directrice</th>
                            <th style="text-align: center; padding: 10px;">Visa Magasinier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            @php
                                $creation = $getHistorique_sig->firstWhere('status', 'Création');
                                $enAttente = $getHistorique_sig->firstWhere('status', 'En attente');
                                $visaDirecteur = $getHistorique_sig->firstWhere('status', 'Visa Directeur');
                                $visaCharge = $getHistorique_sig->firstWhere('status', 'Visa Chargé');
                                $visaEconome = $getHistorique_sig->firstWhere('status', 'Visa Économe');
                                $validation = $getHistorique_sig->firstWhere('status', 'Validé');
                                $visaMagasinier = $getHistorique_sig->firstWhere('status', 'Visa Magasinier');
                                
                                // Use creation or en attente for constateur
                                $constateur = $creation ?? $enAttente;
                            @endphp
                            
                            {{-- Constateur (Creation/En attente) --}}
                            <td style="text-align: center; height: 100px; vertical-align: top; padding: 10px;">
                                @if($constateur)
                                    <img src="data:image/png;base64,{{ $constateur->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                    <br>{{ $constateur->name }}
                                    <br>{{ \Carbon\Carbon::parse($constateur->created_at)->format('Y-m-d H:i:s') }}
                                @endif
                            </td>
                            
                            {{-- Visa DDE (Alimentaire/Produit Fini) OR Visa Chargé (Non Alimentaire) --}}
                            <td style="text-align: center; height: 100px; vertical-align: top; padding: 10px;">
                                @if($perte->classe === 'Alimentaire' || $perte->nature === 'produit fini')
                                    @if($visaDirecteur)
                                        <img src="data:image/png;base64,{{ $visaDirecteur->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                        <br>{{ $visaDirecteur->name }}
                                        <br>{{ \Carbon\Carbon::parse($visaDirecteur->created_at)->format('Y-m-d H:i:s') }}
                                    @endif
                                @else
                                    @if($visaCharge)
                                        <img src="data:image/png;base64,{{ $visaCharge->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                        <br>{{ $visaCharge->name }}
                                        <br>{{ \Carbon\Carbon::parse($visaCharge->created_at)->format('Y-m-d H:i:s') }}
                                    @endif
                                @endif
                            </td>
                            
                            {{-- Visa Économe --}}
                            <td style="text-align: center; height: 100px; vertical-align: top; padding: 10px;">
                                @if($visaEconome)
                                    <img src="data:image/png;base64,{{ $visaEconome->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                    <br>{{ $visaEconome->name }}
                                    <br>{{ \Carbon\Carbon::parse($visaEconome->created_at)->format('Y-m-d H:i:s') }}
                                @endif
                            </td>
                            
                            {{-- Validation Directrice --}}
                            <td style="text-align: center; height: 100px; vertical-align: top; padding: 10px;">
                                @if($validation)
                                    <img src="data:image/png;base64,{{ $validation->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                    <br>{{ $validation->name }}
                                    <br>{{ \Carbon\Carbon::parse($validation->created_at)->format('Y-m-d H:i:s') }}
                                @endif
                            </td>
                            
                            {{-- Visa Magasinier --}}
                            <td style="text-align: center; height: 100px; vertical-align: top; padding: 10px;">
                                @if($visaMagasinier)
                                    <img src="data:image/png;base64,{{ $visaMagasinier->signature }}" alt="" style="max-height: 50px; max-width: 100px;">
                                    <br>{{ $visaMagasinier->name }}
                                    <br>{{ \Carbon\Carbon::parse($visaMagasinier->created_at)->format('Y-m-d H:i:s') }}
                                @endif
                            </td>
                        </tr>
                    </tbody>
                </table>

                {{-- Footer note --}}
                <div style="margin-top: 10px; font-size: 10px; color: red;">
                    Édité le {{ $currentDate }} - Éditeur : {{ auth()->user()->prenom }} {{ auth()->user()->nom }} - Gestock Touarga
                </div>
            </div>
        </div>
        
        {{-- BOTTOM IMAGE/FOOTER --}}
        <footer>
            <div class="invoice-footer">
                <img src="data:image/png;base64,{{ $imageData_bottom }}" alt="" width="750px">
            </div>
        </footer>
    </div>
</body>
</html>