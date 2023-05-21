<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\parents_model;
use App\Models\relations;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\adminController;
class parents_relations extends Controller
{
    //
    public function student_exist($std_id){
        return (int)count(DB::select("SELECT * FROM students where id=".$std_id))==0;
    }
    public function get_data(){
        $cont=new adminController;
        $data=$cont->get_important_data();
        return $data;
    }
    public function add_parent(Request $req){
        if(!$this->student_exist($req->input("student_number"))){
            $parent=new parents_model;
            $rel=new relations;
            $parent->name=$req->input("parent_name");
            $parent->address=$req->input("parent_address");
            $parent->email=$req->input("parent_email");
            $parent->phone=$req->input("parent_phone");
            $parent->job=$req->input("parent_job");
            $rel->std_id=$req->input("student_number");
            $parent->save();
            echo $rel->std_id;
            $rel->parent_id=$parent->id;
            $rel->save();
            $data=$this->get_data();
            return view("admin.parents",["account"=>$_SESSION["user"],"data"=>$data,"status_message"=>"تمت العملية بنجاح"]);
        }else{
            $data=$this->get_data();
            return view("admin.parents",["account"=>$_SESSION["user"],"data"=>$data,"status_message"=>"الطالب غير موجود"]);
        }
    }
}
