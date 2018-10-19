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
	<%@ include file="/WEB-INF/view/aside.jsp"%>

	<!--Main Content Start -->
	<section class="content">
		<%@ include file="/WEB-INF/view/header.jsp"%>

		<!-- Page Content Start -->
		<!-- ================== -->
		<div class="wraper container-fluid">
			<div class="page-title">
				<h3 class="title">Agent</h3>
			</div>


			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">에이전트 현황</h2>
						</div>
						<div class="panel-body">
							<table class="table table-bordered white-bg">
								<thead>
									<tr>
										<th>IP</th>
										<th>status</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><span class="pie">1/5</span></td>
										<td><code>&lt;span class="pie"&gt;1/5&lt;/span&gt;</code>
										</td>
									</tr>
									<tr>
										<td><span class="pie">226/360</span></td>
										<td><code>&lt;span
												class="pie"&gt;226/360&lt;/span&gt;</code></td>
									</tr>
									<tr>
										<td><span class="pie">0.52/1.561</span></td>
										<td><code>&lt;span
												class="pie"&gt;0.52/1.561&lt;/span&gt;</code></td>
									</tr>
									<tr>
										<td><span class="pie">1,4</span></td>
										<td><code>&lt;span class="pie"&gt;1,4&lt;/span&gt;</code>
										</td>
									</tr>
									<tr>
										<td><span class="pie">226,134</span></td>
										<td><code>&lt;span
												class="pie"&gt;226,134&lt;/span&gt;</code></td>
									</tr>
									<tr>
										<td><span class="pie">0.52,1.041</span></td>
										<td><code>&lt;span
												class="pie"&gt;0.52,1.041&lt;/span&gt;</code></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- end panel-body -->
					</div>
				</div>
				<!-- end col -->
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
	<script src="assets/chat/moment-2.2.1.js"></script>

	<!-- Counter-up -->
	<script src="js/waypoints.min.js" type="text/javascript"></script>
	<script src="js/jquery.counterup.min.js" type="text/javascript"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>

	<!-- Todo -->
	<script src="js/jquery.todo.js"></script>

</body>
</html>
