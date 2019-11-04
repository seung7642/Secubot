<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>

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

<link href="css/withyou.css" rel="stylesheet">

<style>
div.tab-pane div.panel.panel-default {
	width: 25%;
	float: left;
	margin-left: 60px;
}
.panel-clear {
	clear: both;
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
			<div class="page-title">
				<h3 class="title"></h3>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-dark">에이전트 정책목록</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="datatable"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="5%">#</th>
											<th data-priority="3" width="20%">정책명</th>
											<th data-priority="3" width="20%">프로세스명</th>
											<th data-priority="3" width="20%">MD5</th>
											<th data-priority="3" width="20%">정책설명</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${agentPolicyPage.list }">
											<tr>
												<td>#</td>
												<td>Process_Kill</td>
												<td>${list.image_name }</td>
												<td>${list.rule_json }</td>
												<td>${list.policy_description }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<button type="button" class="btn btn-info btn-custom m-b-5" data-toggle="modal"
								data-placement="right" title="정책을 추가합니다."
								data-target="#myModal">추가</button>
								<button type="button" class="btn btn-danger btn-custom m-b-5" data-toggle="modal"
								data-placement="right" title="정책을 삭제합니다."
								data-target="#myModal2">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End row -->

		</div>
		<!-- Page Content Ends -->
		<!-- ================== -->


		<!-- Footer Start -->
		<footer class="footer"> 2018 © SECUBOT - Adaptive SIEM &
			Security Configuration Management. </footer>
		<!-- Footer Ends -->
	</section>
	<!-- Main Content Ends -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<form class="form col-md-12 center-block" action="${pageContext.request.contextPath }/agentPolicy.do" method="POST">
						<div class="form-group md-form mb-4">
							<label for="policy_name">정책명</label>
							<select name="policy_name" id="policy_name" class="form-control">
								<option value="process_kill">Process Kill</option>
							</select>
						</div>
						<div class="form-group md-form mb-4">
							<label for="agent_hash">적용할 에이전트</label>
							<select name="agent_hash" id="agent_hash" class="form-control">
								<c:forEach var="list" items="${list }">
									<option value="agent_hash">${list.user_name }(${list.agent_hash })</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group md-form mb-4">
							<label for="policy_description">정책 설명</label>
							<input name="policy_description" type="text" class="form-control" id="policy_description" placeholder="description">
						</div>
						<div class="form-group">
							<label for="process_name">프로세스명</label>
							
							<!-- TODO: ajax로 받아온 데이터를 옵션으로 넣어주기  -->
							<select name="process_name" id="process_name" class="form-control" 
							onchange="var optionVal = $(this).find(':selected').attr('class'); doSomething(optionVal)">
								<option value="process_name"></option>
							</select>
						</div>
						<div class="form-group md-form mb-4">
							<label for="rule_json">MD5</label>
							<input name="rule_json" type="text" class="form-control" id="rule_json" placeholder="MD5">
						</div>
						<div class="form-group">
							<button class="btn btn-outline-secondary" data-dismiss="modal" aria-hidden="false">Cancle</button>
							<button type="submit" class="btn btn-success">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					정말 삭제하시겠습니까?
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div>

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
	<script src="js/ajax.js?ver=1.2121"></script>
	
	<script src="assets/datatables/jquery.dataTables.min.js"></script>
	<script src="assets/datatables/dataTables.bootstrap.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatable').dataTable();
		});
		
		//checkMyNoti();
		
		// TODO: getProcessList로 받아온 데이터를 옵션에 넣어주기
		var data = getProcessList();
		var parse = JSON.parse(data);
		console.log(data);
		console.log(parse);
		
		var select = document.querySelector("#process_name");
		for (var i=0; i<parse.ProcessList.length; i++) {
			select.innerHTML += "<option class=\"" + i +"\">" + parse.ProcessList[i].ImageName + "</option>";
		}
		
		var selected_option = $('#process_name option:selected');
		$('#process_name option').each(function() {
			if($(this).is(':selected')) {
				console.log(".is success");
			}
		});
		
		function doSomething(param) {
			if ($(param.selected)) {
				console.log(param);
				console.log(JSON.stringify(param));
				$('#rule_json').attr('value', parse.ProcessList[param].MD5);
			}
		}
		
	</script>

</body>
</html>