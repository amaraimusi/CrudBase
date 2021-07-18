<?php


/**
 * CrudBase設定ファイル
 *
 * @version 2.0
 * @date 2020-4-13 crud_base_const.phpとCrudBaseConfig.phpを統合してcrud_base_config.phpを作成
 * @date 2016-2-5 新規作成
 *
 */
global $crudBaseConfig;



// 値種別定数    この定数を主に利用しているファイルと関数 → 「app/View/Helper/AppHelper.php : ent_show_x」
define('CB_FLD_SANITAIZE','1'); // サニタイズ
define('CB_FLD_MONEY','2'); // 金額表記
define('CB_FLD_DELETE_FLG','3'); // 有無フラグ
define('CB_FLD_BR','4'); // 改行brタグ化
define('CB_FLD_BOUTOU','5'); // 長文字の冒頭
define('CB_FLD_TEXTAREA','6'); // テキストエリア用（改行対応）
define('CB_FLD_NULL_ZERO','7');// nullは0表記
define('CB_FLD_TA_CSV','8');// テキストエリアCSV出力用


// プロジェクトディレクトリの絶対ルートパス。 例→"C:\Users\user\git\CrudBase\laravel7\dev\"
$crud_base_root = dirname(__FILE__) . DIRECTORY_SEPARATOR; 
define('CRUD_BASE_ROOT', $crud_base_root);

// appディレクトリへの絶対パス。 例→
$crud_base_app_path = $crud_base_root . 'app' . DIRECTORY_SEPARATOR;
define('CRUD_BASE_APP_PATH', $crud_base_app_path);

$crud_base_path = dirname(dirname(dirname(__FILE__))) . '/dist/CrudBase/php/CrudBase/';
define('CRUD_BASE_PATH', $crud_base_path);

$crud_base_project_path = '/CrudBase/laravel7/dev'; // 例：「/animal/mng」
define('CRUD_BASE_PROJECT_PATH', $crud_base_project_path); // 基本URL(非推奨）

$crud_base_url_base = $crud_base_project_path . '/';
define('CRUD_BASE_URL_BASE', $crud_base_url_base); // 基本URL


$crud_base_js = "/CrudBase/dist/CrudBase/js/CrudBase/dist/CrudBase.min.js";
define('CRUD_BASE_JS', $crud_base_js);

$crud_base_css = "/CrudBase/dist/CrudBase/css/CrudBase/dist/CrudBase.min.css";
define('CRUD_BASE_CSS', $crud_base_css);

//■■■□□□■■■□□□
//$crud_base_webroot_abs_path = $crud_base_root . 'app/webroot/';
//define('CRUD_BASE_WEBROOT_ABS_PATH', $crud_base_webroot_abs_path);

// CrudBase設定データ
$crudBaseConfig = [
	'fw_type'=>'laravel',
	'env'=>'localhost', // 環境種別 localhost, amaraimusi, product
	
	'crud_base_root'=>CRUD_BASE_ROOT, // プロジェクトのルートパス（絶対パス）
	'crud_base_app_path'=>CRUD_BASE_APP_PATH, // appディレクトリの絶対パス
	'crud_base_project_path'=>CRUD_BASE_PROJECT_PATH, // プロジェクト名もしくはプロジェクトの相対パス→（例: animal_park/public)
	'crud_base_path'=>CRUD_BASE_PATH, // Vendor側のCrudBaseライブラリへの絶対パス
	'crud_base_js'=>CRUD_BASE_JS, // jsのCrudBaseライブラリパス（相対パス）
	'crud_base_css'=>CRUD_BASE_CSS, // cssのCrudBaseライブラリパス（相対パス）
	'crud_base_url_base'=>CRUD_BASE_URL_BASE, // 基本URL
	
	//'crud_base_webroot_abs_path'=>$crud_base_webroot_abs_path,■■■□□□■■■□□□
];

// DB設定情報を取得する
$crudBaseConfig['dbConfig'] = getDbConfigForCrudBase($crudBaseConfig['env']);

// 汎用メソッドクラス
require_once $crud_base_path . 'crud_base_function.php';
require_once $crud_base_path . 'CrudBaseU.php';

// 権限データ
global $crudBaseAuthorityData;
$crudBaseAuthorityData = [
	'master'=>[
		'name'=>'master',
		'wamei'=>'マスター',
		'level'=>41,
	],
	'developer'=>[
		'name'=>'developer',
		'wamei'=>'開発者',
		'level'=>40,
	],
	'admin'=>[
		'name'=>'admin',
		'wamei'=>'管理者',
		'level'=>30,
	],
	'client'=>[
		'name'=>'client',
		'wamei'=>'クライアント',
		'level'=>20,
	],
	'oparator'=>[
		'name'=>'oparator',
		'wamei'=>'オペレータ',
		'level'=>10,
	],
	
];


/**
 * DB設定
 * @return string[] DB設定情報
 */
function getDbConfigForCrudBase($env = null){
	
	$dbConfig = [
		'host'=>env('DB_HOST'),
		'db_name'=>env('DB_DATABASE'),
		'user'=>env('DB_USERNAME'),
		'pw'=>env('DB_PASSWORD'),
	];
	
	
	return $dbConfig;
}



/**
 * ログB
 * @param mixed $val
 */
function logB($val){
	if(is_array($val)){
		error_log(print_r($val, true), 3, 'log_b.log');
	}else{
		error_log($val, 3, 'log_b.log');
	}
	error_log("\n", 3, 'log_b.log');
}
