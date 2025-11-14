<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Modify the enum to add 'Visa Directeur', 'Visa Économe', 'Visa Chargé'
        DB::statement("ALTER TABLE ventes MODIFY COLUMN status ENUM('Création', 'Visa Directeur', 'Visa Économe', 'Visa Chargé', 'Validation', 'Refus', 'Livraison', 'Réception', 'Visé', 'Annuler') DEFAULT 'Création'");
        
        // Add motif_refus column if it doesn't exist
        if (!Schema::hasColumn('ventes', 'motif_refus')) {
            Schema::table('ventes', function (Blueprint $table) {
                $table->text('motif_refus')->nullable()->after('status');
            });
        }
        
        // Add numero_serie column if it doesn't exist
        if (!Schema::hasColumn('ventes', 'numero_serie')) {
            Schema::table('ventes', function (Blueprint $table) {
                $table->unsignedInteger('numero_serie')->nullable()->after('id');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Revert back to original enum
        DB::statement("ALTER TABLE ventes MODIFY COLUMN status ENUM('Création', 'Validation', 'Refus', 'Livraison', 'Réception', 'Visé', 'Annuler') DEFAULT 'Création'");
        
        Schema::table('ventes', function (Blueprint $table) {
            $table->dropColumn(['motif_refus', 'numero_serie']);
        });
    }
};