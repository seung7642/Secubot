<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>방화벽 신청 서비스 | Secubot</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/home/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/home_main.css" rel="stylesheet">
<link href="css/home/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="img/SecuBot_logo.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png">
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
							<img src="img/home/logo.png" alt="logo">
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
							'방화벽 정책 신청'은 업무 목적으로 내외부를 대상으로 정보 서비스를 하고자 하는 경우 필요합니다</br>
							 방화벽 정책 신청에 필요한 정보를 입력 해주시기 바랍니다.
						</p>
					</div>
					<form method="POST" action="${pageContext.request.contextPath }/article/write.do" accept-charset="utf-8">
						<div class="form-group">
							<input type="text" name="title" id="title" class="form-control"
								required="required" placeholder="title">
						</div>
						<div class="form-group">
							<textarea name="content" id="content" required="required"
								class="form-control" rows="8" placeholder="content"></textarea>
						</div>
						<div class="form-group">
							<select name="type">
								<option value="TCP" selected="selected">TCP</option>
								<option value="UDP">UDP</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="src_ip" id="src_ip" class="form-control"
								required="required" placeholder="src_ip">
						</div>
						<div class="form-group">
							<input type="text" name="dst_ip" id="dst_ip" class="form-control"
								required="required" placeholder="dst_ip">
						</div>
						<div class="form-group">
							<input type="text" name="dst_port" id="dst_port"
								class="form-control" required="required" placeholder="dst_port">
						</div>						
						<div class="form-group">
							<input type="submit" name="submit" class="btn btn-submit" value="Submit">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/jquery.countTo.js"></script>
	<script type="text/javascript" src="js/home-main.js"></script>

</body>
</html>
