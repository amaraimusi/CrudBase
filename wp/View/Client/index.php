<?php 
include $home_dp . '/Vendor/CrudBase/CrudBaseHead.php';
$this->CrudBase->js('Client/index.js');
?>

<div class="cb_func_line">

	<div class="cb_breadcrumbs">
		<a href="/actiestim/wp/wp-admin/admin.php?page=actiestim%2Fmng_index.php">トップ</a>＞
		<span>顧客管理画面</span>
	</div>
	
	<div class="cb_kj_main">
		<!-- 検索条件入力フォーム -->
		<form class="form_kjs">
		<?php $this->CrudBase->inputKjMain($kjs,'kj_main','',null,'顧客名、備考を検索する');?>
		<input type='button' value='検索' onclick='searchKjs()' class='search_kjs_btn btn btn-success' />
		<div class="btn-group">
			<a href="" class="ini_rtn btn btn-info btn-xs" title="この画面を最初に表示したときの状態に戻します。（検索状態、列並べの状態を初期状態に戻します。）">
				&times;</a>
			<button type="button" class="btn btn-default btn-xs" title="詳細検索項目を表示する" onclick="jQuery('.cb_kj_detail').toggle(300)">詳細検索</button>
		</div>
		
		<div class="cb_kj_detail" style="display:none">
		<?php 
		
		// --- CBBXS-1004
		$this->CrudBase->inputKjId($kjs);
		$this->CrudBase->inputKjText($kjs,'kj_inquiry_no','問い合わせ番号');
		$this->CrudBase->inputKjText($kjs,'kj_client_name','社名・団体名');
		$this->CrudBase->inputKjText($kjs,'kj_mail','メール');
		$this->CrudBase->inputKjSelect($kjs,'kj_company_type','取得者属性',$companyTypeList); 
		$this->CrudBase->inputKjSelect($kjs,'kj_traveler_type','旅行参加者属性',$travelerTypeList); 
		$this->CrudBase->inputKjNumRange($kjs,'partic_count','参加人数');
		$this->CrudBase->inputKjSelect($kjs,'kj_bus_num_type','バス台数タイプ',$busNumTypeList); 
		$this->CrudBase->inputKjNumRange($kjs,'bus_num','バス台数');
		$this->CrudBase->inputKjMoDateRng($kjs,'kj_travel_date','旅行時期');
		$this->CrudBase->inputKjSelect($kjs,'kj_travel_type','旅行形態',$travelTypeList); 
		$this->CrudBase->inputKjText($kjs,'kj_last_name','氏');
		$this->CrudBase->inputKjText($kjs,'kj_first_name','名');
		$this->CrudBase->inputKjText($kjs,'kj_last_kana','氏（ふりがな）');
		$this->CrudBase->inputKjText($kjs,'kj_first_kana','名（ふりがな）');
		$this->CrudBase->inputKjText($kjs,'kj_client_addr','住所');
		$this->CrudBase->inputKjText($kjs,'kj_tel','電話番号');
		$this->CrudBase->inputKjNumRange($kjs,'total_amt','合計金額');
		$this->CrudBase->inputKjText($kjs,'kj_note','備考');
		$this->CrudBase->inputKjHidden($kjs,'kj_sort_no');
		$this->CrudBase->inputKjDeleteFlg($kjs);
		$this->CrudBase->inputKjText($kjs,'kj_update_user','更新者');
		$this->CrudBase->inputKjText($kjs,'kj_ip_addr','IPアドレス');
		$this->CrudBase->inputKjCreated($kjs);
		$this->CrudBase->inputKjModified($kjs);

		// --- CBBXE
		
		$this->CrudBase->inputKjLimit($kjs);
		echo "<input type='button' value='検索' onclick='searchKjs()' class='search_kjs_btn btn btn-success' />";
		
		//echo $this->element('CrudBase/crud_base_cmn_inp');■■■□□□■■■□□□
		

		?>
			<div class="kj_div" style="margin-top:5px">
				<input type="button" value="リセット" title="検索入力を初期に戻します" onclick="resetKjs()" class="btn btn-primary btn-xs" />
			</div>
		</div>
		</form><!-- form_kjs -->
	</div>
	
	<!-- マスタリンクボタン -->
	<div style="display:inline-block;margin-left:20px">
		<a href="act" class="btn btn-info btn-xs" title="アクティビティ一覧画面を表示します。">アクティビティ</a>
		<a href="client_act" class="btn btn-info btn-xs" title="顧客アクティビティ画面を表示します。">顧客アクティビティ</a>
		<a href="genre" class="btn btn-info btn-xs" title="ジャンル一覧画面を表示します。">ジャンル</a>
	</div>
	
	<div id="cb_func_btns" class="btn-group" >
		<button type="button" onclick="$('#detail_div').toggle(300);" class="btn btn-default">設定</button>
	</div>
		
