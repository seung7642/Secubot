<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Header -->
<header class="top-head container-fluid">
	<button type="button" class="navbar-toggle pull-left">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>

	<!-- Left navbar -->
	<nav class=" navbar-default" role="navigation">

		<!-- Right navbar -->
		<ul class="nav navbar-nav navbar-right top-menu top-right-menu">
			
			<!-- user login dropdown start-->
			<li class="dropdown text-center"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <img alt=""
					src="${pageContext.request.contextPath }/img/logo.png"
					class="img-circle profile-img thumb-sm"> <span
					class="username">${authUser.name} 님</span>
			</a>
				<ul class="dropdown-menu extended pro-menu fadeInUp animated"
					tabindex="5003" style="overflow: hidden; outline: none;">
					<li><a href="profile.html"><i class="fa fa-briefcase"></i>Profile</a></li>
					<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
					<li><a href="#"><i class="fa fa-bell"></i> Notifacation <span
							class="label label-info pull-right mail-info">5</span></a></li>
					<li><a href="${pageContext.request.contextPath }/logout.do"><i
							class="fa fa-sign-out"></i> Log Out</a></li>
				</ul></li>
			<!-- user login dropdown end -->
		</ul>
		<!-- End right navbar -->
		
	</nav>

</header>
<!-- Header Ends -->