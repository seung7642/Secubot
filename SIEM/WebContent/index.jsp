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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!--Animation css-->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style_dashboard.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

</head>

<body>

	<%
		HttpSession httpSession = request.getSession(false);
		if (httpSession == null || httpSession.getAttribute("authUser") == null) {
			response.sendRedirect("/SIEM/login.do");
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
				<div class="col-lg-3">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">금일 사이버 보안 위협</h3>
						</div>
						<div id="portlet" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="" style="height: 245px;">
									<div class="">
										<h4>전체: 0,000건</h4>
									</div>
									<div class="">- 네트워크: 000건</div>
									<div class="">- 악성코드: 000건</div>
									<div class="">- 위협차단: 000건</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">보안 위협 현황</h3>

						</div>
						<div id="portlet1" class="panel-collapse collapse in">
							<!-- <div class="portlet-body">
								<div id="" style="height: 160px;"></div>
								<div class="row text-center m-t-30 m-b-30"></div>
							</div> -->
							<div class="portlet-body chartJS">
								<canvas id="lineChart" data-type="Line" width="520" height="250"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->

				<div class="row">
					<div class="col-lg-4">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark">보안 위협 유형</h3>
							</div>
							<div id="portlet2" class="panel-collapse collapse in">
								<div class="portlet-body">
									<!-- <div id="donut-chart">
										<div id="donut-chart-container" class="flot-chart"
											style="height: 320px;"></div>
									</div> -->
									<canvas id="doughnut" data-type="Doughnut" height="250"
										width="800"></canvas>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark">보안 위협 출발지IP</h3>
							</div>
							<div id="portlet3" class="panel-collapse collapse in">
								<div class="portlet-body">
									<table class="table table-condensed table-hover table-bordered">
										<tr>
											<th>ip</th>
											<th>건수</th>
										</tr>
										<tr>
											<td>123.123.123.123</td>
											<td>333건</td>
										</tr>
										<tr>
											<td>23.23.23.23</td>
											<td>100건</td>
										</tr>
										<tr>
											<td>8.8.8.8</td>
											<td>78건</td>
										</tr>
										<tr>
											<td>192.168.1.6</td>
											<td>1234건</td>
										</tr>
										<tr>
											<td>0.0.0.0</td>
											<td>6건</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark">보안 위협 목적지IP</h3>
							</div>
							<div id="portlet4" class="panel-collapse collapse in">
								<div class="portlet-body">
									<table class="table table-condensed table-hover table-bordered">
										<tr>
											<th>ip</th>
											<th>건수</th>
										</tr>
										<tr>
											<td>123.123.123.123</td>
											<td>333건</td>
										</tr>
										<tr>
											<td>23.23.23.23</td>
											<td>100건</td>
										</tr>
										<tr>
											<td>8.8.8.8</td>
											<td>78건</td>
										</tr>
										<tr>
											<td>192.168.1.6</td>
											<td>1234건</td>
										</tr>
										<tr>
											<td>0.0.0.0</td>
											<td>6건</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- end col -->


				</div>
				<!-- End row -->


			</div>
			<!-- end row -->

			<button id="ajaxButton">ajax</button>
			<div class="ajaxTest">${userCount}</div>

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
	<script src="assets/chat/moment-2.2.1.js"></script>

	<!-- Chart JS -->
	<script src="assets/chartjs/chart.min.js"></script>
	<script src="assets/chartjs/chartjs.init.js"></script>

	<!-- Flot Chart -->
	<script src="assets/flot-chart/jquery.flot.js"></script>
	<script src="assets/flot-chart/jquery.flot.time.js"></script>
	<script src="assets/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="assets/flot-chart/jquery.flot.resize.js"></script>
	<script src="assets/flot-chart/jquery.flot.pie.js"></script>
	<script src="assets/flot-chart/jquery.flot.selection.js"></script>
	<script src="assets/flot-chart/jquery.flot.stack.js"></script>
	<script src="assets/flot-chart/jquery.flot.crosshair.js"></script>
	<script src="assets/flot-chart/jquery.flot.init.js"></script>


	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>

	<script>
		$(document).ready(function() {
			$('#ajaxButton').bind("click", function() {
				$.ajax({
					url : 'user',
					type : 'GET',
					dataType : 'json',
					success : function(responseData) {
						$("#ajax").remove();
						var data = JSON.parse(responseData);
						if (!data) {
							alert("회원 수는 0명입니다.");
							return false;
						}

						console.log("회원 수: " + responseData);
						console.log(${userCount});
					},
					error : function(e) {
						console.log("Error: " + e);
						console.log(${userCount});
					}
				});
			});
		});
	</script>

</body>
</html>