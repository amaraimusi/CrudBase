<?php 


extract($crudBaseData, EXTR_REFS);
extract($masters, EXTR_REFS);

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

	<div class="cb_kj_main">
	<!-- 検索条件入力フォーム -->
	<form action="" class="form_kjs" id="{{$model_name_c}}IndexForm" method="post" accept-charset="utf-8">
		
		<?php $this->CrudBase->inputKjMain($kjs,'kj_main','',null,'ネコ名、備考を検索する');?>
		<input type='button' value='検索' onclick='searchKjs()' class='search_kjs_btn btn btn-success btn-sm' />
		<div class="btn-group">
			<button type="button" class="btn btn-secondary btn-sm" title="詳細検索項目を表示する" onclick="jQuery('.cb_kj_detail').toggle(300)">詳細検索</button>
			<a href="" class="ini_rtn btn btn-primary btn-sm" title="この画面を最初に表示したときの状態に戻します。（検索状態、列並べの状態を解除）">リセット</a>
		</div>
		<div class="cb_kj_detail" style="display:none">
		<?php 
		
		// --- CBBXS-1004
		$this->CrudBase->inputKjText($kjs,'kj_neko_name','ネコ名前');
		$this->CrudBase->inputKjMoDateRng($kjs,'kj_neko_date','ネコ日付');
		$this->CrudBase->inputKjNumRange($kjs,'neko_val','ネコ数値'); 
		$this->CrudBase->inputKjSelect($kjs,'kj_neko_group','ネコ種別', $masters['nekoGroupList']); 
		$this->CrudBase->inputKjText($kjs,'kj_neko_dt','ネコ日時',150);
		$this->CrudBase->inputKjFlg($kjs,'kj_neko_flg','ネコフラグ');
		$this->CrudBase->inputKjText($kjs,'kj_img_fn','ネコ名前',200);
		$this->CrudBase->inputKjText($kjs,'kj_note','備考',200,'部分一致検索');
		$this->CrudBase->inputKjId($kjs); 
		$this->CrudBase->inputKjHidden($kjs,'kj_sort_no');
		$this->CrudBase->inputKjDeleteFlg($kjs);
		$this->CrudBase->inputKjText($kjs,'kj_update_user','更新者',150);
		$this->CrudBase->inputKjText($kjs,'kj_ip_addr','更新IPアドレス',200);
		$this->CrudBase->inputKjCreated($kjs);
		$this->CrudBase->inputKjModified($kjs);
		
		// --- CBBXE
		
		$this->CrudBase->inputKjLimit($kjs);
		echo "<input type='button' value='検索' onclick='searchKjs()' class='search_kjs_btn btn btn-success' />";
		
		
		?>
				<div class="kj_div" style="margin-top:5px">
					<input type="button" value="検索入力リセット" title="検索入力を初期に戻します" onclick="resetKjs()" class="btn btn-primary btn-sm" />
				</div>
				
				<input id="crud_base_json" type="hidden" value='<?php echo $crud_base_json?>' />
		</div>
	</form>
	</div><!-- cb_kj_main -->
	<div id="cb_func_btns" class="btn-group" >
		<button type="button" onclick="jQuery('#detail_div').toggle(300);" class="btn btn-secondary btn-sm">ツール</button>
	</div>
</div><!-- cb_func_line -->


<div style="clear:both"></div>

<!-- 一括追加機能  -->
<div id="crud_base_bulk_add" style="display:none"></div>

<?php $this->CrudBase->divNewPageVarsion(); // 新バージョン通知区分を表示?>
<div id="err" class="text-danger"><?php echo $errMsg;?></div>

<div style="clear:both"></div>

