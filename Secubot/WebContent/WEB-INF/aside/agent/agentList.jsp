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

<!-- animate CSS -->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- DataTables -->
<link href="assets/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        
<!-- Custom styles for this template -->
<link href="css/style.css?version=1" rel="stylesheet">
<link href="css/helper.css?version=1" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

<style>
.page-content {
	display: none;
}
button.active {
	background-color: #ccc;
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
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-dark">에이전트 관리 목록</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="datatable" class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>사용자명</th>
												<th>Phone</th>
												<th>IP</th>
												<th>MAC</th>
											</tr>
										</thead>
										<tbody id="agentList">
											<c:forEach var="agent" items="${agentPage.list}" varStatus="idx">
												<tr class="data">
													<td class="${"Agent".concat(idx.count)}"><strong>${idx.count}</strong></td>
													<td class="${"Agent".concat(idx.count)}">${agent.getName() }</td>
													<td class="${"Agent".concat(idx.count)}">${agent.getPhone()}</td>
													<td class="${"Agent".concat(idx.count)}">${agent.getIp()}</td>
													<td class="${"Agent".concat(idx.count)}">${agent.getMac()}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>

	<!-- ajax -->
	<script src="js/ajax.js?ver=2"></script>
	
	<!-- datatable -->
	<script src="${pageContext.request.contextPath }/assets/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/datatables/dataTables.bootstrap.js"></script>
	
	<!-- ajax -->
	<script src="${pageContext.request.contextPath }/js/ajax.js?ver=1"></script>
	
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('#datatable').dataTable();
	    });
	    
	    //checkMyNoti();
	    
	    // For go to Details
	    function paginationButton(evt, pageNumber) {
			var pageContent, pageLinks;
			
			pageContent = document.getElementsByClassName('page-content');
			for (var i=0; i<pageContent.length; i++) {
				pageContent[i].style.display = "none"; 
			}
			
			pageLinks = document.getElementsByClassName('page-link');
			for (var i=0; i<pageLinks.length; i++) {
				pageLinks[i].className = pageLinks[i].className.replace("active", "");
			}
			
			document.getElementById(pageNumber).style.display = "table-row-group";
			evt.currentTarget.className += " active";
		}
		
		var forData = document.querySelector("#agentList");
		forData.addEventListener('click', function(e) {
			var data = e.target.parentElement.innerText.split('\t');
			var bodyContent = $.ajax({
				url: "http://211.193.58.162:2222/--" + md5 + "&AgentID=" +e.target.className,
				global: false,
				type: "GET",
				async: false
			}).responseText;
		}, false);
	</script>
</body>
</html>