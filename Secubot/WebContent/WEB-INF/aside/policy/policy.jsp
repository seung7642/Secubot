<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page trimDirectiveWhitespaces="true"%>

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

	<%
		HttpSession httpSession = request.getSession(false);
		if (httpSession == null || httpSession.getAttribute("authUser") == null) {
			response.sendRedirect("/Secubot/login.do");
		}
	%>

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
					<ul class="nav nav-tabs">
						<li class="active"><a href="#agentPolicy" data-toggle="tab"
							aria-expanded="true"> <span class="visible-xs"><i
									class="fa fa-home"></i></span> <span class="hidden-xs">Agent Policy</span>
						</a></li>
						<li class=""><a href="#networkPolicy" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-user"></i></span> <span class="hidden-xs">Network Policy</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="agentPolicy">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="datatable"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="5%">#</th>
											<th data-priority="3" width="20%">정책명</th>
											<th data-priority="3" width="20%">프로세스명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-info btn-custom m-b-5" data-toggle="modal"
								data-placement="right" title="정책을 추가합니다."
								data-target="#myModal">추가</button>
							</div>
						</div>
						<div class="tab-pane" id="networkPolicy">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="30%">#</th>
											<th data-priority="3" width="25%">정책명</th>
											<th data-priority="1" width="20%">srcIP</th>
											<th data-priority="3" width="20%">dstIP</th>
											<th data-priority="3" width="5%">PORT</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
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
					<form class="form col-md-12 center-block" action="#" method="POST">
						<div class="form-group md-form mb-4">
							<label for="policyName">정책명</label>
							<select id="policyName" class="form-control">
								<option value="policyName">직원</option>
								<option value="policyName">비직원</option>
								<option value="policyName">예외</option>
							</select>
						</div>
						<div class="form-group">
							<label for="policyGroup">적용 그룹</label>
							<select id="policyGroup" class="form-control">
								<option value="policyGroup">직원</option>
								<option value="policyGroup">비직원</option>
								<option value="policyGroup">PC 이외</option>
							</select>
						</div>
						<div class="form-group">
							<label for="policy2">적용 정책</label>
							<select id="policy2" class="form-control" multiple="multiple">
								<option selected="selected">--------------</option>
								<option value="policy2">시스템 정보 수집</option>
								<option value="policy2">에이전트 설치 유도</option>
							</select>
						</div>
						<div class="form-group">
							<label for="description">설명</label>
							<input type="text" class="form-control" id="description" placeholder="설명...">
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
	
	<script src="assets/datatables/jquery.dataTables.min.js"></script>
	<script src="assets/datatables/dataTables.bootstrap.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatable').dataTable();
		});
		
		checkMyNoti();
	</script>

</body>
</html>