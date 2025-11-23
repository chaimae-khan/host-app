<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pertes', function (Blueprint $table) {
            $table->id();
            
           
            $table->foreignId('id_product')->nullable()->references('id')->on('products')->onDelete('cascade');
             $table->foreignId('id_category')->nullable()->references('id')->on('categories')->onDelete('cascade');
            $table->foreignId('id_subcategorie')->nullable()->references('id')->on('sub_categories')->onDelete('cascade');
            $table->foreignId('id_unite')->nullable()->references('id')->on('unite')->onDelete('cascade');
            $table->string('id_plat')->nullable();
            $table->string('classe')->nullable();
            $table->string('designation')->nullable();; 
            $table->decimal('quantite', 10, 2)->nullable();;
            $table->string('nature')->nullable();; 
            $table->date('date_perte')->nullable();; 
            $table->text('cause')->nullable(); 
            $table->enum('status', ['En attente', 'Validé', 'Refusé','Annuler'])->default('En attente');
            $table->text('refusal_reason')->nullable();
            $table->string('produit_fini_type')->nullable();
             $table->integer('nombre_plats')->nullable();
            $table->decimal('cout_total', 10, 2)->nullable();
            $table->foreignId('id_user')->constrained('users')->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pertes');
    }
};