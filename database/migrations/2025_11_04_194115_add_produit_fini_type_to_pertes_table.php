<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('pertes', function (Blueprint $table) {
            $table->string('produit_fini_type')->nullable()->after('nature');
        });
    }

    public function down()
    {
        Schema::table('pertes', function (Blueprint $table) {
            $table->dropColumn('produit_fini_type');
        });
    }
};