#!/bin/sh
echo 'ソースコードを差分アップロードします。'

rsync -auvz ../dist amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase
rsync -auvz --exclude='.env' ../laravel7 amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase


echo "------------ 送信完了"
#cmd /k