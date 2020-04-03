<?php
/**
 * CrudBaseヘッダー・フレームワークストラテジーのインターフェース
 *
 * @note
 * WordPress、CakePHPなどフレームワークが異なる状況にCrudBaseを対応させるためのインターフェース。
 * ストラテジーパターンにより異なるフレームワークに対応させる。
 *
 * @version 1.0.0
 * @date 2020-3-30
 * @license MIT
 *
 */
interface ICrudBaseHeadStg{
	public function before(&$param);
	public function after(&$param);
}