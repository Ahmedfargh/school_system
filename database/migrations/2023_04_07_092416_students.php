<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Students extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create("students",function (Blueprint $table){
            $table->integer("id")->primary();
            $table->string("name",60);
            $table->string("phone",15);
            $table->string("email",32);
            $table->string("address",64);
            $table->dateTime("birth_date");
            $table->dateTime("join_date");
            $table->string("nat_id",32)->unique();
            $table->integer("added_by");
            //$table->foreign("added_by")->references("id")->on("students")->onDelete("set null")->onUpdate("cascade");
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
        Schema::dropIfExists("students");
    }
}
