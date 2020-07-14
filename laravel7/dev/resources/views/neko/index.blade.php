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
		<script src="{{ asset('js/app.js') }}" defer></script>
		<script src="{{ asset('/js/test.js') }}"></script>
		<script src="{{ $crud_base_js . $ver_str }}" defer></script>
		<link href="{{ asset('css/app.css') }}" rel="stylesheet">
		<link href="{{ $crud_base_css . $ver_str }}" rel="stylesheet">
		
		
	</head>
	<body>
		<div>


<div class="cb_func_line">


	<div class="cb_breadcrumbs">
	<?php
// 		$this->Html->addCrumb("トップ",'/');
// 		$this->Html->addCrumb("ネコ画面");
// 		echo $this->Html->getCrumbs(" > ");
	?>
	</div>
	



		</div>
	</body>
</html>