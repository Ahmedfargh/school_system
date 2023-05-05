<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class classess_subjects extends Controller
{
    //
    public function get_supervisors(){
        return DB::select("SELECT teachers.name as name,teachers.id as id from teachers, classies WHERE teachers.id = classies.supervisor");
    }
    public function get_all_subjects(){
        return DB::select("SELECT * from subject");
    }
    public function get_class_page_Data(){
        return [
            "supervisors"=>$this->get_supervisors(),
            "all_subjects"=>$this->get_all_subjects()
        ];
    }
}
