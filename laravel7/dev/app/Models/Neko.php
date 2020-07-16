<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Neko extends Model
{
	protected $table = 'nekos'; // 紐づけるテーブル名
	protected $guarded = ['id']; // 予期せぬ代入をガード。 通常、主キーフィールドや、パスワードフィールドなどが指定される。
	public $timestamps = false; // タイムスタンプ。 trueならcreated_atフィールド、updated_atフィールドに適用される。（それ以外のフィールドを設定で指定可）
	
	
	private $cb; // CrudBase制御クラス
	
	public function __construct($cb){
		$this->cb = $cb;
	}
	
	
	/**
	 * 検索条件とページ情報を元にDBからデータを取得する
	 * @param array $crudBaseData
	 * @return number[]|unknown[]
	 *  - array data データ
	 *  - int non_limit_count LIMIT制限なし・データ件数
	 */
	public function getData($crudBaseData){
		
		//■■■□□□■■■□□□
// 		$query = \DB::table('nekos AS Neko')->
// 		select('id', 'neko_name as cat', 'neko_val', 'neko_date');
// 		dump($query->toSql()); // →"select `id`, `neko_name` as `cat`, `neko_val`, `neko_date` from `nekos` as `Neko`"
		
// 		$data = $query->get();
// 		dump($data);
		
		
		$kjs = $crudBaseData['kjs'];//検索条件情報
		$pages = $crudBaseData['pages'];//ページネーション情報

		$page_no = $pages['page_no']; // ページ番号
		$row_limit = $pages['row_limit']; // 表示件数
		$sort_field = $pages['sort_field']; // ソートフィールド
		$sort_desc = $pages['sort_desc']; // ソートタイプ 0:昇順 , 1:降順
		
		//条件を作成
 		$conditions=$this->createKjConditions($kjs);
		
		// オフセットの組み立て
		$offset=null;
		if(!empty($row_limit)) $offset = $page_no * $row_limit;
		
		// ORDER文の組み立て
		$order = $sort_field;
		if(empty($order)) $order='sort_no';
		
		$order_option = 'ASC';
		if(!empty($sort_desc)) $order_option = ' DESC';
		
		$query = \DB::table('nekos as Neko')->
			selectRaw('SQL_CALC_FOUND_ROWS *')->
			whereRaw($conditions)->
			offset($offset)->
			limit($row_limit)->
			orderBy($order, $order_option);
		
		$data = $query->get();
		
		// LIMIT制限なし・データ件数
		$non_limit_count = 0;
		$res = \DB::select('SELECT FOUND_ROWS()');
		if(!empty($res)){
			$non_limit_count = reset($res[0]);
		}

		return ['data' => $data, 'non_limit_count' => $non_limit_count];
		
	}
	
	
	/**
	 * 検索条件情報からWHERE情報を作成。
	 * @param array $kjs	検索条件情報
	 * @return string WHERE情報
	 */
	private function createKjConditions($kjs){
		
		$cnds=null;
		
		$kjs = $this->cb->xssSanitizeW($kjs); // SQLサニタイズ
		
		if(!empty($kjs['kj_main'])){
			$cnds[]="CONCAT( IFNULL(Neko.neko_name, '') ,IFNULL(Neko.note, '')) LIKE '%{$kjs['kj_main']}%'";
		}
		
		// CBBXS-1003
		
		if(!empty($kjs['kj_id'])){
			$cnds[]="Neko.id = {$kjs['kj_id']}";
		}
		
		if(!empty($kjs['kj_neko_val1'])){
			$cnds[]="Neko.neko_val >= {$kjs['kj_neko_val1']}";
		}
		
		if(!empty($kjs['kj_neko_val2'])){
			$cnds[]="Neko.neko_val <= {$kjs['kj_neko_val2']}";
		}
		
		if(!empty($kjs['kj_neko_name'])){
			$cnds[]="Neko.neko_name LIKE '%{$kjs['kj_neko_name']}%'";
		}
		
		if(!empty($kjs['kj_neko_date1'])){
			$cnds[]="Neko.neko_date >= '{$kjs['kj_neko_date1']}'";
		}
		
		if(!empty($kjs['kj_neko_date2'])){
			$cnds[]="Neko.neko_date <= '{$kjs['kj_neko_date2']}'";
		}
		
		if(!empty($kjs['kj_neko_group'])){
			$cnds[]="Neko.neko_group = {$kjs['kj_neko_group']}";
		}
		
		if(!empty($kjs['kj_neko_dt'])){
			$kj_neko_dt = $kjs['kj_neko_dt'];
			$dtInfo = $this->CrudBase->guessDatetimeInfo($kj_neko_dt);
			$cnds[]="DATE_FORMAT(Neko.neko_dt,'{$dtInfo['format_mysql_a']}') = DATE_FORMAT('{$dtInfo['datetime_b']}','{$dtInfo['format_mysql_a']}')";
		}
		
		$kj_neko_flg = $kjs['kj_neko_flg'];
		if(!empty($kjs['kj_neko_flg']) || $kjs['kj_neko_flg'] ==='0' || $kjs['kj_neko_flg'] ===0){
			if($kjs['kj_neko_flg'] != -1){
				$cnds[]="Neko.neko_flg = {$kjs['kj_neko_flg']}";
			}
		}
		
		if(!empty($kjs['kj_img_fn'])){
			$cnds[]="Neko.img_fn = '{$kjs['kj_img_fn']}'";
		}
		
		if(!empty($kjs['kj_note'])){
			$cnds[]="Neko.note LIKE '%{$kjs['kj_note']}%'";
		}
		
		if(!empty($kjs['kj_sort_no']) || $kjs['kj_sort_no'] ==='0' || $kjs['kj_sort_no'] ===0){
			$cnds[]="Neko.sort_no = {$kjs['kj_sort_no']}";
		}
		
		$kj_delete_flg = $kjs['kj_delete_flg'];
		if(!empty($kjs['kj_delete_flg']) || $kjs['kj_delete_flg'] ==='0' || $kjs['kj_delete_flg'] ===0){
			if($kjs['kj_delete_flg'] != -1){
				$cnds[]="Neko.delete_flg = {$kjs['kj_delete_flg']}";
			}
		}
		
		if(!empty($kjs['kj_update_user'])){
			$cnds[]="Neko.update_user = '{$kjs['kj_update_user']}'";
		}
		
		if(!empty($kjs['kj_ip_addr'])){
			$cnds[]="Neko.ip_addr = '{$kjs['kj_ip_addr']}'";
		}
		
		if(!empty($kjs['kj_user_agent'])){
			$cnds[]="Neko.user_agent LIKE '%{$kjs['kj_user_agent']}%'";
		}
		
		if(!empty($kjs['kj_created'])){
			$kj_created=$kjs['kj_created'].' 00:00:00';
			$cnds[]="Neko.created >= '{$kj_created}'";
		}
		
		if(!empty($kjs['kj_modified'])){
			$kj_modified=$kjs['kj_modified'].' 00:00:00';
			$cnds[]="Neko.modified >= '{$kj_modified}'";
		}
		
		// CBBXE
		
		$cnd=null;
		if(!empty($cnds)){
			$cnd=implode(' AND ',$cnds);
		}
		
		return $cnd;
		
	}
	
	
	// CBBXS-1021
	
	/**
	 * 猫種別リストをDBから取得する
	 */
	public function getNekoGroupList(){

		// DBからデータを取得
		$query = \DB::table('neko_groups')->
		whereRaw("delete_flg = 0")->
		orderBy('sort_no', 'ASC');
		$data = $query->get();

		// リスト変換
		$list = [];
		foreach($data as $ent){
			$ent = (array)$ent;
			$id = $ent['id'];
			$name = $ent['neko_group_name'];
			$list[$id] = $name;
		}

		return $list;
		
	}
	
	// CBBXE
	
	
	
	
	
	
	
	
	
	
}
