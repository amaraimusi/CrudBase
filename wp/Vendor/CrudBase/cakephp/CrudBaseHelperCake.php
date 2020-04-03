<?php
App::uses('FormHelper', 'View/Helper');

/**
 * CrudBase用ヘルパー(Cake向け）
 * 
 * @note
 * 検索条件入力フォームや、一覧テーブルのプロパティのラッパーを提供する
 * 
 * 
 * @version 1.9.0
 * @date 2016-7-27 | 2020-3-28
 * @author k-uehara
 *
 */
class CrudBaseHelperCake extends FormHelper implements ICrudBaseHelper{
	
	private $param;
	
	/**
	 * $paramのセッター
	 * @param array $param
	 */
	public function setParam($param){
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
	public function inputKjMain($kjs,$field,$wamei,$width=200,$title=null,$maxlength=255){
		
		if($title==null){
			$title = $wamei."で検索";
		}
		
		// maxlengthがデフォルト値のままなら、共通フィールド用のmaxlength属性値を取得する
		if($maxlength==255){
			$maxlength = $this->getMaxlenIfCommonField($field,$maxlength);
		}
		
		echo "<div class='' data-field='{$field}' style='display:inline-block'>";
		echo $this->input($this->_mdl.$field, array(
			'id' => $field,
			'value' => $kjs[$field],
			'type' => 'search',
			'label' => false,
			'placeholder' => $wamei,
			'style'=>"width:{$width}px",
			'class' => 'kjs_inp',
			'title'=>$title,
			'maxlength'=>$maxlength,
		));
		echo "</div>\n";
	}
	
	/**
	 * 検索用のid入力フォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 */
	public function inputKjId($kjs){
		
		echo "<div class='kj_div kj_wrap' data-field='kj_id'>\n";
		echo $this->input($this->_mdl.'kj_id', array(
			'id' => 'kj_id',
			'value' => $kjs['kj_id'],
			'type' => 'text',
			'label' => false,
			'placeholder' => '-- ID --',
			'style'=>'width:100px',
			'class' => 'kjs_inp',
			'title'=>'IDによる検索',
			'maxlength'=>8,
		));
		
		echo "</div>\n";
		
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
	public function inputKjText($kjs,$field,$wamei,$width=200,$title=null,$maxlength=255){
		
		if($title==null){
			$title = $wamei."で検索";
		}
		
		// maxlengthがデフォルト値のままなら、共通フィールド用のmaxlength属性値を取得する
		if($maxlength==255){
			$maxlength = $this->getMaxlenIfCommonField($field,$maxlength);
		}
		
		echo "<div class='kj_div kj_wrap' data-field='{$field}'>\n";
		echo $this->input($this->_mdl.$field, array(
			'id' => $field,
			'value' => $kjs[$field],
			'type' => 'text',
			'label' => false,
			'placeholder' => $wamei,
			'class'=>"kjs_inp",
			'style'=>"width:{$width}px",
			'title'=>$title,
			'maxlength'=>$maxlength,
		));
		echo "</div>\n";
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
	public function inputKjSelect($kjs,$field,$wamei,$list,$width=150,$title=null){
		
		if($title==null){
			$title = $wamei."で検索";
		}
		
		echo "<div class='kj_div kj_wrap' data-field='{$field}'>\n";
		echo $this->input($this->_mdl.$field, array(
			'id' => $field,
			'type' => 'select',
			'options' => $list,
			'empty' => "-- {$wamei} --",
			'default' => $kjs[$field],
			'label' => false,
			'style'=>"width:{$width}px",
			'class' => 'kjs_inp',
			'title'=>$title,
		));
		echo "</div>\n";
	}
	
	
	/**
	 * 検索用のhiddenフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 * @param string $field フィールド名
	 */
	public function inputKjHidden($kjs, $field){
		
		echo $this->input($this->_mdl.$field, array(
			'id' => $field,
			'value' => $kjs[$field],
			'type' => 'hidden',
			'data-field' => $field,
			'class' => 'kj_wrap kjs_inp',
		));
		
	}
	
	
	/**
	 * 検索用の削除フラグフォームを作成
	 *
	 * @param array $kjs 検索条件データ
	 *
	 */
	public function inputKjDeleteFlg($kjs){
		echo "<div class='kj_div kj_wrap' data-field='kj_delete_flg'>\n";
		echo $this->input($this->_mdl.'kj_delete_flg', array(
			'id' => 'kj_delete_flg',
			'type' => 'select',
			'options' => array(
				-1=>'すべて表示',
				0=>'有効',
				1=>'削除',
			),
			'default' => $kjs['kj_delete_flg'],
			'label' => false,
			'class' => 'kjs_inp',
		));
		echo "</div>\n";
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
	public function inputKjDateTimeA($kjs, $field, $wamei, $list, $width=200, $title=null){
		
		if($title==null){
			$title = $wamei."で検索";
		}
		
		echo "<div class='kj_div kj_wrap' data-field='{$field}' >\n";
		echo $this->input($this->_mdl.$field, array(
			'id' => $field,
			'type' => 'select',
			'options' => $list,
			'empty' => "-- {$wamei} --",
			'default' => $kjs[$field],
			'label' => false,
			'style' => "width:{$width}px",
			'class' => 'kjs_inp',
			'title' => $title,
		));
		echo "</div>\n";
	}
	
	
	/**
	 * 検索用の表示件数セレクトを作成
	 *
	 * @param array $kjs 検索条件データ
	 *
	 */
	public function inputKjLimit(&$kjs){
		echo "<div class='kj_div kj_wrap' data-field='row_limit'>\n";
		echo $this->input($this->_mdl.'row_limit', array(
			'id' => 'row_limit',
			'type' => 'select',
			'options' => array(
				5=>'5件表示',
				10=>'10件表示',
				20=>'20件表示',
				50=>'50件表示',
				100=>'100件表示',
				200=>'200件表示',
				500=>'500件表示',
			),
			'default' => $kjs['row_limit'],
			'label' => false,
			'style' => 'height:27px',
			'class' => 'kjs_inp',
		));
		echo "</div>";
	}
	
	
	

	
}