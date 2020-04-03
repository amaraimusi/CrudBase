

$(function() {
	init();//初期化
	
	$('#client_tbl').show();// 高速表示のためテーブルは最後に表示する
	
});


var crudBase;//AjaxによるCRUD
var pwms; // ProcessWithMultiSelection.js | 一覧のチェックボックス複数選択による一括処理

/**
 *  顧客画面の初期化
 * 
  * ◇主に以下の処理を行う。
 * - 日付系の検索入力フォームにJQueryカレンダーを組み込む
 * - 列表示切替機能の組み込み
 * - 数値範囲系の検索入力フォームに数値範囲入力スライダーを組み込む
 * 
 * @version 1.2.2
 * @date 2015-9-16 | 2018-9-8
 * @author k-uehara
 */
function init(){
	
	
	// 検索条件情報を取得する
	var kjs_json = jQuery('#kjs_json').val();
	var kjs = jQuery.parseJSON(kjs_json);
	
	//AjaxによるCRUD
	crudBase = new CrudBase({
			'src_code':'client', // 画面コード（スネーク記法)
			'kjs':kjs,
			'ni_tr_place':0,
			configData:{delete_alert_flg:1} // 削除アラートフラグ    1:一覧行の削除ボタンを押したときアラートを表示する
		});

	// 表示フィルターデータの定義とセット
	var disFilData = {
			// CBBXS-1008
			'delete_flg':{
				'fil_type':'delete_flg',
			},

			// CBBXE
			
	};

	// CBBXS-1023
	// 取得者属性リストJSON
	var company_type_json = jQuery('#company_type_json').val();
	var companyTypeList = JSON.parse(company_type_json);
	disFilData['company_type'] ={'fil_type':'select','option':{'list':companyTypeList}};
	// 旅行参加者属性リストJSON
	var traveler_type_json = jQuery('#traveler_type_json').val();

	var travelerTypeList = JSON.parse(traveler_type_json);
	disFilData['traveler_type'] ={'fil_type':'select','option':{'list':travelerTypeList}};
	// バス台数タイプリストJSON
	var bus_num_type_json = jQuery('#bus_num_type_json').val();
	var busNumTypeList = JSON.parse(bus_num_type_json);
	disFilData['bus_num_type'] ={'fil_type':'select','option':{'list':busNumTypeList}};
	// 旅行形態リストJSON
	var travel_type_json = jQuery('#travel_type_json').val();
	var travelTypeList = JSON.parse(travel_type_json);
	disFilData['travel_type'] ={'fil_type':'select','option':{'list':travelTypeList}};

	// CBBXE

	
	crudBase.setDisplayFilterData(disFilData);

	//列並替変更フラグがON（列並べ替え実行）なら列表示切替情報をリセットする。
	if(localStorage.getItem('clm_sort_chg_flg') == 1){
		this.crudBase.csh.reset();//列表示切替情報をリセット
		localStorage.removeItem('clm_sort_chg_flg');
	}

	// 一覧のチェックボックス複数選択による一括処理
	pwms = new ProcessWithMultiSelection({
		'tbl_slt':'#client_tbl',
		'ajax_url':'client/ajax_pwms',
			});

	// 新規入力フォームのinput要素にEnterキー押下イベントを組み込む。
	$('#ajax_crud_new_inp_form input').keypress(function(e){
		if(e.which==13){ // Enterキーである場合
			newInpReg(); // 登録処理
		}
	});
	
	// 編集フォームのinput要素にEnterキー押下イベントを組み込む。
	$('#ajax_crud_edit_form input').keypress(function(e){
		if(e.which==13){ // Enterキーである場合
			editReg(); // 登録処理
		}
	});
	
	// CrudBase一括追加機能の初期化
	var today = new Date().toLocaleDateString();
	crudBase.crudBaseBulkAdd.init(
		[
			{'field':'client_name', 'inp_type':'textarea'}, 
//			{'field':'client_val', 'inp_type':'textarea'}, 
//			{'field':'client_group', 'inp_type':'select', 'list':clientGroupList, 'def':2}, 
//			{'field':'client_date', 'inp_type':'date', 'def':today}, 
//			{'field':'note', 'inp_type':'text', 'def':'TEST'}, 
//			{'field':'sort_no', 'inp_type':'sort_no', 'def':1}, 
		],
		{
			'ajax_url':'client/bulk_reg',
			'ta_placeholder':"Excelからコピーした顧客名、顧客数値を貼り付けてください。（タブ区切りテキスト）\n(例)\n顧客名A\t100\n顧客名B\t101\n",
		}
	);
}

