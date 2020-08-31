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
	
	// Neko
	Route::get('neko', 'NekoController@index');
	Route::post('neko/ajax_reg', 'NekoController@ajax_reg');
	Route::post('neko/ajax_delete', 'NekoController@ajax_delete');
	Route::post('neko/auto_save', 'NekoController@auto_save');
	Route::post('neko/ajax_pwms', 'NekoController@ajax_pwms');
	Route::get('neko/csv_download', 'NekoController@csv_download');
	Route::post('neko/bulk_reg', 'NekoController@bulk_reg');
	
	// Yagi
	Route::get('yagi', 'YagiController@index');
	Route::post('yagi/ajax_reg', 'YagiController@ajax_reg');
	Route::post('yagi/ajax_delete', 'YagiController@ajax_delete');
	Route::post('yagi/auto_save', 'YagiController@auto_save');
	Route::post('yagi/ajax_pwms', 'YagiController@ajax_pwms');
	Route::get('yagi/csv_download', 'YagiController@csv_download');
	Route::post('yagi/bulk_reg', 'YagiController@bulk_reg');
	
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();
