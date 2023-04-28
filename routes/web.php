<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\adminController;
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
    return view("admin.index");
})->middleware("protected_against_guest_users")->name("admin_index");
Route::get("admin/login",function(){
    return view("admin.login");
})->name("admin_login")->middleware("protected_against_guest_users");
Route::get("admin/register",function(){
    return view("admin.register");
})->name("register");
Route::post("admin/add",[adminController::class,"register"])->name("register_admin");
Route::post("admin/login/do",[adminController::class,"login"])->name("login_do");