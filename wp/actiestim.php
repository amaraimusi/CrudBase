<?php
/*
 Plugin Name: アクティビティ見積もりシステム・プラグイン
 Plugin URI: 
 Description: 見積もりフォームや、「見積もり追加」ボタン、管理画面へののリンクが実装されています。
 Version: 1.0
 License: MIT
 */	
require_once 'config/actiestim_consts.php';

define('DS', DIRECTORY_SEPARATOR);


add_action('admin_menu', function(){
	
	// コアオブジェクト、CrudBase（WordPress管理画面用）
	global $crudBaseWp;
	require_once 'mng/Vendor/CrudBase/CrudBaseWp.php';
	$crudBaseWp = new CrudBaseWp();
	
	add_menu_page('ｱｸﾃｨﾋﾞﾃｨ見積', 'ｱｸﾃｨﾋﾞﾃｨ見積','publish_posts','actiestim/mng_index.php');
	
});

add_action('init', function(){
	if(session_status() !== PHP_SESSION_ACTIVE){
		@session_start();
	}
	$base_path_script = '/wp-content/plugins/actiestim/'; // Script読込用・基本パス
	wp_enqueue_script( 'jQuery3', $base_path_script . 'js/jquery3.js');
	wp_enqueue_script( 'vue', $base_path_script . 'js/vue.min.js' );
	wp_enqueue_script( 'add-estim', $base_path_script . 'js/add-estim.js' ); //  「見積もり追加ボタン」機能
});


	
	

/**
 * Ajax関連
 */
add_action("wp_ajax_actiestim", "ajax1");
	function ajax1(){

		// リクエストコードの取得とチェック
		$request_code = '';
		if(!empty($_POST['request_code'])) $request_code = $_POST['request_code'];
		if(empty($request_code)) die('No request_code!');
		
		// WordPressログインチェック
		if($request_code = 'wp_login_check'){
			echo _wpLoginFromMng();
			exit;
		}
		
		global $crudBaseWp;
		require_once 'mng/Vendor/CrudBase/CrudBaseWp.php';
		$crudBaseWp = new CrudBaseWp();
		
		$scr_key = $_POST['scr_key'];

		// 管理画面のコントローラークラスを生成する
		$class_name = $scr_key . 'Controller'; // クラスファイル名
		error_log($_POST,3,'a_debug.txt');
		require_once "mng/Controller/{$class_name}.php";
 		$ctrl = new $class_name;
 		
 		$method_name = $_POST['method_name'];
 		$res =$ctrl->$method_name($crudBaseWp);

	//■■■□□□■■■□□□保留
// 		// コアオブジェクト、CrudBase（WordPress管理画面用）
// 		global $crudBaseWp;
// 		require_once 'mng/Vendor/CrudBase/CrudBaseWp.php';
// 		$crudBaseWp = new CrudBaseWp();
		
// 		die($crudBaseWp->test());
		// トークンによるアクセスの正当性を確認
		//$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('nonce error３');
// 		}
// 		$res = ['success'=>1];

		
		
		
		// JSONレスポンスを出力
		header("Content-Type: application/json; charset=utf-8");
		echo json_encode($res);
		exit;
	}
	
	
	
add_action("wp_ajax_nopriv_actiestim", "ajax2");
function ajax2(){
	// リクエストコードの取得とチェック
	$request_code = '';
	if(!empty($_POST['request_code'])) $request_code = $_POST['request_code'];
	if(empty($request_code)) die('No request_code!');
	
	// WordPressログインチェック
	if($request_code = 'wp_login_check'){
		echo _wpLoginFromMng();
		exit;
	}
}


/**
 * 管理画面からのログイン手続き処理
 */
