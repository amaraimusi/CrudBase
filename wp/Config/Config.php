<?php

const CB_PROJECT_CODE = 'actiestim'; // プロジェクトコード

const WEBROOT = '/actiestim/wp/wp-content/plugins/actiestim/mng/';// WEBルート

const ACT_CUSTOMS_COURSE_CNT = 6; // アクティビティ・カスタムパラメータ・コース件数

const C_TAX = 0.1; // 消費税率

// 料金タイプリスト
const AMT_CALC_TYPE_LIST = [
	1 => '計算タイプA',
	2 => '計算タイプB',
];


// 取得者属性
const COMPANY_TYPE_LIST = [
	1 => '旅行会社',
	2 => '旅行会社以外',
];


// 旅行参加者属性
const TRAVELER_TYPE_LIST = [
	1 => '高校生以下',
	2 => '大学生以上',
];


// バス台数タイプ
const BUS_NUM_TYPE_LIST = [
	1 => '1台',
	2 => '2台以上',
];


// 旅行形態
const TRAVEL_TYPE_LIST = [
	1 => '日帰り',
	2 => '1泊',
	3 => '2泊以上',
];

// 消費税
const C_TAX_LIST = [
	0 => 10,
	1 => 8,
];



// 値種別定数    この定数を主に利用しているファイルと関数 → 「app/View/Helper/AppHelper.php : ent_show_x」
const CB_FLD_SANITAIZE = 1;  // サニタイズ
const CB_FLD_MONEY = 2;  // 金額表記
const CB_FLD_DELETE_FLG = 3;  // 有無フラグ
const CB_FLD_BR = 4;  // 改行brタグ化
const CB_FLD_BOUTOU = 5;  // 長文字の冒頭
const CB_FLD_TEXTAREA = 6;  // テキストエリア用（改行対応）
const CB_FLD_NULL_ZERO = 7; // nullは0表記
const CB_FLD_TA_CSV = 8; // テキストエリアCSV出力用


function debug($v){
	echo '<pre>';
	var_dump($v);
	echo '</pre>';
}