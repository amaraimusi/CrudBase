<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>猫インデックスにゃーん</title>
		<script src="{{ asset('js/app.js') }}" defer></script>
		<script src="{{ asset('/js/test.js') }}"></script>
		<link href="{{ asset('css/app.css') }}" rel="stylesheet">
		
	</head>
	<body>
		<div>
			Hello World!<br>
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button> 
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
		</div>
	</body>
</html>