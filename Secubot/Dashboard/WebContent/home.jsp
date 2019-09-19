<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SECUBOT - Adaptive SIEM & Security Configuration
		Management</title>
		
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet"> 
<link href="css/home/lightbox.css" rel="stylesheet"> 
<link href="css/home_main.css?ver=2" rel="stylesheet">
<link href="css/home/responsive.css" rel="stylesheet">

<link rel="shortcut icon" href="img/SecuBot_logo.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png?ver=1">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png?ver=1">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png?ver=1">
<link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png?ver=1">
</head>

<body>

	<%
		HttpSession httpSession = request.getSession(false);
		if (httpSession == null || httpSession.getAttribute("authUser") == null) {
			response.sendRedirect("/Secubot/login.do");
		}
	%>
	
	<header id="header">      
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="home.jsp">
                    	<h1><img src="img/home/logo.png" alt="logo"></h1>
                    </a>
                </div>
                <!-- 상단 목차 -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="home.jsp">Home</a></li>
                                   
                        <li class="dropdown"><a href="#"> 신청 서비스  <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="firewall_apply_board.jsp">방화벽 신청</a></li>
                                <li><a href="#">방화벽 취소</a></li>
                            </ul>
                        </li>                             
                        <li class="dropdown"><a href="#">자료실 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="#">공지 사항</a></li>
                                <li><a href="#">보안 공지</a></li>
                                <li><a href="#">보고서</a></li>
                                <li><a href="#">취약점 정보</a></li>
                                <li><a href="#">가이드 및 매뉴얼</a></li>
                                <li><a href="#">보안 공지</a></li>
                                <li><a href="#">참고 사이트</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"> 다운로드 <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="#">Secubot Agent</a></li>
                            </ul>
                        </li>                                      
                    </ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <!--/#header-->
    
    <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                    <div class="slide-text">
                        <h1>We are The SECUBOT</h1>
                        <p>Adaptive SIEM & Security Configuration Management</p>
                    </div>
                    <img src="img/home/SecuBot.png" class="slider-hill" alt="slider image">
                </div>
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lightbox.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/home_main.js"></script>   
</body>
</html>
