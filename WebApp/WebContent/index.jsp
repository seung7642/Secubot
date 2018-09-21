<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Coderthemes">
<link rel="shortcut icon" href="images/favicon.ico">

<title>Adaptive SIEM & Security Configuration Management</title>

<!-- Google-Fonts -->
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:100,300,400,600,700,900,400italic' rel='stylesheet'>
<link href='http://fonts.googleapis.com/css?family=Cuprum:400,700' rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>

<header>
	<section class="hero">
		<div class="container">
			<div class="row nav-wrapper">
				<nav class="navbar navbar-custom">
				    <div class="container-fluid">
					    <!-- Brand and toggle get grouped for better mobile display -->
					    <div class="navbar-header">
					        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						        <span class="sr-only">Toggle navigation</span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
					        </button>
					        <a class="navbar-brand" href="#"><img src="images/logo.png" alt="logo"></a>
					    </div>
						
						<u:isLogin>
						    <!-- Collect the nav links, forms, and other content for toggling -->
						    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						        <%-- <ul class="nav navbar-nav navbar-right">
							      	<li><a href="#how">How it works</a></li>
							        <li><a href="#features">Features</a></li>
									<li><a href="#pricing">Pricing</a></li>
									<li><a href="#clients">Clients</a></li>
									<li><a href="${pageContext.request.contextPath}/login.do">Log In</a></li>
									<li><a href="${pageContext.request.contextPath}/join.do" class="btn-signup btn-primary">Sign Up</a></li>
						        </ul> --%>
						    </div><!-- /.navbar-collapse -->
							<div class="!panel panel-default">
									<div class="btn-group dropdown" style="float: right;">
										<button type="button" class="btn btn-default">${authUser.name } 님</button>
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="caret"></i></button>
										<ul class="dropdown-menu" role="menu" style="background-color: black;">
											<li><a href="#">Dashboard</a></li>
											<li><a href="#">Setting</a></li>
											<li class="divider"></li>
											<li><a href="${pageContext.request.contextPath}/logout.do">Log Out</a></li>
										</ul>
									</div>
							</div>
					    </u:isLogin>
					    <u:notLogin>
					    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					    		<ul class="nav navbar-nav navbar-right">
					    			<li><a href="${pageContext.request.contextPath}/login.do">Log In</a></li>
					    			<li><a href="${pageContext.request.contextPath}/join.do" class="btn-signup btn-primary">Sign Up</a></li>
					    		</ul>
					    	</div>
					    </u:notLogin>
					    
					</div><!-- /.container-fluid -->
				</nav> <!-- end nav -->
			</div> <!-- End row -->

			<div class="row hero-content text-center">
				<h1 class="">SECUBOT - Adaptive SIEM&Security Configuration Management</h1>
				<div id="macbook">
			        <div id="tour" class="carousel slide" data-ride="carousel">
			        
			            
			            <!-- Indicators -->
						<ol class="carousel-indicators">
						    <li data-target="#tour" data-slide-to="0" class="active"></li>
						    <li data-target="#tour" data-slide-to="1"></li>
						    <li data-target="#tour" data-slide-to="2"></li>
						</ol>

			            <div class="carousel-inner">
			            	<!-- slide item -->
			                <div class="item active">
			                    <img src="images/stock1.jpg" alt="slide-img">
			                </div>
			                <!-- slide item -->
				            <div class="item">
				                <img src="images/stock2.jpg" alt="slide-img">
				            </div>
				            <!-- slide item -->
				            <div class="item">
				                <img src="images/stock3.jpg" alt="slide-img">
				            </div>
			            </div> <!-- /.carousel-inner -->

			        </div> <!-- /#tour -->
			    </div>
			</div>
		</div> <!-- end container -->
	</section> <!-- end hero -->
</header>

<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<a class="navbar-brand-footer" href="#"><img src="images/logo.png" alt="logo"></a>
			</div>
			<div class="col-lg-4 col-lg-offset-3 col-md-7">
				<ul class="nav navbar-nav">
					<li><a href="#how">How it works</a></li>
					<li><a href="#features">Features</a></li>
					<li><a href="#pricing">Pricing</a></li>
					<li><a href="#clients">Clients</a></li>
				</ul>
			</div>
			<div class="col-lg-2 col-md-2">
				<ul class="social-icons">
					<li><a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
					<li><a href="https://www.twitter.com/"><i class="fa fa-twitter"></i></a></li>
					<li><a href="https://plus.google.com/discover"><i class="fa fa-google-plus"></i></a></li>
				</ul>
			</div>
		</div> <!-- end row -->
	</div> <!-- end container -->
</footer>
<!-- End Footer -->




<!-- js placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Jquery easing -->
<script type="text/javascript" src="js/jquery.easing.1.3.min.js"></script>
<!-- SmoothScroll -->
<script src="js/SmoothScroll.js"></script>
<script type="text/javascript">
//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
	$('.navbar-nav a').bind('click', function(event) {
		var $anchor = $(this);
		$('html, body').stop().animate({
			scrollTop: $($anchor.attr('href')).offset().top - 0
		}, 1500, 'easeInOutExpo');
		event.preventDefault();
	});
});
</script>

</body>
</html>