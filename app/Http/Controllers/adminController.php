<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\admin;
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
        echo $request->input("admin_password");
        $password=$this->secure($request->input("admin_password"));
        $admin=DB::select("SELECT * FROM admins where name like '%".$request->input("name")."%' and password='".$password."'");
        if(count($admin)>0 && count($admin)<2){
            return view("admin.index");
        }else{
            //var_dump($admin);
            return view("admin.login");
        }
    }
}