<?php



/**
 * XSSサニタイズ
 * @param string $str
 * @return string
 */
function xss($str){
	if(gettype($str)=='string'){
		$str = str_replace(array('<','>'),array('&lt;','&gt;'),$str);
	}
	return $str;
}

class CrudBaseConfig{
	
	
	

// 	/**
// 	 * DB設定
// 	 * @return string[] DB設定情報
// 	 */
// 	public function getDbConfig(){
// 		$dbConfig = [
// 			'host'=>'localhost',
// 			'db_name'=>'xxx',
// 			'user'=>'root',
// 			'pw'=>'neko',
// 		]; 
		
// 		return $dbConfig;
// 	}
	
}