<?php

class CrudBaseHelperWp implements ICrudBaseHelper{
	
	private $param;
	
	/**
	 * $paramのセッター
	 * @param array $param
	 */
	public function setParam(&$param){
		$this->param = $param;
	}
	
	public function css($css_fp){
		$version = $this->param['version'];
		$css_dp = $this->param['css_dp'];
		$fp = $css_dp . $css_fp;
		echo "<link href='{$fp}?v={$version}' rel='stylesheet'>";
	}

	public function js($js_fp){
		
		$version = $this->param['version'];
		$js_dp = $this->param['js_dp'];
		$fp = $js_dp . $js_fp;
		echo "<script src='{$fp}?v={$version}'></script>";
	}
	
	
	/**
	 * メイン検索の入力フォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 * @param string $wamei フィールド和名
	 * @param int $width 入力フォームの横幅（省略可）
	 * @param string $title ツールチップメッセージ（省略可）
	 * @param int $maxlength 最大文字数(共通フィールドは設定不要）
	 */
	public function inputKjMain(&$kjs,$field,$wamei,$width=200,$title=null,$maxlength=255){
		
		if($title==null) $title = $wamei."で検索";

		$html = "
			  <input name='data[Client][kj_main]' 
					id='{$field}' 
					value='' 
					placeholder='{$wamei}' 
					style='width:{$width}px' 
					class='kjs_inp' 
					title='{$title}' 
					maxlength='{$maxlength}' 
					type='search'>
		";
		
		echo $html;
		
	}
	
	/**
	 * 検索用のid入力フォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 */
	public function inputKjId(&$kjs){
		
		$html = "
			<input
				type='text'
				id='kj_id'
				value=''
				placeholder='-- ID --'
				style='width:100px'
				class='kjs_inp'
				title='IDによる検索'
				maxlength='8'
			>
		";
		
		echo $html;

		
	}
	
	
	/**
	 * 検索用のテキスト入力フォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 * @param string $wamei フィールド和名
	 * @param int $width 入力フォームの横幅（省略可）
	 * @param string $title ツールチップメッセージ（省略可）
	 * @param int $maxlength 最大文字数(共通フィールドは設定不要）
	 */
	public function inputKjText(&$kjs, $field, $wamei, $width=200, $title=null, $maxlength=255){
		
		if($title==null) $title = $wamei."で検索";
		
		$html = "
			<input
				type='text'
				id='{$field}'
				value=''
				placeholder='{$wamei}'
				class='kjs_inp'
				style='width:{$width}px'
				title='{$title}'
				maxlength='{$maxlength}'
			>
		";
		echo $html;
		
	}
	

	/**
	 * 検索用のセレクトフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 * @param string $wamei フィールド和名
	 * @param string $list 選択肢リスト
	 * @param int $width 入力フォームの横幅（省略可）
	 * @param string $title ツールチップメッセージ（省略可）
	 */
	public function inputKjSelect(&$kjs, $field, $wamei, $list, $width=150, $title=null){
		
		// 選択肢
		if($list == null) $list = [];
		$option_html = '';
		foreach($list as $key => $str){
			$option_html .= "<option value='{$key}'>{$str}</option>";
		}
		
		if($title==null) $title = $wamei."で検索";
		
		$html = "
			<select
				id='{$field}'
				style='width:{$width}px'
				class='kjs_inp'
				title='{$title}'>
				<option value=''>-- {$wamei} --</option>
				{$option_html}
			</select>
		";
		
		echo $html;

	}
	
	
	/**
	 * 検索用のhiddenフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 */
	public function inputKjHidden(&$kjs, $field){
		
		$html="
			<input 
				 type='hidden' 
				 id='{$field}'
				 value='$kjs[$field]'
 				 data-field='{$field}'
	 			 class='kj_wrap kjs_inp'
			/>
		";
		
		echo $html;
		
	}
	
	
	/**
	 * 検索用の削除フラグフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 *
	 */
	public function inputKjDeleteFlg(&$kjs){
		
		$html = "
			<select id='kj_delete_flg' class='kjs_inp'>
				<option value='-1'>すべて表示</option>
				<option value='0' selected='selected'>有効</option>
				<option value='1'>削除</option>
			</select>
		";
		
		echo $html;

	}
	
	
	/**
	 * 検索用の日時セレクトフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 * @param string $wamei フィールド和名
	 * @param string $list 選択肢リスト（省略可）
	 * @param int $width 入力フォームの横幅（省略可）
	 * @param string $title ツールチップメッセージ（省略可）
	 */
	public function inputKjDateTimeA($kjs, $field, $wamei, $list=array(), $width=200, $title=null){
		
		if($title==null) $title = $wamei."で検索";
		echo "<div class='kj_div kj_wrap' data-field='{$field}' >";
		$this->inputKjSelect($kjs, $field, $wamei, $list, $width, $title);
		echo "</div>";

	}
	
	
	/**
	 * 検索用の表示件数セレクトを作成
	 *
	 * @param array $kjs 検索条件データ
	 *
	 */
	public function inputKjLimit(&$kjs){
		
		$html = "
			<select id='row_limit' style='height:27px' class='kjs_inp'>
				<option value='5'>5件表示</option>
				<option value='10'>10件表示</option>
				<option value='20'>20件表示</option>
				<option value='50' selected='selected'>50件表示</option>
				<option value='100'>100件表示</option>
				<option value='200'>200件表示</option>
				<option value='500'>500件表示</option>
			</select>
		";
		
		echo $html;
	}

	
}