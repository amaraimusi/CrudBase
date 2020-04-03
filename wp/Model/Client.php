<?php

// ■■■□□□■■■□□□
// App::uses('Model', 'Model');
// App::uses('CrudBase', 'Model');

/**
 * 顧客のCakePHPモデルクラス
 *
 * @date 2015-9-16 | 2020-3-26
 * @version 4.0.0
 *
 */
class Client {

	public $name='Client';
	
	// 関連付けるテーブル CBBXS-1040
	public $useTable = 'clients';

	// CBBXE


	/// バリデーションはコントローラクラスで定義
	public $validate = null;
	
	public $cb; // CrudBaseWp
	
	
	public function __construct(CrudBaseWp $cbw) {
	
		$this->cb = $cbw;
		
	}
	
	/**
	 * 顧客エンティティを取得
	 *
	 * 顧客テーブルからidに紐づくエンティティを取得します。
	 *
	 * @param int $id 顧客ID
	 * @return array 顧客エンティティ
	 */
	public function findEntity($id){

		$conditions='id = '.$id;

		//DBからデータを取得
		$data = $this->find(
				'first',
				Array(
						'conditions' => $conditions,
				)
		);

		$ent=array();
		if(!empty($data)){
			$ent=$data['Client'];
		}
		



		return $ent;
	}


	
	
	/**
	 * 一覧データを取得する
	 * @return array 
	 *  - data 顧客画面一覧のデータ
	 *  - found_row_count LIMIT制限されていないデータ件数
	 */
	public function findData(&$param){
		
		$kjs = $param['kjs'];//検索条件情報
		$where = $this->createKjConditions($kjs);
		
		$res = $this->cb->getData($param, $where);
		
		return $res;
	}

	
	
	/**
	 * SQLのダンプ
	 * @param  $option
	 */
	private function dumpSql($option){
		$dbo = $this->getDataSource();
		
		$option['table']=$dbo->fullTableName($this->Client);
		$option['alias']='Client';
		
		$query = $dbo->buildStatement($option,$this->Client);
		
		Debugger::dump($query);
	}



