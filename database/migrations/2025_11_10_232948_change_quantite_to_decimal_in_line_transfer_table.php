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
        Schema::table('line_transfer', function (Blueprint $table) {
            // Change quantite from unsignedInteger to decimal
            $table->decimal('quantite', 10, 2)->default(0)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('line_transfer', function (Blueprint $table) {
            // Revert back to unsignedInteger if needed
            $table->unsignedInteger('quantite')->default(0)->change();
        });
    }
};