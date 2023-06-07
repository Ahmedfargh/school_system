<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\transfereed_log;
use Illuminate\Support\Facades\DB;

class server extends Controller
{
    //load sever log
    public function get_last_counter(Request $request){
        return DB::select("SELECT * from transfereed_log order by last_record desc limit 1");
    }
    public function get_all_load(Request $request){
        return DB::select("SELECT * FROM transfereed_log order by last_record ASC");
    }
}
