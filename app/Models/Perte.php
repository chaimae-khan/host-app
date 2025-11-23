<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable;

class Perte extends Model implements Auditable
{
    use HasFactory, SoftDeletes;
    use \OwenIt\Auditing\Auditable;

    protected $table = 'pertes';

    protected $fillable = [
        'reference',
        'numero_serie',
        'nature',
        'classe',
        'id_category',
        'id_subcategorie',
        'id_product',
        'id_plat',
        'id_unite',
        'designation',
        'quantite',
        'nombre_plats',
        'produit_fini_type',
        'cout_total',
        'date_perte',
        'cause',
        'circonstances',
        'status',
        'refusal_reason',
        'id_user',
        'n_inv'
    ];

    protected $dates = ['deleted_at', 'date_perte'];

    // Relationships
    public function product()
    {
        return $this->belongsTo(Product::class, 'id_product');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'id_category');
    }

    public function subcategory()
    {
        return $this->belongsTo(SubCategory::class, 'id_subcategorie');
    }

    public function unite()
    {
        return $this->belongsTo(Unite::class, 'id_unite');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}