/**
 * 新規入力フォームを表示
 * @param btnElm ボタン要素
 */
function newInpShow(btnElm, ni_tr_place){
	crudBase.newInpShow(btnElm, {'ni_tr_place':ni_tr_place});
}

/**
 * 編集フォームを表示
 * @param btnElm ボタン要素
 */
function editShow(btnElm){
	
	var option = {};
	crudBase.editShow(btnElm,option);
}



/**
 * 複製フォームを表示（新規入力フォームと同じ）
 * @param btnElm ボタン要素
 */
function copyShow(btnElm){
	crudBase.copyShow(btnElm);
}


/**
 * 削除アクション
 * @param btnElm ボタン要素
 */
function deleteAction(btnElm){
	crudBase.deleteAction(btnElm);
}


/**
 * 有効アクション
 * @param btnElm ボタン要素
 */
function enabledAction(btnElm){
	crudBase.enabledAction(btnElm);
}


/**
 * 抹消フォーム表示
 * @param btnElm ボタン要素
 */
function eliminateShow(btnElm){
	crudBase.eliminateShow(btnElm);
}

/**
 * 詳細検索フォーム表示切替
 * 
 * 詳細ボタンを押した時に、実行される関数で、詳細検索フォームなどを表示します。
 */
function show_kj_detail(){
	$("#kjs2").fadeToggle();
}

/**
 * フォームを閉じる
 * @parma string form_type new_inp:新規入力 edit:編集 delete:削除
 */
function closeForm(form_type){
	crudBase.closeForm(form_type)
}



/**
 * 検索条件をリセット
 * 
 * すべての検索条件入力フォームの値をデフォルトに戻します。
 * リセット対象外を指定することも可能です。
 * @param array exempts リセット対象外フィールド配列（省略可）
 */
function resetKjs(exempts){
	
	crudBase.resetKjs(exempts);
	
}




/**
 * 列並替画面に遷移する
 */
function moveClmSorter(){
	
	//列並替画面に遷移する <CrudBase:index.js>
	moveClmSorterBase('client');
	
}








/**
 * 新規入力フォームの登録ボタンアクション
 */
function newInpReg(){
	crudBase.newInpReg(null,null);
}

/**
 * 編集フォームの登録ボタンアクション
 */
function editReg(){
	crudBase.editReg(null,null);
}

/**
 * 削除フォームの削除ボタンアクション
 */
function deleteReg(){
	crudBase.deleteReg();
}

/**
 * 抹消フォームの抹消ボタンアクション
 */
function eliminateReg(){
	crudBase.eliminateReg();
}


/**
 * リアクティブ機能：TRからDIVへ反映
 * @param div_slt DIV要素のセレクタ
 */
function trToDiv(div_slt){
	crudBase.trToDiv(div_slt);
}

/**
 * 行入替機能のフォームを表示
 * @param btnElm ボタン要素
 */
function rowExchangeShowForm(btnElm){
	crudBase.rowExchangeShowForm(btnElm);
}

/**
 * 自動保存の依頼をする
 * 
 * @note
 * バックグランドでHTMLテーブルのデータをすべてDBへ保存する。
 * 二重処理を防止するメカニズムあり。
 */
function saveRequest(){
	crudBase.saveRequest();
}


/**
 * セッションクリア
 * 
 */
function sessionClear(){
	crudBase.sessionClear();
	
}


/**
 * テーブル変形
 * @param mode_no モード番号  0:テーブルモード , 1:区分モード
 */
function tableTransform(mode_no){

	crudBase.tableTransform(mode_no);

}

/**
 * 検索実行
 */
function searchKjs(){
	crudBase.searchKjs();
}

/**
 * カレンダーモード
 */
function calendarViewKShow(){
	// カレンダービューを生成 
	crudBase.calendarViewCreate('client_date');
}
