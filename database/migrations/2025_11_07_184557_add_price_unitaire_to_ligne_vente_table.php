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
         Schema::table('ligne_vente', function (Blueprint $table) {
            $table->decimal('price_unitaire', 10, 2)->default(0)->after('qte');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
         Schema::table('ligne_vente', function (Blueprint $table) {
            $table->dropColumn('price_unitaire');
        });
    }
};