<div id="detail_div" style="display:none">
	<div id="main_tools" style="margin-bottom:10px;">
		<?php 
			// 列表示切替機能
			$this->CrudBase->divCsh();
			
			// CSVエクスポート機能
 			$csv_dl_url =  'csv_download';
 			$this->CrudBase->makeCsvBtns($csv_dl_url);

		?>

		<button id="crud_base_bulk_add_btn" type="button" class="btn btn-secondary btn-sm" onclick="crudBase.crudBaseBulkAdd.showForm()" >一括追加</button>
		
	</div><!-- main_tools -->
	
	<div id="sub_tools">
		<!-- CrudBase設定 -->
		<div id="crud_base_config" style="display:inline-block"></div>
		
		<button id="calendar_view_k_btn" type="button" class="btn btn-secondary btn-sm" onclick="calendarViewKShow()" >カレンダーモード</button>
		
		<button type="button" class="btn btn-secondary btn-sm" onclick="sessionClear()" >セッションクリア</button>
	
		<button id="table_transform_tbl_mode" type="button" class="btn btn-secondary btn-sm" onclick="tableTransform(0)" style="display:none">一覧の変形・テーブルモード</button>	
		<button id="table_transform_div_mode" type="button" class="btn btn-secondary btn-sm" onclick="tableTransform(1)" >一覧の変形・スマホモード</button>
		
	</div><!-- sub_tools -->
</div><!-- detail_div -->


<div id="new_inp_form_point"></div><!-- 新規入力フォーム表示地点 -->

<?php $this->CrudBase->divPagenation(); // ページネーション ?>

<div id="calendar_view_k"></div>


<div id="crud_base_auto_save_msg" style="height:20px;" class="text-success"></div>

<?php if(!empty($data)){ ?>
	<button type="button" class="btn btn-warning btn-sm" onclick="newInpShow(this, 'add_to_top');">新規追加</span></button>
<?php } ?>


<!-- 一覧テーブル -->
<table id="neko_tbl" class="table table-striped table-bordered table-condensed" style="display:none;margin-bottom:0px">

<thead>
<tr>
	<?php
	foreach($fieldData as $ent){
		$row_order=$ent['row_order'];
		echo "<th class='{$ent['id']}'>{$pages['sorts'][$row_order]}</th>";
	}
	?>
	<th style="min-width:207px"></th>
</tr>
</thead>
<tbody>
<?php

// td要素出力を列並モードに対応させる
$this->CrudBase->startClmSortMode();

foreach($data as $i=>&$ent){

	echo "<tr id='ent{$ent['id']}' >";
	// CBBXS-1005
	$this->CrudBase->tdId($ent,'id',array('checkbox_name'=>'pwms'));
	$this->CrudBase->tdMoney($ent,'neko_val');
	$this->CrudBase->tdStr($ent,'neko_name');
	$this->CrudBase->tdList($ent,'neko_group',$nekoGroupList);
	$this->CrudBase->tdPlain($ent,'neko_date');
	$this->CrudBase->tdPlain($ent,'neko_dt');
	$this->CrudBase->tdFlg($ent,'neko_flg');
	$this->CrudBase->tdImage($ent,'img_fn');
	$this->CrudBase->tdNote($ent,'note',50);
	$this->CrudBase->tdPlain($ent,'sort_no');
	$this->CrudBase->tdDeleteFlg($ent,'delete_flg');
	$this->CrudBase->tdPlain($ent,'update_user');
	$this->CrudBase->tdPlain($ent,'ip_addr');
	$this->CrudBase->tdPlain($ent,'created');
	$this->CrudBase->tdPlain($ent,'modified');
	// CBBXE
	
	$this->CrudBase->tdsEchoForClmSort();// 列並に合わせてTD要素群を出力する
	
	// 行のボタン類
	echo "<td><div style='display:inline-block'>";
	$id = $ent['id'];
	echo  "<input type='button' value='↑↓' onclick='rowExchangeShowForm(this)' class='row_exc_btn btn btn-info btn-sm' />";
	$this->CrudBase->rowEditBtn($id);
	$this->CrudBase->rowCopyBtn($id);
	echo "</div>&nbsp;";
	echo "<div style='display:inline-block'>";
	$this->CrudBase->rowDeleteBtn($ent); // 削除ボタン
	$this->CrudBase->rowEnabledBtn($ent); // 有効ボタン
	echo "&nbsp;";
	$this->CrudBase->rowEliminateBtn($ent);// 抹消ボタン
	echo "</div>";
	echo "</td>";
	echo "</tr>";
}

?>
</tbody>
</table>
		
</div></body>
</html>