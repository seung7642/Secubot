<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Agent Details</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">

<style>
div#window {
	width: 100%;
	height: 500px;
}
#window_0, #window_1, #window_2 {
	width: 30%;
	height: 500px;
	border: 1px solid gray;
	box-shadow: 3px 3px 3px 3px;
	margin: 10px;
	float: left;
}
table > tbody > tr > td {
	cursor: pointer;
}
</style>
</head>
<body>
	
	<div id="window">
		<div id="window_0">
			<table class="table table-hover table-striped table-sm">
				<caption>AgentList</caption>
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Phone</th>
					<tr>
				</thead>
				<tbody>
					<tr>
						<td>Values</td>
						<td>Values</td>
						<td>Values</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="window_1"></div>
		<div id="window_2"></div>
	</div>


	<script src="js/bootstrap.min.js"></script>
	<script>
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(e) {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					var res = xhr.responseText;
					var parse = JSON.parse(res);
					console.log(parse);
				}
			}
		}
		xhr.open('GET', 'http://211.193.58.162/AgentList');
		xhr.setRequestHeader('Accept', 'application/json');
		xhr.send();
	</script>
</body>
</html>