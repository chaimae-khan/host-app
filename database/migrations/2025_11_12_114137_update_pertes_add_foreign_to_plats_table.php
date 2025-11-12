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
        Schema::table('pertes', function (Blueprint $table) {
            // Make id_product nullable since we might have plats instead
            $table->foreignId('id_product')->nullable()->change();
            
            // Add foreign key to plats table
            $table->foreignId('id_plat')->nullable()->after('id_product')->constrained('plats')->onDelete('cascade');
            
            // Make id_unite nullable
            $table->foreignId('id_unite')->nullable()->change();
            
            // Add new columns for plats tracking
            $table->integer('nombre_plats')->nullable()->after('produit_fini_type');
            $table->decimal('cout_total', 10, 2)->nullable()->after('nombre_plats');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pertes', function (Blueprint $table) {
            // Drop new columns
            $table->dropColumn(['nombre_plats', 'cout_total']);
            
            // Drop foreign key and column for plats
            $table->dropForeign(['id_plat']);
            $table->dropColumn('id_plat');
            
        
        });
    }
};