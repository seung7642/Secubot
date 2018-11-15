<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.secubot.network.model.NetworkModel"%>
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
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

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
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">Agent 메인화면</h3>
						</div>
						
						<div id="portlet" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="search">
									<form action="" method="POST" class="pull-right">
										<input type="text" id="ipmac" placeholder="IP/MAC Address...">
										<button type="submit" id="btnSearch" class="btn btn-primary">Search</button>
									</form>
								</div>
								<table class="table table-striped table-hover">
									<thead>
										<th width="10%">상태</th>
										<th width="20%">IP</th>
										<th width="20%">MAC</th>
										<th width="10%">호스트명</th>
										<th width="10%">그룹</th>
										<th width="10%">정책</th>
										<th width="20%">최근접속시간</th>
									</thead>
									<tbody>
										<td>
											<div class="material-switch pull-left">
												<input id="someSwitchOptionPrimary"
													name="someSwitchOption001" type="checkbox" /> <label
													for="someSwitchOptionPrimary" class="label-primary"></label>
											</div>
										</td>
										<td><a href="/Secubot/agentInformation.do">192.168.120.15</a></td>
										<td>00:00:00:00:00:00</td>
										<td>TEST-PC</td>
										<td>직원그룹</td>
										<td>직원정책</td>
										<td>2018-10-26 00:00:00</td>
									</tbody>
								</table>
								
								<div class="text-center">
									<ul class="pagination m-b-5">
	                                    <li>
	                                      <a href="#" aria-label="Previous">
	                                        <i class="fa fa-angle-left"></i>
	                                      </a>
	                                    </li>
	                                    <li class="active"><a href="#">1</a></li>
	                                    <li><a href="#">2</a></li>
	                                    <li><a href="#">3</a></li>
	                                    <li><a href="#">4</a></li>
	                                    <li><a href="#">5</a></li>
	                                    <li>
	                                      <a href="#" aria-label="Next">
	                                        <i class="fa fa-angle-right"></i>
	                                      </a>
	                                    </li>
	                                </ul>
                                </div>
							</div>
						</div>
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


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/chat/moment-2.2.1.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>


</body>
</html>