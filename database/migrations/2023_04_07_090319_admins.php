<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Admins extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create("admins",function (Blueprint $table){
            $table->bigIncrements("id");
            $table->string("name");
            $table->string("email")->unique();
            $table->string("password");
            $table->rememberToken("password");
            $table->integer("added_by");
            $table->timestamp("updated_at");

            $table->timestamp("created_at");
            #$table->foreign("added_by")->references("id")->onUpdate("cascade")->on("admins");
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
        Schema::dropIfExists("admins");
    }
}