</div><!-- cb_func_line -->

<div style="clear:both"></div>

<!-- 一括追加機能  -->
<div id="crud_base_bulk_add" style="display:none"></div>

<?php include $elm_dp . 'crud_base_new_page_version.php'; ?>
<div id="err" class="text-danger"><?php echo $errMsg;?></div>

<div style="clear:both"></div>

<div id="detail_div" style="display:none">
	
	<div id="main_tools" style="margin-bottom:10px;">
		<?php 
			// 列表示切替機能
			include $elm_dp . 'clm_cbs.php';
			
			// CSVエクスポート機能
			$csv_dl_url = $this->html->webroot . 'client/csv_download';
			$this->CrudBase->makeCsvBtns($csv_dl_url);

		?>

		<button id="crud_base_bulk_add_btn" type="button" class="btn btn-default btn-sm" onclick="crudBase.crudBaseBulkAdd.showForm()" >一括追加</button>
		
	</div><!-- main_tools -->
	
	<div id="sub_tools">
		<!-- CrudBase設定 -->
		<div id="crud_base_config" style="display:inline-block"></div>
		
		<button id="calendar_view_k_btn" type="button" class="btn btn-default btn-xs" onclick="calendarViewKShow()" >
			<span class="glyphicon glyphicon-time" >カレンダーモード</span></button>
		
		<button type="button" class="btn btn-default btn-xs" onclick="sessionClear()" >セッションクリア</button>
	
		<button id="table_transform_tbl_mode" type="button" class="btn btn-default btn-xs" onclick="tableTransform(0)" style="display:none">一覧の変形・テーブルモード</button>	
		<button id="table_transform_div_mode" type="button" class="btn btn-default btn-xs" onclick="tableTransform(1)" >一覧の変形・スマホモード</button>
		
	</div><!-- sub_tools -->
</div><!-- detail_div -->


<div id="new_inp_form_point"></div><!-- 新規入力フォーム表示地点 -->

<?php include $elm_dp . 'pagenation_t.php'; ?>

<div id="calendar_view_k"></div>


<div id="crud_base_auto_save_msg" style="height:20px;" class="text-success"></div>

<?php if(!empty($data)){ ?>
	<button type="button" class="btn btn-warning btn-sm" onclick="newInpShow(this, 'add_to_top');">
		<span class="glyphicon glyphicon-plus-sign" title="新規入力"> 追加</span></button>
<?php } ?>
	
<!-- 一覧テーブル -->
<table id="client_tbl" class="table table-striped table-bordered table-condensed" style="display:none;margin-bottom:0px">

<thead>
<tr>
	<?php
	foreach($field_data as $ent){
		$row_order=$ent['row_order'];
		echo "<th class='{$ent['id']}'>{$pages['sorts'][$row_order]}</th>";
	}
	?>
	<th></th>
</tr>
</thead>
<tbody>
<?php

// td要素出力を列並モードに対応させる
$this->CrudBase->startClmSortMode($field_data);

