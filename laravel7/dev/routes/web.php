<?php

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
	
	Route::post('ajax_login_with_cake/login_check', 'AjaxLoginWithCakeController@login_check');
	Route::get('ajax_login_with_cake/login_rap', 'AjaxLoginWithCakeController@login_rap');
	Route::get('neko', 'NekoController@index');
	Route::get('neko/bark', 'NekoController@bark');// ■■■□□□■■■□□□
	Route::post('neko/ajax_reg', 'NekoController@ajax_reg');
	Route::post('neko/ajax_delete', 'NekoController@ajax_delete');
	
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();
