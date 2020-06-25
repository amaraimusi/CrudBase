<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

require_once $_SERVER['DOCUMENT_ROOT'] . '\CrudBase\dist\CrudBase\php\CrudBase\CrudBaseController.php';

//class NekoController extends Controller
class NekoController
{
	
	private $crudBaseCon; // CrudBase制御クラス
	
	
	public function __construct(){
		
		
	}
	


	public function index(){
		
		//$this->crudBaseCon = new \CrudBaseController();
		info('うなぎのおいしさ');
		
		
		dump(config('const.TEST_LIST'));//■■■□□□■■■□□□)
		
		echo '<br>';
		echo $_SERVER['DOCUMENT_ROOT'];
		echo '<br>';
		$data = ['neko'=>'猫', 'yagi'=>'山羊'];
		
		echo '<pre>';
		echo config('const.TEST_PATH');
		echo '<br>';
		var_dump(config('const.TEST_LIST'));
		echo '</pre>';
		
		echo config('const.CRUD_BASE_PATH');
		return view('neko.index', compact('data'));
	}
	
    public function bark() {
        
        $data = ['neko'=>'猫', 'yagi'=>'山羊'];
        
        return view('neko.bark', compact('data'));
    }
}
