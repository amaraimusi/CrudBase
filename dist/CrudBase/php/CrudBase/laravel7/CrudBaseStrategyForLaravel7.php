<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

/**
 * Laravel7用ストラテジークラス
 * @version 1.0.3
 * @since 2020-6-10 | 2020-7-3
 * @license MIT
 */
class CrudBaseStrategyForLaravel7  implements ICrudBaseStrategy{
	
	private $ctrl; // クライアントコントローラ
	private $model; // クライアントモデル
	
	/**
	 * クライアントコントローラのセッター
	 * @param mixed $ctrl クライアントコントローラ
	 */
	public function setCtrl($ctrl){
		$this->ctrl = $ctrl;
	}
	
	
	/**
	 * クライアントモデルのセッター
	 * @param mixed $model クライアントモデル
	 */
	public function setModel($model){
		$this->model = $model;
	}
	
	/**
	 * SQLを実行する
	 * @param string $sql SQL文
	 * @return mixed
	 */
	public function sqlExe($sql){
		$res = \DB::select($sql);
		return $res;
	}
	
	public function begin(){
		\DB::beginTransaction();
	}
	
	public function rollback(){
		\DB::rollback();
	}
	
	public function commit(){
		\DB::commit();
	}
	
	
	/**
	 * セッションに書き込み
	 * @param string $key
	 * @param mixed $value 値
	 */
	public function sessionWrite($key, $value){
		Session::put($key, $value);
	} 
	
	
	/**
	 *  セッションから読み取り
	 * @param string $key キー
	 * @return mixed 
	 */
	public function sessionRead($key){
		return $value = session($key);
	}
	
	
	/**
	 * セッションから削除
	 * @param string $key キー
	 */
	public function sessionDelete($key){
		dump('XXX　sessionDelete');//■■■□□□■■■□□□)
		// ■■■□□□■■■□□□
	} 
	
	
	/**
	 * ユーザー情報を取得する
	 * 
	 * @return
	 *  - update_user 更新ユーザー
	 *  - ip_addr IPアドレス
	 *  - user_agent ユーザーエージェント
	 *  - role 権限
	 *  - authority 権限データ
	 */
	public function getUserInfo(){
		
		$userInfo =[
				'update_user' => '',
				'user_name' => '',
				'user_id' => '',
				'user_email' => '',
				'ip_addr' => $_SERVER["REMOTE_ADDR"], // IPアドレス,
				'user_agent' => $_SERVER['HTTP_USER_AGENT'], // ユーザーエージェント,
				'role' => 'none',
		];
		
		if(\Auth::id()){// idは未ログインである場合、nullになる。
			$user_id = \Auth::id(); // ユーザーID（番号）
			$user_name = \Auth::user()->name; // ユーザー名
			$user_email = \Auth::user()->email; // メールアドレス
			
			$userInfo['update_user'] = $user_name;
			$userInfo['user_name'] = $user_name;
			$userInfo['user_id'] = $user_id;
			$userInfo['user_email'] = $user_email;
			
			// 		// 権限が空であるならオペレータ扱いにする
			// 		if(empty($userInfo['role'])){
			// 			$userInfo['role'] = 'oparator';
			// 		}
			
		}
		
		return $userInfo;
	}
	
	
	/**
	 * パス情報を取得する
	 * @return []
	 *  - home_r_path string ホーム相対パス
	 *  - webroot string  ホーム相対パスのエイリアス(別名)
	 */
	public function getPath(){
		$web_root = config('const.WEB_ROOT');
		$home_r_path = $web_root;
		
		return [
				'home_r_path' => $home_r_path,
				'webroot' => $web_root,
		];
	}
	
	
	/**
	 * データをDB保存
	 * @param [] $data データ（エンティティの配列）
	 * @param [] $option
	 */
	public function saveAll($data, $option = []){
		
		if(!isset($option['atomic'])) $option['atomic'] = false;
		if(!isset($option['validate'])) $option['validate'] = false;
		$rs=$this->model->saveAll($data, $option);
		return $rs;
	}
	
	
	/**
	 * エンティティをDB保存
	 * @param [] $ent エンティティ
	 * @param [] $option
	 */
	public function save($ent, $option){
		if(!isset($option['atomic'])) $option['atomic'] = false;
		if(!isset($option['validate'])) $option['validate'] = false;
		$rs=$this->model->save($data, $option);
		return $rs;
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
	public function validForKj($data,$validate){
		// ■■■□□□■■■□□□
		return '';
	}
	
	/**
	 * CSRFトークンを取得する ※Ajaxのセキュリティ
	 * @return mixid CSRFトークン
	 */
	public function getCsrfToken(){
		return csrf_token(); // ← Laravelの関数
	}
	
}