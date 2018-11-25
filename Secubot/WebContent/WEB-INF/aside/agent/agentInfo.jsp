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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!-- animate CSS -->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

<style>
#tab_container {
	width: 100%;
	margin: 0 auto;
}

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
						<li class="active"><a href="#default" data-toggle="tab"
							aria-expanded="true"> <span class="visible-xs"><i
									class="fa fa-home"></i></span> <span class="hidden-xs">기본정보</span>
						</a></li>
						<li class=""><a href="#system" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-user"></i></span> <span class="hidden-xs">시스템정보</span>
						</a></li>
						<li class=""><a href="#software" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-envelope-o"></i></span> <span class="hidden-xs">소프트웨어
									정보</span>
						</a></li>
						<li class=""><a href="#policy" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-cog"></i></span> <span class="hidden-xs">정책관리</span>
						</a></li>
						<li class=""><a href="#records" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-cog"></i></span> <span class="hidden-xs">이력관리</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="default">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="10%">IP Address</th>
											<th data-priority="3" width="10%">MAC Address</th>
											<th data-priority="1" width="7.5%">Host</th>
											<th data-priority="3" width="5%">Group</th>
											<th data-priority="3" width="7.5%">Policy</th>
											<th data-priority="6" width="15%">최초등록시간</th>
											<th data-priority="6" width="15%">최근 접속시간</th>
											<th data-priority="6" width="30%">설명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>192.168.10.20</td>
											<td>00:00:00:00:00:00</td>
											<td>TEST-PC</td>
											<td>직원</td>
											<td>직원정책</td>
											<td>2018-10-30 00:00:00</td>
											<td>2018-10-30 00:00:00</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="system">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="10%">CPU</th>
											<th data-priority="3" width="5%">Memory</th>
											<th data-priority="1" width="20%">OS</th>
											<th data-priority="3" width="10%">저장장치</th>
											<th data-priority="3" width="15%">Network INC</th>
											<th data-priority="6" width="15%">프린터 정보</th>
											<th data-priority="6" width="15%">보안 정책준수</th>
											<th data-priority="6" width="10%">기타</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Intel i5-4860</td>
											<td>8GB</td>
											<td>Microsoft-Windows 10</td>
											<td>SSD256</td>
											<td>Network Card</td>
											<td>Samsung-Printer100</td>
											<td>보안 정책</td>
											<td></td>
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
											<th data-priority="1" width="20%">소프트웨어명</th>
											<th data-priority="3" width="20%">버전</th>
											<th data-priority="1" width="20%">경로</th>
											<th data-priority="3" width="20%">설치일자</th>
											<th data-priority="3" width="20%">갱신 시각</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Chrome</td>
											<td>69.0.34</td>
											<td>C:\Programfiles\...</td>
											<td>2016-10-30</td>
											<td>2018-09-30</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="policy">
							<div class="panel panel-default">
								<div class="panel-heading text-center">
									<h4 class="panel-title">Group</h4>
								</div>
								<div class="panel-body">
									<ul class="list-group list-group-lg">
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-primary inline m-t-10">기본</span> <a
											href="">SecuBot</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-info inline m-t-10">직원</span> <a
											href="">Team</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-warning inline m-t-10">관리자</span>
											<a href="">Administrator</a></li>
									</ul>
								</div>
								<!--Panel-body -->


								<div class="panel-footer white-bg text-center">
									<hr class="m-b-10" />
									<button class="btn btn-primary btn-addon btn-sm">
										<i class="fa fa-plus m-r-5"></i>Add Group
									</button>
								</div>
								<!-- panel-footer-->
							</div>
							<!-- Panel-->

							<div class="panel panel-default">
								<div class="panel-heading text-center">
									<h4 class="panel-title">Node Policy</h4>
								</div>
								<div class="panel-body">
									<ul class="list-group list-group-lg">
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-primary inline m-t-10">기본</span> <a
											href="">SecuBot</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-info inline m-t-10">직원</span> <a
											href="">Team</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-warning inline m-t-10">관리자</span>
											<a href="">Administrator</a></li>
									</ul>
								</div>
								<!--Panel-body -->


								<div class="panel-footer white-bg text-center">
									<hr class="m-b-10" />
									<button class="btn btn-primary btn-addon btn-sm">
										<i class="fa fa-plus m-r-5"></i>Add Policy
									</button>
								</div>
								<!-- panel-footer-->
							</div>
							<!-- Panel-->

							<div class="panel panel-default" style="width: 25%;">
								<div class="panel-heading text-center">
									<h4 class="panel-title">Agent Policy</h4>
								</div>
								<div class="panel-body">
									<ul class="list-group list-group-lg">
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-primary inline m-t-10">기본</span> <a
											href="">SecuBot</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-info inline m-t-10">직원</span> <a
											href="">Team</a></li>
										<li class="list-group-item b-0"><a href=""
											class=" m-r-10"> </a> <span
											class="pull-right label bg-warning inline m-t-10">관리자</span>
											<a href="">Administrator</a></li>
									</ul>
								</div>
								<!--Panel-body -->


								<div class="panel-footer white-bg text-center">
									<hr class="m-b-10" />
									<button class="btn btn-primary btn-addon btn-sm">
										<i class="fa fa-plus m-r-5"></i>Add Policy
									</button>
								</div>
								<!-- panel-footer-->
							</div>
							<!-- Panel-->
							
							<div class="panel-clear"></div>
						</div>
						<div class="tab-pane" id="records">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="15%">시간</th>
											<th data-priority="3" width="10%">로그종류</th>
											<th data-priority="1" width="10%">IP</th>
											<th data-priority="3" width="10%">MAC</th>
											<th data-priority="3" width="55%">설명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2018-10-10 00:00:00</td>
											<td>일반</td>
											<td>192.168.10.20</td>
											<td>00:00:00:00:00:00</td>
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


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>

</body>
</html>