<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Neko extends Model
{
	protected $table = 'nekos'; // 紐づけるテーブル名
	protected $guarded = ['id']; // 予期せぬ代入をガード。 通常、主キーフィールドや、パスワードフィールドなどが指定される。
	public $timestamps = false; // タイムスタンプ。 trueならcreated_atフィールド、updated_atフィールドに適用される。（それ以外のフィールドを設定で指定可）
	
	public function getData(){
		
		$query = \DB::table('nekos')->
		selectRaw('id, neko_name, neko_val as CatValue');
		dump($query->toSql()); // →"select id, neko_name, neko_val as CatValue from `nekos`"
		
		$data = $query->get();
		dump($data);
		
// 		$query = \DB::table('nekos')->
// 		select('id', 'neko_name as cat', 'neko_val', 'neko_date');
// 		dump($query->toSql()); // →"select `id`, `neko_name` as `cat`, `neko_val`, `neko_date` from `nekos`"
		
// 		$data = $query->get();
// 		dump($data);
		
		
// 		$query = \DB::table('nekos')->
// 			whereRaw('neko_val = 4')->
// 			orderByRaw('neko_name desc');
// 		dump($query->toSql()); // →"select * from `nekos` where neko_val = 4 order by neko_name desc"
		
// 		$data = $query->get();
// 		dump($data);
		
		
		
// 		$query = \DB::table('nekos')->orderBy('neko_name');
// 		dump($query->toSql()); // → "select * from `nekos` order by `neko_name` asc"
			
// 		$data = $query->get();
// 		dump($data);
			
// 		$res = \DB::table('nekos')->where('id', 999)->doesntExist(); // true:レコード存在, false:存在しない
// 		dump($res);//■■■□□□■■■□□□)
		
		
// 		\DB::table('nekos')->orderBy('id')->chunk(4, function ($chunk) {
// 			dump(count($chunk));// → 4 → 4件ずつDBからデータ取得していることを意味している。
// 			foreach ($chunk as $ent) {
// 				$ent = (array)$ent;
// 				//dump($ent['neko_name']);
// 			}
// 		});
		
		
		
// 		$query = \DB::table('nekos');
// 		dump($query->toSql()); // "select * from `nekos`"
		
// 		$value1 = $query->count('id'); // 件数
// 		$value2 = $query->max('neko_val'); // 最大
// 		$value3 = $query->min('neko_val'); // 最小
// 		$value4 = $query->avg('neko_val'); // 平均
// 		$value5 = $query->sum('neko_val'); // 合計

		
		
		
// 		$query = \DB::table('nekos')->where('id', '=', 4);
// 		dump($query->toSql()); 
		
// 		$value = $query->first();
// 		dump($value);
		
		
		
// 		$query = \DB::table('nekos')->where('neko_val', '<', 5);
// 		dump($query->toSql()); // →"select * from `nekos` where `neko_val` < ?"
		
// 		$list = $query->pluck('neko_name');
// 		dump($list);
		
		
		
// 		$query = \DB::table('nekos')
// 			->where('neko_name', '=', 'ゴボウ')
// 			->orWhere('neko_val', '<', 4);
// 			dump($query->toSql()); // →"select * from `nekos` where `neko_name` = ? or `neko_val` < ?"
		
// 		$data = $query->get();
// 		dump($data);
		
		
		
// 		$query = \DB::table('nekos')->whereNotBetween ('neko_val', [2,4]);
// 		dump($query->toSql()); // →"select * from `nekos` where `neko_val` not between ? and ?"
		
// 		$data = $query->get();
// 		dump($data);
		
		
		
// 		$query = \DB::table('nekos')->where ([
// 				['neko_name', 'kame'],
// 				['neko_val', 3],
// 		]);
// 		dump($query->toSql()); // →"select * from `nekos` where (`neko_name` = ? and `neko_val` = ?)"
		
// 		$data = $query->get();
// 		dump($data);
		
		
		
// 		$query = \DB::table('nekos')->whereColumn ('created', '<', 'modified');
// 		dump($query->toSql()); // →"select * from `nekos` where `created` < `modified`"
		
// 		$data = $query->get();
// 		dump($data);
		
// 		$query = \DB::table('nekos')->whereTime ('neko_dt', '10:05:00');
// 		dump($query->toSql()); // → 
		
// 		$data = $query->get();
// 		dump($data);
		
		
// 		$query = \DB::table('nekos')->whereNotNull ('neko_val');
// 		dump($query->toSql()); // → "select * from `nekos` where `neko_val` is not null"
		
// 		$data = $query->get();
// 		dump($data);

		
// 		$data = \DB::table('nekos')
// 		->whereNotIn('neko_name', ['buta', 'ゴボウ', 'ハマダイコン'])
// 			->toSql();
// 		dump($data);
		
		
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
