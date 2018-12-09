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

<!-- Custom styles for this template -->
<link href="css/style.css?ver=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet">
<style>
body {
	font: sans-serif;
}
div#window {
	width: auto;
	height: auto;
    margin: 0px auto;
	padding: 0px;
	
}
#window_0, #window_1{
	width: 50%;
	height: 200px;
	float: left;
	border: 1px solid gray;
	overflow-y: auto;
	padding: 10px 10px;
	position:relative;
}
#cap{
	position:absolute;
}
#in{
    margin:10px;
    height: 100%;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
	overflow-y: auto;
}
#window_2 {
	width: 100%;
	height: auto;
	float: left;
    margin: 30px 10px ;
    overflow-y: auto;
}
table > tbody > tr > td {
	cursor: pointer;
}
div#policy {
	margin: 20px 20px;
	padding: 20px 20px;
	border: 1px solid gray;
}
.clear {
	clear: both;
}
label {
	display: inline-block;
	text-align: right;
}
</style>
</head>
<body>
<%
	String imagename = request.getParameter("imagename");
%>
	<div id="window">
		<h1>프로세스명: <%	out.print(imagename); %></h1>
		<div id="window_0">
			<table class="table table-hover table-striped table-sm">
				<caption class="cap">Process 에이전트 리스트</caption>
				<thead class="thead-dark">
					<tr>
						<th>Name</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody class="tData"  id="forData">
				</tbody>
			</table>
		</div>
		<div id="window_1">
			<table class="table table-hover table-striped table-sm">
				<caption class="cap">프로세스 세션</caption>
				<thead class="thead-dark">
					<tr>
						<th>세션</th>
					</tr>
				</thead>
				<tbody class="tData" id="forData2">
					<tr>
					</tr>
				</tbody>
			</table>
		</div>

    <br>
		<div id="window_2">
			<table class="table table-hover table-striped table-sm">
				<caption>행위 리스트</caption>
				<thead class="thead-dark">
						<colgroup>
							<col width="10%">
							<col width="5%">
							<col width="5%">
							<col width="35%">
							<col width="5%">
							<col width="20%">
							<col width="3%">
							<col width="5%">
						</colgroup>
					<tr>
						<th width="10%">UtcTime</th>
						<th width="5%">ParentPID</th>
						<th width="5%">PID</th>
						<th width="35%">Command Line</th>
						<th width="5%">RuleName</th>
						<th width="20%">Image Path</th>
						<th width="3%">IOC</th>
						<th width="5%">Stage</th>
					</tr>
				</thead>
				<tbody  id="forData3">
				</tbody>
			</table>
		</div>
		<div class="clear"></div>
		<div id="policy" class="pull-right1">
			<form action="" method="GET" class="form col-md-2" onsubmit="pausecomp(1000);alert('전송되었습니다');return false;">
				<label for="policyName">대응: </label>
				<select id="policyName" class="form-control">
					<option value="policy1">차단</option>
					<option value="policy2">정상</option>
				</select>
				<button type="submit" class="btn btn-success btn-custom m-b-5">추가</button>
			</form>
		</div>
	</div>


	<script>
		function pausecomp(millis) {
		    var date = new Date();
		    var curDate = null;
		    do { curDate = new Date(); }
		    while(curDate-date < millis);
		}
	</script>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
		function deleteElement(name){
			var container = name;
			if (container.length == 0)
				return;
			
			if(container.hasChildNodes()){
				while ( container.hasChildNodes() ) {
					container.removeChild( container.firstChild );
				}
				return;
			}
		}
		var urlString = window.location.href;
		var url = new URL(urlString);
		var md5 = url.searchParams.get("md5");
		function getProcessAgentList() {
			console.log("MD5: " + md5);
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/ProcessAgentList?MD5=" + md5,
				global: false,
				type: "GET",
				async: false
			}).responseText;
			return bodyContent;
		}
		tmp = getProcessAgentList();
		console.log("tmp: " + tmp);
		parse = JSON.parse(tmp);
		for (var i in parse.ProcessAgentList) {
			document.querySelector("#forData").innerHTML += "<td>" + parse.ProcessAgentList[i].UserName + "</td>" +
			"<td class=" + parse.ProcessAgentList[i].AgentID + ">" + parse.ProcessAgentList[i].userPhone + "</td>";
		}
		
		var forData = document.querySelector("#forData");
		console.log(forData);
		forData.addEventListener('click', function(e) {
				console.log("MD5: " + md5);
				var bodyContent = $.ajax({
					url: "http://211.193.58.162:2222/ProcessGuidList?MD5=" + md5 + "&AgentID=" +e.target.className,
					global: false,
					type: "GET",
					async: false
				}).responseText;
				parse = JSON.parse(bodyContent);
				document.querySelector("#forData2").innerHTML = "";
				for (var i in parse.ProcessGuidList){
					document.querySelector("#forData2").innerHTML += "<td class=" + e.target.className +">" + parse.ProcessGuidList[i] + "</td>";
				}
				document.querySelector("#forData3").innerHTML = "";
				
				
		}, false);
		var forData = document.querySelector("#forData2");
		console.log(forData);
		forData.addEventListener('click', function(e) {
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/ProcessFamilyList?Guid=" + e.target.innerText + "&AgentID=" +e.target.className,
				global: false,
				type: "GET",
				async: false
			}).responseText;
			parse = JSON.parse(bodyContent);
			document.querySelector("#forData3").innerHTML = "";
			window["ProcessChain"] = {};
			for (var i in parse.ProcessFamilyList){
				var image = parse.ProcessFamilyList[i].Image;
				var imageName = image.split("\\");
				imageName = imageName[imageName.length-1];
				var command = parse.ProcessFamilyList[i].CommandLine.replace(image,imageName);
				var Cname = "Proc" + i.toString();
				
				window["ProcessChain"][Cname] = parse.ProcessFamilyList[i];
				document.querySelector("#forData3").innerHTML += 
					"<tr>" +
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].UtcTime +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].ParentProcessId +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].ProcessId +"</td>"+
					"<td class=" + Cname + ">" + command +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].RuleName +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].Image +"</td>"+
					"<td class=" + Cname + ">"   +"</td>"+
					"<td class=" + Cname + ">"   +"</td>"+
					"</tr>" +
					"<tr><td colspan=\"8\"><div id=" +"TimeLine" +Cname +">"+ "</div></td></tr>";
			}
		}, false);
		var forData = document.querySelector("#forData3");
		console.log(forData);
		forData.addEventListener('click', function(e) {
			var container = $("#TimeLine" +e.target.className);
			if(container[0].hasChildNodes()){
				deleteElement(container[0]);
				return;
			}

			var d = [];
			procData = window["ProcessChain"][e.target.className];
			
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/ProcessEventList?Guid=" + procData.ProcessGuid + "&AgentID=" + procData.AgentID,
				global: false,
				type: "GET",
				async: false
			}).responseText;
			parse = JSON.parse(bodyContent);
			
			for (var i in parse.ProcessEventList){
				var tmp={};
				tmp.id = Number(i);
				tmp.content = parse.ProcessEventList[i].type;
				if (parse.ProcessEventList[i].type == "Image_load"){
					tmp.content += " " +  parse.ProcessEventList[i].ImageLoaded;
				}
				tmp.start = parse.ProcessEventList[i].UtcTime;
				d.push(tmp);
			}
			var items = new vis.DataSet(d)
			var options = {verticalScroll: true, clickToUse:true,height: '500px',zoomKey: 'ctrlKey'}
			var timeline = new vis.Timeline(container[0],items,options);
		}, false);
	</script>
</body>
</html>