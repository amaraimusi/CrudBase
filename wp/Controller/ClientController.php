<?php
// require_once 'CrudBaseControllerWp.php';
// require_once dirname(__DIR__ ) . '/Model/Answer.php';

// require_once dirname(__DIR__ ) . '/Model/MaintToDbAnswer.php';

/**
 * 顧客画面用のコントローラ
 * 
 * @date 2017-5-24 | 2020-3-25
 * @author k-uehara
 *
 */
class ClientController {
	
	private $cb; // CrudBaseWp;
	

	
	/**
	 * 顧客管理画面のindexページ
	 * @param CrudBaseWp $cb 汎用クラス
	 */
	public function index(CrudBaseWp $cb){
		$this->cb = $cb;
		$this->initCrudBase();

		$param = [];
		$param = $cb->indexBefore('Client', $param); // indexアクションの共通事前処理

		$this->Client = $cb->getModel('Client'); // モデルクラスを取得する。
		$res = $this->Client->findData($param); // 一覧データを取得する
		$param['data'] = $res['data']; // 一覧データ
		$param['data_count'] = $res['found_row_count']; // LIMIT制限されていないデータ件数
		
		// CBBXS-1020
		
		// 取得者属性リスト
		$companyTypeList = $this->Client->getCompanyTypeList();
		$company_type_json = json_encode($companyTypeList,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		$this->cb->set(array('companyTypeList' => $companyTypeList,'company_type_json' => $company_type_json));
		
		// 旅行参加者属性リスト
		$travelerTypeList = $this->Client->getTravelerTypeList();
		$traveler_type_json = json_encode($travelerTypeList,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		$this->cb->set(array('travelerTypeList' => $travelerTypeList,'traveler_type_json' => $traveler_type_json));
		
		// バス台数タイプリスト
		$busNumTypeList = $this->Client->getBusNumTypeList();
		$bus_num_type_json = json_encode($busNumTypeList,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		$this->cb->set(array('busNumTypeList' => $busNumTypeList,'bus_num_type_json' => $bus_num_type_json));
		
		// 旅行形態リスト
		$travelTypeList = $this->Client->getTravelTypeList();
		$travel_type_json = json_encode($travelTypeList,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		$this->cb->set(array('travelTypeList' => $travelTypeList,'travel_type_json' => $travel_type_json));
		
		// CBBXE
		
		
		$param = $cb->indexAfter($param); // indexアクションの共通処理（後）

		$cb->render('Client/index', $param);
		
	}
	
	
	/**
	 * DB登録
	 *
	 * @note
	 * Ajaxによる登録。
	 * 編集登録と新規入力登録の両方に対応している。
	 * 
	 * @param CrudBaseWp $cb 汎用クラス
	 */
	public function ajax_reg(CrudBaseWp $cb){
		
		var_dump('ajax_regメソッド2');//■■■□□□■■■□□□)
		// ■■■□□□■■■□□□
// 		App::uses('Sanitize', 'Utility');
// 		$this->autoRender = false;//ビュー(ctp)を使わない。

		$errs = []; // エラーリスト
		
		
		var_dump('A1');//■■■□□□■■■□□□)
		
		// JSON文字列をパースしてエンティティを取得する
		$json=$_POST['key1'];
		$ent = json_decode($json,true);
		
		// 登録パラメータ
		$reg_param_json = $_POST['reg_param_json'];
		$regParam = json_decode($reg_param_json,true);
		$form_type = $regParam['form_type']; // フォーム種別 new_inp,edit,delete,eliminate
		
		
		var_dump('A2');//■■■□□□■■■□□□)
		// CBBXS-1024
		
		// CBBXE
		
		var_dump('A3');//■■■□□□■■■□□□)
		
		$userInfo = wp_get_current_user();
		$update_user = $userInfo->user_login; //ログインID

		// 更新ユーザーなど共通フィールドをセットする。
		$ent = $cb->setCommonToEntity($ent, 'xxx');
		
		var_dump('A4');//■■■□□□■■■□□□)
		
		$this->Client = $cb->getModel('Client'); // モデルクラスを取得する。
		$ent = $this->Client->saveEntity($ent,$regParam);// エンティティをDB保存
		
		
		var_dump('A5');//■■■□□□■■■□□□)
// 		// ■■■□□□■■■□□□
// 		global $crudBaseWp;
// 		$crudBaseWp->test();
		
		
		
		// CBBXS-1025
		
		// CBBXE
		
		if(!empty($res['err_msg'])) $errs[] = $res['err_msg'];
		
		if($errs) $ent['err'] = implode("','",$errs); // フォームに表示するエラー文字列をセット
		
		$json_data=json_encode($ent,true);//JSONに変換
		
		return $json_data;
	}
	
	
	
	
	
	
	
	/**
	 * 削除登録
	 *
	 * @note
	 * Ajaxによる削除登録。
	 * 削除更新でだけでなく有効化に対応している。
	 * また、DBから実際に削除する抹消にも対応している。
	 */
	public function ajax_delete(){
		
		$this->autoRender = false;//ビュー(ctp)を使わない。
		
		// JSON文字列をパースしてエンティティを取得する
		$json=$_POST['key1'];
		$ent0 = json_decode($json,true);
		
		// 登録パラメータ
		$reg_param_json = $_POST['reg_param_json'];
		$regParam = json_decode($reg_param_json,true);
		
		// 抹消フラグ
		$eliminate_flg = 0;
		if(isset($regParam['eliminate_flg'])) $eliminate_flg = $regParam['eliminate_flg'];
		
		// 削除用のエンティティを取得する
		$ent = $this->getEntForDelete($ent0['id']);
		$ent['delete_flg'] = $ent0['delete_flg'];
		
		// エンティティをDB保存
		$this->Client->begin();
		if($eliminate_flg == 0){
			$ent = $this->Client->saveEntity($ent,$regParam); // 更新
		}else{
			$this->Client->eliminateFiles($ent['id'], 'img_fn', $ent); // ファイル抹消（他のレコードが保持しているファイルは抹消対象外）
			$this->Client->delete($ent['id']); // 削除
		}
		$this->Client->commit();//コミット
		
		$json_str =json_encode($ent);//JSONに変換
		
		return $json_str;
	}
	
	
	/**
	 * Ajax | 自動保存
	 *
	 * @note
	 * バリデーション機能は備えていない
	 *
	 */
	public function auto_save(){
		$this->autoRender = false;//ビュー(ctp)を使わない。
		
		App::uses('Sanitize', 'Utility');
		if(empty($this->Auth->user())) return 'Error:login is needed.';// 認証中でなければエラー
		
		
		$json=$_POST['key1'];
		
		$data = json_decode($json,true);//JSON文字を配列に戻す
		
		// データ保存
		$this->Client->begin();
		$this->Client->saveAll($data); // まとめて保存。内部でSQLサニタイズされる。
		$this->Client->commit();
		
		$res = array('success');
		
		$json_str = json_encode($res);//JSONに変換
		
		return $json_str;
	}
	
	/**
	 * 一括登録 | AJAX
	 *
	 * @note
	 * 一括追加, 一括編集, 一括複製
	 */
	public function bulk_reg(){
		
		App::uses('DaoForCake', 'Model');
		App::uses('BulkReg', 'Vendor/CrudBase');
		
		$this->autoRender = false;//ビュー(ctp)を使わない。
		
		
		// 更新ユーザーを取得
		$update_user = 'none';
		if(!empty($this->Auth->user())){
			$userData = $this->Auth->user();
			$update_user = $userData['username'];
		}
		
		$json_param=$_POST['key1'];
		$param = json_decode($json_param,true);//JSON文字を配列に戻す
		
		// 一括登録
		$dao = new DaoForCake();
		$bulkReg = new BulkReg($dao, $update_user);
		$res = $bulkReg->reg('clients', $param);
		
		//JSONに変換
		$str_json = json_encode($res,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
		return $str_json;
	}
	
	
	/**
	 * CSVインポート | AJAX
	 *
	 * @note
	 *
	 */
	public function csv_fu(){
		$this->autoRender = false;//ビュー(ctp)を使わない。
		if(empty($this->Auth->user())) return 'Error:login is needed.';// 認証中でなければエラー
		
		$this->csv_fu_base($this->Client,array('id','client_val','client_name','client_date','client_group','client_dt','client_flg','img_fn','note','sort_no'));
		
	}
	
	
	
	
	
	
	
	
	
	/**
	 * CSVダウンロード
	 *
	 * 一覧画面のCSVダウンロードボタンを押したとき、一覧データをCSVファイルとしてダウンロードします。
	 */
	public function csv_download(){
		$this->autoRender = false;//ビューを使わない。
		
		//ダウンロード用のデータを取得する。
		$data = $this->getDataForDownload();
		
		// ダブルクォートで値を囲む
		foreach($data as &$ent){
			unset($ent['xml_text']);
			foreach($ent as $field => $value){
				if(mb_strpos($value,'"')!==false){
					$value = str_replace('"', '""', $value);
				}
				$value = '"' . $value . '"';
				$ent[$field] = $value;
			}
		}
		unset($ent);
		
		//列名配列を取得
		$clms=array_keys($data[0]);
		
		//データの先頭行に列名配列を挿入
		array_unshift($data,$clms);
		
		
		//CSVファイル名を作成
		$date = new DateTime();
		$strDate=$date->format("Y-m-d");
		$fn='client'.$strDate.'.csv';
		
		
		//CSVダウンロード
		App::uses('CsvDownloader','Vendor/CrudBase');
		$csv= new CsvDownloader();
		$csv->output($fn, $data);
		
		
		
	}
	
	
	
	
	
	//ダウンロード用のデータを取得する。
	private function getDataForDownload(){
		
		
		//セッションから検索条件情報を取得
		$kjs=$this->Session->read('client_kjs');
		
		// セッションからページネーション情報を取得
		$pages = $this->Session->read('client_pages');
		
		$page_no = 0;
		$row_limit = 100000;
		$sort_field = $pages['sort_field'];
		$sort_desc = $pages['sort_desc'];
		
		$crudBaseData = array(
			'kjs' => $kjs,
			'pages' => $pages,
			'page_no' => $page_no,
			'row_limit' => $row_limit,
			'sort_field' => $sort_field,
			'sort_desc' => $sort_desc,
		);
		
		
		//DBからデータ取得
		$data=$this->Client->findData($crudBaseData);
		if(empty($data)){
			return array();
		}
		
		return $data;
	}
	
	
	/**
	 * 当画面系の共通セット
	 */
	private function setCommon(){
		
		
		// 新バージョンであるかチェックする。
		$new_version_flg = $this->checkNewPageVersion($this->this_page_version);
		
		$this->set(array(
			'header' => 'header',
			'new_version_flg' => $new_version_flg, // 当ページの新バージョンフラグ   0:バージョン変更なし  1:新バージョン
			'this_page_version' => $this->this_page_version,// 当ページのバージョン
		));
	}
	
	
	/**
	 * CrudBase用の初期化処理
	 *
	 * @note
	 * フィールド関連の定義をする。
	 *
	 *
	 */
	private function initCrudBase(){
		
		
		// CBBXS-3001
		
		// CBBXE
		
		
		/// 検索条件情報の定義
		$kensakuJoken=[
			
			array('name'=>'kj_main','def'=>null),
			// CBBXS-1000
			array('name'=>'kj_id','def'=>null),
			array('name'=>'kj_inquiry_no','def'=>null),
			array('name'=>'kj_client_name','def'=>null),
			array('name'=>'kj_mail','def'=>null),
			array('name'=>'kj_company_type','def'=>null),
			array('name'=>'kj_traveler_type','def'=>null),
			array('name'=>'kj_partic_count1','def'=>null),
			array('name'=>'kj_partic_count2','def'=>null),
			array('name'=>'kj_bus_num_type','def'=>null),
			array('name'=>'kj_bus_num1','def'=>null),
			array('name'=>'kj_bus_num2','def'=>null),
			array('name'=>'kj_travel_date1','def'=>null),
			array('name'=>'kj_travel_date2','def'=>null),
			array('name'=>'kj_travel_type','def'=>null),
			array('name'=>'kj_last_name','def'=>null),
			array('name'=>'kj_first_name','def'=>null),
			array('name'=>'kj_last_kana','def'=>null),
			array('name'=>'kj_first_kana','def'=>null),
			array('name'=>'kj_client_addr','def'=>null),
			array('name'=>'kj_tel','def'=>null),
			array('name'=>'kj_total_amt1','def'=>null),
			array('name'=>'kj_total_amt2','def'=>null),
			array('name'=>'kj_note','def'=>null),
			array('name'=>'kj_sort_no','def'=>null),
			array('name'=>'kj_delete_flg','def'=>0),
			array('name'=>'kj_update_user','def'=>null),
			array('name'=>'kj_ip_addr','def'=>null),
			array('name'=>'kj_created','def'=>null),
			array('name'=>'kj_modified','def'=>null),
			
			// CBBXE
			
			array('name'=>'row_limit','def'=>50),
			
		];

		
		/// 検索条件のバリデーション
		$kjs_validate=[
			
			// CBBXS-1001
			'kj_id' => array(
				'naturalNumber'=>array(
					'rule' => array('naturalNumber', true),
					'message' => 'idは数値を入力してください',
					'allowEmpty' => true
				),
			),
			'kj_inquiry_no'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '問い合わせ番号は100文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_client_name'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '社名・団体名は100文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_mail'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => 'メールは255文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_company_type' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '取得者属性は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_traveler_type' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '旅行参加者属性は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_partic_count1' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '参加人数は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_partic_count2' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
					'message' => '参加人数は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_bus_num_type' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => 'バス台数タイプは整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_bus_num1' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => 'バス台数は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_bus_num2' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
					'message' => 'バス台数は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_travel_date1'=> array(
				'rule' => array( 'date', 'ymd'),
				'message' => '旅行時期【範囲1】は日付形式【yyyy-mm-dd】で入力してください。',
				'allowEmpty' => true
			),
			'kj_travel_date2'=> array(
				'rule' => array( 'date', 'ymd'),
				'message' => '旅行時期【範囲2】は日付形式【yyyy-mm-dd】で入力してください。',
				'allowEmpty' => true
			),
			'kj_travel_type' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '旅行形態は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_last_name'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '氏は50文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_first_name'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '名は50文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_last_kana'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '氏（ふりがな）は50文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_first_kana'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '名（ふりがな）は50文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_client_addr'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '住所は500文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_tel'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '電話番号は40文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_total_amt1' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '合計金額は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_total_amt2' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
					'message' => '合計金額は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_note'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '備考は1000文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_sort_no' => array(
				'custom'=>array(
					'rule' => array( 'custom', '/^[-]?[0-9]+$/' ),
					'message' => '順番は整数を入力してください。',
					'allowEmpty' => true
				),
			),
			'kj_update_user'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => '更新者は50文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_ip_addr'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 255),
					'message' => 'IPアドレスは40文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_created'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 20),
					'message' => '生成日時は20文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			'kj_modified'=> array(
				'maxLength'=>array(
					'rule' => array('maxLength', 20),
					'message' => '更新日は20文字以内で入力してください',
					'allowEmpty' => true
				),
			),
			
			// CBBXE
		];
		
		
		
		
		
		///フィールドデータ
		$field_data = array('def'=>array(
			
			// CBBXS-1002
			'id'=>array(
				'name'=>'ID',//HTMLテーブルの列名
				'row_order'=>'Client.id',//SQLでの並び替えコード
				'clm_show'=>1,//デフォルト列表示 0:非表示 1:表示
			),
			'inquiry_no'=>array(
				'name'=>'問い合わせ番号',
				'row_order'=>'Client.inquiry_no',
				'clm_show'=>1,
			),
			'client_name'=>array(
				'name'=>'社名・団体名',
				'row_order'=>'Client.client_name',
				'clm_show'=>1,
			),
			'mail'=>array(
				'name'=>'メール',
				'row_order'=>'Client.mail',
				'clm_show'=>0,
			),
			'company_type'=>array(
				'name'=>'取得者属性',
				'row_order'=>'Client.company_type',
				'clm_show'=>1,
			),
			'traveler_type'=>array(
				'name'=>'旅行参加者属性',
				'row_order'=>'Client.traveler_type',
				'clm_show'=>1,
			),
			'partic_count'=>array(
				'name'=>'参加人数',
				'row_order'=>'Client.partic_count',
				'clm_show'=>1,
			),
			'bus_num_type'=>array(
				'name'=>'バス台数タイプ',
				'row_order'=>'Client.bus_num_type',
				'clm_show'=>1,
			),
			'bus_num'=>array(
				'name'=>'バス台数',
				'row_order'=>'Client.bus_num',
				'clm_show'=>0,
			),
			'travel_date'=>array(
				'name'=>'旅行時期',
				'row_order'=>'Client.travel_date',
				'clm_show'=>1,
			),
			'travel_type'=>array(
				'name'=>'旅行形態',
				'row_order'=>'Client.travel_type',
				'clm_show'=>1,
			),
			'last_name'=>array(
				'name'=>'氏',
				'row_order'=>'Client.last_name',
				'clm_show'=>0,
			),
			'first_name'=>array(
				'name'=>'名',
				'row_order'=>'Client.first_name',
				'clm_show'=>0,
			),
			'last_kana'=>array(
				'name'=>'氏（ふりがな）',
				'row_order'=>'Client.last_kana',
				'clm_show'=>0,
			),
			'first_kana'=>array(
				'name'=>'名（ふりがな）',
				'row_order'=>'Client.first_kana',
				'clm_show'=>0,
			),
			'client_addr'=>array(
				'name'=>'住所',
				'row_order'=>'Client.client_addr',
				'clm_show'=>0,
			),
			'tel'=>array(
				'name'=>'電話番号',
				'row_order'=>'Client.tel',
				'clm_show'=>0,
			),
			'total_amt'=>array(
				'name'=>'合計金額',
				'row_order'=>'Client.total_amt',
				'clm_show'=>1,
			),
			'note'=>array(
				'name'=>'備考',
				'row_order'=>'Client.note',
				'clm_show'=>0,
			),
			'sort_no'=>array(
				'name'=>'順番',
				'row_order'=>'Client.sort_no',
				'clm_show'=>0,
			),
			'delete_flg'=>array(
				'name'=>'無効フラグ',
				'row_order'=>'Client.delete_flg',
				'clm_show'=>0,
			),
			'update_user'=>array(
				'name'=>'更新者',
				'row_order'=>'Client.update_user',
				'clm_show'=>0,
			),
			'ip_addr'=>array(
				'name'=>'IPアドレス',
				'row_order'=>'Client.ip_addr',
				'clm_show'=>0,
			),
			'created'=>array(
				'name'=>'生成日時',
				'row_order'=>'Client.created',
				'clm_show'=>0,
			),
			'modified'=>array(
				'name'=>'更新日',
				'row_order'=>'Client.modified',
				'clm_show'=>0,
			),
			
			// CBBXE
		));
		
		// 列並び順をセットする
		$clm_sort_no = 0;
		foreach ($field_data['def'] as &$fEnt){
			$fEnt['clm_sort_no'] = $clm_sort_no;
			$clm_sort_no ++;
		}
		unset($fEnt);
		
		// フィールド関連の各種パラメータをセットする
		$this->cb->setFieldBoxs([
			'kensakuJoken'=>$kensakuJoken,
			'kjs_validate'=>$kjs_validate,
			'field_data'=>$field_data, 
		]);
		
		
	}
	
	
	// ■■■□□□■■■□□□
// 	public $scr_key = 'answer'; // 画面キー
	
	
// 	private $model; // 当画面用のモデルクラス
	
// 	private $mtd; // MaintToDbAnswer

// 	public function __construct(){
		
// 		$this->model = new Answer();

// 		// フィールド関係の定義と初期化をする。
// 		$this->initFields(); 

// 		// メンテナンスDB
// 		$this->mtd = new MaintToDbAnswer();

// 		parent::__construct();
// 	}
	
	
// 	/**
// 	 * 初期表示
// 	 */
// 	public function init_view(){
// 		$this->index();
// 	}
	
	
// 	/**
// 	 * 顧客画面の表示
// 	 */
// 	public function index(){

		
// 		$res = $this->index_before(); // indexアクションの共通処理
// 		$kjs = $res['kjs'];

// 		// データを取得
// 		$res = $this->model->getData($kjs);
// 		$data = $res['data'];
// 		$found_row_count = $res['found_row_count'];
		
// 		$nonce = wp_create_nonce("unique_key"); // Ajax用のトークン
// 		$csv_dl_url = $this->makeCsvDlUrl($kjs,'csv_download'); // CSVダウンロード用のURLを作成
// 		$cssStyleList = $this->model->getCssStyleList(); // CSSスタイルリスト
// 		$mtdCndData = $this->getMtdCndData(); // メンテナンス・条件データを取得
		
// 		//indexアクションの共通後処理
// 		$this->index_after(array(
// 				'kjs' => $kjs,
// 				'found_row_count' => $found_row_count,
// 		));

// 		$this->setX(array(
// 				'data'=>$data,
// 				'kjs'=>$kjs,
// 				'nonce'=>$nonce,
// 				'csv_dl_url'=>$csv_dl_url,
// 				'cssStyleList'=>$cssStyleList,
// 				'mtdCndData'=>$mtdCndData,
// 		));
		
// 		$this->renderX('Answer/index.php');

// 	}
	
	
// 	/**
// 	 * Ajaxのアクション設定
// 	 */
// 	public function ajax_actions(){
		
// 		$ajaxActions = array(
// 				"enqnx_answer_ni" => array("action" => "enqnx_answer_ni_action", "function" => "edit_reg"),
// 				"enqnx_answer_edit" => array("action" => "enqnx_answer_edit_action", "function" => "edit_reg"),
// 				"enqnx_answer_delete" => array("action" => "enqnx_answer_delete_action", "function" => "delete_reg"),
// 				"enqnx_answer_mtd_maintenance" => array("action" => "enqnx_answer_mtd_maintenance", "function" => "mtd_maintenance"),
// 				"enqnx_answer_mtd_restor_files_to_sel" => array("action" => "enqnx_answer_mtd_restor_files_to_sel", "function" => "mtd_restor_files_to_sel"),
// 				"enqnx_answer_mtd_restor_exe" => array("action" => "enqnx_answer_mtd_restor_exe", "function" => "mtd_restor_exe"),
// 				"enqnx_answer_mtd_apply" => array("action" => "enqnx_answer_mtd_apply", "function" => "mtd_apply"),
// 		);
		
// 		foreach ($ajaxActions as $custom_key => $custom_action) {
// 			add_action("wp_ajax_nopriv_" . $custom_action['action'], array($this, $custom_action["function"]));
// 			add_action("wp_ajax_" . $custom_action['action'], array($this, $custom_action["function"]));
// 		}
// 	}
	

// 	/**
// 	 * Ajaxによる編集登録
// 	 *
// 	 */
// 	function edit_reg(){
		
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
	
// 		// Ajaxからのデータを受け取る
// 		$json_param=$_POST['key1'];
// 		$json_param = stripslashes($json_param);
// 		$ent = json_decode($json_param,true);//JSON文字を配列に戻す
	
// 		$ent =$this->setCommonToEntity($ent); // 共通情報をセットする
		
// 		// エンティティをDB保存する。
// 		$res_ent = $this->model->save($ent);

// 		header("Content-Type: application/json; charset=utf-8");
// 		echo json_encode($res_ent);
// 		exit;
// 	}
	
	
// 	/**
// 	 * 削除登録
// 	 *
// 	 * @note
// 	 * Ajaxによる削除登録。
// 	 * 物理削除でなく無効フラグをONにする方式。
// 	 */
// 	public function delete_reg(){

// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		// Ajaxからのデータを受け取る
// 		$json_param=$_POST['key1'];
// 		$json_param = stripslashes($json_param);
// 		$ent = json_decode($json_param,true);//JSON文字を配列に戻す
	
// 		$ent =$this->setCommonToEntity($ent); // 共通情報をセットする
// 		$ent['delete_flg'] = 1; // 無効フラグをONにする
	
// 		// エンティティをDB保存する。
// 		$res_ent = $this->model->save($ent);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo json_encode($res_ent);
// 		exit;
// 	}
	
	
	
	
	
	
// 	/**
// 	 * メンテナンスDB | Ajax
// 	 */
// 	public function mtd_maintenance(){
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		// Ajaxからのデータを受け取る
// 		$json_param=$_POST['key1'];
// 		$json_param = stripslashes($json_param);
// 		$cndData = json_decode($json_param,true);//JSON文字を配列に戻す
		
// 		// ログの出力
// 		error_log('▽▽ 顧客テーブルのメンテナンスを開始します。【手動】 ▽▽'. date('Y-m-d H:i:s'));
		
// 		// ★メンテナンスを実行
// 		$html = $this->mtd->maintenance($cndData);
		
// 		$res = array('html'=>$html);
		
// 		$json = json_encode($res,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo $json;
// 		exit;
// 	}
	
	
	
	
	
	
	
	
// 	/**
// 	 * メンテナンスDB:レストアファイル群をSELECT要素へ | Ajax
// 	 */
// 	public function mtd_restor_files_to_sel(){
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		// レストアファイルリストを取得する
// 		$restorFiles = $this->mtd->getRestorFiles();

		
// 		$json = json_encode($restorFiles,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo $json;
// 		exit;
// 	}
	
	
	
	
	
	
// 	/**
// 	 * メンテナンスDB:レストア実行 | Ajax
// 	 */
// 	public function mtd_restor_exe(){
		
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		// Ajaxからのデータを受け取る
// 		$json_param=$_POST['key1'];
// 		$json_param = stripslashes($json_param);
// 		$cndData = json_decode($json_param,true);//JSON文字を配列に戻す
		
// 		// レストア実行
// 		$html = $this->mtd->restor_exe($cndData);
		
		
// 		$res = array('html'=>$html);
		
// 		$json = json_encode($res,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo $json;
// 		exit;
// 	}
	
	
	
	
// 	/**
// 	 * WPクーロンによるメンテナンス機能
// 	 */
// 	public function cron_maint(){

// 		// ログの出力
// 		error_log('▽▽ 顧客テーブルのメンテナンスを開始します。【自動クーロン】 ▽▽'. date('Y-m-d H:i:s'));

// 		// 条件データを取得する
// 		$cndData = $this->mtd->getCndData();
		
// 		try {
			
// 			// ★メンテナンスを実行
// 			$html = $this->mtd->maintenance($cndData);
// 			error_log($html);
// 		} catch (Exception $e) {
// 			var_dump($e);
// 			throw $e;
// 		}
		

// 	}
	
	
	
// 	/**
// 	 * メンテナンス・条件データを取得
// 	 * @return メンテナンス・条件データ
// 	 */
// 	private function getMtdCndData(){

// 		$cndData = $this->mtd->getCndData();

// 		return $cndData;

// 	}
	
	
	
	
	
// 	/**
// 	 * メンテナンスDB:適用 | Ajax
// 	 */
// 	public function mtd_apply(){
		
// 		// トークンによるアクセスの正当性を確認
// 		$nonce = $_POST['nonce'];
// 		if (!wp_verify_nonce($nonce, 'unique_key')){
// 			die('Unauthorized request!');
// 		}
		
// 		// Ajaxからのデータを受け取る
// 		$json_param=$_POST['key1'];
// 		$json_param = stripslashes($json_param);
// 		$cndData = json_decode($json_param,true);//JSON文字を配列に戻す

// 		// 条件テーブルをアンケーター用オプションテーブルへ保存する
// 		$this->mtd->saveCndDataToOptionTbl($cndData);
		
// 		// クーロン活性フラグとクーロン間隔を取得する
// 		$cron_active_flg = $cndData['cron_active_flg'];
// 		$cron_interval = $cndData['cron_interval'];
		
// 		// WPクーロンの切替
// 		$this->mtd->cron_switch2($cron_active_flg,$cron_interval,array($this, 'cron_maint' ));
		
		
// 		$res = array('html'=>'success');
		
// 		$json = json_encode($res,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		
// 		header("Content-Type: application/json; charset=utf-8");
// 		echo $json;
// 		exit;
// 	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// 	/**
// 	 * フィールド関係の定義と初期化をする。
// 	 */
// 	private function initFields(){

// 		/// 検索条件情報の定義
// 		$this->kensakuJoken=array(
// 				array('name'=>'kj_id','def'=>null),
// 				array('name'=>'kj_order_code','def'=>null),
// 				array('name'=>'kj_enq_id','def'=>null),
// 				array('name'=>'kj_enquete_name','def'=>null),
// 				array('name'=>'kj_qst_id','def'=>null),
// 				array('name'=>'kj_q_text','def'=>null),
// 				array('name'=>'kj_choice_id','def'=>null),
// 				array('name'=>'kj_ans_value','def'=>null),
// 				array('name'=>'kj_ans_text','def'=>null),
// 				array('name'=>'kj_choice_text','def'=>null),
// 				array('name'=>'kj_inp_type','def'=>null),
// 				array('name'=>'kj_ans_date1','def'=>null),
// 				array('name'=>'kj_ans_date2','def'=>null),
// 				array('name'=>'kj_post_id','def'=>null),
// 				array('name'=>'kj_meta_id','def'=>null),
// 				array('name'=>'kj_ip_addr','def'=>null),
// 				array('name'=>'kj_delete_flg','def'=>0),
// 				array('name'=>'kj_update_user','def'=>null),
// 				array('name'=>'kj_user_agent','def'=>null),
// 				array('name'=>'kj_created','def'=>null),
// 				array('name'=>'kj_modified','def'=>null),
// 				array('name'=>'kj_limit','def'=>50),
// 		);


	
	
	
	
// 		///フィールドデータ
// 		$this->field_data=array('def'=>array(
	
// 				'id'=>array(
// 						'name'=>'ID',//HTMLテーブルの列名
// 						'row_order'=>'id',//SQLでの並び替えコード
// 						'clm_show'=>1,//デフォルト列表示 0:非表示 1:表示
// 				),
// 				'order_code'=>array(
// 						'name'=>'受付コード',
// 						'row_order'=>'Answer.order_code',
// 						'clm_show'=>1,
// 				),
// 				'enq_id'=>array(
// 						'name'=>'顧客ID',
// 						'row_order'=>'Answer.enq_id',
// 						'clm_show'=>1,
// 				),
// 				'enquete_name'=>array(
// 						'name'=>'アンケート名',
// 						'row_order'=>'Enquete.enquete_name',
// 						'clm_show'=>1,
// 				),
// 				'qst_id'=>array(
// 						'name'=>'質問ID',
// 						'row_order'=>'Answer.qst_id',
// 						'clm_show'=>1,
// 				),
// 				'q_text'=>array(
// 						'name'=>'質問文',
// 						'row_order'=>'Answer.q_text',
// 						'clm_show'=>1,
// 				),
// 				'choice_id'=>array(
// 						'name'=>'選択肢ID',
// 						'row_order'=>'Answer.choice_id',
// 						'clm_show'=>1,
// 				),
// 				'ans_value'=>array(
// 						'name'=>'顧客値',
// 						'row_order'=>'Answer.ans_value',
// 						'clm_show'=>1,
// 				),
// 				'ans_text'=>array(
// 						'name'=>'顧客テキスト',
// 						'row_order'=>'Answer.ans_text',
// 						'clm_show'=>1,
// 				),
// 				'choice_text'=>array(
// 						'name'=>'選択肢テキスト',
// 						'row_order'=>'Answer.choice_text',
// 						'clm_show'=>1,
// 				),
// 				'inp_type'=>array(
// 						'name'=>'入力タイプ',
// 						'row_order'=>'Answer.inp_type',
// 						'clm_show'=>1,
// 				),
// 				'ans_date'=>array(
// 						'name'=>'顧客日付',
// 						'row_order'=>'Answer.ans_date',
// 						'clm_show'=>1,
// 				),
// 				'post_id'=>array(
// 						'name'=>'投稿ID',
// 						'row_order'=>'Answer.post_id',
// 						'clm_show'=>1,
// 				),
// 				'meta_id'=>array(
// 						'name'=>'メタID',
// 						'row_order'=>'Answer.meta_id',
// 						'clm_show'=>0,
// 				),
// 				'ip_addr'=>array(
// 						'name'=>'IPアドレス',
// 						'row_order'=>'Answer.ip_addr',
// 						'clm_show'=>0,
// 				),
// 				'delete_flg'=>array(
// 						'name'=>'削除フラグ',
// 						'row_order'=>'Answer.delete_flg',
// 						'clm_show'=>0,
// 				),
// 				'update_user'=>array(
// 						'name'=>'更新ユーザー',
// 						'row_order'=>'Answer.update_user',
// 						'clm_show'=>0,
// 				),
// 				'user_agent'=>array(
// 						'name'=>'ユーザーエージェント',
// 						'row_order'=>'Answer.user_agent',
// 						'clm_show'=>0,
// 				),
// 				'created'=>array(
// 						'name'=>'生成日時',
// 						'row_order'=>'Answer.created',
// 						'clm_show'=>0,
// 				),
// 				'modified'=>array(
// 						'name'=>'更新日時',
// 						'row_order'=>'Answer.modified',
// 						'clm_show'=>0,
// 				),
				
	
// 		));

// 	}
	
	
// 	/**
// 	 * CSVダウンロード
// 	 */
// 	public function csv_download(){
		
//  		// CSV用データをDBから取得する
//  		$data = $this->model->getDataForCsv($_GET);
 		
//  		if(empty($data)){
//  			$data[0]=array('id'=>'empty');
//  		}
 		
//  		// CSV用データに変換（文字列データはダブルクォートで括る）
//  		$this->convToCsvData($data);
 		
		
// 		//列名配列を取得
// 		$clms=array_keys($data[0]);
		
// 		//データの先頭行に列名配列を挿入
// 		array_unshift($data,$clms);
		
		
// 		//CSVファイル名を作成
// 		$date = new DateTime();
// 		$strDate=$date->format("Y-m-d");
// 		$fn=$this->scr_key.$strDate.'.csv';
		
//  		//CSVダウンロード
// 		$csv= new CsvDownloader();
// 		$csv->output($fn, $data);
		
// 	}
	
	
	
	// ■■■□□□■■■□□□
	public function testAjax(){
		//var_dump($_POST);//■■■□□□■■■□□□)
		global $crudBaseWp;
		$test = $crudBaseWp->test();
		
		$res = ['aaa'=>$test];
		return $res;
	}
	
	
	
	
	
	
	
	
	
	
	
}