<?php

namespace App\Http\Controllers;

use App\Models\Plat;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PlatsController extends Controller

{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $dataPlat = DB::table('plats as p')
                ->join('users as us', 'us.id', '=', 'p.iduser')
                ->whereNull('p.deleted_at')
                ->select(
                    'p.id',
                    'p.name',
                    'p.type',
                    DB::raw("CONCAT(us.prenom, ' ', us.nom) as username"),
                    'p.created_at'
                )
                ->orderBy('p.id', 'desc');
    
            return DataTables::of($dataPlat)
                ->addIndexColumn()
                ->filterColumn('username', function($query, $keyword) {
                    $query->whereRaw("LOWER(CONCAT(us.prenom, ' ', us.nom)) LIKE ?", ["%".strtolower($keyword)."%"]);
                })
                ->addColumn('action', function ($row) {
                    $btn = '';
    
                    if (auth()->user()->can('Plats-modifier')) {
                        $btn .= '<a href="#" class="btn btn-sm bg-primary-subtle me-1 editPlat"
                                    data-id="' . $row->id . '">
                                    <i class="fa-solid fa-pen-to-square text-primary"></i>
                                </a>';
                    }
    
                    if (auth()->user()->can('Plats-supprimer')) {
                        $btn .= '<a href="#" class="btn btn-sm bg-danger-subtle deletePlat"
                                    data-id="' . $row->id . '" data-bs-toggle="tooltip" 
                                    title="Supprimer Plat">
                                    <i class="fa-solid fa-trash text-danger"></i>
                                </a>';
                    }
    
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
             
        return view('plats.index');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!auth()->user()->can('Plats-ajoute')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission d\'ajouter des plats'
            ], 403);
        }
    
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'type' => 'required|in:Entrée,Plat Principal,Dessert',
        ], [
            'required' => 'Le champ :attribute est requis.',
            'in' => 'Le type doit être: Entrée, Plat Principal ou Dessert.',
        ], [
            'name' => 'nom',
            'type' => 'type',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->messages(),
            ], 400);
        }
    
        $cleanedName = strtolower(trim($request->name));
        $exists = Plat::whereRaw('LOWER(TRIM(name)) = ?', [$cleanedName])->count();
            
        if ($exists > 0) {
            return response()->json([
                'status' => 422,
                'message' => 'Ce plat existe déjà',
            ], 422);
        }
    
        $plat = Plat::create([
            'name' => trim($request->name),
            'type' => $request->type,
            'iduser' => Auth::user()->id,
        ]);
    
        if($plat) {
            return response()->json([
                'status' => 200,
                'message' => 'Plat créé avec succès',
            ]);
        } else { 
            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue. Veuillez réessayer.'
            ]);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        if (!auth()->user()->can('Plats-modifier')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de modifier des plats'
            ], 403);
        }

        $plat = Plat::find($id);
        
        if (!$plat) {
            return response()->json([
                'status' => 404,
                'message' => 'Plat non trouvé'
            ], 404);
        }
        
        return response()->json($plat);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        if (!auth()->user()->can('Plats-modifier')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de modifier des plats'
            ], 403);
        }
    
        $plat = Plat::find($request->id);
        
        if (!$plat) {
            return response()->json([
                'status' => 404,
                'message' => 'Plat non trouvé'
            ], 404);
        }
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'type' => 'required|in:Entrée,Plat Principal,Dessert',
        ], [
            'required' => 'Le champ :attribute est requis.',
            'in' => 'Le type doit être: Entrée, Plat Principal ou Dessert.',
        ], [
            'name' => 'nom',
            'type' => 'type',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->messages(),
            ], 400);
        }
        
        $cleanedName = strtolower(trim($request->name));
        $exists = Plat::whereRaw('LOWER(TRIM(name)) = ?', [$cleanedName])
            ->where('id', '!=', $request->id)
            ->count();
            
        if ($exists > 0) {
            return response()->json([
                'status' => 422,
                'message' => 'Ce plat existe déjà',
            ], 422);
        }
    
        $plat->name = trim($request->name);
        $plat->type = $request->type;
        $saved = $plat->save();
        
        if ($saved) {
            return response()->json([
                'status' => 200,
                'message' => 'Plat mis à jour avec succès',
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'message' => 'Erreur lors de la mise à jour du plat',
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        if (!auth()->user()->can('Plats-supprimer')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission de supprimer des plats'
            ], 403);
        }

        $plat = Plat::find($request->id);

        if (!$plat) {
            return response()->json([
                'status' => 404,
                'message' => 'Plat non trouvé'
            ], 404);
        }

        if ($plat->delete()) {
            return response()->json([
                'status' => 200,
                'message' => 'Plat supprimé avec succès'
            ]);
        }

        return response()->json([
            'status' => 500,
            'message' => 'Une erreur est survenue lors de la suppression'
        ], 500);
    }
    
    /**
     * Import Plats from Excel file.
     */
    public function import(Request $request)
    {
        if (!auth()->user()->can('Plats-ajoute')) {
            return response()->json([
                'status' => 403,
                'message' => 'Vous n\'avez pas la permission d\'importer des plats'
            ], 403);
        }

        $validator = Validator::make($request->all(), [
            'file' => 'required|mimes:xlsx,xls,csv|max:2048',
        ], [
            'required' => 'Le fichier est requis.',
            'mimes' => 'Le fichier doit être de type: xlsx, xls ou csv.',
            'max' => 'La taille du fichier ne doit pas dépasser 2MB.',
        ]);
        
        if ($validator->fails()) {
            return response()->json([
                'status' => 400,
                'errors' => $validator->messages(),
            ], 400);
        }

        try {
            $file = $request->file('file');
            $data = [];
            $imported = 0;
            $skipped = 0;
            $duplicates = [];
            $debug = [];

            if ($file->getClientOriginalExtension() == 'csv') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
            } else {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
            }
            
            $spreadsheet = $reader->load($file->getPathname());
            $worksheet = $spreadsheet->getActiveSheet();
            $rows = $worksheet->toArray();
            
            $debug['total_rows'] = count($rows);
            $debug['first_rows'] = array_slice($rows, 0, 5);
            
            if (count($rows) < 1) {
                return response()->json([
                    'status' => 400,
                    'message' => 'Le fichier est vide',
                ], 400);
            }

            $headers = $rows[0];
            $debug['headers'] = $headers;
            
            $headersLower = array_map('strtolower', $headers);
            $debug['headers_lower'] = $headersLower;
            
            $nomIndex = array_search('nom', $headersLower);
            $typeIndex = array_search('type', $headersLower);
            
            if ($nomIndex === false && isset($headers[0])) {
                $nomIndex = 0;
            }
            
            if ($typeIndex === false && isset($headers[1])) {
                $typeIndex = 1;
            }
            
            if ($nomIndex === false) {
                if (count($headers) >= 1) {
                    $nomIndex = 0;
                } else {
                    return response()->json([
                        'status' => 400,
                        'message' => 'Le fichier doit contenir au moins une colonne pour les noms',
                        'debug' => $debug
                    ], 400);
                }
            }
            
            if ($typeIndex === false && count($headers) >= 2) {
                $typeIndex = 1;
            }
            
            $debug['nom_index'] = $nomIndex;
            $debug['type_index'] = $typeIndex;
            
            array_shift($rows);
            
            $validTypes = ['Entrée', 'Plat Principal', 'Dessert'];
            
            foreach ($rows as $index => $row) {
                $rowNum = $index + 2;
                
                if (!isset($row[$nomIndex])) {
                    $skipped++;
                    continue;
                }
                
                $name = trim($row[$nomIndex]);
                
                if (empty($name)) {
                    $skipped++;
                    continue;
                }
                
                $type = null;
                if ($typeIndex !== false && isset($row[$typeIndex])) {
                    $type = trim($row[$typeIndex]);
                    
                    // Validate type
                    if (!in_array($type, $validTypes)) {
                        $duplicates[] = $name . ' (type invalide: ' . $type . ')';
                        $skipped++;
                        continue;
                    }
                } else {
                    $duplicates[] = $name . ' (type manquant)';
                    $skipped++;
                    continue;
                }
                
                $cleanedName = strtolower($name);
                
                $isDuplicate = false;
                foreach ($data as $item) {
                    if (strtolower($item['name']) === $cleanedName) {
                        $duplicates[] = $name;
                        $isDuplicate = true;
                        break;
                    }
                }
                
                if ($isDuplicate) {
                    $skipped++;
                    continue;
                }
                
                $nameExists = Plat::whereRaw('LOWER(TRIM(name)) = ?', [strtolower($name)])->exists();
                
                if ($nameExists) {
                    $duplicates[] = $name . ' (existe déjà)';
                    $skipped++;
                    continue;
                }
                
                $data[] = [
                    'name' => $name,
                    'type' => $type
                ];
            }
            
            foreach ($data as $item) {
                Plat::create([
                    'name' => $item['name'],
                    'type' => $item['type'],
                    'iduser' => Auth::user()->id
                ]);
                $imported++;
            }
            
            return response()->json([
                'status' => 200,
                'message' => $imported . ' plats ont été importés avec succès. ' . 
                            ($skipped > 0 ? $skipped . ' ont été ignorés (doublons, vides ou types invalides).' : ''),
                'imported' => $imported,
                'skipped' => $skipped,
                'duplicates' => $duplicates,
                'debug' => $debug
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => 'Une erreur est survenue lors de l\'importation: ' . $e->getMessage(),
                'line' => $e->getLine(),
                'file' => $e->getFile()
            ], 500);
        }
    }
    
    /**
     * Get plats by type
     */
    public function getPlatsByType(Request $request)
    {
        $type = $request->type;
        $plats = DB::select('select * from plats where type = ?', [$type]);
       
        return response()->json([
            'status'  => 200,
            'data'    => $plats,
        ]);
    }
    /**
 * Get column information by index
 */
