<?php

$this->headStrategy = null; // CrudBaseヘッダー・ストラテジー
if($fw_strategy_type == 'wpm'){
	require_once 'wordpress/CrudBaseHeadStgWpm.php';
	$this->headStrategy = new CrudBaseHeadStgWpm();
}else{
	require_once 'cakephp/CrudBaseHeadStgCake.php';
	$this->headStrategy = new CrudBaseHeadStgCake();
}

$this->headStrategy->before($param);
// ■■■□□□■■■□□□



//var_dump($cbHelper);//■■■□□□■■■□□□)
// CrudBaseヘルパーの初期化。各種パラメータをセットする。
$this->CrudBase->init([
	'model_name'=>$model_name_c,
	'bigDataFlg'=>$bigDataFlg,
	'debug_mode'=>$debug_mode,
]);

// CSSファイルの読み込み
$this->CrudBase->css('bootstrap.min.css');
$this->CrudBase->css('bootstrap-theme.min.css');
$this->CrudBase->css('Layouts/default.css');
$this->CrudBase->css('CrudBase/common.css');
$this->CrudBase->css('clm_show_hide.css');
$this->CrudBase->css('CrudBase/FileUploadK.css');
$this->CrudBase->css('CrudBase/CalendarViewK.css');
$this->CrudBase->css('CrudBase/CrudBaseBulkAdd.css');
$this->CrudBase->css('CrudBase/ReqBatch.css');

// JSファイルの読み込み
//$this->CrudBase->js('jquery-3.4.1.min.js');
$this->CrudBase->js('bootstrap.min.js');
$this->CrudBase->js('vue.min.js');
$this->CrudBase->js('CrudBase/dist/CrudBase.min.js');

?>

<div>
<input id='param_json' type="hidden" value='<?php echo $param_json;?>' />
<input id='base_url' type="hidden" value='<?php echo $base_url;?>' />
<input id='referer_url' type="hidden" value='<?php echo $referer_url;?>' />
<input id='now_url' type="hidden" value='<?php echo $now_url;?>' />
<input id='act_flg' type="hidden" value='1' />
<input id='page_no' type="hidden" value='<?php echo $pages['page_no'];?>' />
<input id='sort_field' type="hidden" value='<?php echo $pages['sort_field'];?>' />
<input id='sort_desc' type="hidden" value='<?php echo $pages['sort_desc'];?>' />
<input id='webroot' type="hidden" value='<?php echo $home_dp;?>' />
<input id='home_dp' type="hidden" value='<?php echo $home_dp;?>' />
<input id='bigDataFlg' type="hidden" value='<?php echo $bigDataFlg;?>' />
<input id='debug_mode' type="hidden" value='<?php echo $debug_mode;?>' />
<input id='row_exc_flg' type="hidden" value='<?php echo $row_exc_flg;?>' />
<input id='def_kjs_json' type="hidden" value='<?php echo $def_kjs_json;?>' />
<input id='kjs_json' type="hidden" value='<?php echo $kjs_json;?>' />
</div>


<?php 
$this->headStrategy->after($param);
?>