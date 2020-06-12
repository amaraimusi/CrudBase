<?php
App::uses('AppController', 'Controller');


/**
 * Cake2.x用ストラテジークラス
 * @since 2020-6-10
 * @license MIT
 */
class CrudBaseStrategyForCake extends AppController implements ICrudBaseStrategy{
	
	private $ctrl;
	
	public function setCtrl($ctrl){
		$this->ctrl = $ctrl;
	}
	public function sqlExe($sql){}
	public function begin(){}
	public function rollback(){}
	public function commit(){}
	
	
	/**
	 * セッションに書き込み
	 * @param string $key
	 * @param mixed $value 値
	 */
	public function sessionWrite($key, $value){
		$this->ctrl->Session->write($key, $value);
	} 
	
	
	/**
	 *  セッションから読み取り
	 * @param string $key キー
	 * @return mixed 
	 */
	public function sessionRead($key){
		return $this->ctrl->Session->read($key);
	}
	
	
	/**
	 * セッションから削除
	 * @param string $key キー
	 */
	public function sessionDelete($key){
		$this->ctrl->Session->delete($key);
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
		$userInfo = $this->ctrl->Auth->user();
		
		$userInfo['update_user'] = $userInfo['username'];// 更新ユーザー
		$userInfo['ip_addr'] = $_SERVER["REMOTE_ADDR"];// IPアドレス
		$userInfo['user_agent'] = $_SERVER['HTTP_USER_AGENT']; // ユーザーエージェント
		
		// 権限が空であるならオペレータ扱いにする
		if(empty($userInfo['role'])){
			$userInfo['role'] = 'oparator';
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
		$webroot = $this->ctrl->webroot;
		$home_r_path = $webroot;
		
		return [
			'home_r_path' => $home_r_path,
			'webroot' => $webroot,
		];
	}
}