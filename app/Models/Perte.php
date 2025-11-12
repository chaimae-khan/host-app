<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Perte extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'pertes';

    protected $fillable = [
        'id_product',
        'id_plat', // NEW
        'id_category',
        'id_subcategorie',
        'id_unite',
        'classe',
        'designation',
        'quantite',
        'nature',
        'produit_fini_type',
        'nombre_plats', // NEW
        'cout_total', // NEW
        'date_perte',
        'cause',
        'status',
        'refusal_reason',
        'id_user',
    ];

    protected $casts = [
        'date_perte' => 'date',
        'quantite' => 'decimal:2',
        'cout_total' => 'decimal:2', // NEW
    ];

    // Relationships
    public function product()
    {
        return $this->belongsTo(Product::class, 'id_product');
    }
    
    // NEW
    public function plat()
    {
        return $this->belongsTo(Plat::class, 'id_plat');
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

    public function getStatusBadgeAttribute()
    {
        $badges = [
            'En attente' => '<span class="badge bg-warning text-dark"><i class="fa-solid fa-clock"></i> En attente</span>',
            'Validé' => '<span class="badge bg-success"><i class="fa-solid fa-check"></i> Validé</span>',
            'Refusé' => '<span class="badge bg-danger"><i class="fa-solid fa-times"></i> Refusé</span>',
        ];

        return $badges[$this->status] ?? $this->status;
    }
}