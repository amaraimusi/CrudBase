/**
 * CrudBaseストラテジー：Cake
 * @version 1.0.0
 * @date 2020-3-30
 * @license MIT
 * @auther kenji uehara
 */
class CrudBaseStgCake{



	/**
	 * パラメータに空プロパティがあれば、デフォルト値をセットする
	 * @param object param パラメータ
	 */
	setParamIfEmpty(param){

		if(param == null){
			param = {};
		}

		// 画面コード（スネーク記法）
		if(param['src_code'] == null){
			throw new Exception("'src_code' is empty!")
		}

		// 画面コード （キャメル）
		if(param['src_code_c'] == null){
			param['src_code_c'] = this._snakeToCamel(param.src_code);
		}
		
		// CRUD対象テーブルセレクタ
		if(param['tbl_slt'] == null){
			param['tbl_slt'] = param.src_code + '_tbl';
		}

		// 編集フォームセレクタ
		if(param['edit_form_slt'] == null){
			param['edit_form_slt'] = 'ajax_crud_edit_form';
		}

		// 新規フォームセレクタ
		if(param['new_form_slt'] == null){
			param['new_form_slt'] = 'ajax_crud_new_inp_form';
		}

		// 削除フォームセレクタ
		if(param['delete_form_slt'] == null){
			param['delete_form_slt'] = 'ajax_crud_delete_form';
		}

		// 抹消フォームセレクタ
		if(param['eliminate_form_slt'] == null){
			param['eliminate_form_slt'] = 'ajax_crud_eliminate_form';
		}

		// コンテンツセレクタ
		if(param['contents_slt'] == null){
			param['contents_slt'] = null;
		}

		// 編集登録サーバーURL
		if(param['edit_reg_url'] == null){
			param['edit_reg_url'] = param.src_code + '/ajax_reg';
		}

		// 新規登録サーバーURL
		if(param['new_reg_url'] == null){
			param['new_reg_url'] = param.src_code + '/ajax_reg';
		}

		// 削除登録サーバーURL
		if(param['delete_reg_url'] == null){
			param['delete_reg_url'] = param.src_code + '/ajax_delete';
		}

		// 自動保存サーバーURL
		if(param['auto_save_url'] == null){
			param['auto_save_url'] = param.src_code + '/auto_save';
		}

		// ファイルアップロードデータ
		if(param['file_uploads'] == null){
			param['file_uploads'] = null;
		}

		// フォーム横幅
		if(param['form_width'] == null){
			param['form_width'] = null; // nullはフォーム幅がauto
		}

		// フォーム縦幅
		if(param['form_height'] == null){
			param['form_height'] = null; // nullはフォーム幅がauto
		}

		// フォーム位置
		if(param['form_position'] == null){
			param['form_position'] = 'auto';
		}


		// フォームの前面深度(z-index)
		if(param['form_z_index'] == null){
			param['form_z_index'] = 9;
		}

		// バリデーションメッセージセレクタ
		if(param['valid_msg_slt'] == null){
			param['valid_msg_slt'] = '.err';
		}

		// 自動閉フラグ
		if(param['auto_close_flg'] == null){
			param['auto_close_flg'] = 0;
		}

		// 新規入力追加場所フラグ
		if(param['ni_tr_place'] == null){
			param['ni_tr_place'] = 0;
		}

		// 表示フィルターデータ
		if(param['disFilData'] == null){
			param['disFilData'] = null;
		}

		// 検索条件情報
		if(param['kjs'] == null){
			param['kjs'] = null;
		}

		// デバイスタイプ
		if(param['device_type'] == null){
			param['device_type'] = this.judgDeviceType(); // デバイスタイプ（PC/SP）の判定
		}

		// ■■■□□□■■■□□□
//		// エラータイプリスト
//		if(param['errTypes'] == null){
//			var err_types_json = jQuery('#err_types_json').val();
//			param['errTypes'] = jQuery.parseJSON(err_types_json);
//		}
		
		
		if(param['drag_and_resize_flg'] == null) param['drag_and_resize_flg'] = 1;
		
		// フォームモード
		if(param['form_mode'] == null) param['form_mode'] = 1
		
		if(param['midway_dp'] == null) param['midway_dp'] = '';
		
		if(param['configData'] == null) param['configData'] = {};
		
		this.param = param;
		
		return param;
	}
	
	
	/**
	 * スネーク記法をキャメル記法に変換する
	 * (例) big_cat_test → BigCatTest
	 */
	_snakeToCamel(str){
		//_+小文字を大文字にする(例:_a を A)
		str = str.replace(/_./g,
			(s) => {
				return s.charAt(1).toUpperCase();
			}
		);

		// 先頭を大文字化する
		str = str.charAt(0).toUpperCase() + str.slice(1);
		
		return str;
	}
	
	
	/**
	 * デバイスタイプ（PC/SP）の判定
	 * @return string デバイスタイプ pc,sp
	 */
	judgDeviceType(){
		var device = 'pc';
		if (screen.width <= 480) {
			device = 'sp';
		}
		return device;
	}
	
}