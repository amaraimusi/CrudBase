#!/bin/sh
echo 'cake_demoのCrudBase関連ファイルをディストリビューションフォルダ(distフォルダ）に上書きコピーします。'
echo '更新日付が新しいファイルだけ上書きします。'

rsync -auvz ../cake_demo/app/Vendor/CrudBase ../dist/CrudBase/php
rsync -auvz ../cake_demo/app/webroot/js/CrudBase ../dist/CrudBase/js
rsync -auvz ../cake_demo/app/webroot/css/CrudBase ../dist/CrudBase/css


echo "------------ 上書きコピー完了"
cmd /k