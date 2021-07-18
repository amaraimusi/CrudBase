# CrudBase

管理画面の見本システム
since 2013-6-1 | 2021-7-11


CRUD画面（一覧、新規追加、編集、削除）の見本システムです。

パッケージ的なもので、このシステムを元に様々なWEBアプリを開発しています。
元々はCakePHP2によるシステムでしたが、
このリポジトリではLaravel7に変更しています。


2013年からバージョンアップを重ねてきました。
この見本システムから数多くのWEBアプリを開発してきました。
WordPressのプラグインも作成したことがあります。
2021年現在もテストや改良を繰り返し清廉しています。


jQueryに依存しています。
レイアウトはBootstrap4に依存しています。


以下の機能を備えています。
* 一覧表示
* 追加/編集/複製/削除/抹消
* 検索/詳細検索
* 初期戻し機能（リセットボタン）
* 列表示切替機能
* セッションクリア機能
* スマホ用一覧
* ページネーション
* 一括削除/有効
* ソート機能
* 行入替機能
* 一般モードとログインモードの切替
* CSVエスポート機能
* ユーザー管理画面
* ファイルアップロード機能
* ユーザー管理画面
* サインイン画面（アカウント登録機能）

------


## 見本サイトURL

<https://amaraimusi.sakura.ne.jp/crud_base/>

------


## 開発に必要なスキル

最低限のスキルとしてGitHubに関する知識が必要です。
バックエンド側で必要とするスキルはPHP7, MariaDB, MySQL, Laravel7.x系です。

フロントエンド側で必要とする技術はJavaScript ES6(ES2015), jQuery, Vue.js, Gulp, npm(Node.js)です。

必須ではありませんがComposerについて知っておくといくつかのファイルの意味が分かります。

## 当プロジェクト（CrudBase）の準備

.envのAPP_KEYを変更する

.envにデータベース情報を記述する。

データベースを作成

```
/CrudBase/laravel7/backup/crud_base_laravel7.sql
```

URLへアクセス

```
http://localhost/CrudBase/laravel7/dev/public/neko
```

------

## GitHub
<https://github.com/amaraimusi/cake_demo>

------

# 開発の準備
開発にはGitやphpの知識が必須になります。WEBシステム開発経験者向けの解説ですので詳しい説明は割愛します。

開発環境は各自でご用意ください。推奨環境はWindows10 + xampp（2021年6月時点で最新のもの）です。

GitHubにてプロジェクトをダウンロードできます。

<https://github.com/amaraimusi/cake_demo>

データベースはMySQLです。

開発用にテストデータ（cake_demo.sql）を用意しています。
farmin_food.sqlはphpmyadminなどでインポートできるようになっています。

[doc/cake_demo.sql](doc/cake_demo.sql)

------

## テスト用のアカウント

syoutokutaisi@example.com
yasigani@example.com
syo_umu_tennou@example.com
など他多数
パスワードはすべて「abcd1234」

------


##動作環境
php 7.4 MariaDB 10系

DBはMySQL5.6、MySQL8などでも可。

Chrome, Edge, Firefoxなどの主流なブラウザで動作。
スマートフォンやタブレットなどの主要ブラウザで動作。


------

## 設計図

なし


------

## ストレージ

一般ユーザーがアップロードした画像やファイルは以下のパスに保存されます。

/CrudBase/laravel7/dev/storage

------



## CrudBase for Laravel7 の新プロジェクトを立ち上げる手順(旧式）

プロジェクト名は「red_book」で手順説明をする。

プロジェクトのルートパスは「Windows for Git」に準ずる。例→C:\Users\user\git\プロジェクト名

1. GitHubのサイトにて新プロジェクトを作成する。(例→red_bookを作成）
1. cd ~/git
1. git cloneコマンドで新プロジェクトをダウンロード. 例→`git clone git@github.com:amaraimusi/red_book.git`
1. setup_for_laravel7（/CrudBase/setup_for_laravel7）フォルダ内のcomposerを新プロジェクトのルート直下に配置
1. phpMyAdminなどでDBを作成. → red_bookを作成
1. red_bookデータベースにamaraimusi_crud_base.sqlをインポートする。
1. Laravel7をダウンロード→php composer.phar create-project "laravel/laravel=7.*" dev
1. Laravelのテスト→http://localhost/red_book/dev/public
1. /red_book/dev/.envを開き、DB設定を行う。変更箇所→DB_DATABASE=red_book
1. 00_setup.shを開き、プロジェクト名を新プロジェクト名に書き換え、実行する。
1. ログイン機能のインストール
1. 　cd dev
1. 　composer require laravel/ui 2.*
1. 　php artisan ui vue --auth
1. 　ログイン機能の確認→http://localhost/red_book/dev/public/home
1. CrudBaseBulkで各管理画面を自動生成



