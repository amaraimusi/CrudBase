#!/bin/sh
echo 'ソースコードを差分アップロードします。'

rsync -auvz ../dist amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase
rsync -auvz ../laravel7 amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase
rsync -auvz ../laravel7/dev/.env_p amaraimusi@amaraimusi.sakura.ne.jp:www/CrudBase/laravel7/dev/.env


echo "------------ 送信完了"
#cmd /k