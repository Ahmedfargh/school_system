<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\class_model;

class classess_subjects extends Controller
{
    //
    public function get_supervisors(){
        return DB::select("SELECT teachers.name as name,teachers.id as id from teachers, classies WHERE teachers.id = classies.supervisor");
    }
    public function get_all_subjects(){
        return DB::select("SELECT * from subject");
    }
    public function get_all_non_supervisors(){
        return DB::select("SELECT teachers.name as name_,teachers.email as email,teachers.id as id from teachers where teachers.id Not in (SELECT supervisor from classies)");
    }
    public function get_all_classies(){
        return DB::select("SELECT teachers.name as name_,classies.class as class_name,classies.id as class_id from teachers,classies where teachers.id=classies.supervisor");
    }
    public function get_class_page_Data(){
        return [
            "supervisors"=>$this->get_supervisors(),
            "all_subjects"=>$this->get_all_subjects(),
            "nosupervisor"=>$this->get_all_non_supervisors(),
            "all_classies"=>$this->get_all_classies()
        ];
    }
    public function add_classs(Request $req){
        $class=new class_model;
        $class->class=$req->input("class_label");
        $class->supervisor =$req->input("teacher_id");
        $class->save();
        $data=$this->get_class_page_Data();
        $data["status"]="تمت عملية أضافة الفصل بنجاح";
        return view("admin.class_edit",["account"=>$_SESSION["user"],"data"=>$data]);
    }
}