private function getColumnByIndex($index)
{
    $columns = [
        0 => ['field' => 'name', 'title' => 'Nom', 'data' => 'name'],
        1 => ['field' => 'type', 'title' => 'Type', 'data' => 'type'],
        2 => ['field' => 'username', 'title' => 'Créé par', 'data' => 'username'],
        3 => ['field' => 'created_at', 'title' => 'Créé le', 'data' => 'created_at'],
    ];
    
    return $columns[$index] ?? null;
}

/**
 * Export plats to Excel with selected columns
 */
public function exportExcel(Request $request)
{
    // if (!auth()->user()->can('Plats-exporter')) {
    //     return response()->json([
    //         'status' => 403,
    //         'message' => 'Vous n\'avez pas la permission d\'exporter des plats'
    //     ], 403);
    // }

    // Parse columns from request
    $selectedColumnIndices = [];
    if ($request->has('columns')) {
        $selectedColumnIndices = explode(',', $request->input('columns'));
    } else {
        // Default to all columns if none specified
        $selectedColumnIndices = range(0, 3);
    }
    
    // Get column information for selected columns
    $selectedColumns = [];
    $columnTitles = [];
    $columnData = [];
    
    foreach ($selectedColumnIndices as $index) {
        $column = $this->getColumnByIndex(intval($index));
        if ($column) {
            $selectedColumns[] = $column['field'];
            $columnTitles[] = $column['title'];
            $columnData[] = $column['data'];
        }
    }
    
    // Get all plats data with selected columns
    $platsData = DB::table('plats as p')
        ->join('users as us', 'us.id', '=', 'p.iduser')
        ->whereNull('p.deleted_at')
        ->select(
            'p.id',
            'p.name',
            'p.type',
            DB::raw("CONCAT(us.prenom, ' ', us.nom) as username"),
            'p.created_at'
        )
        ->orderBy('p.id', 'desc')
        ->get();
    
    // Create new Spreadsheet object
    $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    
    // Set header row with selected columns
    $colIndex = 'A';
    foreach ($columnTitles as $title) {
        $sheet->setCellValue($colIndex . '1', $title);
        $colIndex++;
    }
    
    // Style header row
    $headerStyle = [
        'font' => [
            'bold' => true,
        ],
        'alignment' => [
            'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
        ],
        'fill' => [
            'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
            'startColor' => [
                'rgb' => 'EEEEEE',
            ],
        ],
    ];
    
    $sheet->getStyle('A1:' . chr(64 + count($columnTitles)) . '1')->applyFromArray($headerStyle);
    
    // Add data rows
    $row = 2;
    foreach ($platsData as $plat) {
        $colIndex = 'A';
        
        foreach ($columnData as $field) {
            $value = '';
            
            if ($field === 'created_at') {
                $value = $plat->created_at ? date('d/m/Y H:i', strtotime($plat->created_at)) : '';
            } else {
                $value = $plat->{$field} ?? '';
            }
            
            $sheet->setCellValue($colIndex . $row, $value);
            $colIndex++;
        }
        
        // Center align all data cells
        $sheet->getStyle('A' . $row . ':' . chr(64 + count($columnTitles)) . $row)
            ->getAlignment()
            ->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        
        $row++;
    }
    
    // Auto size columns
    foreach (range('A', chr(64 + count($columnTitles))) as $column) {
        $sheet->getColumnDimension($column)->setAutoSize(true);
    }
    
    // Create writer
    $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
    
    // Set headers for download
    $fileName = 'Plats - ' . date('d-m-Y') . '.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename="' . $fileName . '"');
    header('Cache-Control: max-age=0');
    
    // Save file to output
    $writer->save('php://output');
    exit;
}

