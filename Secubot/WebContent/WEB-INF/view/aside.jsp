<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script>
$(document).ready(function() {
    var url = window.location; 
    var element = $("body > aside > nav > ul > li.has-submenu > a")
    var element1 = $("body > aside > nav > ul > li.has-submenu > ul > li > a")
    
    for(var i=0;i<element.length;i++){
    	if (element[i].href.slice(-1) !="#" && element[i].href.indexOf(url.href) != -1 || url.href.indexOf(element[i].href) != -1){
    		element[i].closest("li.has-submenu").className += " active";
    	}
    }
    for(var i=0;i<element1.length;i++){
    	if (element1[i].href.slice(-1) !="#" && element1[i].href.indexOf(url.href) != -1 || url.href.indexOf(element1[i].href) != -1){
    		element1[i].closest("li.has-submenu").className += " active";
    	}
    }
    //if (element.is('li')) { 
     //    element.addClass('active').parent().parent('li').addClass('active')
     //}
});
</script>
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
			<li class="has-submenu">
				<a href="${pageContext.request.contextPath }/index.jsp"><i class="ion-home"></i>
				<span class="nav-label">Dashboard</span></a>
			</li>
			
			<!-- Agent -->
			<li class="has-submenu">
				<a href="#"><i class="ion-eye"></i> <span class="nav-label">Agent</span></a>
				<ul class="list-unstyled">
					<li><a href="${pageContext.request.contextPath }/agentMain.do">Agent List</a></li>
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
					<li><a href="${pageContext.request.contextPath }/report.do">Security</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<!-- Navbar Ends -->

</aside>
<!-- Aside Ends-->

