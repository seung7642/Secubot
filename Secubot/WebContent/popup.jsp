<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Agent Details</title>


<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!--Animation css-->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- DataTables -->
<link href="assets/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css?ver=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet">
<style>
.vis-item.red {
  background-color: #cc2222;
  border-color: red;
  color:#ffffff;
}
.vis-item.vis-selected {
    border-color: #ffc200;
    background-color: #d5ddf6;
}

body {
	font: sans-serif;
}
#modalData{
	overflow-y:scroll;
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
			<table class="table table-hover table-striped table-sm"  style="table-layout:fixed;word-break:break-all; ">
				<caption>행위 리스트</caption>
				<thead class="thead-dark">

					<tr>
						<th width="8%">UtcTime</th>
						<th width="3%">ParentPID</th>
						<th width="3%">PID</th>
						<th width="20%">Parent Command Line</th>
						<th width="20%">Command Line</th>
						<th width="5%">RuleName</th>
						<th width="8%">HASH</th>
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

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				</div>
				<br>
				<span class="modal-body">
					<div class="form col-md-12 center-block">
						<div class="table-responsive" data-pattern="priority-columns">
								<table id="datatable" class="table table-small-font table-bordered table-striped" style="table-layout:fixed;word-break:break-all; ">
									<thead>
										<tr>
											<th data-priority="3" width="10%">Column</th>
											<th data-priority="3" width="30%">Value</th>
										</tr>
									</thead>
									<tbody id="modalData">
									</tbody>
								</table>
							</div>
					</div>
				</span>
				<div class="modal-footer">
				
				</div>
			</div>
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
			document.querySelector("#forData").innerHTML += 
			"<td class=" + parse.ProcessAgentList[i].AgentID + ">" + parse.ProcessAgentList[i].UserName + "(" +parse.ProcessAgentList[i].userMac + ")" +  "</td>" +
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
				
				var RuleNameField=""
				if (parse.ProcessFamilyList[i].RuleName != ""){
					RuleNameField = "<a target=\"_blank\" href=\"https://attack.mitre.org/techniques/" + parse.ProcessFamilyList[i].RuleCode + "\">" +parse.ProcessFamilyList[i].RuleCode + "</a>";
				}
				/*
						th width="10%">UtcTime</th>
						<th width="5%">ParentPID</th>
						<th width="5%">PID</th>
						<th width="20%">Parent Command Line</th>
						<th width="20%">Command Line</th>
						<th width="5%">RuleName</th>
						<th width="3%">HASH</th>
						<th width="5%">Stage</th>
				*/
				window["ProcessChain"][Cname] = parse.ProcessFamilyList[i];
				document.querySelector("#forData3").innerHTML += 
					"<tr>" +
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].UtcTime +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].ParentProcessId +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].ProcessId +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].ParentCommandLine +"</td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].CommandLine +"</td>"+
					"<td class=" + Cname + ">" + RuleNameField +"</td>"+
					"<td class=" + Cname + ">" + "<a target=\"_blank\" href=\"https://www.virustotal.com/#/file/" + parse.ProcessFamilyList[i].MD5 + "\">" + parse.ProcessFamilyList[i].MD5 + "</a></td>"+
					"<td class=" + Cname + ">" + parse.ProcessFamilyList[i].stage  +"</td>"+
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
			window["Timeline"+e.target.className.toString()] = parse.ProcessEventList;
			for (var i in parse.ProcessEventList){
				var tmp={};
				tmp.id = Number(i);
				tmp.content = parse.ProcessEventList[i].type;
				if (parse.ProcessEventList[i].type == "Image_load"){
					tmp.content += " " +  parse.ProcessEventList[i].ImageLoaded;
				}else if (parse.ProcessEventList[i].type == "process_changed_file_creation_time"){
					tmp.content += " " +  parse.ProcessEventList[i].TargetFilename;
				}else if (parse.ProcessEventList[i].type == "Network_connection"){
					tmp.content += "<br>srcIP:" +  parse.ProcessEventList[i].SourceIp + ":" + parse.ProcessEventList[i].SourcePort +"<br>dstIP:" +  parse.ProcessEventList[i].DestinationIp + ":" + parse.ProcessEventList[i].DestinationPort;
				}else if (parse.ProcessEventList[i].type == "CreateRemoteThread"){
					tmp.content += " " +  parse.ProcessEventList[i].TargetImage;
				}else if (parse.ProcessEventList[i].type == "RawAccessRead"){
					tmp.content += " " +  parse.ProcessEventList[i].Image;
				}else if (parse.ProcessEventList[i].type == "ProcessAccess"){
					tmp.content += " " +  parse.ProcessEventList[i].TargetImage;
				}else if (parse.ProcessEventList[i].type == "FileCreate"){
					tmp.content += " " +  parse.ProcessEventList[i].TargetFilename;
				}else if (parse.ProcessEventList[i].type == "RegistryEvent_create_delete"){
					tmp.content += "<br>" +  parse.ProcessEventList[i].EventType + " : " + parse.ProcessEventList[i].TargetObject;
				}else if (parse.ProcessEventList[i].type == "Registry_value_set"){
					tmp.content += "<br>" +  parse.ProcessEventList[i].TargetObject + "<br>" + parse.ProcessEventList[i].Details;
				}else if (parse.ProcessEventList[i].type == "File_stream_create"){
					tmp.content += " " +  parse.ProcessEventList[i].TargetFilename;
				}else if (parse.ProcessEventList[i].type == "Pipe_Create"){
					tmp.content += "<br>" +  parse.ProcessEventList[i].Image + " : " + parse.ProcessEventList[i].PipeName;
				}else if (parse.ProcessEventList[i].type == "Pipe_Connect"){
					tmp.content += "<br>" +  parse.ProcessEventList[i].Image + " : " + parse.ProcessEventList[i].PipeName;
				}
				
				tmp.start = parse.ProcessEventList[i].UtcTime;
				window["TimeLine"+e.target.className.toString()][i] = parse.ProcessEventList[i];
				if (parse.ProcessEventList[i].RuleName !="")
					tmp.className="red";
								
				d.push(tmp);
			}
			var items = new vis.DataSet(d)
			var options = {verticalScroll: true, clickToUse:true,height: '500px',zoomKey: 'ctrlKey'}
			var timeline = new vis.Timeline(container[0],items,options);
		    timeline.on('click', function (properties) {
		    	if (properties.item != null){

			        var j=window[properties.event.currentTarget.parentElement.id.toString()][properties.item];
			        document.querySelector("#modalData").innerHTML = ""
			        
			        Object.keys(j).forEach(function(k){
			        	document.querySelector("#modalData").innerHTML += 
			        		"<tr>" +
							"<td>" + k + "</td>" +
							"<td>" + j[k] + "</td>" +
							"</tr>";
			        });
			        $("#myModal").modal("show");
		    	}
		      });
		}, false);
	</script>
</body>
</html>