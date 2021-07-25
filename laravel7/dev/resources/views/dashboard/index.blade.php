
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ダッシュボード</title>
	
	
	<script src="{{ asset('/js/app.js') }}" defer></script>
	<script src="{{ CRUD_BASE_JS }}" defer></script>
	<script src="{{ asset('/js/Dashboard/index.js')  . '?v=1.0.0' }}" defer></script>
	<link href="{{ asset('/css/app.css') }}" rel="stylesheet">
	<link href="{{ CRUD_BASE_CSS }}" rel="stylesheet">

	
</head>
<body>
@include('layouts.plain_header')

<div class="container-fluid">

いろはうた


</div><!-- container-fluid -->
@include('layouts.common_footer')


</body>
</html>