<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/SecuBot_logo.png">
<title>SECUBOT - 민원관리</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap-reset.css" rel="stylesheet">

<!--Animation css-->
<link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="${pageContext.request.contextPath }/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- DataTables -->
<link href="${pageContext.request.contextPath }/assets/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/style.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/helper.css" rel="stylesheet">

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
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-dark">보안 업무 형상관리</h3>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<table id="datatable" class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
									<c:if test="${articlePage.hasNoArticles()}">
										<tr>
											<td colspan="4">게시글이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="article" items="${articlePage.content}">
										<tr>
											<td><strong>${article.number}</strong></td>
											<td>
											<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}">
											<c:out value="${article.title}"/>
											</a>
											</td>
											<td>${article.writer.name}</td>
											<td>${article.readCount}</td>
										</tr>
									</c:forEach>
										</tbody>
									</table>
									<a class="btn btn-default pull-right" href="write.do">글 작성</a>
									<%-- <c:if test="${articlePage.hasArticles()}">
										<tr>
											<td colspan="4">
												<c:if test="${articlePage.startPage > 5}">
													<a href="list.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
												</c:if>
												<c:forEach var="pNo" 
														   begin="${articlePage.startPage}" 
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
									</c:if> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end row -->
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
	<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/modernizr.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/pace.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.scrollTo.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.nicescroll.js" type="text/javascript"></script>

	<script src="${pageContext.request.contextPath }/js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="${pageContext.request.contextPath }/js/jquery.dashboard.js"></script>
	
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