<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable;
use OwenIt\Auditing\Auditable as AuditableTrait;
use Illuminate\Support\Facades\DB;

class Vente extends Model implements Auditable
{
    use HasFactory;
    use SoftDeletes;
    use AuditableTrait;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ventes';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'numero_serie',  // ✅ Added
        'total',
        'status',
        'motif_refus',
        'type_commande', 
        'type_menu',
        'id_client',
        'id_formateur', 
        'id_user',
        'is_transfer',
        'eleves',
        'personnel',
        'invites',
        'divers',
        'date_usage',
        'entree',
        'plat_principal',
        'accompagnement',
        'dessert',
    ];

    /**
     * Attributes to exclude from the Audit.
     *
     * @var array
     */
    protected $auditExclude = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'numero_serie' => 'integer',  // ✅ Added
        'total' => 'decimal:2',
        'eleves' => 'integer',
        'personnel' => 'integer',
        'invites' => 'integer',
        'divers' => 'integer',
        'date_usage' => 'date',
    ];

    /**
     * ✅ NEW: Boot method to auto-generate numero_serie before creating
     */
    protected static function boot()
    {
        parent::boot();

        // Before creating a new Vente, auto-generate numero_serie
        static::creating(function ($vente) {
            if (is_null($vente->numero_serie)) {
                $vente->numero_serie = static::getNextNumeroSerie($vente->type_commande);
            }
        });
    }

    /**
     * ✅ NEW: Get next numero_serie for the given command type
     * Uses SELECT IFNULL(MAX(numero_serie), 0) + 1 approach
     * 
     * @param string $typeCommande
     * @return int
     */
    public static function getNextNumeroSerie($typeCommande)
    {
        // Use raw SQL for better control and to include soft-deleted records
        $maxNumero = DB::table('ventes')
            ->where('type_commande', $typeCommande)
            ->max('numero_serie');
        
        // Return next number (start at 1 if no records exist)
        return ($maxNumero ?? 0) + 1;
    }

    /**
     * ✅ NEW: Get formatted command number (e.g., "A-1/Alimentaire/2025")
     * This is an accessor that can be used as: $vente->formatted_command_number
     * 
     * @return string
     */
    public function getFormattedCommandNumberAttribute()
    {
        $year = $this->created_at ? $this->created_at->format('Y') : date('Y');
        $prefix = ($this->type_commande === 'Alimentaire') ? 'A' : 'NA';
        
        return "{$prefix}-{$this->numero_serie}/{$this->type_commande}/{$year}";
    }

    /**
     * Set attribute and convert empty strings to null for menu fields
     */
    public function setAttribute($key, $value)
    {
        $menuFields = ['entree', 'plat_principal', 'accompagnement', 'dessert'];
        
        if (in_array($key, $menuFields) && empty($value)) {
            $value = null;
        }
        
        return parent::setAttribute($key, $value);
    }

    /**
     * Get the client associated with the vente.
     */
    public function client()
    {
        return $this->belongsTo(Client::class, 'id_client');
    }

    /**
     * Get the formateur associated with the vente.
     */
    public function formateur()
    {
        return $this->belongsTo(User::class, 'id_formateur');
    }

    /**
     * Get the user who created the vente.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    /**
     * Get the ligne_ventes for the vente.
     */
    public function ligneVentes()
    {
        return $this->hasMany(LigneVente::class, 'idvente');
    }
}