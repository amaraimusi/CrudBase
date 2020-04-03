<?php

require_once 'HashCustom.php';
require_once 'SanitizeCustom.php';
require_once 'CrudBasePagenation.php';
/**
 * 各コントローラーの基本クラス【WordPress版】
 * 
 * 
 * @date 2017-4-27 | 2020-3-26
 * @version 1.0
 *
 */
class CrudBaseControllerWp{
	
//■■■□□□■■■□□□
// 	protected $scr_key = ''; // 画面キー
	
// 	protected $pagenation; // ページネーション制御クラス

// 	protected $params = array(); // ビューへのパラメータ
	
// 	protected $helper; // View用のヘルパークラス
	
// 	protected $plugin_url; // プラグインURL
	
// 	protected $plugin_dp; // プラグインディレクトリパス(末尾に「/」はない」
	
// 	protected $kensakuJoken; // 検索条件情報
	
// 	protected $field_data; // フィールドデータ
	
// 	private $page_name=''; // ページ名 (クエリのpageの値）
	
	// ■■■□□□■■■□□□
// 	///バージョン
// 	public $version = "2.7.9";
	
	///デフォルトの並び替え対象フィールド
	public $defSortFeild='sort_no';
	
	///デフォルトソートタイプ
	public $defSortType=0;//0:昇順 1:降順
	
	public $userInfo = array(); // ユーザー情報
	
	///検索条件定義（要,オーバーライド）
	public $kensakuJoken=array();
	
	///検索条件のバリデーション（要,オーバーライド）
	public $kjs_validate = array();
	
	///フィールドデータ（要、オーバーライド）
	public $field_data = array();
	
	///一覧列情報(ソート機能付	 $field_dataの簡易版）
	public $table_fields=array();
	
	///編集エンティティ定義（要,オーバーライド）
	public $entity_info=array();
	
	///編集用バリデーション（要,オーバーライド）
	public $edit_validate = array();
	
	///巨大データ判定行数
	public $big_data_limit=501;
	
	//巨大データフィールド
	public $big_data_fields = array();
	
	// 当ページバージョン（各ページでオーバーライドすること)
	public $this_page_version = '1.0';
	
	// バージョン情報
	public $verInfo = array();
	
	private $params = []; // URLクエリ（GETパラメータ）
	
