<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Aside Start-->
<aside class="left-panel">

	<!-- brand -->
	<div class="logo">
		<a href="${pageContext.request.contextPath }/index.jsp" class="logo-expanded">
			<i><img src="${pageContext.request.contextPath }/img/logo_0_0.png"></i> 
			<span class="nav-label">Secubot</span>
		</a>
	</div>
	<!-- / brand -->

	<!-- Navbar Start -->
	<nav class="navigation">
		<ul class="list-unstyled">
			<!-- Dashboard -->
			<li class="active">
				<a href="${pageContext.request.contextPath }/index.jsp"><i class="ion-home"></i>
				<span class="nav-label">Dashboard</span></a>
			</li>
			
			<!-- Agent -->
			<li class="has-submenu">
				<a href="#"><i class="ion-eye"></i> <span class="nav-label">Agent</span></a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/listAgent.do">Agent List</a></li>
				</ul>
			</li>
			
			<!-- Network -->
			<li class="has-submenu">
				<a href="#"><i class="ion-network"></i> <span class="nav-label">Network</span></a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/network.do">Main</a></li>
				</ul>
			</li>
			
			<!-- Policy -->
			<li class="has-submenu">
				<a href="#"><i class="ion-clipboard"></i> <span class="nav-label">Policy</span></a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/agentPolicy.do">process</a></li>
				</ul>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/networkPolicy.do">network</a></li>
				</ul>
			</li>
			
			<!-- Analysis -->
			<li class="has-submenu">
				<a href="#"><i class="ion-podium"></i><span class="nav-label">Analysis</span></a>
				<ul class="list-unstyled">
					<li><a href="#">Main</a></li>
				</ul>
			</li>
			
			<!-- Desk -->
			<li class="has-submenu">
				<a href="#"><i class="ion-headphone"></i> <span class="nav-label">Desk</span></a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/article/list.do">Complaints</a></li>
				</ul>		
			</li>
			
			<!-- Report -->
			<li class="has-submenu">
				<a href="#"><i class="ion-document"></i> <span class="nav-label">Report</span></a>
				<ul class="list-unstyled">
					<li><a href="#">Security</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- Navbar Ends -->

</aside>
<!-- Aside Ends-->
