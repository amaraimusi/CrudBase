# CrudBase

管理画面の見本システム
updated 2021-2-18

## 当プロジェクト（CrudBase）の準備

Laravel7をインストールする。

```
cd ~/git/CrudBase/setup_for_laravel7`
php composer.phar install
```




## CrudBase for Laravel7 の新プロジェクトを立ち上げる手順

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



