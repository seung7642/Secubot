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

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<!-- myCSS -->
<link href="css/myCSS.css" rel="stylesheet">

<!-- d3 -->
<link href="css/d3.css?ver=2" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet">

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
				<div class="col-lg-6">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">Chart</h3>
						</div>
						<div class="portlet-body">
							<div id="visualization">
								<svg></svg>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">이상 행위 분석</h3>
						</div>
						<div id="portlet1" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="testChart">
									<svg></svg>
								</div>
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
							<div id="portlet3" class="panel-collapse collapse in">
								<div class="portlet-body">
									<div id="orthographic">
										<svg style="width:330px;height:300px;border:1px solid gray;"></svg>
									</div>
								</div>
							</div>
						</div>
					</div>

					<%
						List<NetworkModel> ttt;
						ttt = (List<NetworkModel>) session.getAttribute("networkList");
					%>
					<div class="col-lg-4">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark">보안 위협 Source IP</h3>
							</div>
							<div id="portlet3" class="panel-collapse collapse in">
								<div class="portlet-body">
									<table class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th>IP Address</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="netModel" items="${networkList }">
												<tr>
													<td>${netModel.srcIP }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="portlet">
							<!-- /primary heading -->
							<div class="portlet-heading">
								<h3 class="portlet-title text-dark">보안 위협 Destination IP</h3>
							</div>
							<div id="portlet4" class="panel-collapse collapse in">
								<div class="portlet-body">
									<table class="table table-condensed table-hover table-bordered">
										<thead>
											<th>IP Address</th>
										</thead>
										<tbody>
											<c:forEach var="netModel" items="${networkList }">
												<tr>
													<td>${netModel.dstIP }</td>
												</tr>
											</c:forEach>
										</tbody>
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
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/chat/moment-2.2.1.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
	
	<!-- d3.js -->
	<script src="js/d3.v3.min.js"></script>
	<script src="js/visualization.js"></script>
	<script src="js/geodesic.js"></script>
	<script src="js/testChart.js"></script>
	<script src="js/topojson.v1.min.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js"></script>
	
	<script>
		getNetworkData();
		getElasticData();
		loadScript();
		loadTestChart();
	</script>
	
	<script>
		var width = 330,
		   height = 300,
		   radius = 240;
		
		var origin = [-71, 42],
		    velocity = [.012, -.002],
		    t0 = Date.now();
		
		var projection = d3.geo.orthographic()
		    .scale(radius)
		    .clipAngle(90);
		
		var path = d3.geo.path()
		    .projection(projection);
		
		var svg = d3.select("#orthographic").select("svg")
		    .attr("width", width)
		    .attr("height", height);
		
		svg.append("circle")
		    .attr("cx", width / 2)
		    .attr("cy", height / 2)
		    .attr("r", radius);
		
		d3.json("dataset/world-110m.min.json", function(error, world) {
		  if (error) throw error;
		
		  var feature = svg.append("path")
		      .datum(topojson.feature(world, world.objects.land))
		      .attr("d", path);
		
		  d3.timer(function() {
		    var t = Date.now() - t0;
		    projection.rotate([origin[0] + velocity[0] * t, origin[1] + velocity[1] * t]);
		    feature.attr("d", path);
		  });
		});
	</script>
	
</body>
</html>