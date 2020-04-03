<?php
require_once 'IDao.php';
/**
 * WordPressのDAO（データベースアクセスオブジェクト）
 * 
 * @date 2020-3-28
 * @version 1.0.0
 * @license MIT
 * @author Kenji Uehara
 *
 */
class DaoWp implements IDao
{
	
	
	/**
	 * DAO(データベースアクセスオブジェクト）を取得する
	 * @return $wpdb
	 */
	public function getDao(){
		return $wpdb;
	}
	
	/**
	 * シンプルなSQL実行(SELECTは未対応）
	 * @param string $sql
	 * {@inheritDoc}
	 * @see IDao::sqlExe()
	 */
	public function sqlExe($sql){
		global $wpdb;
		return $wpdb->query( $sql );
	}
	
	/**
	 * シンプルなSQL実行(SELECTは未対応）
	 * @param string $sql
	 * {@inheritDoc}
	 * @see IDao::query()
	 */
	public function query($sql){
		global $wpdb;
		return $wpdb->query( $sql );
	}
	
	
	
	public function begin(){
		return $this->sqlExe('BEGIN');
	}
	
	public function rollback(){
		return $this->sqlExe('ROLLBACK');
	}
	
	public function commit(){
		return $this->sqlExe('COMMIT');
	}
	
	
	/**
	 * SQLを実行してデータを取得する
	 * {@inheritDoc}
	 * @see IDao::getData()
	 */
	public function getData($sql){
		global $wpdb;
		$data = $wpdb->get_results($sql);
		
		// stdClassオブジェクトから配列に変換する
		$data2=[];
		if(!empty($data)){
			foreach($data as $stdClassEnt){
				$data2[] = (array) $stdClassEnt;
			}
		}
		
		return $data2;
	}
	
	/**
	 * SQLを実行してエンティティを取得する
	 * {@inheritDoc}
	 * @see IDao::getEnt()
	 */
	public function getEnt($sql){
		global $wpdb;
		$ent = $wpdb->get_results($sql);
		
		$ent2 = [];
		if(!empty($ent)){
			$ent2 = (array)$ent[0];
		}
		
		return $ent2;
	}
	
	
	/**
	 * SQLを実行して一つの値を取得する
	 * {@inheritDoc}
	 * @see IDao::getValue()
	 */
	public function getValue($sql){
		global $wpdb;
		$value = $wpdb->get_var($sql);
		return $value;
	}
	
	
	
}

