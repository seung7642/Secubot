<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<caption>에이전트 리스트</caption>
				<thead class="thead-dark">
					<tr>
						<th>Name</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody id="forData">
					<tr>
						<td>Values</td>
						<td>Values</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="window_1">
			<table class="table table-hover table-striped table-sm">
				<caption>프로세스 세션</caption>
				<thead class="thead-dark">
					<tr>
						<th>세션</th>
					</tr>
				</thead>
				<tbody id="forData2">
					<tr>
						<td>Values</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="window_2">
			<table class="table table-hover table-striped table-sm">
				<caption>행위 리스트</caption>
				<thead class="thead-dark">
					<tr>
						<th>Name</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody id="forData3">
					<tr>
						<td>Values</td>
						<td>Values</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
		function get() {
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/AgentList",
				global: false,
				type: "GET",
				async: false
			}).responseText;
			return bodyContent;
		}
		var tmp = get();
		var parse = JSON.parse(tmp);
		for (var i in parse.AgentList) {
			document.querySelector("#forData").innerHTML += "<td>" + parse.AgentList[i].UserName + "</td>" +
			"<td>" + parse.AgentList[i].userPhone + "</td>";
		}
		
		function getGuid() {
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/ProcessGuidList?",
				global: false,
				type: "GET",
				async: false
			}).responseText;
			return bodyContent;
		}
		var tmp = get();
		var parse = JSON.parse(tmp);
	</script>
</body>
</html>