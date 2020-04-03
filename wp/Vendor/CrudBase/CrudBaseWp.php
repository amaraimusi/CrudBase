<?php

//■■■□□□■■■□□□
//define('DS', DIRECTORY_SEPARATOR);

class CrudBaseWp {
	
	public $version = '3.0.0';
	
	public $param;
	
	public $scr_key; // 画面キー（画面コード）

	public $home_dp; // ホームディレクトリパス
	
	public $dao;
	
	public $cbCtrl; // CrudBase基本コントローラー
	
	public $cbModel; // CrudBaseModel
	
	public $container; // コンテナ

	
	public function __construct() {
		$this->home_dp = dirname(dirname(__DIR__)); // ホームディレクトリパス
		
		// 定数
		require_once 'CrudBaseConfig.php';
		require_once $this->home_dp . '/Config/Config.php';
		
		$this->webroot = WEBROOT;
		
		require_once 'DaoWp.php';
		$this->dao = new DaoWp();
		
		// 汎用コントローラの宣言
		require_once 'CrudBaseControllerWp.php';
		$this->cbCtrl = new CrudBaseControllerWp();
		
		// 汎用モデルクラスの宣言
		require_once 'CrudBaseModel.php';
		$this->cbModel = new CrudBaseModel();
		$this->cbModel->setDao($this->dao);
		
		// 汎用ヘルパーの宣言
		require_once 'CrudBaseHelper.php';
		require_once 'ICrudBaseHelper.php';
		require_once 'wordpress/CrudBaseHelperWp.php'; // CrudBaseヘルパー・フレームワークストラテジー：WordPress用
		$this->cbHelper = new CrudBaseHelper();
		$this->cbHelper->setStrategy(new CrudBaseHelperWp());
		
		require_once 'ICrudBaseHeadStg.php';
		
		
	}
	
	
	/**
	 * 管理画面：indexアクションの共通事前処理
	 */
	public function indexBefore($name, &$param){
		$param['wp_ajax_action'] = CB_PROJECT_CODE; // WpのAjaxアクションにプロジェクトコードをセット
		$param['fw_strategy_type'] = 'wpm'; // WordPress管理画面型
		$param['version'] = $this->version; // バージョン
		$param['scr_key'] = $this->scr_key; // 画面キー
		$param['home_dp'] = $this->home_dp; // ホームディレクトリパス
		$param['elm_dp'] = $this->home_dp . '/Vendor/CrudBase/element/'; // 埋め込みエレメントパス
		$param['webroot'] = $this->webroot; // WEBルートパス
		$param['js_dp'] = $param['webroot'] . 'js/'; // JSルートパス
		$param['css_dp'] = $param['webroot'] . 'css/'; // CSSルートパス
		$param['wp_ajax_url'] = admin_url('admin-ajax.php');
		$param['nonce'] = wp_create_nonce("afarig4g");
		
		
		$cbCtrl = $this->cbCtrl;
		$param = $cbCtrl->indexBefore($name, $param);
		
		$this->param = $param;
		
		return $param;
	}
	
	
	/**
	 * 指定した管理画面ページを表示する
	 * @param string $scr_key 画面キー
	 */
	public function showPage($scr_key){
		
		$dp = DIRECTORY_SEPARATOR;
		$this->scr_key = $scr_key;
		
		// 管理画面のコントローラークラスを生成する
		$class_name = $scr_key . 'Controller'; // クラスファイル名
		$class_fp = $this->home_dp . $dp . 'Controller' . $dp . $class_name . '.php'; // クラスファイルパス
		require_once $class_fp;
		$ctrl = new $class_name;
		$ctrl->index($this);

		
	}
	
