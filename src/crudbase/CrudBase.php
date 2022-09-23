<?php 
namespace CrudBase;

/**
 * CRUD support class
 *
 * @version 4.0.0
 * @since 2014-1-1 | 2022-9-21
 *
 */
class CrudBase{
    
    
    /**
     * テンプレートからファイルパスを組み立てる
     * @param array $FILES $_FILES
     * @param string $path_tmpl ファイルパステンプレート
     * @param array $ent エンティティ
     * @param string $field　file要素のname属性
     * @param string $date パスに含める日時 ← 「Y-m-d H:i:s」型で指定 ← 省略した場合は現在日時になる。
     * @return string ファイルパス
     */
    public static  function makeFilePath(&$FILES, $path_tmpl, $ent, $field, $date=null){
        
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
        
        if(strpos($fp, '%unique')){
            $unique = uniqid(rand(1, 1000)); // ユニーク値を取得
            $fp = str_replace('%unique', $unique, $fp);
        }
        
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
}