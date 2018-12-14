<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
textarea{ 
  color: black;
  min-width:100%; 
  max-width:100%;
  min-height:100%;
}
</style>
<style type="text/css" media="screen">

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
						<li class="active"><a href="#default" data-toggle="tab"
							aria-expanded="true"> <span class="visible-xs"><i
									class="fa fa-home"></i></span> <span class="hidden-xs">자산정보</span>
						</a></li>
						<li class=""><a href="#sysmonxml" data-toggle="tab"
							aria-expanded="false"> <span class="visible-xs"><i
									class="fa fa-user"></i></span> <span class="hidden-xs">이벤트 수집 정책</span>
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
											<th data-priority="6" width="15%">최근 접속시간</th>
											<th data-priority="6" width="15%">CPU</th>
											<th data-priority="6" width="30%">OS</th>
											<th data-priority="6" width="30%">RAM</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${agentInfo.getAgent_ip()}</td>
											<td>${agentInfo.getAgent_mac()}</td>
											<td>${agentInfo.agent_hostname}</td>
											<td>일반그룹</td>
											<td>${agentInfo.agent_recent_login}</td>
											<td>${agentInfo.agent_cpu}</td>
											<td>${agentInfo.agent_os}</td>
											<td>${agentInfo.agent_ram}</td>
										</tr>
									</tbody>
								</table>
								<br>
								<table id="tech-companies-1"
									class="table table-small-font table-bordered table-striped" style="table-layout:fixed;word-break:break-all; ">
									<thead>
										<tr>
											<th data-priority="1" width="10%">소프트웨어 이름</th>
											<th data-priority="3" width="30%">설치 경로</th>
											<th data-priority="1" width="10%">설치 날짜</th>
											<th data-priority="3" width="5%">버전</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach var="item" items="${agentInfo.getSwList()}">
												<tr class="data">
													<td>${item.getName()}</td>
													<td>${item.getPath()}</td>
													<td>${item.getDate()}</td>
													<td>${item.getVersion()}</td>
												</tr>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane" id="sysmonxml">
							<button type="button" id="commit" class="btn btn-success">저장</button>
							<br>
							<div class="table-responsive" data-pattern="priority-columns">
								<textarea class="form-control" rows="5" id="xmlEditor" style="height:400px;">${agentInfo.agent_xml}</textarea>
								
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
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.2/ace.js"></script>
<script>
		var forData = document.querySelector("#commit");
		console.log(forData);
		forData.addEventListener('click', function(e) {
			var editor = document.querySelector("#xmlEditor");
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/UpdateXML",
				global: false,
				type: "POST",
				async: false,
				data:{
					agent_hash:'${agentInfo.agent_hash}',
					xml_data: editor.value
				}
			}).responseText;
			parse = JSON.parse(bodyContent);
			if(parse.success==true)
				alert('적용 완료');
		}, false);
</script>
</body>
</html>