<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\adminController;
use App\Http\Controllers\classess_subjects;
session_start();

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return view('welcome');
});
Route::get("admin/index",function(){
    $adminController=new adminController();
    return view("admin.index",["account"=>$_SESSION["user"],"statictics"=>$adminController->statistic()]);
})->middleware("protected_against_guest_users")->name("admin_index");
Route::get("admin/login",function(){
    return view("admin.login");
})->name("admin_login");
Route::get("admin/register",function(){
    return view("admin.register");
})->name("register");
Route::post("admin/add",[adminController::class,"register"])->name("register_admin");
Route::post("admin/login/do",[adminController::class,"login"])->name("login_do");
Route::get("admin/edit/student",function(){
    return view("admin.edit_students",["account"=>$_SESSION["user"]]);
})->middleware("protected_against_guest_users")->name("edit_student");
Route::get("admin/edit/teacher",function(){
    return view("admin.edit_teacher",["account"=>$_SESSION["user"]]);
})->name("edit_teacher")->middleware("protected_against_guest_users");

Route::post("admin/edit/student/add",[adminController::class,"add_student"])->name("add_students")->middleware("protected_against_guest_users");
Route::any("admin/ajax/search/student",[adminController::class,"search_students"])->name("search_students");
Route::any("admin/get/statictics",[adminController::class,"get_statis"]);
Route::any("admin/student/delete",[adminController::class,"delete_students"])->middleware("protected_against_guest_users");
Route::any("admin/student/update",[adminController::class,"update_std"]);
Route::post("admin/teacher/add",[adminController::class,"add_Teacher"])->name("add_teacher")->middleware("protected_against_guest_users");
Route::any("admin/ajax/search/teacher",[adminController::class,"search_teacher"]);
Route::any("admin/ajax/delete/teacher",[adminController::class,"delete_Teacher"]);
Route::any("admin/ajax/update/teacher",[adminController::class,"update_teacher"]);
Route::get("admin/edit/class",function(){
    $classess_subjects=new classess_subjects();
    $data=$classess_subjects->get_class_page_Data();
    return view("admin.class_edit",["account"=>$_SESSION["user"],"data"=>$data]);
})->name("edit_classes")->middleware("protected_against_guest_users");
Route::POST("admin/edit/class/add",[classess_subjects::class,"add_classs"])->middleware("protected_against_guest_users")->name("add_class");
Route::any("admin/class/search",[classess_subjects::class,"Search"]);