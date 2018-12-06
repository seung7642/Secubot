<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/SecuBot_logo.png">
<title>SECUBOT - 글 내용</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap-reset.css" rel="stylesheet">

<!--Animation css-->
<link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="${pageContext.request.contextPath }/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/style.css?ver=2" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/helper.css" rel="stylesheet">

<!-- Summernote -->
<link href="${pageContext.request.contextPath }/css/summernote.css" res="stylesheet">

<style>
textarea {
	width: 100%;
	height: 600px;
}
li.notiActive {
	display: inline-block;
}
li.nonActive {
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
				<div class="col-lg-12">
					<div class="portlet">
						<!-- /primary heading -->
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">민원 내용</h3>
						</div>
						<div class="portlet-body">
							<table border="1" width="100%">
								<tr>
									<th class="text-center">번호</th>
									<td class="text-center">${articleData.article.number}</td>
								</tr>
								<tr>
									<th class="text-center">작성자</th>
									<td class="text-center">${articleData.article.writer.name}</td>
								</tr>
								<tr>
									<th class="text-center">제목</th>
									<td class="text-center"><c:out value='${articleData.article.title}' /></td>
								</tr>
								<tr>
									<th class="text-center" colspan="2">내용</th>
								</tr>
								<tr>
									<td class="text-center" colspan="2" height=100><u:pre value='${articleData.content}'/></td>
								</tr>
							</table>
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
	
	<!-- ajax -->
	<script src="${pageContext.request.contextPath }/js/ajax.js?ver=2"></script>
	
	<script>
		checkMyNoti();
	</script>
</body>
</html>