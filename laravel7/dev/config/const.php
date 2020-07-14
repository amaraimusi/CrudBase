<?php

return [
		'CRUD_BASE_PATH' =>$_SERVER['DOCUMENT_ROOT'] . '\CrudBase\dist\CrudBase\php\CrudBase\\',
		'CRUD_BASE_JS' =>'/CrudBase/dist/CrudBase/js/CrudBase/dist/CrudBase.min.js',
		'CRUD_BASE_CSS' =>'/CrudBase/dist/CrudBase/css/CrudBase/dist/CrudBase.min.css',
		'WEB_ROOT' => '/CrudBase/laravel7/dev/',
];

function debug($var){
	dump($var);
}