foreach($data as $i=>$ent){
	echo "<tr id='ent{$ent['id']}' >";
// 	// CBBXS-1005
 	$this->CrudBase->tdId($ent,'id',array('checkbox_name'=>'pwms'));
 	$this->CrudBase->tdStr($ent,'inquiry_no');
	$this->CrudBase->tdStr($ent,'client_name');
	$this->CrudBase->tdStr($ent,'mail');
 	$this->CrudBase->tdList($ent,'company_type',$companyTypeList);
 	$this->CrudBase->tdList($ent,'traveler_type',$travelerTypeList);
	$this->CrudBase->tdPlain($ent,'partic_count');
	$this->CrudBase->tdList($ent,'bus_num_type',$busNumTypeList);
	$this->CrudBase->tdPlain($ent,'bus_num');
	$this->CrudBase->tdPlain($ent,'travel_date');
	$this->CrudBase->tdList($ent,'travel_type',$travelTypeList);
	$this->CrudBase->tdStr($ent,'last_name');
	$this->CrudBase->tdStr($ent,'first_name');
	$this->CrudBase->tdStr($ent,'last_kana');
	$this->CrudBase->tdStr($ent,'first_kana');
	$this->CrudBase->tdStr($ent,'client_addr');
	$this->CrudBase->tdStr($ent,'tel');
	$this->CrudBase->tdPlain($ent,'total_amt');
	$this->CrudBase->tdStr($ent,'note');
	$this->CrudBase->tdPlain($ent,'sort_no');
	$this->CrudBase->tdDeleteFlg($ent,'delete_flg');
	$this->CrudBase->tdStr($ent,'update_user');
	$this->CrudBase->tdStr($ent,'ip_addr');
	$this->CrudBase->tdPlain($ent,'created');
	$this->CrudBase->tdPlain($ent,'modified');

// 	// CBBXE
	
 	$this->CrudBase->tdsEchoForClmSort();// 列並に合わせてTD要素群を出力する
	
	// 行のボタン類
	echo "<td><div style='display:inline-block'>";
	$id = $ent['id'];
	echo  "<input type='button' value='↑↓' onclick='rowExchangeShowForm(this)' class='row_exc_btn btn btn-info btn-xs' />";
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

<?php include $elm_dp . 'pagenation_b.php'; ?>
<br>

<button type="button" class="btn btn-warning btn-sm" onclick="newInpShow(this, 'add_to_bottom');">
	<span class="glyphicon glyphicon-plus-sign" title="新規入力"> 追加</span></button>
	
<?php include $elm_dp . 'crud_base_pwms.php';  // 複数選択による一括処理?>
<table id="crud_base_forms">

	<!-- 新規入力フォーム -->
	<tr id="ajax_crud_new_inp_form" class="crud_base_form" style="display:none;padding-bottom:60px"><td colspan='5'>
	
		<div>
			<div style="color:#3174af;float:left">新規入力</div>
			<div style="float:left;margin-left:10px">
				<button type="button"  onclick="newInpReg();" class="btn btn-success btn-xs reg_btn">
					<span class="glyphicon glyphicon-ok reg_btn_msg"></span>
				</button>
			</div>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-xs" onclick="closeForm('new_inp')"><span class="glyphicon glyphicon-remove"></span></button>
			</div>
		</div>
		<div style="clear:both;height:4px"></div>
		<div class="err text-danger"></div>
		
		<div style="display:none">
	    	<input type="hidden" name="form_type">
	    	<input type="hidden" name="row_index">
	    	<input type="hidden" name="sort_no">
		</div>
	
	
		<!-- CBBXS-1006 -->
		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >問い合わせ番号: </div>
			<div class='cbf_input'>
				<input type="text" name="inquiry_no" class="valid " value=""  maxlength="100" title="100文字以内で入力してください" />
				<label class="text-danger" for="inquiry_no"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >社名・団体名: </div>
			<div class='cbf_input'>
				<input type="text" name="client_name" class="valid " value=""  maxlength="100" title="100文字以内で入力してください" />
				<label class="text-danger" for="client_name"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >メール: </div>
			<div class='cbf_input'>
				<input type="text" name="mail" class="valid " value=""  maxlength="255" title="255文字以内で入力してください" />
				<label class="text-danger" for="mail"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >取得者属性: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('company_type',null,$companyTypeList,null);?>
				<label class="text-danger" for="company_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行参加者属性: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('traveler_type',null,$travelerTypeList,null);?>
				<label class="text-danger" for="traveler_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >参加人数: </div>
			<div class='cbf_input'>
				<input type="text" name="partic_count" class="valid" value="" pattern="^[+-]?([0-9]*[.])?[0-9]+$" maxlength="11" title="数値を入力してください" />
				<label class="text-danger" for="partic_count" ></label>
			</div>
		</div>
		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >バス台数タイプ: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('bus_num_type',null,$busNumTypeList,null);?>
				<label class="text-danger" for="bus_num_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >バス台数: </div>
			<div class='cbf_input'>
				<input type="text" name="bus_num" class="valid" value="" pattern="^[+-]?([0-9]*[.])?[0-9]+$" maxlength="11" title="数値を入力してください" />
				<label class="text-danger" for="bus_num" ></label>
			</div>
		</div>
		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行時期: </div>
			<div class='cbf_input'>
				<input type="text" name="travel_date" class="valid datepicker" value=""  pattern="([0-9]{4})(/|-)([0-9]{1,2})(/|-)([0-9]{1,2})" title="日付形式（Y-m-d）で入力してください(例：2012-12-12)" />
				<label class="text-danger" for="travel_date"></label>
			</div>
		</div>
		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行形態: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('travel_type',null,$travelTypeList,null);?>
				<label class="text-danger" for="travel_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >氏: </div>
			<div class='cbf_input'>
				<input type="text" name="last_name" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="last_name"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >名: </div>
			<div class='cbf_input'>
				<input type="text" name="first_name" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="first_name"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >氏（ふりがな）: </div>
			<div class='cbf_input'>
				<input type="text" name="last_kana" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="last_kana"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >名（ふりがな）: </div>
			<div class='cbf_input'>
				<input type="text" name="first_kana" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="first_kana"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >住所: </div>
			<div class='cbf_input'>
				<input type="text" name="client_addr" class="valid " value=""  maxlength="500" title="500文字以内で入力してください" />
				<label class="text-danger" for="client_addr"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >電話番号: </div>
			<div class='cbf_input'>
				<input type="text" name="tel" class="valid " value=""  maxlength="40" title="40文字以内で入力してください" />
				<label class="text-danger" for="tel"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >合計金額: </div>
			<div class='cbf_input'>
				<input type="text" name="total_amt" class="valid" value="" pattern="^[+-]?([0-9]*[.])?[0-9]+$" maxlength="11" title="数値を入力してください" />
				<label class="text-danger" for="total_amt" ></label>
			</div>
		</div>
		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >備考: </div>
			<div class='cbf_input'>
				<input type="text" name="note" class="valid " value=""  maxlength="1000" title="1000文字以内で入力してください" />
				<label class="text-danger" for="note"></label>
			</div>
		</div>


		<!-- CBBXE -->
		
		<div style="clear:both"></div>
		<div class="cbf_inp_wrap">
			<button type="button" onclick="newInpReg();" class="btn btn-success reg_btn">
				<span class="glyphicon glyphicon-ok reg_btn_msg"></span>
			</button>
		</div>
	</td></tr><!-- new_inp_form -->



	<!-- 編集フォーム -->
	<tr id="ajax_crud_edit_form" class="crud_base_form" style="display:none"><td colspan='5'>
		<div  style='width:100%'>
	
			<div>
				<div style="color:#3174af;float:left">編集</div>
				<div style="float:left;margin-left:10px">
					<button type="button"  onclick="editReg();" class="btn btn-success btn-xs reg_btn">
						<span class="glyphicon glyphicon-ok reg_btn_msg"></span>
					</button>
				</div>
				<div style="float:right">
					<button type="button" class="btn btn-primary btn-xs" onclick="closeForm('edit')"><span class="glyphicon glyphicon-remove"></span></button>
				</div>
			</div>
			<div style="clear:both;height:4px"></div>
			<div class="err text-danger"></div>
			
			<!-- CBBXS-1007 -->
			<div class="cbf_inp_wrap">
				<div class='cbf_inp' >ID: </div>
				<div class='cbf_input'>
					<span class="id"></span>
				</div>
			</div>
		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >問い合わせ番号: </div>
			<div class='cbf_input'>
				<input type="text" name="inquiry_no" class="valid " value=""  maxlength="100" title="100文字以内で入力してください" />
				<label class="text-danger" for="inquiry_no"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >社名・団体名: </div>
			<div class='cbf_input'>
				<input type="text" name="client_name" class="valid " value=""  maxlength="100" title="100文字以内で入力してください" />
				<label class="text-danger" for="client_name"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >メール: </div>
			<div class='cbf_input'>
				<input type="text" name="mail" class="valid " value=""  maxlength="255" title="255文字以内で入力してください" />
				<label class="text-danger" for="mail"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >取得者属性: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('company_type',null,$companyTypeList,null);?>
				<label class="text-danger" for="company_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行参加者属性: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('traveler_type',null,$travelerTypeList,null);?>
				<label class="text-danger" for="traveler_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >参加人数: </div>
			<div class='cbf_input'>
				<input type="text" name="partic_count" class="valid " value=""  maxlength="11" title="11文字以内で入力してください" />
				<label class="text-danger" for="partic_count"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >バス台数タイプ: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('bus_num_type',null,$busNumTypeList,null);?>
				<label class="text-danger" for="bus_num_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >バス台数: </div>
			<div class='cbf_input'>
				<input type="text" name="bus_num" class="valid " value=""  maxlength="11" title="11文字以内で入力してください" />
				<label class="text-danger" for="bus_num"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行時期: </div>
			<div class='cbf_input'>
				<input type="text" name="travel_date" class="valid datepicker" value=""  pattern="([0-9]{4})(/|-)([0-9]{1,2})(/|-)([0-9]{1,2})" title="日付形式（Y-m-d）で入力してください(例：2012-12-12)" />
				<label class="text-danger" for="travel_date"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp_label' >旅行形態: </div>
			<div class='cbf_input'>
				<?php $this->CrudBase->selectX('travel_type',null,$travelTypeList,null);?>
				<label class="text-danger" for="travel_type"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >氏: </div>
			<div class='cbf_input'>
				<input type="text" name="last_name" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="last_name"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >名: </div>
			<div class='cbf_input'>
				<input type="text" name="first_name" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="first_name"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >氏（ふりがな）: </div>
			<div class='cbf_input'>
				<input type="text" name="last_kana" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="last_kana"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >名（ふりがな）: </div>
			<div class='cbf_input'>
				<input type="text" name="first_kana" class="valid " value=""  maxlength="50" title="50文字以内で入力してください" />
				<label class="text-danger" for="first_kana"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >住所: </div>
			<div class='cbf_input'>
				<input type="text" name="client_addr" class="valid " value=""  maxlength="500" title="500文字以内で入力してください" />
				<label class="text-danger" for="client_addr"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >電話番号: </div>
			<div class='cbf_input'>
				<input type="text" name="tel" class="valid " value=""  maxlength="40" title="40文字以内で入力してください" />
				<label class="text-danger" for="tel"></label>
			</div>
		</div>


		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >合計金額: </div>
			<div class='cbf_input'>
				<input type="text" name="total_amt" class="valid " value=""  maxlength="oubl" title="oubl文字以内で入力してください" />
				<label class="text-danger" for="total_amt"></label>
			</div>
		</div>

		<div class="cbf_inp_wrap">
			<div class='cbf_inp' >備考: </div>
			<div class='cbf_input'>
				<input type="text" name="note" class="valid " value=""  maxlength="1000" title="1000文字以内で入力してください" />
				<label class="text-danger" for="note"></label>
			</div>
		</div>


			<div class="cbf_inp_wrap">
				<div class='cbf_inp_label' >無効フラグ：</div>
				<div class='cbf_input'>
					<input type="checkbox" name="delete_flg" class="valid"  />
				</div>
			</div>

			<!-- CBBXE -->
			
			<div style="clear:both"></div>
			<div class="cbf_inp_wrap">
				<button type="button"  onclick="editReg();" class="btn btn-success reg_btn">
					<span class="glyphicon glyphicon-ok reg_btn_msg"></span>
				</button>
			</div>
			
			<div class="cbf_inp_wrap" style="padding:5px;">
				<input type="button" value="更新情報" class="btn btn-default btn-xs" onclick="$('#ajax_crud_edit_form_update').toggle(300)" /><br>
				<aside id="ajax_crud_edit_form_update" style="display:none">
					更新日時: <span class="modified"></span><br>
					生成日時: <span class="created"></span><br>
					ユーザー名: <span class="update_user"></span><br>
					IPアドレス: <span class="ip_addr"></span><br>
				</aside>
			</div>
		</div>
	</td></tr>
</table>







<!-- 削除フォーム -->
<div id="ajax_crud_delete_form" class="panel panel-danger" style="display:none">

	<div class="panel-heading">
		<div class="pnl_head1">削除</div>
		<div class="pnl_head2"></div>
		<div class="pnl_head3">
			<button type="button" class="btn btn-default btn-sm" onclick="closeForm('delete')"><span class="glyphicon glyphicon-remove"></span></button>
		</div>
	</div>
	
	<div class="panel-body" style="min-width:300px">
	<table><tbody>

		<!-- Start ajax_form_new -->
		<tr><td>ID: </td><td>
			<span class="id"></span>
		</td></tr>
		

		<tr><td>顧客名: </td><td>
			<span class="client_name"></span>
		</td></tr>
		
		<tr><td>画像ファイル: </td><td>
			<label for="img_fn"></label><br>
			<img src="" class="img_fn" width="80" height="80" ></img>
		</td></tr>


		<!-- Start ajax_form_end -->
	</tbody></table>
	<br>
	

	<button type="button"  onclick="deleteReg();" class="btn btn-danger">
		<span class="glyphicon glyphicon-remove"></span>　削除する
	</button>
	<hr>
	
	<input type="button" value="更新情報" class="btn btn-default btn-xs" onclick="$('#ajax_crud_delete_form_update').toggle(300)" /><br>
	<aside id="ajax_crud_delete_form_update" style="display:none">
		更新日時: <span class="modified"></span><br>
		生成日時: <span class="created"></span><br>
		ユーザー名: <span class="update_user"></span><br>
		IPアドレス: <span class="ip_addr"></span><br>
		ユーザーエージェント: <span class="user_agent"></span><br>
	</aside>
	

	</div><!-- panel-body -->
</div>



<!-- 抹消フォーム -->
<div id="ajax_crud_eliminate_form" class="panel panel-danger" style="display:none">

	<div class="panel-heading">
		<div class="pnl_head1">抹消</div>
		<div class="pnl_head2"></div>
		<div class="pnl_head3">
			<button type="button" class="btn btn-default btn-sm" onclick="closeForm('eliminate')"><span class="glyphicon glyphicon-remove"></span></button>
		</div>
	</div>
	
	<div class="panel-body" style="min-width:300px">
	<table><tbody>

		<!-- Start ajax_form_new -->
		<tr><td>ID: </td><td>
			<span class="id"></span>
		</td></tr>
		

		<tr><td>顧客名: </td><td>
			<span class="client_name"></span>
		</td></tr>


		<!-- Start ajax_form_end -->
	</tbody></table>
	<br>
	

	<button type="button"  onclick="eliminateReg();" class="btn btn-danger">
		<span class="glyphicon glyphicon-remove"></span>　抹消する
	</button>
	<hr>
	
	<input type="button" value="更新情報" class="btn btn-default btn-xs" onclick="$('#ajax_crud_eliminate_form_update').toggle(300)" /><br>
	<aside id="ajax_crud_eliminate_form_update" style="display:none">
		更新日時: <span class="modified"></span><br>
		生成日時: <span class="created"></span><br>
		ユーザー名: <span class="update_user"></span><br>
		IPアドレス: <span class="ip_addr"></span><br>
		ユーザーエージェント: <span class="user_agent"></span><br>
	</aside>
	

	</div><!-- panel-body -->
</div>


<br />

<!-- 埋め込みJSON -->
<div style="display:none">
	
	<!-- CBBXS-1022 -->
	<input id="company_type_json" type="hidden" value='<?php echo $company_type_json; ?>' />
	<input id="traveler_type_json" type="hidden" value='<?php echo $traveler_type_json; ?>' />
	<input id="bus_num_type_json" type="hidden" value='<?php echo $bus_num_type_json; ?>' />
	<input id="travel_type_json" type="hidden" value='<?php echo $travel_type_json; ?>' />

	<!-- CBBXE -->
</div>



<!-- ヘルプ用  -->
<input type="button" class="btn btn-info btn-sm" onclick="$('#help_x').toggle()" value="ヘルプ" />
<div id="help_x" class="help_x" style="display:none">
	<h2>ヘルプ</h2>

	<?php include $elm_dp . 'crud_base_help.php'; ?>

</div>


















