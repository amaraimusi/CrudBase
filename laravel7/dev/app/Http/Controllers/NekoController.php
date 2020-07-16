<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Neko;
use Illuminate¥Support¥Facades¥DB;

//class NekoController extends Controller■■■□□□■■■□□□
class NekoController
{
	
	private $cb; // CrudBase制御クラス
	private $md; // モデル


	/**
	 * ネコCRUDページ
	 */
	public function index(){

		$this->cb = $this->initCrudBase();
		$data = [];
		
		$this->md = new Neko($this->cb);

 		// CrudBase共通処理（前）
 		$crudBaseData = $this->cb->indexBefore('Neko');//indexアクションの共通先処理(CrudBaseController)

// 		// CBBXS-1019
		
// 		// CBBXE
		
		//一覧データを取得
		$res = $this->md->getData($crudBaseData);
		$data = $res['data'];
		$non_limit_count = $res['non_limit_count']; // LIMIT制限なし・データ件数

		// CrudBase共通処理（後）
		$crudBaseData = $this->cb->indexAfter($crudBaseData, ['non_limit_count'=>$non_limit_count]);
		
		$masters = []; // マスターリスト群
		// CBBXS-1020
		$nekoGroupList = $this->md->getNekoGroupList();
		$masters['nekoGroupList'] = $nekoGroupList;
		// CBBXE
		
		$crudBaseData['masters'] = $masters;
		
// 		$this->set($crudBaseData);
// 		$this->set(array(
// 				'title_for_layout'=>'ネコ',
// 				'data'=> $data,
// 		));
		
		
		
// 		echo '<br>';
// 		echo $_SERVER['DOCUMENT_ROOT'];
// 		echo '<br>';
// 		$data = ['neko'=>'猫', 'yagi'=>'山羊'];
		
// 		echo '<pre>';
// 		echo config('const.TEST_PATH');
// 		echo '<br>';
// 		var_dump(config('const.TEST_LIST'));
// 		echo '</pre>';
		
// 		echo config('const.CRUD_BASE_PATH');

		$crud_base_json = json_encode($crudBaseData,JSON_HEX_TAG | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_HEX_APOS);
		return view('neko.index', compact('crudBaseData', 'crud_base_json'));
		
		
	}
	
	
	public function index2(){
		$data = [];
		
		\Session::put('neko_key', ['abc'=> '野良猫にエサをあげる大臣', 'value2'=>'白い猫']);
		//\Session::put('neko_key', '野良猫にエサをあげる大臣');
		return view('neko.index', compact('data'));
	}
	