	public function __construct(){
		
// 		require_once 'PagenationForWp.php';//■■■□□□■■■□□□
 		$this->pagenation = new CrudBasePagenation();
		
		
	}
	
	
	/**
	 * indexアクションの共通処理
	 *
	 * @note
	 * 検索条件情報の取得、入力エラー、ページネーションなどの情報を取得します。
	 * このメソッドはindexアクションの冒頭部分で呼び出されます。
	 * @param string $name 	対応するモデル名（キャメル記法）
	 * @param array $option
	 *  - request 	HTTPリクエスト
	 *  - func_new_version 新バージョンチェック機能   0:OFF(デフォルト) , 1:ON
	 *  - func_csv_export CSVエクスポート機能 0:OFF ,1:ON(デフォルト)
	 *  - func_file_upload ファイルアップロード機能 0:OFF , 1:ON(デフォルト)
	 *  - sql_dump_flg SQLダンプフラグ   true:SQLダンプを表示（デバッグモードである場合。デフォルト） , false:デバッグモードであってもSQLダンプを表示しない。
	 * @return array $param;
	 */
	public function indexBefore($name, $param){

		
		// ■■■□□□■■■□□□
// 		$this->page_name = $_GET['page'];
		
// 		$req = $_GET;
		
//  		// GET（URIクエリ）など検索条件情報を取得する
//  		$kjs = $this->getKjs($req);
 		
 		
// 		// DB検索に必要なLIMIT,ORDER BYを検索オプション情報として取得
//  		$req['kj_limit'] = $kjs['kj_limit'];
// 		$page_lo=$this->pagenation->createLimitAndOrder($req);
// 		$kjs = array_merge($kjs,$page_lo);
		
// 		// 列表示切替機能の初期設定JSONを作成する。
// 		$this->params['csh_json'] = $this->makeClmShowHideJson($this->field_data);
		
		$this->params['url'] = $this->getUrlQuery();

		// ▼ HTTPリクエストを取得
		$request = null;
		if(empty($param['request'])){
			$request = $this->request->data;
		}else{
			$request = $param['request'];
		}
		
		// ▼ オプションの初期化
		if(empty($param['func_new_version'])) $param['func_new_version'] = 0;
		if(!isset($param['func_csv_export'])) $param['func_csv_export'] = 1;
		if(!isset($param['sql_dump_flg'])) $param['sql_dump_flg'] = true;
		if(!isset($param['func_file_upload'])) $param['func_file_upload'] = 1;
		
		
		// ▼ 画面に関連づいているモデル名関連を取得
//		$this->MainModel=ClassRegistry::init($name);■■■□□□■■■□□□
		$this->main_model_name=$name;
		$this->main_model_name_s=$this->snakize($name);
		
		// ▼POSTデータを取得
		$postData = null;
		if(isset($this->request->data[$name])){
			$postData = $this->request->data[$name];
		}
		
		// アクションを判定してアクション種別を取得する（0:初期表示、1:検索ボタン、2:ページネーション、3:ソート）
		$actionType = $this->judgActionType();
		
		// 新バージョンであるかチェック。新バージョンである場合セッションクリアを行う。２回目のリクエスト（画面表示）から新バージョンではなくなる。
		$new_version_chg = 0; // 新バージョン変更フラグ: 0:通常  ,  1:新バージョンに変更
		if($param['func_new_version'] != 0){
			$system_version = $this->checkNewPageVersion($this->this_page_version);
			if(!empty($system_version)){
				$new_version_chg = 1;
				$this->sessionClear();
			}
		}
		
		//URLクエリ（GET)にセッションクリアフラグが付加されている場合、当画面に関連するセッションをすべてクリアする。
		if(!empty($this->request->query['sc'])){
			$this->sessionClear();
		}
		
		//フィールドデータが画面コントローラで定義されている場合、以下の処理を行う。
		if(!empty($this->field_data)){
			$res = $this->exe_field_data($this->field_data,$this->main_model_name_s);//フィールドデータに関する処理
			$this->table_fields = $res['table_fields'];
			$this->field_data = $res['field_data'];

		}

		//フィールドデータから列表示配列を取得
		$csh_ary = $this->exstractClmShowHideArray($this->field_data);
		$csh_json = json_encode($csh_ary);
		
// 		// ■■■□□□■■■□□□
// 		//サニタイズクラスをインポート
// 		App::uses('Sanitize', 'Utility');
		
		//検索条件情報をPOST,GET,デフォルトのいずれから取得。
		$kjs=$this->getKjs($name);
		
		// 検索条件情報のバリデーション
		$errTypes = array();
		$errMsg = $this->valid($kjs,$this->kjs_validate);
		if(isset($errMsg)){//入力エラーがあった場合。
			//再表示用の検索条件情報をSESSION,あるいはデフォルトからパラメータを取得する。
			$kjs= $this->getKjsSD($name);
			$errTypes[] = 'kjs_err';
		}
		
		//検索ボタンが押された場合
		$pages=array();
		if(!empty($request['search'])){
			
			//ページネーションパラメータを取得
			$pages = $this->getPageParamForSubmit($kjs,$postData);
			
		}else{
			//ページネーション用パラメータを取得
			$overData['row_limit']=$kjs['row_limit'];
			$pages=$this->getPageParam($overData);
			
		}
		
		$bigDataFlg=$this->checkBigDataFlg($kjs);//巨大データ判定
		
		//巨大データフィールドデータを取得
		$big_data_fields = $this->big_data_fields;
		
		//フィールドデータが定義されており、巨大データと判定された場合、巨大フィールドデータの再ソートをする。（列並替に対応）
		if(!empty($this->field_data) && $bigDataFlg ==true){
			
			//巨大データフィールドを列並替に合わせて再ソートする。
			$big_data_fields = $this->sortBigDataFields($big_data_fields,$this->field_data['active']);
			
		}
		
		$def_kjs_json=$this->getDefKjsJson();// 検索条件情報からデフォルト検索情報JSONを取得する
		
		//デバッグモードを取得
		$debug_mode = 0;
		if(!empty($param['debug'])) $debug_mode = $param['debug'];
		
		//アクティブフィールドデータを取得
		$active = array();
		if(!empty($this->field_data['active'])){
			$active = $this->field_data['active'];
		}
		
		// ユーザー情報を取得する
		$userInfo = $this->getUserInfo();
		$this->userInfo = $userInfo;
		
		// アクティブフラグをリクエストから取得する
		$act_flg = $this->getValueFromPostGet('act_flg');
		
		$kjs_json = json_encode($kjs,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
		// セッションへセット（CSVエクスポートで利用）
		if(!empty($param['func_csv_export'])){
			$this->setSession($this->main_model_name_s.'_kjs', $kjs);
		}
		
		$sql_dump_flg = $param['sql_dump_flg']; // SQLダンプフラグ   true:SQLダンプを表示（デバッグモードである場合） , false:デバッグモードであってもSQLダンプを表示しない。
		
		// エラータイプJSON
		$err_types_json = json_encode($errTypes,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);

		
		$param['model_name_c'] =  $this->main_model_name; // モデル名（キャメル記法）
		$param['model_name_s'] = $this->main_model_name_s; // モデル名（スネーク記法）
		$param['field_data']=$active;		// アクティブフィールドデータ
		$param['kjs'] = $kjs;				// 検索条件情報
		$param['kjs_json'] = $kjs_json;		// 検索条件JSON
		$param['def_kjs_json'] = $def_kjs_json; // デフォルト検索情報JSON
		$param['errMsg'] = $errMsg;			// エラーメッセージ
		$param['errTypes']  =  $errTypes;	// エラータイプ
		$param['err_types_json']  =  $err_types_json; // エラータイプJSON
		//$param['version'] = $this->version;	// CrudBaseのバージョン■■■□□□■■■□□□
		$param['userInfo'] = $userInfo;		// ユーザー情報
		$param['new_version_chg'] = $new_version_chg; // 新バージョン変更フラグ: 0:通常  ,  1:新バージョンに変更
		$param['debug_mode'] = $debug_mode;	// デバッグモード	CakePHPのデバッグモードと同じもの
		$param['csh_ary'] = $csh_ary;		// 列表示配列	列表示切替機能用
		$param['csh_json'] = $csh_json;		// 列表示配列JSON	 列表示切替機能用
		$param['bigDataFlg'] = $bigDataFlg;	// 巨大データフラグ	画面に表示する行数が制限数（$big_data_limit）を超えるとONになる。
		$param['big_data_fields'] = $big_data_fields; // 巨大データ用のフィールド情報 (高速化のため列の種類は少なめ）
		$param['pages'] = $pages;			// ページネーションパラメータ
		$param['act_flg'] = $act_flg;		// アクティブフラグ	null:初期表示 , 1:検索アクション , 2:ページネーションアクション , 3:列ソートアクション
		$param['sql_dump_flg'] = $sql_dump_flg; // SQLダンプフラグ

		return $param;
	}
	
	/**
	 * URLクエリ（GETパラメータを取得する）
	 * @return array URLクエリデータ
	 */
	private function getUrlQuery(){
		$urlQuerys = [];
		foreach($_GET as $key => $value){
			$urlQuerys[$key] = $value;
		}
		return $urlQuerys;
	}
	
	
	/**
	 * アクション種別を取得する
	 * @return int アクション種別   0:初期表示、1:検索ボタン、2:ページネーション、3:ソート
	 */
	private function judgActionType(){
		
		$postData = $this->request->data;
		$getData = $this->request->query;
		
		$post_flg =false;
		if($postData){
			$post_flg = true;
		}
		
		$get_flg = false;
		if($getData){
			$get_flg = true;
		}
		
		$actionType = null;
		
		if($post_flg == true && $get_flg == true){
			$actionType = 1 ; // 検索ボタンアクション
			
		}else if($post_flg == true && $get_flg == false){
			$actionType = 1 ; // 検索ボタンアクション
			
		}else if($post_flg == false && $get_flg == true){
			
			// GETのパラメータを判定してアクション種別を取得する
			$actionType = $this->judgActionTypeByGet($getData);
			
		}else if($post_flg == false && $get_flg == false){
			$actionType = 0 ; // 初期表示アクション
			
		}
		
		return $actionType;
	}
	
	/**
	 * GETのパラメータを判定してアクション種別を取得する
	 * @param array $getData GETリクエストのパラメータ
	 * @return int アクション種別  0:初期表示、 2:ページネーション、 3:ソート
	 */
	private function judgActionTypeByGet($getData){
		
		// GETパラメータにkj_○○というフィールドが存在したらアクション種別は「初期表示」と判定する
		foreach($getData as $key => $dummy){
			$s3 =mb_substr($key,0,3);
			if($s3 == 'kj_'){
				return 0; // 初期表示
			}
		}
		
		// ソートアクションの判定
		if(isset($getData['page_no']) && isset($getData['row_limit']) && isset($getData['sort_field'])){
			return 3; // ソート
		}
		
		// ページネーションアクションの判定
		else if(isset($getData['page_no']) && isset($getData['row_limit']) && !isset($getData['sort_field'])){
			return 2; // ページネーション・アクション
		}
		
		return 0; // その他は初期表示
	}
	
	
	
	
	/**
	 * 当画面に関連するセッションをすべてクリアする
	 *
	 */
	public function sessionClear(){
		
		$page_code = $this->main_model_name_s; // スネーク記法のページコード（モデル名）
		$pageCode = $this->main_model_name; // スネーク記法のページコード（キャメル記法）
		
		$fd_ses_key=$page_code.'_sorter_field_data';//フィールドデータのセッションキー
		$tf_ses_key=$page_code.'_table_fields';//一覧列情報のセッションキー
		$err_ses_key=$page_code.'_err';//入力エラー情報のセッションキー
		$page_ses_key=$pageCode.'_page_param';//ページパラメータのセッションキー
		$kjs_ses_key=$pageCode;	//検索条件情報のセッションキー
		$csv_ses_key=$page_code.'_kjs';//CSV用のセッションキー
		$mains_ses_key = $page_code.'_mains_cb';//主要パラメータのセッションキー
		$ini_cnds_ses_key = $page_code.'_ini_cnds';// 初期条件データのセッションキー
		
		
		
		$this->Session->delete($fd_ses_key);
		$this->Session->delete($tf_ses_key);
		$this->Session->delete($err_ses_key);
		$this->Session->delete($page_ses_key);
		$this->Session->delete($kjs_ses_key);
		$this->Session->delete($csv_ses_key);
		$this->Session->delete($mains_ses_key);
		$this->Session->delete($ini_cnds_ses_key);
		
	}
	
	/**
	 * フィールドデータに関する処理
	 *
	 * @param array $def_field_data コントローラで定義しているフィールドデータ
	 * @param string $page_code ページコード（モデル名）
	 * @return array res
	 * - table_fields 一覧列情報
	 */
	private function exe_field_data($def_field_data,$page_code){
		
		//フィールドデータをセッションに保存する
		$fd_ses_key=$page_code.'_sorter_field_data';
		
		//一覧列情報のセッションキー
		$tf_ses_key = $page_code.'_table_fields';
		
		//セッションキーに紐づくフィールドデータを取得する
		//$field_data=$this->Session->read($fd_ses_key);■■■□□□■■■□□□
		$field_data = $this->getSession($fd_ses_key);
		
		$table_fields=[];//一覧列情報
		
		//フィールドデータが空である場合
		if(empty($field_data)){
			
			//定義フィールドデータをフィールドデータにセットする。
			$field_data=$def_field_data;
			
			//defをactiveとして取得。
			$active=$field_data['def'];
			
			//列並番号でデータを並び替える。データ構造も変換する。
			//$active=$this->CrudBase->sortAndCombine($active);■■■□□□■■■□□□
			$active=$this->sortAndCombine($active);
			$field_data['active']=$active;
			
			//セッションにフィールドデータを書き込む
			//$this->Session->write($fd_ses_key,$field_data);■■■□□□■■■□□□
			$this->setSession($fd_ses_key, $field_data);
			
			//フィールドデータから一覧列情報を作成する。
			//$table_fields=$this->CrudBase->makeTableFieldFromFieldData($field_data);;■■■□□□■■■□□□
			$table_fields=$this->makeTableFieldFromFieldData($field_data);

			
			//セッションに一覧列情報をセットする。
			//$this->Session->write($tf_ses_key,$table_fields);■■■□□□■■■□□□
			$this->setSession($tf_ses_key,$table_fields);
			
		}
		
		//セッションから一覧列情報を取得する。
		if(empty($table_fields)){
			//$table_fields = $this->Session->read($tf_ses_key);■■■□□□■■■□□□
			$table_fields = $this->getSession($tf_ses_key);
			if($table_fields == null) $table_fields = [];
		}

		$res['table_fields']=$table_fields;
		$res['field_data']=$field_data;
		
		return $res;
		
	}
	
	
	/**
	 * 列並替アクティブデータの昇順ソートと構造変換を行う。
	 *
	 *  列並替アクティブデータはフィールデータに含まれており、現在の列並び状態を表す。
	 *
	 * @param array $active	列並替アクティブデータ
	 * @return 列並替アクティブ(昇順ソート適用、構造変換後）
	 */
	private function sortAndCombine($active){
		
		//構造変換
		$data=array();
		foreach($active as $id=>$ent){
			$ent['id']=$id;
			$data[]=$ent;
		}
		
		//列並番号でデータを並び替える
		$sorts=HashCustom::extract($data, '{n}.clm_sort_no');
		array_multisort($sorts,SORT_ASC,$data);
		
		return $data;
	}
	
	
	/**
	 * フィールドデータが空でなければ、フィールドデータから一覧列情報を作成する。
	 * @param array $field_data フィールドデータ
	 * @return array 一覧列情報
	 */
	private function makeTableFieldFromFieldData($field_data){
		$fields=array();
		$clms=$field_data['active'];
		
		foreach($clms as $clm){
			$row_order = $clm['row_order'];
			$name = $clm['name'];
			$fields[$row_order] = $name;
		}
		
		return $fields;
	}
	
	
	
	
	
	
	/**
	 * フィールドデータから列表示配列を取得
	 * @param array $field_data フィールドデータ
	 * @return array 列表示配列
	 */
	private function exstractClmShowHideArray($field_data){
		
		$csh_ary=array();
		if(!empty($field_data)){
			$csh_ary=HashCustom::extract($field_data, 'active.{n}.clm_show');
		}
		return $csh_ary;
	}
	
	/**
	 * indexアクションの共通処理（後）
	 *
	 * @param array $crudBaseData
	 * @param $option
	 *  - pagenation_param ページネーションの目次に付加するパラメータ
	 *  - method_url 基本URLのメソッド部分
	 * @return $param
	 */
	public function indexAfter(&$param,$option=array()){

		$method_url = '';
		if(!empty($option['method_url'])) $method_url = '/' . $option['method_url'];
		
		// 検索データ数を取得
		$kjs = $param['kjs'];
		//$data_count=$this->MainModel->findDataCnt($kjs);//■■■□□□■■■□□□
		$data_count=$param['data_count'];
		
		//ページネーション情報を取得する
		$base_url = $this->webroot . $this->main_model_name_s . $method_url; // 基本ＵＲＬ
		$pages = $param['pages'];

		$pagenation_param = null;
		if(isset($option['pagenation_param'])) $pagenation_param = $option['pagenation_param'];
		$this->CrudBasePagenation = new CrudBasePagenation();
		$pages = $this->CrudBasePagenation->createPagenationData($pages,$data_count,$base_url , $pagenation_param,$this->table_fields,$kjs);
		
		$kjs_json = json_encode($kjs,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
		// 行入替機能フラグを取得する
		$row_exc_flg = $this->getRowExcFlg($param,$pages);
		
		$referer_url = empty($_SERVER['HTTP_REFERER']) ? '' : $_SERVER['HTTP_REFERER']; // リファラURL
		
		// 現在URLを組み立てる
		$now_url = (empty($_SERVER["HTTPS"]) ? "http://" : "https://") . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
		
		$param['pages'] = $pages; // ページネーション情報
		$param['data_count'] = $data_count; // 検索データ数
		$param['kjs_json'] = $kjs_json; // 検索条件ＪＳＯＮ
		$param['base_url'] = $base_url; // 基本URL
		$param['referer_url'] = $referer_url; // リファラURL
		$param['now_url'] = $now_url; // 現在URL
		$param['row_exc_flg'] = $row_exc_flg; // 行入替機能フラグ  0:行入替ボタンは非表示 , 1:表示
		
		
		//$this->Session->write($this->main_model_name_s.'_pages',$pages);■■■□□□■■■□□□
		$this->setSession($this->main_model_name_s.'_pages', $pages);
		
		return $param;
	}
	
	
	/**
	 * 初期条件データを取得する
	 * @param array $crudBaseData
	 * @param array $pages ページネーション情報
	 * @return array 初期条件データ
	 */
	private function getIniCnds(&$crudBaseData,&$pages){
		
		$iniCnds = null; // 初期条件データ
		$ses_key = $this->main_model_name_s.'_ini_cnds';
		
		//アクションフラグが空である場合
		if(empty($crudBaseData['act_flg'])){
			
			// 初期条件データにセットする
			$iniCnds = array('kjs' => $crudBaseData['kjs'],'pages'=>$pages);
			
			// ‎セッションにデータをセット
			//$this->Session->write($ses_key,$iniCnds);// ■■■□□□■■■□□□
			$this->setSession($ses_key,$iniCnds);
		}
		else{
			// 		セッションにデータが存在する場合
			//$iniCnds = $this->Session->read($ses_key);// ■■■□□□■■■□□□
			$iniCnds = $this->getSession($ses_key);
			
			if(empty($iniCnds)){
				
				$iniCnds = array('kjs' => $crudBaseData['kjs'],'pages'=>$pages);
				//$this->Session->write($ses_key,$iniCnds);■■■□□□■■■□□□
				$this->setSession($ses_key, $iniCnds);
			}
			
		}
		
		return $iniCnds;
	}
	
	
	
	/**
	 * 行入替機能フラグを取得する
	 * @param array $crudBaseData
	 * @param array $pages ページネーション情報
	 * @return int 行入替機能フラグ 1:ボタン表示 , 0:ボタン非表示
	 */
	private function getRowExcFlg(&$crudBaseData,&$pages){
		
		// 初期条件データを取得する
		$iniCnds = $this->getIniCnds($crudBaseData,$pages);
		
		// 検索条件情報の初期データと現在データを比較する。
		$iKjs = $iniCnds['kjs']; // 初期の検索条件情報
		$aKjs = $crudBaseData['kjs']; // 現在条件情報
		foreach($aKjs as $field => $a_value){
			
			if($field == 'row_limit') continue;
			
			$i_value = null;
			if(isset($iKjs[$field])) $i_value = $iKjs[$field];
			
			// ゼロ比較
			if($this->_compare0($a_value, $i_value)){
				continue;
			}else{
				return 0;
			}
			
		}
		
		// ページネーション情報の初期データと現在データを比較する。
		$list = ['sort_field','sort_desc'];
		
		$iPages = $iniCnds['pages']; // 初期のページネーション情報
		
		foreach( $list as $field){
			
			$a_value = null;
			if(isset($pages[$field])) $a_value = $pages[$field];
			
			$i_value = null;
			if(isset($iPages[$field])) $i_value = $iPages[$field];
			
			// ゼロ比較
			if($this->_compare0($a_value, $i_value)){
				continue;
			}else{
				return 0;
			}
		}
		
		return 1; // 一致判定
		
	}
	
	
	/**
	 * ユーザー情報を取得する
	 *
	 * @return array ユーザー情報
	 * - ユーザー名
	 * - IPアドレス
	 * - ユーザーエージェント
	 */
	public function getUserInfo(){
		
		// ■■■□□□■■■□□□
// 		$userInfo = $this->Auth->user();
		
// 		$userInfo['update_user'] = $userInfo['username'];// 更新ユーザー

		$userInfo = [];
		$userInfo['ip_addr'] = $_SERVER["REMOTE_ADDR"];// IPアドレス
		$userInfo['user_agent'] = $_SERVER['HTTP_USER_AGENT']; // ユーザーエージェント
		
		// 権限が空であるならオペレータ扱いにする
		if(empty($userInfo['role'])){
			$userInfo['role'] = 'oparator';
		}
		
		// 権限データを取得してセットする
		$userInfo['authority'] = $this->getAuthority($userInfo['role']);
		
		return $userInfo;
	}
	
	/**
	 * 許可権限リストを作成(扱える下位権限のリスト）
	 * @return array 許可権限リスト
	 */
	protected function makePermRoles(){
		
		$userInfo = $this->getUserInfo(); // 現在のログインユーザー情報を取得する
		$authData = $this->getAuthorityData();// 権限データを取得する
		
		// 許可権限リストを権限データをフィルタリングして取得する
		$permRoles = array(); // 許可権限リスト
		$role = $userInfo['authority']['name']; // 権限名
		if($role == 'master'){
			$permRoles = array_keys($authData);
		}else{
			$level = $userInfo['authority']['level']; // 権限レベル
			foreach($authData as $aEnt){
				if($aEnt['level'] < $level){
					$permRoles[] = $aEnt['name'];
				}
			}
		}
		
		return $permRoles;
		
	}
	
	/**
	 * 権限に紐づく権限エンティティを取得する
	 * @param string $role 権限
	 * @return array 権限エンティティ
	 */
	protected function getAuthority($role){
		
		// 権限データを取得する
		$authorityData = $this->getAuthorityData();
		
		$authority = array();
		if(!empty($authorityData[$role])){
			$authority = $authorityData[$role];
		}
		
		return $authority;
	}
	
	/**
	 * 権限リストを取得する
	 * @return array 権限リスト
	 */
	protected function getRoleList(){
		
		$role = $this->userInfo['authority']['name']; // 現在の権限を取得
		$data = $this->getAuthorityData();
		$roleList = array(); // 権限リスト
		if($role == 'master'){
			$roleList = HashCustom::combine($data, '{s}.name','{s}.wamei');
		}else{
			$level = $this->userInfo['authority']['level'];
			foreach($data as $ent){
				if($level > $ent['level']){
					$name = $ent['name'];
					$wamei = $ent['wamei'];
					$roleList[$name] = $wamei;
				}
			}
		}
		
		return $roleList;
	}
	
	/**
	 * 権限データを取得する
	 * @return array 権限データ
	 */
	protected function getAuthorityData(){
		$data=array(
			'master'=>array(
				'name'=>'master',
				'wamei'=>'マスター',
				'level'=>41,
			),
			'developer'=>array(
				'name'=>'developer',
				'wamei'=>'開発者',
				'level'=>40,
			),
			'admin'=>array(
				'name'=>'admin',
				'wamei'=>'管理者',
				'level'=>30,
			),
			'client'=>array(
				'name'=>'client',
				'wamei'=>'クライアント',
				'level'=>20,
			),
			'oparator'=>array(
				'name'=>'oparator',
				'wamei'=>'オペレータ',
				'level'=>10,
			),
			
		);
		
		return $data;
	}
	
// 	/**■■■□□□■■■□□□
// 	 * editアクションの共通処理
// 	 *
// 	 * エンティティ、入力エラーメッセージ、モードを取得します。
// 	 * エンティティはテーブルのレコードのことです。
// 	 * エラーメッセージは登録ボタン押下時の入力エラーメッセージです。
// 	 *
// 	 * @param $name 対象モデル名（キャメル記法）
// 	 * @return array
// 	 * - noData <bool> true:エンティティが空(※非推奨)
// 	 * - ent <array> エンティティ（テーブルのレコード）$this
// 	 * - errMsg <string> 入力エラーメッセージ
// 	 * - mode <string> new:新規入力モード, edit:編集モード
// 	 *
// 	 */
// 	protected function edit_before($name){
// 		$this->MainModel=ClassRegistry::init($name);
// 		$this->main_model_name=$name;
// 		$this->main_model_name_s=$this->snakize($name);
		
// 		App::uses('Sanitize', 'Utility');//インクルード
		
// 		$err=$this->Session->read($this->main_model_name_s.'_err');
// 		$this->Session->delete($this->main_model_name_s.'_err');
// 		$noData=false;
// 		$ent=null;
// 		$errMsg=null;
// 		$mode=null;
		
// 		//入力エラー情報が空なら通常の遷移
// 		if(empty($err)){
			
// 			$id=$this->getGet('id');//GETからIDを取得
			
// 			//IDがnullなら新規登録モード
// 			if(empty($id)){
				
// 				$ent=$this->getDefaultEntity();
// 				$mode='new';//モード（new:新規追加  edit:更新）
				
// 				//IDに数値がある場合、編集モード。
// 			}else if(is_numeric($id)){
				
// 				//IDに紐づくエンティティをDBより取得
// 				$ent=$this->MainModel->findEntity($id);
// 				$mode='edit';//モード（new:新規追加  edit:更新）
				
// 			}else{
				
// 				//数値以外は「NO DATA」表示
// 				$noData=true;
// 			}
			
// 		}
		
// 		//入力エラーによる再遷移の場合
// 		else{
			
// 			$ent=$err['ent'];
// 			$mode=$err['mode'];
// 			$errMsg=$err['errMsg'];
			
// 			//エンティティには入力フォーム分のフィールドしか入っていないため、不足分のフィールドをDBから取得しマージする
// 			$ent2=$this->MainModel->findEntity($ent['id']);
// 			$ent=HashCustom::merge($ent2,$ent);
			
// 		}
		
// 		//リファラを取得
// 		$referer = ( !empty($this->params['url']['referer']) ) ? $this->params['url']['referer'] : null;
		
// 		$this->set(array(
// 			'noData'=>$noData,
// 			'mode'=>$mode,
// 			'errMsg'=>$errMsg,
// 			'referer'=>$referer,
// 		));
		
// 		$ret=array(
// 			'ent'=>$ent,
// 			'noData'=>$noData,
// 			'errMsg'=>$errMsg,
// 			'mode'=>$mode,
// 			'referer'=>$referer,
// 		);
		
		
// 		return $ret;
		
// 	}
	
	/**
	 * regアクション用の共通処理
	 *
	 * 結果エンティティとモードを取得します。
	 * 結果エンティティは登録したエンティティで、また全フィールドを持っています。
	 * @param string $name 対象モデル名
	 * @return array
	 * - ent <array> 結果エンティティ
	 * - mode <string> new:新規入力モード,edit:編集モード
	 *
	 */
	protected function reg_before($name){
		$this->MainModel=ClassRegistry::init($name);
		$this->main_model_name=$name;
		$this->main_model_name_s=$this->snakize($name);
		
		//リロードチェック
		if(empty($this->ReloadCheck)){
			App::uses('ReloadCheck','Vendor/CrudBase');
			$this->ReloadCheck=new ReloadCheck();
		}
		
		if ($this->ReloadCheck->check()!=1){//1以外はリロードと判定し、一覧画面へリダイレクトする。
			return $this->redirect(array('controller' => $this->main_model_name_s, 'action' => 'index'));
		}
		
// 		// ■■■□□□■■■□□□
// 		App::uses('Sanitize', 'Utility');//インクルード
		
		$ent=$this->getEntityFromPost();
		
		$mode=$this->request->data[$this->main_model_name]['mode'];
		$errMsg=$this->valid($ent,$this->edit_validate);
		
		if(isset($errMsg)){
			
			//エラー情報をセッションに書き込んで、編集画面にリダイレクトで戻る。
			$err=array('mode'=>$mode,'ent'=>$ent,'errMsg'=>$errMsg);
			//$this->Session->write($this->main_model_name_s.'_err',$err);■■■□□□■■■□□□
			$this->setSession($this->main_model_name_s.'_err',$err);
			$this->redirect(array('action' => 'edit'));
			
			return null;
		}
		
		//更新関係のパラメータをエンティティにセットする。
		$ent=$this->setUpdateInfo($ent,$mode);
		
		//リファラを取得
		$referer = ( !empty($this->request->data[$this->main_model_name]['referer']) ) ? $this->request->data[$this->main_model_name]['referer'] : null;
		
		$this->set(array(
			'mode'=>$mode,
			'referer'=>$referer,
		));
		
		$res = array(
			'ent'=>$ent,
			'mode'=>$mode,
			'referer'=>$referer,
		);
		
		return $res;
		
		
	}
	
	/**
	 * 編集画面へリダイレクトで戻ります。その際、入力エラーメッセージも一緒に送られます。
	 *
	 * @param string $errMsg 入力エラーメッセージ
	 * @return なし。（編集画面に遷移する）
	 */
	protected function errBackToEdit($errMsg){
		
		$ent=$this->getEntityFromPost();
		$mode=$this->request->data[$this->main_model_name]['mode'];
		
		//エラー情報をセッションに書き込んで、編集画面にリダイレクトで戻る。
		$err=array('mode'=>$mode,'ent'=>$ent,'errMsg'=>$errMsg);
		//$this->Session->write($this->main_model_name_s.'_err',$err);■■■□□□■■■□□□
		$this->setSession($this->main_model_name_s.'_err', $err);
		$this->redirect(array('action' => 'edit'));
		
	}
	
	
	/**
	 * 検索条件のバリデーション
	 *
	 * 引数のデータを、バリデーション情報を元にエラーチェックを行います。
	 * その際、エラーがあれば、エラーメッセージを作成して返します。
	 *
	 * @param array $data バリデーション対象データ
	 * @param array $validate バリデーション情報
	 * @return string 正常な場合、nullを返す。異常値がある場合、エラーメッセージを返す。
	 */
	protected function valid($data,$validate){
		
		$errMsg=null;
		
		// ■■■□□□■■■□□□保留中
		
		// ■■■□□□■■■□□□
// 		//▽バリデーション（入力チェック）を行い、正常であれば、改めて検索条件情報を取得。
// 		$this->MainModel->validate=$validate;
		
// 		$this->MainModel->set($data);
// 		if (!$this->MainModel->validates($data)){
			
// 			////入力値に異常がある場合。（エラーメッセージの出力仕組みはcake phpの仕様に従う）
// 			$errors=$this->MainModel->validationErrors;//入力チェックエラー情報を取得
// 			if(!empty($errors)){
				
// 				foreach ($errors  as  $err){
					
// 					foreach($err as $val){
						
// 						$errMsg.= $val.' ： ';
						
// 					}
// 				}
				
// 			}
			
// 		}
		
		return $errMsg;
	}
	
	/**
	 * POST,またはSESSION,あるいはデフォルトから検索条件情報を取得します。
	 *
	 * @param $formKey form要素のキー。通常はモデル名をキーにしているので、モデルを指定すれば良い。
	 * @return array 検索条件情報
	 */
	protected function getKjs($formKey){
		
		$def=$this->getDefKjs();//デフォルトパラメータ
		$keys=$this->getKjKeys();//検索条件キーリストを取得
		$kjs=$this->getParams($keys,$formKey,$def);
		
		foreach($kjs as $k=>$v){
			if(is_array($v)){
				$kjs[$k]=$v;
			}else{
				$kjs[$k]=trim($v);
			}
			
		}
		
		//SQLインジェクション対策
		foreach($kjs as $i => $kj){
			if(!empty($kj)){
				$kjs[$i] = str_replace("'", '\'', $kj);
			}
		}
		
		return $kjs;
		
	}
	
	
	/**
	 * 検索条件キーリストを取得
	 *
	 * 検索条件情報からname要素だけを、キーリストとして取得します。
	 * @return array 検索条件キーリスト
	 */
	protected function getKjKeys(){
		
		if(empty($this->m_kj_keys)){
			foreach($this->kensakuJoken as $ent){
				$this->m_kj_keys[]=$ent['name'];
			}
		}
		
		return $this->m_kj_keys;
	}
	
	/**
	 * デフォルト検索条件を取得
	 *
	 * 検索条件情報からdef要素だけを、デフォルト検索条件として取得します。
	 * @return array デフォルト検索条件
	 */
	protected function getDefKjs(){
		
		if(empty($this->m_kj_defs)){
			foreach($this->kensakuJoken as $ent){
				$this->m_kj_defs[$ent['name']]=$ent['def'];
			}
		}
		
		return $this->m_kj_defs;
		
	}
	
	/**
	 * SESSION,あるいはデフォルトから検索条件情報を取得する
	 *
	 * @param string $formKey モデル名、またはformタグのname要素
	 * @return array 検索条件情報
	 */
	protected function getKjsSD($formKey){
		
		$def=$this->getDefKjs();//デフォルトパラメータ
		$keys=$this->getKjKeys();
		$kjs=$this->getParamsSD($keys,$formKey,$def);
		
		return $kjs;
	}
	
	/**
	 *
	 * POSTからデータを取得。ついでにサニタイズする。
	 *
	 * POSTからデータを取得する際、ついでにサニタイズします。
	 * サニタイズはSQLインジェクション対策用です。
	 *
	 * @param string $key リクエストキー
	 * @return string リクエストの値
	 *
	 */
	protected function getPost($key){
		$v=null;
		if(isset($this->request->data[$this->main_model_name][$key])){
			$v=$this->request->data[$this->main_model_name][$key];
			// ■■■□□□■■■□□□
			//$v=SanitizeCustom::escape($v);//SQLインジェクションのサニタイズ　// 何らかのバージョンによっては2重サニタイズになってしまう。
		}
		return $v;
	}
	
	
	/**
	 * GET情報（URLのクエリ）からページネーション情報を取得します。
	 *
	 * ページネーション情報は、ページ番号の羅列であるページ目次のほかに、ソート機能にも使われます。
	 *
	 * @param array $overData 上書きデータ
	 * @return array
	 * - page_no <int> 現在のページ番号
	 * - limit <int> 表示件数
	 * - sort_field <string> ソートする列フィールド
	 * - sort_desc <int> 並び方向。 0:昇順 1:降順
	 */
	protected function getPageParam($overData){
		//GETよりパラメータを取得する。
		$pages=$this->params['url'];

		// 上書き
		$pages=HashCustom::merge($pages,$overData);
		
		
		$defs=$this->getDefKjs();//デフォルト情報を取得
		
		//空ならデフォルトをセット
		if(empty($pages['page_no'])){
			$pages['page_no']=0;
		}
		if(empty($pages['row_limit'])){
			$pages['row_limit']=$defs['row_limit'];
		}
		if(empty($pages['sort_field'])){
			$pages['sort_field']=$this->defSortFeild;
		}
		if(!isset($pages['sort_desc'])){
			$pages['sort_desc']=$this->defSortType;//0:昇順 1:降順
		}
		
		
		return $pages;
	}
	
	
	/**
	 * サブミット時用のページネーション情報を取得
	 *
	 * GET情報（URLのクエリ）からページネーション情報を取得します。
	 * ついでにセッションへのページネーション情報を保存します。
	 * このメソッドはサブミット時の処理用です。
	 *
	 * @param array $kjs 検索条件情報。row_limitのみ利用する。
	 * @param $postData POST
	 * @return array ページネーション情報
	 * - page_no <int> ページ番号
	 * - limit <int> 表示件数
	 *
	 */
	protected function getPageParamForSubmit(&$kjs,&$postData){
		
		$pages =  array();
		$defs=$this->getDefKjs();//デフォルト情報を取得
		
		$pages['page_no'] = 0;
		
		if(isset($postData['row_limit'])){
			$pages['row_limit'] = $postData['row_limit'];
		}else{
			$pages['row_limit'] = $defs['row_limit'];;
		}
		
		if(isset($postData['sort_field'])){
			$pages['sort_field'] = $postData['sort_field'];
		}else{
			$pages['sort_field'] = $this->defSortFeild;;
		}
		
		if(isset($postData['sort_desc'])){
			$pages['sort_desc'] = $postData['sort_desc'];
		}else{
			$pages['sort_desc'] = $this->defSortType;//0:昇順 1:降順;
		}
		
		
		return $pages;
	}
	
	
	
	
	/**
	 * デフォルトからパラメータを取得する。
	 * @param string $keys キーリスト
	 * @param string $formKey フォームキー
	 * @param string $def デフォルトパラメータ
	 * @return array フォームデータ
	 */
	protected function getParamsSD($keys,$formKey,$def){
		
		$prms=null;
		foreach($keys as $key){
			$prms[$key] = $def[$key];
		}
		return $prms;
		
	}
	
	
	
	
	/**
	 * POST,GET,デフォルトのいずれかからパラメータリストを取得する
	 * @param array $keys キーリスト
	 * @param string $formKey フォームキー
	 * @param array $def デフォルトパラメータ
	 * @return array パラメータ
	 */
	protected function getParams($keys,$formKey,$def){
		
		$prms=null;
		foreach($keys as $key){
			$prms[$key]=$this->getParam($key, $formKey,$def);
		}
		
		return $prms;
	}
	
	/**
	 * POST,GET,SESSION,デフォルトのいずれかからパラメータを取得する。
	 * @param string $key パラメータのキー
	 * @param string $formKey フォームキー
	 * @param string $def デフォルトパラメータ
	 *
	 * @return array パラメータ
	 */
	protected function getParam($key,$formKey,&$def){
		$v=null;
		
		//POSTからデータ取得を試みる。
		if(isset($this->request->data[$formKey][$key])){
			$v=$this->request->data[$formKey][$key];
		}
		
		//GETからデータ取得を試みる。
		elseif(isset($this->params['url'][$key])){
			$v=$this->params['url'][$key];
		}
		
		//デフォルトのパラメータをセット
		else{
			$v=$def[$key];
		}
		
		return $v;
	}
	
	
	/**
	 * POST、ＧＥＴの順にキーに紐づく値を探して取得する。
	 *
	 * @param string $key キー
	 * @return string リクエスト値
	 */
	protected function getValueFromPostGet($key){
		$value = null;
		
		//POSTからデータ取得を試みる。
		$model_name = $this->main_model_name;
		if(isset($this->request->data[$model_name][$key])){
			$value = $this->request->data[$model_name][$key];
			return $value;
		}
		
		//GETからデータ取得を試みる。
		if(isset($this->params['url'][$key])){
			$value = $this->params['url'][$key];
			return $value;
		}
		
		return $value;
	}
	
	
	/**
	 * ＧＥＴ、POSTの順にキーに紐づく値を探して取得する。
	 *
	 * @param string $key キー
	 * @return string リクエスト値
	 */
	protected function getValueFromGetPost($key){
		$value = null;
		
		//GETからデータ取得を試みる。
		if(isset($this->params['url'][$key])){
			$value = $this->params['url'][$key];
			return $value;
		}
		
		//POSTからデータ取得を試みる。
		$model_name = $this->main_model_name;
		if(isset($this->request->data[$model_name][$key])){
			$value = $this->request->data[$model_name][$key];
			return $value;
		}
		
		return $value;
	}
	
	/**
	 * キャメル記法に変換
	 * @param string $str スネーク記法のコード
	 * @return string キャメル記法のコード
	 */
	protected function camelize($str) {
		$str = strtr($str, '_', ' ');
		$str = ucwords($str);
		return str_replace(' ', '', $str);
	}
	
	/**
	 * スネーク記法に変換
	 * @param string $str キャメル記法のコード
	 * @return string スネーク記法のコード
	 */
	protected function snakize($str) {
		$str = preg_replace('/[A-Z]/', '_\0', $str);
		$str = strtolower($str);
		return ltrim($str, '_');
	}
	
	
	/**
	 * 巨大データ判定
	 * @param array $kjs 検索条件情報
	 * @return int 巨大データフラグ 0:通常データ  1:巨大データ
	 *
	 */
	private function checkBigDataFlg($kjs){
		
		$bigDataFlg=0;//巨大データフラグ
		
		//制限行数
		$row_limit=0;
		if(empty($kjs['row_limit'])){
			return $bigDataFlg;
		}else{
			$row_limit=$kjs['row_limit'];
		}
		
		// 制限行数が巨大データ判定行数以上である場合
		if($row_limit >= $this->big_data_limit){
			
// 			// ■■■□□□■■■□□□
// 			App::uses('Sanitize', 'Utility');
			$kjs = SanitizeCustom::clean($kjs, array('encode' => false));
			
			// DBよりデータ件数を取得
			$cnt=$this->MainModel->findDataCnt($kjs);
			
			// データ件数が巨大データ判定行数以上である場合、巨大データフラグをONにする。
			if($cnt >= $this->big_data_limit){
				$bigDataFlg=1;
			}
			
		}
		
		return $bigDataFlg;
	}
	
	/**
	 * 巨大データフィールドを列並替に合わせて再ソートする
	 *
	 * @param array $big_data_fields 巨大データフィールド
	 * @param array $active アクティブフィールドデータ
	 * @return array ソート後の巨大データフィールド
	 */
	private function sortBigDataFields($big_data_fields,$active){
		
		//巨大データフィールドのキーと値を入れ替えて、マッピングを作成する。
		$map = array_flip($big_data_fields);
		
		//巨大データフィールドを列並替に合わせて再ソートする
		$big_data_fields2 = array();
		foreach($active as $ent){
			$f = $ent['id'];
			if(isset($map[$f])){
				$big_data_fields2[] = $f;
			}
		}
		
		return $big_data_fields2;
		
	}
	
	/**
	 * 検索条件情報からデフォルト検索JSONを取得する
	 *
	 * @note
	 * デフォルト検索JSONはリセットボタンの処理に使われます。
	 *
	 * @param array $noResets リセット対象外フィールドリスト 省略可
	 * @return string デフォルト検索JSON
	 */
	protected function getDefKjsJson($noResets=null){
		
		$kjs=$this->kensakuJoken;//メンバの検索条件情報を取得
		
		$defKjs=HashCustom::combine($kjs, '{n}.name','{n}.def');//構造変換
		
		//リセット対象外フィールドリストが空でなければ、対象外のフィールドをはずす。
		if(!empty($noResets)){
			foreach($noResets as $noResetField){
				unset($defKjs[$noResetField]);
			}
		}
		
		$def_kjs_json=json_encode($defKjs);//JSON化
		
		return $def_kjs_json;
	}
	
	
	
	
	
	////////// 編集画面用 ///////////////////////
	
	// ■■■□□□■■■□□□
// 	/**
// 	 * POSTからデータを取得
// 	 *
// 	 * @note
// 	 * SQLインジェクションのサニタイズも行われます。
// 	 * 編集画面の内部処理用です。
// 	 */
// 	protected function getGet($key){
// 		$v=null;
// 		if(isset($this->params['url'][$key])){
// 			$v=$this->params['url'][$key];
// 			$v=SanitizeCustom::escape($v);//SQLインジェクションのサニタイズ
			
// 		}
		
// 		return $v;
// 	}
	
// 	/**
// 	 * デフォルトエンティティを取得
// 	 *
// 	 * @note
// 	 * 編集画面の内部処理用です。
// 	 */
// 	protected function getDefaultEntity(){
		
// 		if(empty($this->m_edit_defs)){
// 			foreach($this->entity_info as $ent){
// 				$this->m_edit_defs[$ent['name']]=$ent['def'];
// 			}
// 		}
		
// 		return $this->m_edit_defs;
		
// 	}
	
	/**
	 * 編集エンティティのキーリストを取得
	 *
	 * @note
	 * 編集画面の内部処理用です。
	 */
	protected function getKeysForEdit(){
		if(empty($this->m_edit_keys)){
			foreach($this->entity_info as $ent){
				$this->m_edit_keys[]=$ent['name'];
			}
		}
		
		return $this->m_edit_keys;
	}
	
	
	////////// 登録完了画面用 ///////////////////////
	
	/**
	 * POSTからエンティティを取得する。
	 *
	 * @note
	 * 登録完了画面の内部処理用です。
	 */
	protected function getEntityFromPost(){
		
		$keys=$this->getKeysForEdit();
		foreach($keys as $key){
			$v=$this->getPost($key);
			$ent[$key]=trim($v);
		}
		
		return $ent;
	}
	
	/**
	 * 更新関係のパラメータをエンティティにセット。
	 *
	 * @note
	 * 登録完了画面の内部処理用です。
	 *
	 * @param array $ent エンティティ
	 * @param string $mode モード new or edit
	 * @return array 更新関係をセットしたエンティティ
	 */
	protected function setUpdateInfo($ent,$mode){
		
		//更新者をセット
		$user=$this->Auth->user();
		$ent['update_user']=$user['username'];
		
		//更新者IPアドレスをセット
		$ent['ip_addr'] = $_SERVER["REMOTE_ADDR"];
		
		//新規モードであるなら作成日をセット
		if($mode=='new'){
			$ent['created']=date('Y-m-d H:i:s');
		}
		
		//※更新日はDBテーブルにて自動設定されているので省略
		
		return $ent;
	}
	
	
	
	
	
	/**
	 * 拡張コピー　存在しないディテクトリも自動生成
	 *
	 * @note
	 * 日本語ファイルに対応
	 *
	 * @param string $sourceFn コピー元ファイル名
	 * @param string $copyFn コピー先ファイル名
	 * @param string $permission パーミッション（ファイルとフォルダの属性。デフォルトはすべて許可の777。8進数で指定する）
	 */
	protected function copyEx($sourceFn,$copyFn,$permission=0777){
		
		if(empty($this->CopyEx)){
			App::uses('CopyEx', 'Vendor/CrudBase');
			$this->CopyEx = $this->Animal=new CopyEx();
		}
		
		$this->CopyEx->copy($sourceFn,$copyFn,$permission);
		
	}
	
	/**
	 * 日本語ディレクトリの存在チェック
	 *
	 * @param string $dn ディレクトリ名
	 * @return boolean true:存在 , false:未存在
	 */
	protected function isDirEx($dn){
		$dn=mb_convert_encoding($dn,'SJIS','UTF-8');
		if (is_dir($dn)){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * パス指定によるディレクトリ作成（パーミッションをすべて許可）
	 *
	 * @note
	 * ディレクトリが既に存在しているならディレクトリを作成しない。
	 * パスに新しく作成せねばならないディレクトリ情報が複数含まれている場合でも、順次ディレクトリを作成する。
	 *
	 * @param string $path ディレクトリのパス
	 *
	 */
	protected function mkdir777($path,$sjisFlg=false){
		
		if(empty($this->MkdirEx)){
			App::uses('MkdirEx', 'Vendor/CrudBase');
			$this->MkdirEx = new MkdirEx();
		}
		
		$this->MkdirEx->mkdir777($path,$sjisFlg);
		
	}
	
	// 更新ユーザーなど共通フィールドをセットする。
	protected function setCommonToEntity($ent){
		
		// 更新ユーザーの取得とセット
		$update_user = $this->Auth->user('username');
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
		unset($ent['modified']);
		
		return $ent;
		
	}
	
	// 更新ユーザーなど共通フィールドをデータにセットする。
	protected function setCommonToData($data){
		
		// 更新ユーザー
		$update_user = $this->Auth->user('username');
		
		// ユーザーエージェント
		$user_agent = $_SERVER['HTTP_USER_AGENT'];
		$user_agent = mb_substr($user_agent,0,255);
		
		// IPアドレス
		$ip_addr = $_SERVER["REMOTE_ADDR"];
		
		// 本日
		$today = date('Y-m-d H:i:s');
		
		// データにセットする
		foreach($data as $i => $ent){
			
			$ent['update_user'] = $update_user;
			$ent['user_agent'] = $user_agent;
			$ent['ip_addr'] = $ip_addr;
			
			// idが空（新規入力）なら生成日をセットし、空でないなら除去
			if(empty($ent['id'])){
				$ent['created'] = $today;
			}else{
				unset($ent['created']);
			}
			
			// 更新日時は除去（DB側にまかせる）
			unset($ent['modified']);
			
			$data[$i] = $ent;
		}
		
		
		return $data;
		
	}
	
	
	
	/**
	 * 新バージョンであるかチェックする。
	 * @param string $this_page_version 当ページバージョン
	 * @return int 新バージョンフラグ  0:バージョン変更なし   1:新バージョンに変更されている
	 */
	public function checkNewPageVersion($this_page_version){
		
		$sesKey = $this->main_model_name_s.'_ses_page_version_cb';
		
		// セッションページバージョンを取得する
		//$ses_page_version = $this->Session->read($sesKey);■■■□□□■■■□□□
		$ses_page_version = $this->getSession($sesKey);
		
		// セッションページバージョンがセッションに存在しない場合
		if(empty($ses_page_version)){
			// 当ページバージョンを新たにセッションに保存し、バージョン変更なしを表す"0"を返す。
			//$this->Session->write($sesKey, $this_page_version);■■■□□□■■■□□□
			$this->setSession($sesKey, $this_page_version);
			return 0;
		}
		
		// セッションページバージョンがセッションに存在する場合
		else{
			
			// セッションページバージョンと当ページバージョンが一致する場合、バージョン変更なしを表す"0"を返す。
			if($this_page_version == $ses_page_version){
				return 0;
			}
			
			// セッションページバージョンと当ページバージョンが異なる場合、新バージョンによる変更を表す"1"を返す。
			else{
				//$this->Session->write($sesKey, $this_page_version);■■■□□□■■■□□□
				$this->setSession($sesKey, $this_page_version);
				return 1;
			}
		}
		
	}
	
	
	/**
	 * 主要パラメータをkjsにセットする。
	 *
	 * @note
	 * kj_idなど特に主要なパラメータをセットする。
	 * 主要パラメータを単にリクエストで保持すると、常にそのパラメータを受け渡しをしなければならず不便である。
	 * 当メソッドでは、主要パラメータをセッションで保持し、リクエストで主要パラメータを保持する必要がなくなる。
	 *
	 * @param string $mains 主要パラメータのキー。配列指定も可能。
	 * @param array $kjs 検索条件情報
	 * @param array kjs( 検索条件情報)
	 */
	protected function setMainsToKjs($mains,$kjs){
		
		// 配列でないなら配列化する
		if(!is_array($mains)){
			$mains = array($mains);
		}
		
		// 主要パラメータのセッションキー
		$sesKey = $this->main_model_name_s.'_mains_cb';
		
		// セッションで保持している主要パラメータ
		$sesMains = array();
		
		// kjsに主要パラメータをセットする。
		foreach($mains as $key){
			
			// kjs内のパラメータが空である場合
			if(empty($kjs[$key])){
				
				// セッションの主要パラメータが空ならセッションから取得
				if(empty($sesMains)){
					//$sesMains = $this->Session->read($sesKey);■■■□□□■■■□□□
					$sesMains = $this->getSession($sesKey);
				}
				
				// セッションのパラメータをkjsにセットする
				if(!empty($sesMains[$key])){
					$kjs[$key] = $sesMains[$key];
				}
				
			}else{
				$sesMains[$key] = $kjs[$key];
			}
		}
		
		// 主要パラメータをセッションで保持する。
		//$this->Session->write($sesKey,$sesMains);■■■□□□■■■□□□
		$this->setSession($sesKey,$sesMains);
		
		return $kjs;
		
	}
	
	
	/**
	 * AJAX | 一覧のチェックボックス複数選択による一括処理
	 * @return string
	 */
	public function ajax_pwms(){
		
// 		//■■■□□□■■■□□□
// 		App::uses('Sanitize', 'Utility');
		
		$this->autoRender = false;//ビュー(ctp)を使わない。
		
		$json_param=$_POST['key1'];
		
		$param=json_decode($json_param,true);//JSON文字を配列に戻す
		
		// IDリストを取得する
		$ids = $param['ids'];
		
		// アクション種別を取得する
		$kind_no = $param['kind_no'];
		
		// 更新ユーザーを取得する
		$update_user = $this->Auth->user('username');
		
		$this->MainModel=ClassRegistry::init($this->name);
		
		// アクション種別ごとに処理を分岐
		switch ($kind_no){
			case 10:
				$this->MainModel->switchDeleteFlg($ids,0,$update_user); // 有効化
				break;
			case 11:
				$this->MainModel->switchDeleteFlg($ids,1,$update_user); // 削除化
				break;
			default:
				return "'kind_no' is unknown value";
				
		}
		
		return 'success';
	}
	
	
	/**
	 * パラメータ内の指定したフィールドが数値であるかチェックする
	 *
	 * @note
	 * リクエストパラメータ内のidなどを調べる。
	 * idにSQLインジェクションを引き起こすコードが入っていないかなどを調べる。
	 *
	 * @param array $param リクエストパラメータ
	 * @param array $numProps 数値フィールドリスト： チェック対象のフィールドを配列で指定する
	 * @return bool 指定したフィールドに紐づくパラメータの値のうち、一つでも数値でないものがあればfalseを返す。
	 */
	protected function checkNumberParam($param,$numProps=array('id')){
		
		foreach($numProps as $field){
			if(!is_numeric($param[$field])){
				return false;
			}
		}
		return true;
	}
	
	
	
	/**
	 * 0以外の空判定
	 *
	 * @note
	 * いくつかの空値のうち、0と'0'は空と判定しない。
	 *
	 * @param $value
	 * @return int 判定結果 0:空でない , 1:空である
	 */
	protected function _empty0($value){
		if(empty($value) && $value!==0 && $value!=='0'){
			return 1;
		}
		return 0;
	}
	
	
	/**
	 *	ゼロ比較
	 *
	 * @note
	 * 比較用のカスタマイズ関数。
	 * ただし、空の値の比較は0とそれ以外の空値（null,"",falseなど）で仕様が異なる。
	 * 0とそれ以外の空値（null,"",falseなど）は不一致のみなす。
	 * 0と'0'は一致と判定する。
	 * null,'',falseのそれぞれの組み合わせは一致である。
	 * bool型のtrueは数字の1と同じ扱い。（※通常、2や3でもtrueとするが、この関数では1だけがtrue扱い）
	 * 1.0 , 1 , '1' など型が異なる数値を一致と判定する。
	 *
	 * @param $a_value
	 * @param $b_value
	 * @return bool false:不一致 , true:一致
	 */
	function _compare0($a_value,$b_value){
		if(empty($a_value) && empty($b_value)){
			if($a_value === 0 || $a_value === '0'){
				if($b_value === 0 || $b_value === '0'){
					return true;
				}else{
					return false;
				}
				
			}else{
				if($b_value === 0 || $b_value === '0'){
					return false;
				}else{
					return true;
				}
				
			}
			
		}else{
			
			if(gettype($a_value) == 'boolean'){
				if($a_value){
					$a_value = 1;
				}else{
					$a_value = 0;
				}
			}
			if(gettype($b_value) == 'boolean'){
				if($b_value){
					$b_value = 1;
				}else{
					$b_value = 0;
				}
			}
			
			
			if(is_numeric($a_value) && is_numeric($b_value)){
				if($a_value == $b_value) return true;
			}else{
				if($a_value === $b_value) return true;
				
			}
		}
		
		return false;
	}
	
	/**
	 * テンプレートからファイルパスを組み立てる
	 * @param array $FILES $_FILES
	 * @param string $path_tmpl ファイルパステンプレート
	 * @param array $ent エンティティ
	 * @param string $field
	 * @param string $date
	 * @return string ファイルパス
	 */
	protected function makeFilePath(&$FILES, $path_tmpl, $ent, $field, $date=null){
		
		// $_FILESにアップロードデータがなければ、既存ファイルパスを返す
		if(empty($FILES[$field])){
			return $ent[$field];
		}
		
		$fp = $path_tmpl;
		
		if(empty($date)){
			$date = date('Y-m-d H:i:s');
		}
		$u = strtotime($date);
		
		// ファイル名を置換
		$fn = $FILES[$field]['name']; // ファイル名を取得
		
		// ファイル名が半角英数字でなければ、日時をファイル名にする。（日本語ファイル名は不可）
		if (!preg_match("/^[a-zA-Z0-9-_.]+$/", $fn)) {
			
			// 拡張子を取得
			$pi = pathinfo($fn);
			$ext = $pi['extension'];
			if(empty($ext)) $ext = 'png';
			$fn = date('Y-m-d_his',$u) . '.' . $ext;// 日時ファイル名の組み立て
		}
		
		$fp = str_replace('%fn', $fn, $fp);
		
		// フィールドを置換
		$fp = str_replace('%field', $field, $fp);
		
		// 日付が空なら現在日時をセットする
		$Y = date('Y',$u);
		$m = date('m',$u);
		$d = date('d',$u);
		$H = date('H',$u);
		$i = date('i',$u);
		$s = date('s',$u);
		
		$fp = str_replace('%Y', $Y, $fp);
		$fp = str_replace('%m', $m, $fp);
		$fp = str_replace('%d', $d, $fp);
		$fp = str_replace('%H', $H, $fp);
		$fp = str_replace('%i', $i, $fp);
		$fp = str_replace('%s', $s, $fp);
		
		return $fp;
		
	}
	
	// ■■■□□□■■■□□□
// 	/**
// 	 * indexアクションの共通後処理
// 	 * @param array $param 
// 	 * - kjs 検索条件情報
// 	 * - found_row_count データ件数 （検索条件は適用されているが、LIMITがかかっていないデータ件数）
// 	 */
// 	public function index_after($param){

// 		$kjs = $param['kjs'];
// 		$found_row_count = $param['found_row_count'];

// 		$base_url = "?page={$this->page_name}&scr_key={$this->scr_key}";

// 		// フィールドデータをページ情報取得用に変換する
// 		$fields2 = array();
// 		foreach($this->field_data['def'] as $f => $ent){
// 			$wamei = $ent['name'];
// 			$fields2[$f] = $wamei;
// 		}
		
// 		// ページ情報を取得してパラメータへセットする。
// 		$pages=$this->pagenation->createPagenationData($found_row_count,$base_url , $kjs,$fields2);
// 		$this->params['pages'] = $pages;
		
		
// 	}
	
	
// 	/**
// 	 * GET（URIクエリ）など検索条件情報を取得する
// 	 * @param $req リクエスト
// 	 * @return 検索条件情報
// 	 */
// 	private function getKjs($req){
		
// 		$kjs = array(); // 検索条件情報
// 		foreach($this->kensakuJoken as $kjEnt){
// 			$kj_field = $kjEnt['name'];
// 			$kj_value = null;
			
// 			if(isset($req[$kj_field])){
// 				$kj_value = $req[$kj_field];
// 			}else{
// 				$kj_value =$kjEnt['def'];
// 			}
			
// 			$kjs[$kj_field] = $kj_value;
			
// 		}
// 		return $kjs;
// 	}
	
		
	
	
	
// 	/**
// 	 * ヘルパークラスのセッター
// 	 * @param object $helper ヘルパークラス（オブジェクト）
// 	 */
// 	public function setHelper($helper){
// 		$this->helper = $helper;
// 	}
	
// 	/**
// 	 * プラグインURLのセッター
// 	 * @param string $plugin_url プラグインURL
// 	 */
// 	public function setPluginUrl($plugin_url){
// 		$this->plugin_url = $plugin_url;
// 	}
	
// 	/**
// 	 * プラグインディレクトリパスのセッター
// 	 * @param string $plugin_dp プラグインディレクトリパス
// 	 */
// 	public function setPluginDp($plugin_dp){
// 		$this->plugin_dp = $plugin_dp;
// 	}
	
	
	
// 	// 更新ユーザーなど共通フィールドをデータにセットする。
// 	protected function setCommonToData($data){
	
// 		// 更新ユーザー
// 		$wpUser = wp_get_current_user();
// 		$update_user = $wpUser->data->user_login;
	
// 		// ユーザーエージェント
// 		$user_agent = $_SERVER['HTTP_USER_AGENT'];
// 		$user_agent = mb_substr($user_agent,0,255);
	
// 		// IPアドレス
// 		$ip_addr = $_SERVER["REMOTE_ADDR"];
	
// 		// 本日
// 		$today = date('Y-m-d H:i:s');
	
// 		// データにセットする
// 		foreach($data as $i => $ent){
	
// 			$ent['update_user'] = $update_user;
// 			$ent['user_agent'] = $user_agent;
// 			$ent['ip_addr'] = $ip_addr;
	
// 			// idが空（新規入力）なら生成日をセットし、空でないなら除去
// 			if(empty($ent['id'])){
// 				$ent['created'] = $today;
// 			}else{
// 				unset($ent['created']);
// 			}
	
// 			$ent['modified'] = $today;
	
	
// 			$data[$i] = $ent;
// 		}
	
	
// 		return $data;
	
// 	}
	
	
	
// 	// 更新ユーザーなど共通フィールドをセットする。
// 	protected function setCommonToEntity($ent){
	
// 		// 更新ユーザーの取得とセット
// 		$wpUser = wp_get_current_user();
// 		$update_user = $wpUser->data->user_login;
// 		$ent['update_user'] = $update_user;
	
// 		// ユーザーエージェントの取得とセット
// 		$user_agent = $_SERVER['HTTP_USER_AGENT'];
// 		$user_agent = mb_substr($user_agent,0,255);
// 		$ent['user_agent'] = $user_agent;
	
// 		// IPアドレスの取得とセット
// 		if(!empty($_SERVER["REMOTE_ADDR"])){
// 			$ent['ip_addr'] =$_SERVER["REMOTE_ADDR"];
// 		}
	
// 		// idが空（新規入力）なら生成日をセットし、空でないなら除去
// 		if(empty($ent['id'])){
// 			$ent['created'] = date('Y-m-d H:i:s');
// 		}else{
// 			unset($ent['created']);
// 		}
	
// 		// 更新日時は除去（DB側にまかせる）
// 		unset($ent['modified']);
	
	
// 		return $ent;
	
// 	}
	
	
	
// 	/**
// 	 * ビューにパラメータをセットする
// 	 * @param array $params
// 	 */
// 	protected function setX($params){
		
// 		// 共通のパラメータ
// 		$params['helper'] = $this->helper;
		
// 		// デフォルト検索条件情報をセット
// 		$params['defKjs'] = $this->kensakuJoken;
		
		
// 		$this->params = array_merge($this->params,$params);
		
// 	}
	
	
// 	/**
// 	 * テンプレートエンジンをレンダリングする。
// 	 * コンテンツをHTML文字列として取得する。
// 	 *
// 	 * @param string $template テンプレートファイルパス（View内からのファイルパス）
// 	 * @return string コンテンツHTML
// 	 */
// 	protected function renderX($template){
		
// 		extract($this->params);
// //		ob_start();
// 		$template_fp = dirname(__DIR__).'/View/'.$template;
// 		include $template_fp;
// //  		$html = ob_get_contents();
// //  		ob_end_clean();
	
//  //		return $html;
// 	}
	
	
	
// 	/**
// 	 * 列表示切替機能の初期設定JSONを作成する。
// 	 * @param array $field_data フィールドデータ
// 	 * @return string 初期設定JSON
// 	 */
// 	private function makeClmShowHideJson($field_data){
		
		

// 		$list = array(); // 初期設定リスト
		
// 		if(!empty($field_data)){
// 			foreach($field_data['def'] as $ent){
// 				$list[] = $ent['clm_show'];
// 			}
// 		}

// 		return json_encode($list,true);
// 	}
	
	
	
	
	
// 	/**
// 	 * SQLインジェクションサニタイズ
// 	 *
// 	 * @note
// 	 * SQLインジェクション対策のためデータをサニタイズする。
// 	 * 高速化のため、引数は参照（ポインタ）にしている。
// 	 *
// 	 * @param any サニタイズデコード対象のデータ | 値および配列を指定
// 	 * @return void
// 	 */
// 	protected function sql_sanitize(&$data){
	
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->sql_sanitize($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = addslashes($data);// SQLインジェクション のサニタイズ
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
// 	/**
// 	 * SQLサニタイズデコード
// 	 *
// 	 * @note
// 	 * SQLインジェクションでサニタイズしたデータを元に戻す。
// 	 * 高速化のため、引数は参照（ポインタ）にしている。
// 	 *
// 	 * @param any サニタイズデコード対象のデータ | 値および配列を指定
// 	 * @return void
// 	 */
// 	protected function sql_sanitize_decord(&$data){
	
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->sql_sanitize_decord($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = stripslashes($data);
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
// 	/**
// 	 * XSSエスケープ（XSSサニタイズ）
// 	 *
// 	 * @note
// 	 * XSSサニタイズ
// 	 * 記号「<>」を「&lt;&gt;」にエスケープする。
// 	 * 高速化のため、引数は参照（ポインタ）にしており、返値もかねている。
// 	 *
// 	 * @param any $data 対象データ | 値および配列を指定
// 	 * @return void
// 	 */
// 	protected function xss_escape(&$data){
		
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->xss_escape($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = str_replace(array('<','>'),array('&lt;','&gt;'),$data);
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
	
	
// 	/**
// 	 * XSSアンエスケープ（XSSサニタイズデコード）
// 	 *
// 	 * @note
// 	 * XSSエスケープされたデータを元に戻す。
// 	 * 高速化のため、引数は参照（ポインタ）にしており、返値もかねている。
// 	 *
// 	 * @param any $data 対象データ | 値および配列を指定
// 	 * @return void
// 	 */
// 	function xss_unescape(&$data){
		
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->xss_unescape($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = str_replace(array('&lt;','&gt;'),array('<','>'),$data);
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
	
	
	
// 	/**
// 	 * テーブル名にプリフィックスを付加する
// 	 * @param プロとテーブル名（プリフィックスなしのテーブル名）
// 	 * @return プリフィックスを付加したテーブル名
// 	 */
// 	protected function prefixTableName($proto_tbl_name){
// 		global $wpdb;
// 		$prefix = $wpdb->prefix; // プリフィックス
// 		$table_name = $prefix.'enqnx_'.$proto_tbl_name;
// 		return $table_name;
// 	}
	
	

	
// 	/**
// 	 * CSVダウンロード用のURLを作成
// 	 * @param array $kjs 検索条件情報
// 	 * @param string $actoin アクション名（画面コントローラのメソッド名）
// 	 * @return string CSVダウンロード用のURL
// 	 */
// 	protected function makeCsvDlUrl($kjs,$actoin){
		
// 		// 検索条件情報からURLクエリを取得する
// 		$kjs_uq = $this->makeUrlQuery($kjs);
		
// 		$site_url = site_url(); // 表示サイトのパス
// 		$url = "{$site_url}?download=true&page={$this->page_name}&scr_key={$this->scr_key}&act_key={$actoin}&{$kjs_uq}";
		
// 		return $url;
// 	}
	
	
// 	/**
// 	 * エンティティからURLに付加するURLクエリ文字列を作成する。
// 	 * @param array $ent エンティティ
// 	 * @param string $url_enc_flg URLエンコードフラグ  true:エンコード , false:エンコードしない
// 	 * @return string URLクエリ文字列 (例： &animal=neko&value1=99&a=1)
// 	 */
// 	protected function makeUrlQuery($ent,$url_enc_flg=true){
		
// 		if(empty($ent)){
// 			return '';
// 		}
		
// 		// URLエンコードフラグがTRUEならエンティティ内の文字列をURLエンコードする
// 		if($url_enc_flg){
// 			$this->urlencodeEx($ent);
// 		}
		
// 		$str_uq='';
// 		foreach($ent as $key => $val){
// 			if($val!==null && $val!==''){
// 				$str_uq=$str_uq.'&'.$key.'='.$val;
// 			}
// 		}
		
// 		$str_uq = mb_substr($str_uq,1); // 先頭の一文字を削る
		
// 		return $str_uq;
		
		
// 	}
	
// 	/**
// 	 * 拡張URLエンコード
// 	 *
// 	 * @note
// 	 * 多次元配列に対応
// 	 * 高速化のため、引数は参照（ポインタ）にしている。
// 	 *
// 	 * @param any $data URLエンコード対象データ（参照型） | 値および配列を指定
// 	 * @return void
// 	 */
// 	protected function urlencodeEx(&$data){
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->urlencodeEx($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = urlencode($data);// URLエンコード
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
	
	
// 	/**
// 	 * CSV用データに変換
// 	 * 
// 	 * @note
// 	 * 文字列型ならダブルクォートで括る
// 	 * 多次元配列に対応
// 	 * 高速化のため、引数は参照（ポインタ）であり返値もかねている。
// 	 * 
// 	 * @param array $data データ
// 	 * @return array CSV用のデータ
// 	 */
// 	protected function convToCsvData(&$data){
// 		if(is_array($data)){
// 			foreach($data as &$val){
// 				$this->convToCsvData($val);
// 			}
// 			unset($val);
// 		}elseif(gettype($data)=='string'){
// 			$data = str_replace('"','""',$data);
// 			$data = '"' . $data .'"';
// 		}else{
// 			// 何もしない
// 		}
// 	}
	
	
	
	
// 	/**
// 	 * CSVインポート | EAJAX
// 	 * 
// 	 * @param $model モデルクラス
// 	 * @param $checkFields チェックフィールドリスト： バリデーションで利用
// 	 *
// 	 */
// 	public function csv_fu_base(CrudBaseModelWp $model,$checkFields){
		
		
		
// 		// タイムアウトの制限を300秒にする。
// 		set_time_limit(300);
		
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		$err_msg = ''; // エラーメッセージ
		
// 		// ファイルアップロードからテキストまたは配列データを取得する
// 		$fuText = new FuText();
// 		$res = $fuText->getTextFromFiles($_FILES);
// 		if(!empty($res['err_msg'])){
// 			$err_msg .= $res['err_msg'] . '<br>';
// 		}
		
// 		// 配列データをアンケートデータEXとして取得する。（アンケートデータEXはアンケートデータに質問データと選択肢データを結合したデータ）
// 		$csvData = $res['data'];
		
// 		// チェックフィールドリストCSVデータのチェック
// 		$check_err_msg = $this->checkCsvByCheckFields($csvData,$checkFields);
// 		if(empty($check_err_msg)){
// 			global $wpdb;
// 			try {
				
// 				$wpdb->get_results("BEGIN");

// 				// 保存オプション
// 				$option = array(
// 						'table'=>'enquetes',
// 						'id_ins_flg'=>1, // 1:INSERT時にidをクリアしない
// 						'debug' => 0,// SQLデバッグ表示  0:表示しない 1:表示する
// 				);
				
// 				// アンケートテーブルへ保存
// 				$model->saveAll($csvData,$option);
				
// 				$wpdb->get_results("COMMIT");
				
// 			} catch (Exception $e) {
// 				$err_msg .= $e->getMessage() . '<br>';;
// 				$wpdb->get_results("ROLLBACK");
				
// 			}
// 		}else{
// 			$err_msg .= $check_err_msg. '<br>';
// 		}
		
// 		// エラーがあれば、エラーメッセージの組み立て
// 		if(!empty($err_msg)){
// 			$err_msg = 'エラー:<br>' . $err_msg;
// 		}
		
// 		$res_ent = array(
// 				'result'=>'success',
// 				'err_msg'=>$err_msg,
// 		);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo json_encode($res_ent,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
// 		exit;
// 	}
	
	
// 	/**
// 	 * チェックフィールドリストCSVデータのチェック
// 	 * @param array $csvData CSVデータ
// 	 * @param array $checkFields チェックフィールド
// 	 * @throw データが空、もしくはチェックエラーがある場合は例外を投げる
// 	 */
// 	private function checkCsvByCheckFields($csvData,$checkFields){
// 		$err_msg = '';
		
// 		// 空チェック
// 		if(empty($csvData)){
// 			return 'データが空です。';
// 		}
		
// 		$ent = $csvData[0];

// 		// データ中に確認フィールドが存在するかチェックする。（存在しないフィールドがあればエラー）
// 		foreach($checkFields as $check_field){
// 			if(!isset($ent[$check_field])){
// 				$err_msg = "CSVデータに{$check_field}フィールドが存在しません。";
// 				break;
// 			}
// 		}
		
// 		return $err_msg;
// 	}
	
	/**
	 * 検索条件情報のセッター
	 * @param array $kensakuJoken 検索条件情報
	 */
	public function setKensakuJoken($kensakuJoken){
		$this->kensakuJoken = $kensakuJoken;
	}
	
	
	/**
	 * 検索条件バリデーション情報のセッター
	 * @param array $kjs_validate 検索条件バリデーション情報
	 */
	public function setKjsValidate($kjs_validate){
		$this->kjs_validate = $kjs_validate;
	}
	
	
	/**
	 * フィールドデータのセッター
	 * @param array $field_data
	 */
	public function setFildData($field_data){
		$this->field_data = $field_data;
	}
	
	
	/**
	 * セッションからデータを取得する
	 */
	public function getSession($key){
		return $_SESSION[$key];
	}
	
	
	/**
	 * セッションにデータ文字列をセットする
	 */
	public function setSession($key, $data){
		$_SESSION[$key] = $data;
	}
	
	
}