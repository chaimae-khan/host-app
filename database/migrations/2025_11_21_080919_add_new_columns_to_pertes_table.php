<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up()
    {
        // First, add the new columns
        Schema::table('pertes', function (Blueprint $table) {
            $table->text('circonstances')->nullable();
            $table->string('reference')->unique()->nullable();
            $table->integer('numero_serie')->nullable();
            $table->string('n_inv')->nullable();
        });
        
        // Then, modify the status enum
        DB::statement("ALTER TABLE pertes MODIFY COLUMN status ENUM('En attente', 'Visa Directeur', 'Visa Économe', 'Visa Chargé', 'Validé', 'Visa Magasinier', 'Refusé', 'Annuler') DEFAULT 'En attente'");
    }

    public function down()
    {
        // Restore original status enum
        DB::statement("ALTER TABLE pertes MODIFY COLUMN status ENUM('En attente', 'Validé', 'Refusé', 'Annuler') DEFAULT 'En attente'");
        
        // Drop the new columns
        Schema::table('pertes', function (Blueprint $table) {
            $table->dropColumn(['circonstances', 'reference', 'numero_serie', 'n_inv']);
        });
    }
};