	/**
	 * 検索条件情報からWHERE情報を作成。
	 * @param array $kjs	検索条件情報
	 * @return string WHERE情報
	 */
	private function createKjConditions($kjs){

		$cnds=null;
		
		$this->cb->sql_sanitize($kjs); // SQLサニタイズ
		
		if(!empty($kjs['kj_main'])){
			$cnds[]="CONCAT( IFNULL(Client.client_name, '') ,IFNULL(Client.note, '')) LIKE '%{$kjs['kj_main']}%'";
		}
		
		// CBBXS-1003
		if(!empty($kjs['kj_id']) || $kjs['kj_id'] ==='0' || $kjs['kj_id'] ===0){
			$cnds[]="Client.id = {$kjs['kj_id']}";
		}
		if(!empty($kjs['kj_inquiry_no'])){
			$cnds[]="Client.inquiry_no LIKE '%{$kjs['kj_inquiry_no']}%'";
		}
		if(!empty($kjs['kj_client_name'])){
			$cnds[]="Client.client_name LIKE '%{$kjs['kj_client_name']}%'";
		}
		if(!empty($kjs['kj_mail'])){
			$cnds[]="Client.mail LIKE '%{$kjs['kj_mail']}%'";
		}
		if(!empty($kjs['kj_company_type']) || $kjs['kj_company_type'] ==='0' || $kjs['kj_company_type'] ===0){
			$cnds[]="Client.company_type = {$kjs['kj_company_type']}";
		}
		if(!empty($kjs['kj_traveler_type']) || $kjs['kj_traveler_type'] ==='0' || $kjs['kj_traveler_type'] ===0){
			$cnds[]="Client.traveler_type = {$kjs['kj_traveler_type']}";
		}
		if(!empty($kjs['kj_partic_count1'])){
			$cnds[]="Client.partic_count >= {$kjs['kj_partic_count1']}";
		}
		if(!empty($kjs['kj_partic_count2'])){
			$cnds[]="Client.partic_count <= {$kjs['kj_partic_count2']}";
		}
		if(!empty($kjs['kj_bus_num_type']) || $kjs['kj_bus_num_type'] ==='0' || $kjs['kj_bus_num_type'] ===0){
			$cnds[]="Client.bus_num_type = {$kjs['kj_bus_num_type']}";
		}
		if(!empty($kjs['kj_bus_num1'])){
			$cnds[]="Client.bus_num >= {$kjs['kj_bus_num1']}";
		}
		if(!empty($kjs['kj_bus_num2'])){
			$cnds[]="Client.bus_num <= {$kjs['kj_bus_num2']}";
		}
		if(!empty($kjs['kj_travel_date1'])){
			$cnds[]="Client.travel_date >= '{$kjs['kj_travel_date1']}'";
		}
		if(!empty($kjs['kj_travel_date2'])){
			$cnds[]="Client.travel_date <= '{$kjs['kj_travel_date2']}'";
		}
		if(!empty($kjs['kj_travel_type']) || $kjs['kj_travel_type'] ==='0' || $kjs['kj_travel_type'] ===0){
			$cnds[]="Client.travel_type = {$kjs['kj_travel_type']}";
		}
		if(!empty($kjs['kj_last_name'])){
			$cnds[]="Client.last_name LIKE '%{$kjs['kj_last_name']}%'";
		}
		if(!empty($kjs['kj_first_name'])){
			$cnds[]="Client.first_name LIKE '%{$kjs['kj_first_name']}%'";
		}
		if(!empty($kjs['kj_last_kana'])){
			$cnds[]="Client.last_kana LIKE '%{$kjs['kj_last_kana']}%'";
		}
		if(!empty($kjs['kj_first_kana'])){
			$cnds[]="Client.first_kana LIKE '%{$kjs['kj_first_kana']}%'";
		}
		if(!empty($kjs['kj_client_addr'])){
			$cnds[]="Client.client_addr LIKE '%{$kjs['kj_client_addr']}%'";
		}
		if(!empty($kjs['kj_tel'])){
			$cnds[]="Client.tel LIKE '%{$kjs['kj_tel']}%'";
		}
		if(!empty($kjs['kj_total_amt1'])){
			$cnds[]="Client.total_amt >= {$kjs['kj_total_amt1']}";
		}
		if(!empty($kjs['kj_total_amt2'])){
			$cnds[]="Client.total_amt <= {$kjs['kj_total_amt2']}";
		}
		if(!empty($kjs['kj_note'])){
			$cnds[]="Client.note LIKE '%{$kjs['kj_note']}%'";
		}
		if(!empty($kjs['kj_sort_no']) || $kjs['kj_sort_no'] ==='0' || $kjs['kj_sort_no'] ===0){
			$cnds[]="Client.sort_no = {$kjs['kj_sort_no']}";
		}
		$kj_delete_flg = $kjs['kj_delete_flg'];
		if(!empty($kjs['kj_delete_flg']) || $kjs['kj_delete_flg'] ==='0' || $kjs['kj_delete_flg'] ===0){
			if($kjs['kj_delete_flg'] != -1){
			   $cnds[]="Client.delete_flg = {$kjs['kj_delete_flg']}";
			}
		}
		if(!empty($kjs['kj_update_user'])){
			$cnds[]="Client.update_user LIKE '%{$kjs['kj_update_user']}%'";
		}
		if(!empty($kjs['kj_ip_addr'])){
			$cnds[]="Client.ip_addr LIKE '%{$kjs['kj_ip_addr']}%'";
		}
		if(!empty($kjs['kj_created'])){
			$kj_created=$kjs['kj_created'].' 00:00:00';
			$cnds[]="Client.created >= '{$kj_created}'";
		}
		if(!empty($kjs['kj_modified'])){
			$kj_modified=$kjs['kj_modified'].' 00:00:00';
			$cnds[]="Client.modified >= '{$kj_modified}'";
		}

		// CBBXE
		
		$cnd=null;
		if(!empty($cnds)){
			$cnd=implode(' AND ',$cnds);
		}

		return $cnd;

	}

