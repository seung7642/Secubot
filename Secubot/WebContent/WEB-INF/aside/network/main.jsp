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
<link href="css/style.css?version=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet">

<style>
div.tab-pane div.panel.panel-default {
	width: 25%;
	float: left;
	margin-left: 60px;
}
.panel-clear {
	clear: both;
}
#mynetwork {
	width: 100%;
	height: 800px;
	border: 1px solid lightgray;
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
						<li class="active"><a href="#node" data-toggle="tab"
							aria-expanded="true"> <span class="visible-xs"><i
									class="fa fa-home"></i></span> <span class="hidden-xs">Node</span>
						</a></li>
						<li class=""><a href="#topology" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-user"></i></span> <span class="hidden-xs">Topology</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="node">
							<div class="table-responsive" data-pattern="priority-columns">
								<div id="search">
									<!-- Search -->
									<form role="search" class="navbar-right app-search pull-right hidden-xs">
										<input type="text" placeholder="Search..." class="form-control">
										<a href=""><i class="fa fa-search"></i></a>
									</form>
								</div>
								<table id="datatable" class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>IP</th>
											<th>MAC</th>
											<th>Vendor</th>
											<th>OS</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="network" items="${networkPage.list}">
											<tr>
												<td><strong>#</strong></td>
												<td>${network.getIp() }</td>
												<td>${network.getMac() }</td>
												<td>${network.getVendor() }</td>
												<td>${network.getOs() }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="topology">
							<div id="mynetwork"></div>
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

	<script src="js/agentinfo.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js?ver=1"></script>
	
	<!-- datatable -->
	<script src="${pageContext.request.contextPath }/assets/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/datatables/dataTables.bootstrap.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
	<script>
		$(document).ready(function() {
	        $('#datatable').dataTable();
	    });
		
		checkMyNoti();
		
		var bodyContent = $.ajax({
			url: "http://211.193.58.162:2222/NetworkTopology",
			global: false,
			type: 'GET',
			async: false,
		}).responseText;
		parse = JSON.parse(bodyContent);
		nodeList = []
		edgeList = []
		for (var i in parse.allEntity){
			nodeList.push({id: parse.allEntity[i], label:parse.allEntity[i]});
		}
		for (var i in parse.allConnection){
			edgeList.push({from: parse.allConnection[i][0], to:parse.allConnection[i][1]});
		}
		var nodes = new vis.DataSet(nodeList);
		var edges = new vis.DataSet(edgeList);
		var container = document.getElementById('mynetwork');
		var data = {
				nodes: nodes,
				edges: edges
		};
		var options = {
				autoResize: true,
				height: '100%',
				width: '100%',
		};
		var network = new vis.Network(container, data, options);
	</script>
</body>
</html>