	/**
	 * モデルクラスを取得する
	 * @param string $page_code ページコード
	 * @return object モデルのインスタンス
	 */
	public function getModel($page_code){
		$home_dp = $this->param['home_dp']; // ホームディレクトリパス
		require_once $home_dp . "/Model/{$page_code}.php"; // モデルのインクルード
		$model = new $page_code($this);
		
		return $model;
	}
	
	
	/**
	 * コンテナにデータを追加する
	 * @param array $ctrs 追加コンテナ群(2次元構造型配列）
	 */
	public function set($ctrs){
		foreach($ctrs as  $key => $value){
			$this->container[$key] = $value;
		}
	}
	
	
	/**
	 * ビューをレンダリングする。
	 * コンテンツをHTML文字列として取得する。
	 *
	 * @param string $view_path ビューパス（View内からのファイルパス）
	 * @return string コンテンツHTML
	 */
	public function render($view_path, $param = []){
		$this->CrudBase = $this->cbHelper; // ヘルパー
		$param_json = json_encode($param, JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		extract($param);
		extract($this->container);
		$template = $this->home_dp . '/View/' . $view_path . '.php';
		include $template;
		
	}
	
	
	/**
	 * 管理画面：indexアクションの共通処理（後）
	 */
	public function indexAfter(&$param,$option=[]){
		$cbCtrl = $this->cbCtrl;
		$param = $cbCtrl->indexAfter($param, $option);
		$this->cbHelper->setParam($param);
		return $param;
	}
	
	//■■■□□□■■■□□□
// 	/**
// 	 * CrudBaseControllerWpのインスタンスを取得
// 	 * @return CrudBaseControllerWp instance
// 	 */
// 	public function getCbCtrl(){
// 		if(empty($this->cbCtrl)){
// 			require_once 'CrudBaseControllerWp.php';
// 			$this->cbCtrl = new CrudBaseControllerWp();
// 		}
// 		return $this->cbCtrl;
// 	}
	
	
	/**
	 * フィールド関連の各種パラメータをセットする
	 * @param array $box
	 *  - kensakuJoken	検索条件情報
	 *  - kjs_validate	検索条件のバリデーション
	 *  - field_data	フィールドデータ
	 */
	public function setFieldBoxs($box){
		
		$cbCtrl = $this->cbCtrl;
		$cbCtrl->setKensakuJoken($box['kensakuJoken']);
		$cbCtrl->setKjsValidate($box['kjs_validate']);
		$cbCtrl->setFildData($box['field_data']);

	}
	
	/**
	 * SQLインジェクションサニタイズ
	 *
	 * @note
	 * SQLインジェクション対策のためデータをサニタイズする。
	 * 高速化のため、引数は参照（ポインタ）にしている。
	 *
	 * @param any サニタイズデコード対象のデータ | 値および配列を指定
	 * @return void
	 */
	public function sql_sanitize(&$data){
		
		if(is_array($data)){
			foreach($data as &$val){
				$this->sql_sanitize($val);
			}
			unset($val);
		}elseif(gettype($data)=='string'){
			$data = addslashes($data);// SQLインジェクション のサニタイズ
		}else{
			// 何もしない
		}
	}
	
	
	

	
	public function makeSelectSql($option){
		$option=array(
			'conditions' => $conditions,
			'limit' =>$row_limit,
			'offset'=>$offset,
			'order' => $order,
		);
	}
	
	
	/**
	 * DBから一覧用のデータ取得する
	 * @param array $param
	 * @param string $where WHERE情報
	 * @return
	 * - data 一覧用のデータ
	 * - found_row_count データ件数(LIMITがかかっていないデータ件数）
	 */
	public function getData(&$param, &$where){
		
		return $this->cbModel->getData($param, $where);

	}
	
	
	public function test(){
		return 'Hello CrudBaseWp! Take2';
	}
	
	
	
	
	
	
	// 更新ユーザーなど共通フィールドをセットする。
	public function setCommonToEntity($ent,$update_user){
		
		// 更新ユーザーの取得とセット
		//$update_user = $this->Auth->user('username');
		$ent['update_user'] = $update_user;
		
		// ユーザーエージェントの取得とセット
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		$user_agent = mb_substr($user_agent,0,255);
		$ent['user_agent'] = $user_agent;
		
		// IPアドレスの取得とセット
		$ip_addr = $_SERVER["REMOTE_ADDR"];
		$ent['ip_addr'] = $ip_addr;
		
		// idが空（新規入力）なら生成日をセットし、空でないなら除去
		if(empty($ent['id'])){
			$ent['created'] = date('Y-m-d H:i:s');
		}else{
			unset($ent['created']);
		}
		
		// 更新日時は除去（DB側にまかせる）
		if(isset($ent['modified'])){
			unset($ent['modified']);
		}
		
		
		return $ent;
		
	}
	

 
}