	/**
	 * エンティティをDB保存
	 *
	 * 顧客エンティティを顧客テーブルに保存します。
	 *
	 * @param array $ent 顧客エンティティ
	 * @param array $option オプション
	 *  - form_type フォーム種別  new_inp:新規入力 , copy:複製 , edit:編集
	 *  - ni_tr_place 新規入力追加場所フラグ 0:末尾 , 1:先頭
	 * @return array 顧客エンティティ（saveメソッドのレスポンス）
	 */
	public function saveEntity($ent,$option=array()){

		// 新規入力であるなら新しい順番をエンティティにセットする。
		if($option['form_type']=='new_inp' ){
			if(empty($option['ni_tr_place'])){
				$ent['sort_no'] = $this->CrudBase->getLastSortNo($this); // 末尾順番を取得する
			}else{
				$ent['sort_no'] = $this->CrudBase->getFirstSortNo($this); // 先頭順番を取得する
			}
		}
		

		//DBに登録('atomic' => false　トランザクションなし。saveでSQLサニタイズされる）
		$ent = $this->save($ent, array('atomic' => false,'validate'=>false));

		//DBからエンティティを取得
		$ent = $this->find('first',
				array(
						'conditions' => "id={$ent['Client']['id']}"
				));

		$ent=$ent['Client'];
		if(empty($ent['delete_flg'])) $ent['delete_flg'] = 0;

		return $ent;
	}

	

//■■■□□□■■■□□□
// 	/**
// 	 * 全データ件数を取得
// 	 *
// 	 * limitによる制限をとりはらった、検索条件に紐づく件数を取得します。
// 	 *  全データ件数はページネーション生成のために使われています。
// 	 *
// 	 * @param array $kjs 検索条件情報
// 	 * @return int 全データ件数
// 	 */
// 	public function findDataCnt($kjs){

// 		//DBから取得するフィールド
// 		$fields=array('COUNT(id) AS cnt');
// 		$conditions=$this->createKjConditions($kjs);

// 		//DBからデータを取得
// 		$data = $this->find(
// 				'first',
// 				Array(
// 						'fields'=>$fields,
// 						'conditions' => $conditions,
// 				)
// 		);

// 		$cnt=$data[0]['cnt'];
// 		return $cnt;
// 	}
	
	/**
	 * アップロードファイルの抹消処理
	 * 
	 * @note
	 * 他のレコードが保持しているファイルは抹消対象外
	 * 
	 * @param int $id
	 * @param string $fn_field_strs ファイルフィールド群文字列（複数ある場合はコンマで連結）
	 * @param array $ent エンティティ
	 */
	public function eliminateFiles($id, $fn_field_strs, &$ent){
		$this->CrudBase->eliminateFiles($this, $id, $fn_field_strs, $ent);
	}
	
	
	// CBBXS-1021
	/**
	 * 取得者属性リストをDBから取得する
	 */
	public function getCompanyTypeList(){
		return COMPANY_TYPE_LIST;
	}
	/**
	 * 旅行参加者属性リストをDBから取得する
	 */
	public function getTravelerTypeList(){
		return TRAVELER_TYPE_LIST;
	}
	/**
	 * バス台数タイプリストをDBから取得する
	 */
	public function getBusNumTypeList(){
		return BUS_NUM_TYPE_LIST;
	}
	/**
	 * 旅行形態リストをDBから取得する
	 */
	public function getTravelTypeList(){
		return AMT_CALC_TYPE_LIST;
	}

	// CBBXE


}