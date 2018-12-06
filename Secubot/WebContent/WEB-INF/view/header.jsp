<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Header -->
<header class="top-head container-fluid">
	<button type="button" class="navbar-toggle pull-left">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>

	<!-- Right navbar -->
	<ul class="list-inline navbar-right top-menu top-right-menu">
		
		<!-- Notification dropdown start -->
		<li class="dropdown">
		    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
		        <i class="fa fa-bell-o"></i>
		        <span class="badge badge-sm up bg-pink count"></span>
		    </a>
		    <ul class="dropdown-menu extended fadeInUp animated nicescroll" tabindex="5002">
		        <li class="noti-header">
		            <p>Notifications</p>
		        </li>
		        <li class="xAlarm active">
		            <a href="#">
		                <span class="pull-left"><i class="ion-close-circled fa-2x text-danger"></i></span>
		                <span>알림이 없습니다.<br><small class="text-muted">Nothing else</small></span>
		            </a>
		        </li>
		        <li class="oAlarm nonActive">
		        	<a href="#">
		        		<span class="pull-left"><i class="ion-checkmark-circled fa-2x text-success"></i></span>
		        		<span><strong></strong> 개의 알림이 있습니다.<br><small class="text-muted">Please check</small></span>
		        	</a>
		        </li>
		        <li>
		            <p><a href="#" class="text-right">See all notifications</a></p>
		        </li>
		    </ul>
		</li>
		<!-- Notification dropdown end -->
		
		<!-- user login dropdown start-->
		<li class="dropdown text-center">
			<a data-toggle="dropdown" class="dropdown-toggle" href="#">
				<!--<img alt="" src="img/avatar-2.jpg" class="img-circle profile-img thumb-sm"> -->
				<span class="username">${authUser.name} 님</span><span class="caret"></span>
			</a>
			<ul class="dropdown-menu extended pro-menu fadeInUp animated"
				tabindex="5003" style="overflow: hidden; outline: none;">
				<li><a href="#"><i class="fa fa-briefcase"></i>Profile</a></li>
				<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
				<li><a href="${pageContext.request.contextPath }/logout.do"><i
						class="fa fa-sign-out"></i> Log Out</a></li>
			</ul>
		</li>
		<!-- user login dropdown end -->
		
	</ul>
	<!-- End right navbar -->
		
</header>
<!-- Header Ends -->