<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ParentContact extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create("parents",function(Blueprint $table){
            $table->bigInteger("id")->primary();
            $table->string("name",64);
            $table->string("address",128);
            $table->string("phone",15);
            $table->string("job",35)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists("parents");
    }
}
