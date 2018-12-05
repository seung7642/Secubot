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
										<tbody>
											<!-- 
											<c:if test="${agentPage.hasAgentList()}">
												<tr>
													<td colspan="5">등록된 에이전트가 없습니다.</td>
												</tr>
											</c:if>
											-->
											<c:forEach var="agent" items="${agentPage.list}">
												<tr>
													<td><strong>#</strong></td>
													<td>${agent.getName() }</td>
													<td>${agent.getPhone()}</td>
													<td>${agent.getIp()}</td>
													<td>${agent.getMac()}</td>
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
	<script>
		var data = getAgentList();
		var parse = JSON.parse(data);
		/*
		for (var i=0; i<parse.AgentList.length; i++) {
			document.querySelector('table').innerHTML += '<tbody>'
				+ '<tr>' 
				+ "<td width='20%'></td>"
				+ "<td width='20%'><a href='/Secubot/agentInfo.do'>" + parse.AgentList[i].UserName + "</a></td>"
				+ "<td width='20%'>" + parse.AgentList[i].userPhone + "</td>" 
				+ "<td width='20%'></td>" 
				+ "<td width='20%'></td>"
				+ '</tr>';
				+ '</tbody>';
		}
		*/
		
		/*
		 *	페이징 처리할 부분
		 */
		var size = 5; // 1페이지당 갯수
		var arr = parse.AgentList; // 에이전트 리스트 객체들을 담을 배열
		var arrLen = arr.length;
		var page = parseInt(arrLen / size);
		var arrList = new Array(page);
		for (var i=0; i<=page; i++) {
			arrList[i] = new Array();
			console.log("success");
		}
		
		var tmp = 0;
		for (var i=0; i<=1; i++) {
			for (var j=0; j<size; j++) {
				if (arrLen != tmp) {
					arrList[i][j] = arr[tmp++];
				}
			}
		}
		
		/* var area = document.querySelector('#paginationArea > ul');
		for (var i=0; i<=page; i++) {
			area.innerHTML += '<button class="page-link btn btn-default" onclick=' + '"paginationButton(event, ' + i + ')">' + (i+1) + '</a></li>';
		}
		
		for (var i=0; i<=page; i++) {
			document.querySelector('table').innerHTML += '<tbody id=' + i + ' class="page-content">';
			for (var j=0; j<arrList[i].length; j++) {
				document.getElementById(i).innerHTML += '<tr>' + "<td width='10%'></td>"
				+ "<td width='20%'><a href='/Secubot/agentInfo.do'>" + arrList[i][j].UserName + "</a></td>"
				+ "<td width='20%'>" + arrList[i][j].userPhone + "</td>" + "<td width='30%'></td>" + "<td width='10%'></td>";
			}
			document.querySelector('table').innerHTML += '</tbody>';
		} */
		
		/*
		 *	버튼 클릭에 따른 패널 전환 처리 함수
		 */
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
		
	</script>
	
	<!-- datatable -->
	<script src="${pageContext.request.contextPath }/assets/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/datatables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('#datatable').dataTable();
	    });
	</script>
</body>
</html>