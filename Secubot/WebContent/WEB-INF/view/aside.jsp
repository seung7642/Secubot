<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- Aside Start-->
<aside class="left-panel">

	<!-- brand -->
	<div class="logo">
		<a href="index.jsp" class="logo-expanded">
			<i><img src="img/logo_0_0.png"></i> <span class="nav-label">SECUBOT</span>
		</a>
	</div>
	<!-- / brand -->

	<!-- Navbar Start -->
	<nav class="navigation">
		<ul class="list-unstyled">
			<li class="active"><a href="index.jsp"><i class="ion-home"></i>
					<span class="nav-label">Dashboard</span></a></li>
			<li class="has-submenu">
				<a href="agent.jsp"><i
					class="ion-eye"></i> <span class="nav-label">Agent</span></a>
				<ul class="list-unstyled">
					<li><a href="/Secubot/agentMain.do">Main</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="network.jsp"><i
					class="ion-network"></i> <span class="nav-label">Network</span> <!--<span class="badge bg-success">New</span>--></a>
				<ul class="list-unstyled">
					<li><a href="/Secubot/network.do">Main</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#"><i
					class="ion-clipboard"></i> <span class="nav-label">Policy</span></a>
				<ul class="list-unstyled">
					<li><a href="/Secubot/policy.do">Main</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#"><i class="ion-podium"></i>
					<span class="nav-label">analysis</span></a>
				<ul class="list-unstyled">
					<li><a href="#">Main</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#"><i
					class="ion-headphone"></i> <span class="nav-label">Desk</span></a>
				<ul class="list-unstyled">
					<li><a href="#">Main</a></li>
					<li><a href="#">Security</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#"><i
					class="ion-document"></i> <span class="nav-label">Report</span></a>
					<ul class="list-unstyled">
						<li><a href="${pageContext.request.contextPath }/article/list.do">Complaints</a></li>
					</ul>		
			</li>
		</ul>
	</nav>

</aside>
<!-- Aside Ends-->
