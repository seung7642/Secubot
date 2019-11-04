<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="img/SecuBot_logo.png">

<title>SECUBOT - Adaptive SIEM & Security Configuration
	Management</title>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet">
<style>
vis-timeline{
	width:100%;
}
#modalData{
	overflow-y:scroll;
}

.vis-item.red {
  background-color: #cc2222;
  border-color: red;
  color:#ffffff;
}
.vis-item.vis-selected {
    border-color: #ffc200;
    background-color: #d5ddf6;
}
li.notiActive {
	display: inline-block;
}
li.nonotiActive {
	display: none;
}
</style>

</head>

<body>

	<%@ include file="/WEB-INF/view/aside.jsp"%>

	<!--Main Content Start -->
	<section class="content">
		<%@ include file="/WEB-INF/view/header.jsp"%>

		<!-- Page Content Start -->
		<!-- ================== -->
		<div class="wraper container-fluid">

			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default" style="margin-bottom:10px;padding:10px 30px;">
						<div class="panel-body p-t-0">
							<div class="input-group">
								<input type="text" id="searchQuery" name="example-input1-group2" class="form-control" placeholder="Search">
								<span class="input-group-btn">
									<button type="button" id="search" class="btn btn-effect-ripple btn-primary"><i class="fa fa-search"></i></button>
								</span>
							</div>
						</div>
					</div>
				</div>
				<br>
				<p id="queryResult"></p> 
				<div id="resultTimeline"></div>

			</div>
			<!-- End row -->
			<table class="table table-hover table-striped table-sm"  style="table-layout:fixed;word-break:break-all;width:100%; ">
				<!--<caption>행위 리스트</caption>
				<thead class="thead-dark">

					<tr>
						<th width="8%">UserName</th>					
						<th width="8%">UtcTime</th>
						<th width="6%">ParentPID</th>
						<th width="6%">PID</th>
						<th width="30%">Parent Command Line</th>
						<th width="30%">Command Line</th>
						<th width="12%">HASH</th>
					</tr>
				</thead>
				<tbody  id="resultCommandLine">
				</tbody>>-->
			</table>
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
		<!-- Page Content Ends -->
		<!-- ================== -->


		<!-- Footer Start -->
		<footer class="footer"> 2018 © SECUBOT - Adaptive SIEM &
			Security Configuration Management. </footer>
		<!-- Footer Ends -->
	</section>
	<!-- Main Content Ends -->


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js?ver=1"></script>
	
	<!-- elasticsearch -->
	<script src="js/elasticsearch.jquery.min.js"></script>
	<script>
		function ConvertToJsonQuery(q){
			var client = new $.es.Client({
				  hosts: '211.193.58.162:9200',
				  log: 'trace'
				});
			
			var TargetFieldList = {};
			TargetFieldList["proc.name"] = ["Image"];
			TargetFieldList["proc.md5"] = ["MD5"];
			TargetFieldList["proc.sha1"] = ["SHA1"];
			TargetFieldList["proc.guid"] = ["ProcessGuid"];
			TargetFieldList["proc.cmd"] = ["CommandLine"];
			TargetFieldList["network.ip"] = ["SourceIp","DestinationIp"];
			TargetFieldList["network.port"] = ["DestinationPort"];
			TargetFieldList["file"] = ["TargetFilename"];
			TargetFieldList["event"] = ["type"];
			TargetFieldList["agent.id"] = ["AgentID"];
			
			
			function WildQuery(key,value){
				var a= {
	               		 "wildcard": {
			             }
		              }
				if(key == "DestinationPort")
				{
					value = Number(value);
					var a= {
		               		 "match": {
				             }
			              }
					a["match"][key]=value;
				}
				else{
					a["wildcard"][key]=value;
				}

				if(key == "Image")
					a["wildcard"][key]="*"+a["wildcard"][key];

				return a;
			}
			function boolMustMapper(list){
				return {"bool":{"must":list
					}
				}
			}
			function boolShouldMapper(list){
				return {"bool":{"should":list
					}
				}
			}
			function makeWildQuery(field,value,result){
				
				if(field.length==1){
					var a = WildQuery(field[0],value)
					result.push( a);
				}
				else if(field.length>1){
					for(var i in field){
						result.push(WildQuery(field[i],value));
					}
					
				}
			}
			function ShouldQuery(shouldList){
				return {
					  "sort": [
					    {
					      "UtcTime": {
					        "order": "desc"
					      }
					    }
					  ],
					  "query": {
					    "bool": {
					      "should": shouldList
					    }
					  }
					}
			}
			var atts = q.split(",");
			var shouldList=[];
			var procCondition=[];
			var networkIpCondition=[];
			var networkCondition=[];
			
			
			for(var i in atts){
				var key = atts[i].trim().split("=")[0];
				var value = atts[i].trim().split("=")[1];
				if (key.indexOf("proc.")==0){
					makeWildQuery(TargetFieldList[key],value,procCondition);
				}
				else if (key == "network.ip"){
					makeWildQuery(TargetFieldList[key],value,networkIpCondition);
				}
				else{
					makeWildQuery(TargetFieldList[key],value,shouldList);
				}
			}
			if(procCondition.length!=0){
				shouldList.push(boolMustMapper(procCondition));
			}
			if(networkIpCondition.length!=0){
				shouldList.push(boolShouldMapper(networkIpCondition));
			}
			var q=  ShouldQuery(shouldList);
			//alert(JSON.stringify(q));
			client.search({
				  index: 'agent',
				  size: 300,
				  body: q
				}).then(function (resp) {
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
					$("#queryResult")[0].innerHTML= "총 " + resp.hits.total + "개의 결과 조회됨."
					//deleteElement($("#sdfsdfresultCommandLine")[0]);
					
				    var hits = resp.hits.hits;
				    allData = [];
				    d = [];
					for (var i in hits){
						
						var tmp={};
						tmp.id = Number(i);
						tmp.content = hits[i]["_source"].type;
						if (hits[i]["_source"].type == "process_creation"){

							tmp.content += "";
							/*document.querySelector("#sdfsdfresultCommandLine").innerHTML += 
								"<tr>" +
								"<td >" + hits[i]["_source"].UserName +"</td>"+
								"<td >" + hits[i]["_source"].UtcTime +"</td>"+
								"<td >" + hits[i]["_source"].ParentProcessId +"</td>"+
								"<td >" + hits[i]["_source"].ProcessId +"</td>"+
								"<td >" + hits[i]["_source"].ParentCommandLine +"</td>"+
								"<td >" + hits[i]["_source"].CommandLine +"</td>"+
								"<td >" + "<a target=\"_blank\" href=\"https://www.virustotal.com/#/file/" + hits[i]["_source"].MD5 + "\">" + hits[i]["_source"].MD5 + "</a></td>"+
								"</tr>" +
								"<tr><td colspan=\"8\"></td></tr>";*/
						}else if (hits[i]["_source"].type == "Image_load"){
							tmp.content += " " +  hits[i]["_source"].ImageLoaded;
						}else if (hits[i]["_source"].type == "process_changed_file_creation_time"){
							tmp.content += " " +  hits[i]["_source"].TargetFilename;
						}else if (hits[i]["_source"].type == "Network_connection"){
							tmp.content += "<br>srcIP:" +  hits[i]["_source"].SourceIp + ":" + hits[i]["_source"].SourcePort +"<br>dstIP:" +  hits[i]["_source"].DestinationIp + ":" + hits[i]["_source"].DestinationPort;
						}else if (hits[i]["_source"].type == "CreateRemoteThread"){
							tmp.content += " " +  hits[i]["_source"].TargetImage;
						}else if (hits[i]["_source"].type == "RawAccessRead"){
							tmp.content += " " +  hits[i]["_source"].Image;
						}else if (hits[i]["_source"].type == "ProcessAccess"){
							tmp.content += " " +  hits[i]["_source"].TargetImage;
						}else if (hits[i]["_source"].type == "FileCreate"){
							tmp.content += " " +  hits[i]["_source"].TargetFilename;
						}else if (hits[i]["_source"].type == "RegistryEvent_create_delete"){
							tmp.content += "<br>" +  hits[i]["_source"].EventType + " : " + hits[i]["_source"].TargetObject;
						}else if (hits[i]["_source"].type == "Registry_value_set"){
							tmp.content += "<br>" +  hits[i]["_source"].TargetObject + "<br>" + hits[i]["_source"].Details;
						}else if (hits[i]["_source"].type == "File_stream_create"){
							tmp.content += " " +  hits[i]["_source"].TargetFilename;
						}else if (hits[i]["_source"].type == "Pipe_Create"){
							tmp.content += "<br>" +  hits[i]["_source"].Image + " : " + hits[i]["_source"].PipeName;
						}else if (hits[i]["_source"].type == "Pipe_Connect"){
							tmp.content += "<br>" +  hits[i]["_source"].Image + " : " + hits[i]["_source"].PipeName;
						}
						
						tmp.start = hits[i]["_source"].UtcTime;
						allData.push( hits[i]["_source"]);
						if (hits[i]["_source"].RuleName !="")
							tmp.className="red";
										
						d.push(tmp);
					}
					window["TimeLine"] = allData;
					var items = new vis.DataSet(d)
					var options = {verticalScroll: true, clickToUse:true,width:'100%',height:'480px',zoomKey: 'ctrlKey'}
					deleteElement($("#resultTimeline")[0]);
					
					var timeline = new vis.Timeline($("#resultTimeline")[0],items,options);
				    timeline.on('click', function (properties) {
				    	if (properties.item != null){

					        var j=window["TimeLine"][properties.item];
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
				}, function (err) {
				    console.trace(err.message);
				});
		}
	</script>
	
	<script>
		
		var forData = document.querySelector("#search");
		forData.addEventListener('click', function(e) {
			var txtQuery = document.querySelector("#searchQuery").value;
			ConvertToJsonQuery(txtQuery);
		});
	</script>
</body>
</html>