function _wpLoginFromMng(){

	$login_user = '';
	if(is_user_logged_in()){
		$wpUser = wp_get_current_user();
		$login_user = $wpUser->data->user_login;
	}
	
	$res = ['login_user'=>$login_user];
	$json = json_encode($res, JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
	
	return $json;
}

	
	
	
add_action( 'wp_enqueue_scripts', 'theme_enqueue_styles' );
function theme_enqueue_styles() {
	// 子スタイルの適用
	wp_enqueue_style( 'child-style', '/wp-content/themes/actiestim-theme/style.css');
}

// 見積もりフォームを表示させるショートコードにロジックを組み込む
add_shortcode('actiestim-form','actiestimForm');
function actiestimForm(){

	// モデル
	require_once 'model/ActiestimForm.php';
	$model = new ActiestimForm();
	$param = $model->init();
	
	$base_path_script = $param['base_path_script'];
	
	// CSSのインクルード
	wp_enqueue_style( 'actiestim', $base_path_script . 'css/actiestim.css' );
	
	// JSのインクルード

	wp_enqueue_script( 'crudBaseValidation', $base_path_script . 'js/CrudBaseValidation.js' );
	wp_enqueue_script( 'actiestimMakeEstim', $base_path_script . 'js/ActiestimMakeEstim.js' );
	wp_enqueue_script( 'estimForm', $base_path_script . 'js/EstimForm.js' );
	wp_enqueue_script( 'requestForm', $base_path_script . 'js/RequestForm.js' );
	wp_enqueue_script( 'loginForm', $base_path_script . 'js/LoginForm.js' );
	wp_enqueue_script( 'resetPwForm', $base_path_script . 'js/ResetPwForm.js' );
	wp_enqueue_script( 'actiestim', $base_path_script . 'js/Actiestim.js' );
	wp_enqueue_script( 'actiestim-form', $base_path_script . 'js/actiestim-form.js' );
	
	$inquiry_no = getQuery('inquiry_no'); // 問い合わせ番号をGETパラメータから取得する
	$mode = judgMode($inquiry_no); // モード判定    0:申請モード, 1:ログイン要求モード, 2:見積もりモード, 3:パスワードリセットモード

	// 申請モード以外なら、問い合わせ番号にひもづく顧客エンティティJSONをDBから取得する
	$c_ent_json = ''; // 顧客エンティティJSON
	if($mode != 0){
		$c_ent_json = $model->getCEntJson($inquiry_no);
		
		// 問い合わせ番号にひもづく顧客エンティティが空ならモードを申請モードにする。
		if(empty($c_ent_json)){
			$mode = 0;
		}
	}
	
	$param['mode'] = $mode;
	$param['c_ent_json'] = $c_ent_json;
	
	// 「3:パスワードリセットモード」ならハッシュをセット
	if($mode == 3) $param['smpu_hash'] = getQuery('smpu');
	
	return renderX('actiestim-form.php', $param);
	
}


/**
 * モード判定
 * @param string $inquiry_no 問い合わせ番号
 * @return int モード  
 * 		0:申請モード, 1:ログイン要求モード, 2:見積もりモード, 3:パスワードリセットモード
 */
function judgMode($inquiry_no){
	
	// 問い合わせ番号が空なら「申請モード」
	if(empty($inquiry_no)){
		return 0; // 申請モード
	}

	// ログイン状態にあるなら「見積もりモード」。
	if(!empty($_SESSION['actiestim_uid'])){
		return 2; // 見積もりモード
	}
	
	// smpuハッシュがGETパラメータに存在するならパスワードリセットモード（有効期限判定は登録ボタンにて）
	$smpu_hash = getQuery('smpu');
	if(!empty($smpu_hash)){
		return 3; // パスワードリセットモード
	}
	
	return 1; // ログイン要求モード

}




// function ajaxReceive(){
	
// // 	//■■■□□□■■■□□□
// // 	// トークンによるアクセスの正当性を確認
// // 	$nonce = $_POST['nonce'];
// // 	if (!wp_verify_nonce($nonce, 'unique_key')){
// // 		die('nonce error');
// // 	}

	
// // 	// データを受け取る
// // 	$json_param=$_POST['key1'];
// // 	$json_param = stripslashes($json_param);
// // 	$data = json_decode($json_param,true);//JSON文字を配列に戻す
	
// // 	// 任意の処理
// // 	$data[1]['name1'] = 'Wild Pig';
// // 	$res = $data;


// }







// テストページを表示させるためのショートコード
add_shortcode('actiestim-test','actiestimTest');
function actiestimTest(){
	
	$param = [];

	return renderX('test/index.php', $param);
}


/**
 * GETパラメータからキーに紐づくプロパティを取得
 * @return string 問い合わせ番号
 */
function getQuery($key){
	$prop_value = null;
	if(!empty($_GET)){
		if(!empty($_GET[$key])){
			$prop_value = $_GET[$key];
		}
	}
	return $prop_value;
}


// 「見積もりに追加ボタン」のショートコード
add_shortcode('add-estim','addEstim');

/**
 *  「見積もりに追加ボタン」の処理
 * @param array $attr
 *  - act アクティビティID
 */
function addEstim($attr){
	
 	require_once 'controller/AddEstimController.php';
 	$ctrl= new AddEstimController();
 	return $ctrl->render($attr);
}


/**
 * テンプレートエンジンをレンダリングする。
 * コンテンツをHTML文字列として取得する。
 *
 * @param string $template テンプレートファイルパス（View内からのファイルパス）
 * @return string コンテンツHTML
 */
function renderX($template, $param = []){
	extract($param);
	
	$template_fp = $template;
	ob_start();
	include $template_fp;
	$html = ob_get_contents();
	ob_end_clean();
	
	return $html;
}

