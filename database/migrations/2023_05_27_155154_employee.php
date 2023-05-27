<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Employee extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create("employee",function(Blueprint $table){
            $table->integer("id")->primary();
            $table->string("name",64);
            $table->string("phone",15)->unique();
            $table->string("email",32)->unique();
            $table->string("address",128);
            $table->datetime("joined_at");
            $table->datetime("birth_date");
            $table->string("nat_id",32)->unique();
            $table->integer("added_by");
            $table->string("Religion",15);
            $table->string("gender",10);
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
    }
}