	/**
	 * CrudBase用の初期化処理
	 *
	 * @note
	 * フィールド関連の定義をする。
	 *
	 * @return CrudBaseController
	 *
	 */
	private function initCrudBase(){
		
		
		// CBBXS-3001

		
		// CBBXE
		
		
		/// 検索条件情報の定義
		$kensakuJoken=array(
				
				array('name'=>'kj_main','def'=>null),
				// CBBXS-1000
				array('name'=>'kj_id','def'=>null),
				array('name'=>'kj_neko_val1','def'=>null),
				array('name'=>'kj_neko_val2','def'=>null),
				array('name'=>'kj_neko_name','def'=>null),
				array('name'=>'kj_neko_date_ym','def'=>null),
				array('name'=>'kj_neko_date1','def'=>null),
				array('name'=>'kj_neko_date2','def'=>null),
				array('name'=>'kj_neko_group','def'=>null),
				array('name'=>'kj_neko_dt','def'=>null),
				array('name'=>'kj_neko_flg','def'=>null),
				array('name'=>'kj_img_fn','def'=>null),
				array('name'=>'kj_note','def'=>null),
				array('name'=>'kj_sort_no','def'=>null),
				array('name'=>'kj_delete_flg','def'=>0),
				array('name'=>'kj_update_user','def'=>null),
				array('name'=>'kj_ip_addr','def'=>null),
				array('name'=>'kj_created','def'=>null),
				array('name'=>'kj_modified','def'=>null),
				// CBBXE
				
				array('name'=>'row_limit','def'=>50),
				
		);
		
		
		
		
		
		/// 検索条件のバリデーション
		$kjs_validate=array(
				
				// CBBXS-1001
				
				'kj_id' => array(
						'naturalNumber'=>array(
								'rule' => array('naturalNumber', true),
								'message' => 'IDは数値を入力してください',
								'allowEmpty' => true
						),
				),
				
				'kj_neko_val1' => array(
						'custom'=>array(
								'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
								'message' => 'ネコ数値1は整数を入力してください。',
								'allowEmpty' => true
						),
				),
				
				'kj_neko_val2' => array(
						'custom'=>array(
								'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
								'message' => 'ネコ数値2は整数を入力してください。',
								'allowEmpty' => true
						),
				),
				
				
				'kj_neko_name'=> array(
						'maxLength'=>array(
								'rule' => array('maxLength', 255),
								'message' => 'ネコ名前は255文字以内で入力してください',
								'allowEmpty' => true
						),
				),
				
				'kj_neko_date1'=> array(
						'rule' => array( 'date', 'ymd'),
						'message' => 'ネコ日【範囲1】は日付形式【yyyy-mm-dd】で入力してください。',
						'allowEmpty' => true
				),
				
				'kj_neko_date2'=> array(
						'rule' => array( 'date', 'ymd'),
						'message' => 'ネコ日【範囲2】は日付形式【yyyy-mm-dd】で入力してください。',
						'allowEmpty' => true
				),
				
				'kj_note'=> array(
						'maxLength'=>array(
								'rule' => array('maxLength', 255),
								'message' => '備考は255文字以内で入力してください',
								'allowEmpty' => true
						),
				),
				
				'kj_sort_no' => array(
						'custom'=>array(
								'rule' => array( 'custom', '/^[-]?[0-9]+?$/' ),
								'message' => '順番は整数を入力してください。',
								'allowEmpty' => true
						),
				),
				
				'kj_update_user'=> array(
						'maxLength'=>array(
								'rule' => array('maxLength', 50),
								'message' => '更新者は50文字以内で入力してください',
								'allowEmpty' => true
						),
				),
				
				'kj_ip_addr'=> array(
						'maxLength'=>array(
								'rule' => array('maxLength', 40),
								'message' => '更新IPアドレスは40文字以内で入力してください',
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
								'message' => '更新日時は20文字以内で入力してください',
								'allowEmpty' => true
						),
				),
				
				// CBBXE
		);
		
		
		
		
		
		///フィールドデータ
		$field_data = array('def'=>array(
				
				// CBBXS-1002
				'id'=>array(
						'name'=>'ID',//HTMLテーブルの列名
						'row_order'=>'Neko.id',//SQLでの並び替えコード
						'clm_show'=>1,//デフォルト列表示 0:非表示 1:表示
				),
				'neko_val'=>array(
						'name'=>'ネコ数値',
						'row_order'=>'Neko.neko_val',
						'clm_show'=>0,
				),
				'neko_name'=>array(
						'name'=>'ネコ名前',
						'row_order'=>'Neko.neko_name',
						'clm_show'=>1,
				),
				'neko_group'=>array(
						'name'=>'ネコ種別',
						'row_order'=>'Neko.neko_group',
						'clm_show'=>1,
				),
				'neko_date'=>array(
						'name'=>'ネコ日',
						'row_order'=>'Neko.neko_date',
						'clm_show'=>1,
				),
				'neko_dt'=>array(
						'name'=>'ネコ日時',
						'row_order'=>'Neko.neko_dt',
						'clm_show'=>1,
				),
				'neko_flg'=>array(
						'name'=>'ネコフラグ',
						'row_order'=>'Neko.neko_flg',
						'clm_show'=>1,
				),
				'img_fn'=>array(
						'name'=>'画像ファイル名',
						'row_order'=>'Neko.img_fn',
						'clm_show'=>1,
				),
				'note'=>array(
						'name'=>'備考',
						'row_order'=>'Neko.note',
						'clm_show'=>0,
				),
				'sort_no'=>array(
						'name'=>'順番',
						'row_order'=>'Neko.sort_no',
						'clm_show'=>0,
				),
				'delete_flg'=>array(
						'name'=>'削除フラグ',
						'row_order'=>'Neko.delete_flg',
						'clm_show'=>1,
				),
				'update_user'=>array(
						'name'=>'更新者',
						'row_order'=>'Neko.update_user',
						'clm_show'=>0,
				),
				'ip_addr'=>array(
						'name'=>'更新IPアドレス',
						'row_order'=>'Neko.ip_addr',
						'clm_show'=>0,
				),
				'created'=>array(
						'name'=>'生成日時',
						'row_order'=>'Neko.created',
						'clm_show'=>0,
				),
				'modified'=>array(
						'name'=>'更新日時',
						'row_order'=>'Neko.modified',
						'clm_show'=>1,
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
		
		
		$crud_base_path = config('const.CRUD_BASE_PATH');
		$crud_base_js = config('const.CRUD_BASE_JS');
		$crud_base_css = config('const.CRUD_BASE_CSS');
		require_once $crud_base_path . 'CrudBaseController.php';
		
		$crudBaseCon = new \CrudBaseController([
				'fw_type' => 'laravel7',
				'ctrl' => $this,
				'model' => $this->md,
				'kensakuJoken' => $kensakuJoken, //検索条件情報
				'kjs_validate' => $kjs_validate, //検索条件バリデーション
				'field_data' => $field_data, //フィールドデータ
				'crud_base_path' => $crud_base_path,
				'crud_base_js' => $crud_base_js,
				'crud_base_css' => $crud_base_css,
		]);
		
		
		return $crudBaseCon;
		
	}
	
	
	
	// ■■■□□□■■■□□□
    public function bark() {
        
        $data = ['neko'=>'猫', 'yagi'=>'山羊'];
        
        return view('neko.bark', compact('data'));
    }
}


