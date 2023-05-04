<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\admin;
use App\Models\student;
use App\Models\teacher;
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
        $admin=DB::select("SELECT * FROM admins where name ='".$request->input("name")."' and password='".$password."'");
        if(count($admin)>0 && count($admin)<2){
            $_SESSION["user_id"]=$admin[0]->id;
            $_SESSION["user"]=$admin;
            return view("admin.index",["statictics"=>$this->statistic(),"account"=>$admin]);
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
        $student->nationality=$request->input("nationality");
        $student->gender=$request->input("student_gender");
        $student->relegion	=$request->input("student_relgion");
        $image_path="\\".$request->file("student_image")->move("public\\images\\");
        $student->personal_image=$image_path;
        $student->save();
        return view("admin.edit_students",["account"=>$_SESSION["user"]]);
    }
    protected function search_by_name($name){
        return DB::select("SELECT * FROM students where name like '%".$name."%';");
    }
    protected function search_by_address($address){
        return DB::select("SELECT * FROM students where address like '%".$address."%';");
    }
    protected function search_by_id($id){
        return DB::select("SELECT * FROM students where id=".$id);
    }

    public function search_students(Request $request){
        $filter=str_replace('"',"",$request->input("key"));
        $value=str_replace('"',"",$request->input("value"));
        if($filter=="name"){
            return $this->search_by_name($value);
        }
        else if($filter=="address"){
            return $this->search_by_address($value);
        }
        else if($filter=="id"){
            return $this->search_by_id($value);
        }
        return ["status"=>$request->input("key")];
    }
    public function statistic(){
        return [
            "student_count"=>DB::table("students")->count(),
            "admin_count"=>DB::table("admins")->count(),
            "classes_count"=>DB::table("classies")->count(),
            "students_have_credit"=>DB::table("depts")->count(),
            "teacher_count"=>DB::table("teachers")->count()
        ];
    }
    public function get_statis(Request $req){
        return $this->statistic();
    }
    public function delete_students(Request $req){
        $std=DB::select("delete  FROM students  where id =".$req->input("std_id"));
        var_dump($std);
        $data_to_return=["message"=>"تم مسح الطالب "];
        $std->delete();
        return $data_to_return;
    }
    public function update_std(Request $req){
        $std_id=str_replace('"',"",$req->input("std_id"));
        $value=str_replace('"',"",$req->input("value"));
        $field=str_replace('"',"",$req->input("field"));
        $std=student::find($std_id);
        echo $field;
        echo $value;
        echo $std_id;
        if($field=="name"){
            $result=["status"=>"تمت تغيير أسم الطالب من ".$std->name."إلى ".$value];
            $std->name=$value;
            $std->save();
            return $result;
        }else if($field=="address"){
            $result=["status"=>$value."إلى".$std->address."تم تغيير العنوان من "];
            $std->address=$value;
            $std->save();
            return $result;
        }else if($field=="email"){
            echo "shit";
            $result=["status"=>$value."إلى ".$std->email."تمت عملية تغيير البريد الألكترونى من "];
            $std->email=$value;
            $std->save();
            return $result;
        }else if($field=="birth_date"){
            echo $std->birth_date;
            $result=["status"=>$value." إلى ".$std->birth_date."تم تغيير تاريخ الميلاد من "];
            $std->birth_date=$value;
            $std->save();
            return $result;
        }
        return ["status"=>"fuck you"];
    }
    function add_Teacher(Request $request){
        $student=new teacher;
        $student->name=$request->input("teacher_name");
        $student->email=$request->input("teacher_email");
        $student->phone=$request->input("teacher_phone");
        $student->address=$request->input("teacher_address");
        $student->nat_id =$request->input("teacher_nat_id");
        $student->birth_date=$request->input("teacher_birth_date");
        $student->gender=$request->input("student_gender");
        $student->relegion	=$request->input("Relegion");
        $image_path="\\".$request->file("teacher_image")->move("public\\images\\teachers\\");
        $student->personal_image=$image_path;
        $student->save();
        return view("admin.edit_teacher",["account"=>$_SESSION["user"],"status"=>"تمت عملية الأضافة بنجاح"]);
    }
}