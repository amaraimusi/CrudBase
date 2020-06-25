<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>ヤギ：べーべー</title>
		
	</head>
	<body>
		<div>
			{{$data['yagi']}}
			<?php echo $data['neko'] ?>
		</div>
	</body>
</html>