<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LigneVente extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'ligne_vente';

    protected $fillable = [
        'id_user',
        'idvente',
        'idproduit',
        'qte',
        'newquantet',          
        'price_unitaire',      
        'contete_formateur',
        'contente_transfert',
    ];

    protected $dates = [
        'deleted_at',
    ];

    /**
     * Relationship with Vente
     */
    public function vente()
    {
        return $this->belongsTo(Vente::class, 'idvente');
    }

    /**
     * Relationship with Product
     */
    public function product()
    {
        return $this->belongsTo(Product::class, 'idproduit');
    }

    /**
     * Relationship with User (who created this line)
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    /**
     * Get the total price for this line item
     * ✅ UPDATED: Use price_unitaire if available, otherwise fallback to product price
     */
    public function getTotalAttribute()
    {
        $unitPrice = $this->price_unitaire ?? $this->product->price_achat;
        return $this->qte * $unitPrice;
    }

    /**
     * Scope to get lines for a specific vente
     */
    public function scopeForVente($query, $venteId)
    {
        return $query->where('idvente', $venteId);
    }

    /**
     * Scope to get lines for a specific product
     */
    public function scopeForProduct($query, $productId)
    {
        return $query->where('idproduit', $productId);
    }

    /**
     * ✅ NEW: Get ordered quantity (with fallback to qte if newquantet is null)
     */
    public function getOrderedQuantityAttribute()
    {
        return $this->newquantet ?? $this->qte;
    }

    /**
     * ✅ NEW: Get delivered quantity
     */
    public function getDeliveredQuantityAttribute()
    {
        return $this->qte;
    }

    /**
     * ✅ NEW: Check if quantity has been modified
     */
    public function isQuantityModifiedAttribute()
    {
        return !is_null($this->newquantet) && $this->newquantet != $this->qte;
    }
}