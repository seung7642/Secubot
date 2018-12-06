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
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

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
						<li class="active" style="border: 1px solid;"><a href="#default" data-toggle="tab"
							aria-expanded="true"> <span class="visible-xs"><i
									class="fa fa-home"></i></span> <span class="hidden-xs">Node Policy</span>
						</a></li>
						<li class="" style="border: 1px solid;"><a href="#system" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-user"></i></span> <span class="hidden-xs">Agent Policy</span>
						</a></li>
						<li class="" style="border: 1px solid;"><a href="#software" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-envelope-o"></i></span> <span class="hidden-xs">Group Policy</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="default">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="datatable"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="7.5%">순서</th>
											<th data-priority="3" width="10%">정책명</th>
											<th data-priority="1" width="10%">적용 그룹</th>
											<th data-priority="3" width="30%">적용 정책</th>
											<th data-priority="3" width="20%">설명</th>
											<th data-priority="6" width="10%">노드 수</th>
											<th data-priority="6" width="7.5%">적용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>직원정책</td>
											<td>직원</td>
											<td>- 시스템정보 수집</td>
											<td>직원</td>
											<td>55</td>
											<td>-</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td>2</td>
											<td>비직원정책</td>
											<td>비직원</td>
											<td>- 시스템정보 수집<br/>- 에이전트 설치유도</td>
											<td>비직원</td>
											<td>213</td>
											<td>V</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td>3</td>
											<td>예외정책</td>
											<td>PC이외</td>
											<td>- </td>
											<td>프린터, 스마트폰</td>
											<td>10</td>
											<td>V</td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-info btn-custom m-b-5" data-toggle="modal"
								data-placement="right" title="정책을 추가합니다."
								data-target="#myModal">추가</button>
							</div>
						</div>
						<div class="tab-pane" id="system">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="30%">정책명</th>
											<th data-priority="3" width="25%">수행조건</th>
											<th data-priority="1" width="20%">적용그룹</th>
											<th data-priority="3" width="20%">설명</th>
											<th data-priority="3" width="5%">적용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>백신 검사/배포</td>
											<td>파일검사</td>
											<td>-</td>
											<td>-</td>
											<td>V</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td>소프트웨어 정보수집</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>V</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td>블랙리스트 파일 실행차단</td>
											<td>파일 검사/MD5(위치검사)</td>
											<td>직원그룹</td>
											<td>-</td>
											<td>V</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="software">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="20%">그룹명</th>
											<th data-priority="3" width="20%">노드 수</th>
											<th data-priority="1" width="45%">정책 내용</th>
											<th data-priority="3" width="5%">적용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>직원 그룹</td>
											<td></td>
											<td>- 192.168.00.00 IP 차단</td>
											<td>V</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td>비직원 그룹</td>
											<td></td>
											<td>- 00:00:00:00:00:00 MAC 차단</td>
											<td>V</td>
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