<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\admin;
class adminController extends Controller
{
    //
    public function register(Request $request){
        if($request->input("admin_password")===$request->input("confirm_password")){
            $admin=new admin;
            $admin->name=$request->input("admin_name");
            $admin->email=$request->input("admin_mail");
            $admin->password= password_hash($request->input("admin_password"), PASSWORD_DEFAULT);
            $admin->save();
            $_SESSION["user_id"]=$admin->id;
            echo $_SESSION["user_id"];
            return view("admin.login",["status"=>"خطأ فى البيانات"]);
        }
        return view("admin.register",["status"=>"خطأ فى البيانات"]);
    }
}