/**
 * Export plats to PDF with selected columns
 */
public function exportPdf(Request $request)
{
    // if (!auth()->user()->can('Plats-exporter')) {
    //     return response()->json([
    //         'status' => 403,
    //         'message' => 'Vous n\'avez pas la permission d\'exporter des plats'
    //     ], 403);
    // }

    // Parse columns from request
    $selectedColumnIndices = [];
    if ($request->has('columns')) {
        $selectedColumnIndices = explode(',', $request->input('columns'));
    } else {
        // Default to all columns if none specified
        $selectedColumnIndices = range(0, 3);
    }
    
    // Get column information for selected columns
    $selectedColumns = [];
    $columnTitles = [];
    $columnData = [];
    
    foreach ($selectedColumnIndices as $index) {
        $column = $this->getColumnByIndex(intval($index));
        if ($column) {
            $selectedColumns[] = $column['field'];
            $columnTitles[] = $column['title'];
            $columnData[] = $column['data'];
        }
    }
    
    // Get all plats data
    $platsData = DB::table('plats as p')
        ->join('users as us', 'us.id', '=', 'p.iduser')
        ->whereNull('p.deleted_at')
        ->select(
            'p.id',
            'p.name',
            'p.type',
            DB::raw("CONCAT(us.prenom, ' ', us.nom) as username"),
            'p.created_at'
        )
        ->orderBy('p.id', 'desc')
        ->get();
    
    // Transform data for view with selected columns
    $plats = [];
    foreach ($platsData as $plat) {
        $platItem = [];
        
        // Add only selected fields
        foreach ($columnData as $field) {
            if ($field === 'created_at') {
                $platItem[$field] = $plat->created_at ? date('d/m/Y H:i', strtotime($plat->created_at)) : '';
            } else {
                $platItem[$field] = $plat->{$field} ?? '';
            }
        }
        
        $plats[] = $platItem;
    }
    
    // Generate PDF
    $pdf = \PDF::loadView('plats.pdf_export', [
        'plats' => $plats,
        'columns' => $columnTitles,
        'columnData' => $columnData,
        'date' => date('d/m/Y')
    ]);
    
    // Make PDF landscape and A4
    $pdf->setPaper('a4', 'landscape');
    
    // Download PDF
    return $pdf->download('Plats - ' . date('d-m-Y') . '.pdf');
}

}