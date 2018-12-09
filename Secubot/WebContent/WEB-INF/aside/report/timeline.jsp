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
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-dark">Report</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive" data-pattern="priority-columns">
							
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