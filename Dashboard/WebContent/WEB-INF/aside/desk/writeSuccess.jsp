<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>방화벽 신청 서비스 | Secubot</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/home/lightbox.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/home_main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/home/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="img/SecuBot_logo.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/img/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/img/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="i${pageContext.request.contextPath }/mg/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/img/ico/apple-touch-icon-57-precomposed.png">
</head>

<body>

	<%
		HttpSession httpSession = request.getSession(false);
		if (httpSession == null || httpSession.getAttribute("authUser") == null) {
			response.sendRedirect("/Secubot/login.do");
		}
	%>
	
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 overflow"></div>
			</div>
		</div>
		<div class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="index.html">
						<h1>
							<img src="${pageContext.request.contextPath }/img/home/logo.png" alt="logo">
						</h1>
					</a>
				</div>
				<!-- 상단 목차 -->
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="index.jsp">Home</a></li>

						<li class="dropdown"><a href="#"> 신청 서비스 <i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="firewall_apply_board.jsp">방화벽 신청</a></li>
								<li><a href="firewall_cancel_board.jsp">방화벽 취소</a></li>
							</ul></li>
						<li class="dropdown"><a href="#">자료실 <i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="#">공지 사항</a></li>
								<li><a href="#">보안 공지</a></li>
								<li><a href="#">보고서</a></li>
								<li><a href="#">취약점 정보</a></li>
								<li><a href="#">가이드 및 매뉴얼</a></li>
								<li><a href="#">보안 공지</a></li>
								<li><a href="#">참고 사이트</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"> 다운로드 <i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="#">Secubot Agent</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="search">
					<form role="form">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="Search">
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<!--/#header-->

	<div class="container">
		<div class="row">
			<!-- 게시판 -->
			<div class="col-sm-12">
				<div class="contact-form bottom">
					<div class="col-sm-12">
						<h1 class="title">방화벽 정책 신청</h1>
						<p>
							민원신청이 접수되었습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/lightbox.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.countTo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/home-main.js"></script>

</body>
</html>
