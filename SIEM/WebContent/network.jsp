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
				<h3 class="title">Network</h3>
			</div>

			<div class="row1">
				<div class="col-lg-6">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark text-uppercase">
								위협단말기(출발지)</h3>
						</div>
						<div id="portlet" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="" style="height: 160px;"></div>
								<div class="row text-center m-t-30 m-b-30"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark text-uppercase">
								위협단말기(목적지)</h3>
						</div>
						<div id="portlet1" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="" style="height: 160px;"></div>
								<div class="row text-center m-t-30 m-b-30"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->

				<div class="row2">
					<div class="col-lg-12">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark text-uppercase">
									네트워크 장비 현황</h3>
							</div>
							<div id="portlet2" class="panel-collapse collapse in">
								<div class="portlet-body">
									<div id="" style="height: 320px;"></div>
									<div class="row text-center m-t-30 m-b-30"></div>
								</div>
							</div>
						</div>
						<!-- /Portlet -->

					</div>
				</div>
				<!-- End row -->
				
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

