<?php
session_start();
use Illuminate\Support\Facades\Route;

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
})->name("admin_login");