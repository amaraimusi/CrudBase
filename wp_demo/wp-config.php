<?php
/**
 * WordPress の基本設定
 *
 * このファイルは、インストール時に wp-config.php 作成ウィザードが利用します。
 * ウィザードを介さずにこのファイルを "wp-config.php" という名前でコピーして
 * 直接編集して値を入力してもかまいません。
 *
 * このファイルは、以下の設定を含みます。
 *
 * * MySQL 設定
 * * 秘密鍵
 * * データベーステーブル接頭辞
 * * ABSPATH
 *
 * @link https://ja.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// 注意:
// Windows の "メモ帳" でこのファイルを編集しないでください !
// 問題なく使えるテキストエディタ
// (http://wpdocs.osdn.jp/%E7%94%A8%E8%AA%9E%E9%9B%86#.E3.83.86.E3.82.AD.E3.82.B9.E3.83.88.E3.82.A8.E3.83.87.E3.82.A3.E3.82.BF 参照)
// を使用し、必ず UTF-8 の BOM なし (UTF-8N) で保存してください。

// ** MySQL 設定 - この情報はホスティング先から入手してください。 ** //
/** WordPress のためのデータベース名 */
define( 'DB_NAME', 'crud_bases' );

/** MySQL データベースのユーザー名 */
define( 'DB_USER', 'root' );

/** MySQL データベースのパスワード */
define( 'DB_PASSWORD', 'neko' );

/** MySQL のホスト名 */
define( 'DB_HOST', 'localhost' );

/** データベースのテーブルを作成する際のデータベースの文字セット */
define( 'DB_CHARSET', 'utf8mb4' );

/** データベースの照合順序 (ほとんどの場合変更する必要はありません) */
define( 'DB_COLLATE', '' );

/**#@+
 * 認証用ユニークキー
 *
 * それぞれを異なるユニーク (一意) な文字列に変更してください。
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の秘密鍵サービス} で自動生成することもできます。
 * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせることになります。
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'I|Bl-kBo8bl[Yf#n~jH{zKp]c4MmF#eto^E$fg6h3eN)&9pm[E7nlUt{n>&-Syk4' );
define( 'SECURE_AUTH_KEY',  'yrBp1De2N?2G1o0WW22]B3;9)v_}rj^M7PX3(&>zPUs16JGUL!ld;ldV<=N+96R,' );
define( 'LOGGED_IN_KEY',    'd#Y+tI][-Z06eO!Pc{1X!Ip{<)?%S.6rCU1o@$f^HO3~HRJY]^-`E~K@T~`YoT2.' );
define( 'NONCE_KEY',        'l@a5aNLV(hRSfXmt6MHo.p+MD?9l^a.8W*00JRhQz$r*LJ(A4=T|&edouL?eo9^/' );
define( 'AUTH_SALT',        '!SxM/f;]6k/[u19&B /)vn`.m2lU76H^Ylfai9Wu7n2Nmip!MdwpC|5`MT*sc^7q' );
define( 'SECURE_AUTH_SALT', '{KNyWw=7(5CSWhDDLb>Q2E(<C!yeN?I_Jls^c:r1r!/[-v,QdOPlXQYz=-8Pq$z!' );
define( 'LOGGED_IN_SALT',   'X4X>R[`<kg29lcE+`5*dI<`}>i:-v0j!m8*!BLT~kmce#i5h]4^]o~$-L8+#NxT#' );
define( 'NONCE_SALT',       '$%;nnyPfyf,lw}R>4+Z1}}{b5bMOn+/=/.5=uG.{fj1ZO-C=HQo7~qInt[Jj`w,<' );

/**#@-*/

/**
 * WordPress データベーステーブルの接頭辞
 *
 * それぞれにユニーク (一意) な接頭辞を与えることで一つのデータベースに複数の WordPress を
 * インストールすることができます。半角英数字と下線のみを使用してください。
 */
$table_prefix = 'wp_';

/**
 * 開発者へ: WordPress デバッグモード
 *
 * この値を true にすると、開発中に注意 (notice) を表示します。
 * テーマおよびプラグインの開発者には、その開発環境においてこの WP_DEBUG を使用することを強く推奨します。
 *
 * その他のデバッグに利用できる定数についてはドキュメンテーションをご覧ください。
 *
 * @link https://ja.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* 編集が必要なのはここまでです ! WordPress でのパブリッシングをお楽しみください。 */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
