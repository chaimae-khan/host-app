<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('ventes', function (Blueprint $table) {
            // Add numero_serie column after id
            $table->unsignedInteger('numero_serie')->after('id')->nullable();
            
            // Add index for better query performance
            $table->index(['type_commande', 'numero_serie']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('ventes', function (Blueprint $table) {
            $table->dropIndex(['type_commande', 'numero_serie']);
            $table->dropColumn('numero_serie');
        });
    }
};