<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\adminController;
use App\Http\Controllers\classess_subjects;
use App\Http\Controllers\parents_relations;
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
/*
*admin login and register
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
/*
*admin edit student and teacher page route
*/
Route::get("admin/edit/student",function(){
    $cont=new adminController;
    $data=$cont->get_important_data();
    return view("admin.edit_students",["account"=>$_SESSION["user"],"data"=>$data]);
})->middleware("protected_against_guest_users")->name("edit_student");
Route::get("admin/edit/teacher",function(){
    $cont=new adminController;
    $data=$cont->get_important_data();
    return view("admin.edit_teacher",["account"=>$_SESSION["user"],"data"=>$data]);
})->name("edit_teacher")->middleware("protected_against_guest_users");
/**
 * student  CURD
 */
Route::post("admin/edit/student/add",[adminController::class,"add_student"])->name("add_students")->middleware("protected_against_guest_users");
Route::any("admin/ajax/search/student",[adminController::class,"search_students"])->name("search_students");
Route::any("admin/get/statictics",[adminController::class,"get_statis"]);
Route::any("admin/student/delete",[adminController::class,"delete_students"])->middleware("protected_against_guest_users");
Route::any("admin/student/update",[adminController::class,"update_std"]);
/**
* teacher CRUD
*/
Route::post("admin/teacher/add",[adminController::class,"add_Teacher"])->name("add_teacher")->middleware("protected_against_guest_users");
Route::any("admin/ajax/search/teacher",[adminController::class,"search_teacher"]);
Route::any("admin/ajax/delete/teacher",[adminController::class,"delete_Teacher"]);
Route::any("admin/ajax/update/teacher",[adminController::class,"update_teacher"]);
/**
 * class CRUDE and route
 */
Route::get("admin/edit/class",function(){
    $classess_subjects=new classess_subjects();
    $data=$classess_subjects->get_class_page_Data();
    return view("admin.class_edit",["account"=>$_SESSION["user"],"data"=>$data]);
})->name("edit_classes")->middleware("protected_against_guest_users");
Route::POST("admin/edit/class/add",[classess_subjects::class,"add_classs"])->middleware("protected_against_guest_users")->name("add_class");
Route::any("admin/class/search",[classess_subjects::class,"Search"]);
Route::any("admin/class/delete",[classess_subjects::class,"delete_class"]);
Route::any("admin/update/class",[classess_subjects::class,"update_class"]);
/**
 * subject CRUD
 */
Route::get("admin/edit/subjects",function(){
    $classess_subjects=new classess_subjects();
    $data=$classess_subjects->get_class_page_Data();
    return view("admin.subject_edit",["account"=>$_SESSION["user"],"data"=>$data]);
})->name("edit_subjects")->middleware("protected_against_guest_users");
Route::POST("admin/edit/add/subject",[classess_subjects::class,"add_subject"])->name("add_subject")->middleware("protected_against_guest_users");
Route::any("admin/search/subject/",[classess_subjects::class,"search_subject"]);
Route::any("admin/subject/update",[classess_subjects::class,"update_subject"]);
Route::any("admin/teacher/assign_subject",[classess_subjects::class,"assign_subject_to_teacher"]);
/**
 * parents CRUD
 */
Route::get("admin/parents/page",function(){
    $cont=new adminController;
    $data=$cont->get_important_data();
    return view("admin.parents",["account"=>$_SESSION["user"],"data"=>$data]);
})->middleware("protected_against_guest_users")->name("parent_edit_page");
Route::post("admin/parents/add",[parents_relations::class,"add_parent"])->middleware("protected_against_guest_users")->name("add_parent");
/*
* صفحات أعضاء التطبيق
*/
Route::get("admin/student/data/{id}",function($id){
    $cont=new adminController;
    $data=$cont->get_student_pages_data($id);
    return view("admin.student_account",$data);
})->name("student_data")->middleware("protected_against_guest_users");
Route::get("admin/employee/data/{id}",function($id){
    $cont=new adminController;
    $data=$cont->get_employee_pages_data($id);
    return view("admin.employee_type",$data);
})->name("employee_page")->middleware("protected_against_guest_users");
Route::get("admin/server/page",function(){
    return view("admin.server",["account"=>$_SESSION["user"]]);
})->name("server_page")->middleware("protected_against_guest_users");