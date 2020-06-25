<?php
interface ICrudBaseStrategy{
	public function setCtrl($ctrl); // クライアントコントローラのセッター
	public function setModel($model); // クライアントモデルのセッター
	public function sqlExe($sql);
	public function begin();
	public function rollback();
	public function commit();
	public function sessionWrite($key, $value); // セッションに書き込み
	public function sessionRead($key); // セッションから読み取り
	public function sessionDelete($key); // セッションから削除
	public function getUserInfo(); // ユーザー情報を取得する
	public function getPath(); // パス情報を取得する
	public function saveAll($data, $option); // データをDB保存
	public function save($ent, $option); // エンティティをDB保存
}