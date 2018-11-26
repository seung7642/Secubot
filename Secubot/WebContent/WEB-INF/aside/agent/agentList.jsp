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
<link href="css/helper.css?version=1" rel="stylesheet">

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
							<h3 class="portlet-title text-dark">에이전트 관리 목록</h3>
						</div>
						
						<div id="portlet" class="panel-collapse collapse in">
							<div class="portlet-body">
								<div id="search">
									<!-- Search -->
									<form role="search" class="navbar-right app-search pull-right hidden-xs">
										<input type="text" placeholder="Search..." class="form-control">
										<a href=""><i class="fa fa-search"></i></a>
									</form>
								</div>
								<table class="table table-hover table-sm">
									<thead>
										<th width="10%">상태</th>
										<th width="20%">사용자명</th>
										<th width="20%">Phone</th>
										<th width="30%">MAC</th>
										<th width="10%">AgentID</th>
									</thead>
									<tbody>
									
									</tbody>
								</table>
								<c:if test="${articlePage.hasArticles()}">
									<tr>
										<td colspan="4">
											<c:if test="${articlePage.startPage > 5}">
												<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
											</c:if>
											<c:forEach var="pNo" begin="${articlePage.startPage}" 
											end="${articlePage.endPage}">
												<div class="text-center">
													<ul class="pagination">
														<li><a href="list.do?pageNo=${pNo}">${pNo}</a></li>
													</ul>
												</div>
											</c:forEach>
											<c:if test="${articlePage.endPage < articlePage.totalPages}">
												<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
											</c:if>
										</td>
									</tr>
								</c:if>
								<div id="paginationArea" class="text-center">
									<%-- <ul class="pagination m-b-5">
	                                    <li>
	                                      <a href="#" aria-label="Previous">
	                                        <i class="fa fa-angle-left"></i>
	                                      </a>
	                                    </li>
	                                    <li class="active"><a href="#">1</a></li>
	                                    <li><a href="#">2</a></li>
	                                    <li>
	                                      <a href="#" aria-label="Next">
	                                        <i class="fa fa-angle-right"></i>
	                                      </a>
	                                    </li>
	                                </ul> --%>
	                                <ul class="pagination m-b-5">
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
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>

	<!-- ajax -->
	<script src="js/ajax.js?ver=2"></script>
	<script>
		data = getAgentList();
		parse = JSON.parse(data);
		for (i in parse.AgentList) {
			document.querySelector('table').innerHTML += "<tbody>" + "<td><div class='material-switch pull-left'><input id='someSwitchOptionPrimary' name='someSwitchOption001' type='checkbox' /> <label for='someSwitchOptionPrimary' class='label-primary'></label></div></td>"
			+ "<td><a href='/Secubot/agentInfo.do'>" + parse.AgentList[i].UserName + "</a></td>"
			+ "<td>" + parse.AgentList[i].userPhone + "</td>" + "<td></td>" + "<td></td>" + "</tbody>";
		}
		
		/*
		 *	페이징 처리할 부분
		 */
		var size = 5; // 1페이지당 갯수
		var arr = parse.AgentList; // 에이전트 리스트 객체들을 담을 배열
		console.log("test: " + arr.length);
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
		console.log(arrList);
		
		var area = document.querySelector('#paginationArea > ul');
		for (var i=0; i<=page; i++) {
			/* area.innerHTML += '<ul class="pagination m-b-5"><li>' + 
			i + '</li></ul>' */
			area.innerHTML += '<li>' + i + '</li>';
		}
		
	</script>

</body>
</html>