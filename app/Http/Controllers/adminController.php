<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\admin;
use App\Models\student;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

class adminController extends Controller
{
    //
    private function secure($text){
        return $text;
    }
    public function register(Request $request){
        if($request->input("admin_password")===$request->input("confirm_password")){
            $admin=new admin;
            $admin->name=$request->input("admin_name");
            $admin->email=$request->input("admin_mail");
            $admin->password=$this->secure($request->input("admin_password"));
            $admin->save();
            $_SESSION["user_id"]=$admin->id;
            echo $_SESSION["user_id"];
            return view("admin.login",["status"=>"خطأ فى البيانات"]);
        }
        return view("admin.register",["status"=>"خطأ فى البيانات"]);
    }
    public function login(Request $request){
        $password=$this->secure($request->input("admin_password"));
        $admin=DB::select("SELECT * FROM admins where name like '%".$request->input("name")."%' and password='".$password."'");
        if(count($admin)>0 && count($admin)<2){
            $_SESSION["user_id"]=$admin[0]->id;
            //$_SESSION["user_id"]=;
            return view("admin.index");
        }else{
            //var_dump($admin);
            return view("admin.login");
        }
    }
    public function add_student(Request $request){
        $student=new student;
        $student->name=$request->input("student_name");
        $student->email=$request->input("student_email");
        $student->phone=$request->input("student_phone");
        $student->address=$request->input("student_address");
        $student->nat_id =$request->input("student_nat_id");
        $student->birth_date=$request->input("student_birth_date");
        $image_path=$_SERVER["HTTP_HOST"]."/".$request->file("student_image")->store("student_images");
        $student->personal_image=$image_path;
        $student->save();
        return view("admin.edit_students");
    }
}