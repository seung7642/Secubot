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

<!-- animate CSS -->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css?version=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<!-- myCSS -->
<link href="css/myCSS.css" rel="stylesheet">

<!-- d3 -->
<link href="css/d3.css?ver=1" rel="stylesheet">

<style>
h2:hover {
	transform: scale(1.05);
	-webkit-transform: scale(1.05);
	-moz-transform: scale(1.05);
	transition: all 0.3s ease-in-out;
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

	<!-- Main Content Start -->
	<section class="content">
		<%@ include file="/WEB-INF/view/header.jsp"%>
		
		<!-- Page Content Start -->
		<!-- ================== -->
		<div class="wraper container-fluid">
			<div class="page-title">
				<h3 class="title"></h3>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="fa fa-shield text-pink"></i> 
						<h2 class="m-0 counter" style="cursor:pointer;">8956</h2>
						<div>Total responses</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-social-freebsd-devil text-purple"></i> 
						<h2 class="m-0 counter" style="cursor:pointer;">50</h2>
						<div>Today's responses</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-android-search text-info"></i> 
						<h2 class="m-0 counter" style="cursor:pointer;">126</h2>
						<div>Count of Process</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-ios7-compose text-success"></i> 
						<h2 class="m-0 counter" style="cursor:pointer;">145</h2>
						<div>Count of complain</div>
					</div>
				</div>
			</div> <!-- end row -->
                
			<div class="row">
				<div class="col-lg-6">
					<div class="portlet">
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">보안 위협 시각화</h3>
						</div>
						<div class="portlet-body" id="visualization">
							<svg></svg>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="portlet">
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">누적 대응 건수</h3>
						</div>
						<div class="portlet-body" id="line"></div>
					</div>				
				</div>
			</div>
			<!-- end row -->

		</div>
		<!-- Page Content Ends -->
		<!-- ================== -->


		<!-- Footer Start -->
		<footer class="footer"> 2018 © SECUBOT - Adaptive SIEM &
			Security Configuration Management. </footer>
		<!-- Footer Ends -->
	</section>
	<!-- Main Content Ends -->

	<!-- modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Details</div>
				<div class="modal-body"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

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
	
	<!-- d3.js -->
	<script src="js/d3.v3.min.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js?ver=1"></script>
	<script src="js/visualization.js?ver=1"></script>
	
	<script>
		var data = getProcessList();
		var parse = JSON.parse(data);
		visualization(parse);
		
		/* line Chart */
		lineChart();
	</script>
	
</body>
</html>