<?php 
/**
 * CrudBaseヘルパー・フレームワークストラテジーのインターフェース
 * 
 * @note 
 * WordPress、CakePHPなどフレームワークが異なる状況にCrudBaseを対応させるためのインターフェース。
 * ストラテジーパターンにより異なるフレームワークに対応させる。
 * 
 * @version 1.0.0
 * @date 2020-3-27
 * @license MIT
 *
 */
interface ICrudBaseHelper{
	public function js($js_fp); // JSファイルの読み込み
	public function css($css_fp); // CSSファイルの読み込み
}