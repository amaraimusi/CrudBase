<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate¥Support¥Facades¥DB;

class DashboardController
{
	
	//■■■□□□■■■□□□
	//private $login_needed_flg = true; // ログイン必須フラグ（編集系で認証を必須とするか？）

	
	/**
	 * ネコCRUDページ
	 */
	public function index(){
		
		
		if(\Auth::id() == null ){
			return 'Error:ログイン認証が必要です。 Login is needed';
		}
		
		
		
		//$crudBaseData['userInfo']

		return view('dashboard.index');
		
		
	}
	
	
	
}


