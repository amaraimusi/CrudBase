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

	Route::get('neko/bark', 'NekoController@bark');
	Route::get('neko', 'NekoController@index');
	Route::get('neko2', 'NekoController@index2');
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
