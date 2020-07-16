<?php 


extract($crudBaseData, EXTR_REFS);

require_once $crud_base_path . 'CrudBaseHelper.php';
$this->CrudBase = new CrudBaseHelper($crudBaseData);
$ver_str = '?v=' . $version; // キャッシュ回避のためのバージョン文字列


?>
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>猫インデックスにゃーん</title>
	
	<script src="{{ asset('/js/app.js') }}" defer></script>
	<script src="{{ asset('/js/test.js') }}" defer></script>
	<script src="{{ $crud_base_js . $ver_str }}" defer></script>
	<script src="{{ asset('/js/Neko/index.js')  . $ver_str }}" defer></script>
	<link href="{{ asset('/css/app.css') }}" rel="stylesheet">
	<link href="{{ $crud_base_css . $ver_str }}" rel="stylesheet">
	
</head>
<body><div class="container">
		


<div class="cb_func_line">

	<!-- 検索条件入力フォーム -->
	<form action="" class="form_kjs" id="{{$model_name_c}}IndexForm" method="post" accept-charset="utf-8">
		
		<?php $this->CrudBase->inputKjMain($kjs,'kj_main','',null,'ネコ名、備考を検索する');?>
		<input type='button' value='検索' onclick='searchKjs()' class='search_kjs_btn btn btn-success btn-xs' />
		<div class="btn-group">
			<button type="button" class="btn btn-secondary btn-sm" title="詳細検索項目を表示する" onclick="jQuery('.cb_kj_detail').toggle(300)">詳細検索</button>
			<a href="" class="ini_rtn btn btn-primary btn-sm" title="この画面を最初に表示したときの状態に戻します。（検索状態、列並べの状態を解除）">リセット</a>
		</div>
		<div class="cb_kj_detail" ><?php 
		$this->CrudBase->inputKjText($kjs,'kj_neko_name','ネコ名前');
		$this->CrudBase->inputKjMoDateRng($kjs,'kj_neko_date','ネコ日付');
		$this->CrudBase->inputKjNumRange($kjs,'neko_val','ネコ数値'); 
		$this->CrudBase->inputKjSelect($kjs,'kj_neko_group','ネコ種別', $masters['nekoGroupList']); 
		$this->CrudBase->inputKjText($kjs,'kj_neko_dt','ネコ日時',150);
		$this->CrudBase->inputKjFlg($kjs,'kj_neko_flg','ネコフラグ');
		$this->CrudBase->inputKjText($kjs,'kj_img_fn','ネコ名前',200);
		$this->CrudBase->inputKjText($kjs,'kj_note','備考',200,'部分一致検索');
		$this->CrudBase->inputKjId($kjs); 
		?></div>
		
		<input id="crud_base_json" type="hidden" value='<?php echo $crud_base_json?>' />
	</form>

TEST
</div>







		
</div></body>
</html>