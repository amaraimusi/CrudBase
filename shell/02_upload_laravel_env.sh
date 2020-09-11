#!/bin/sh
echo 'ソースコードを差分アップロードします。'

rsync -auvz ../laravel7/dev/.env_p amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase/laravel7/dev/.env


echo "------------ 送信完了"
#cmd /k