<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Neko extends Model
{
	protected $table = 'nekos'; // 紐づけるテーブル名
	protected $guarded = ['id']; // 予期せぬ代入をガード。 通常、主キーフィールドや、パスワードフィールドなどが指定される。
	public $timestamps = false; // タイムスタンプ。 trueならcreated_atフィールド、updated_atフィールドに適用される。（それ以外のフィールドを設定で指定可）
	
	public function getData(){
		
		$data = \DB::table('nekos')
			->whereIn('neko_name', ['buta', 'ゴボウ', 'ハマダイコン'])
			->get();
		dump($data);
// 		$ent = \DB::table('nekos')->where('id', '4')->first();
// 		//$ent = \DB::table('nekos')->first();
// 		dump($ent);
		
		
// 		$data = \DB::table($this->table)->where('neko_val', '>' , 3)->get();
		

// // 		$query = \DB::table($this->table);
// // 		$query->where('id', 4);
// // 		$data = $query->get();
		
// 		dump($data);
	}
}
