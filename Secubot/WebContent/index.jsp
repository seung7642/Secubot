<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="img/SecuBot_logo.png">

<title>SECUBOT - Adaptive SIEM & Security Configuration
	Management</title>
<script src="js/hammer.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!-- animate CSS -->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css?version=1" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<!-- myCSS -->
<link href="css/myCSS.css" rel="stylesheet">

<!-- d3 -->
<link href="css/d3.css?ver=1.234" rel="stylesheet">

<style>
h2:hover {
	transform: scale(1.05);
	-webkit-transform: scale(1.05);
	-moz-transform: scale(1.05);
	transition: all 0.3s ease-in-out;
}
li.notiActive {
	display: inline-block;
}
li.nonotiActive {
	display: none;
}
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
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
				<h3 class="title">Main Dashboard for Check of Threat Intelligence</h3>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="fa fa-shield text-pink"></i> 
						<h2 class="today-process-count m-0 counter" style="cursor:pointer;"></h2>
						<div>Today's Process</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-social-freebsd-devil text-purple"></i> 
						<h2 class="today-network-count m-0 counter" style="cursor:pointer;"></h2>
						<div>Today's Network</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-android-search text-info"></i> 
						<h2 class="today-rule-count m-0 counter" style="cursor:pointer;"></h2>
						<div>Today's Rule</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="widget-panel widget-style-2 white-bg">
						<i class="ion-ios7-compose text-success"></i> 
						<h2 class="today-event-count m-0 counter" style="cursor:pointer;"></h2>
						<div>Today's Event</div>
					</div>
				</div>
			</div> <!-- end row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="portlet">
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark"></h3>
						</div>
						<button id="randomizeData">Day</button>
						<button id="randomizeData">Weekend</button>
						<button id="randomizeData">Month</button>
						<div class="portlet-body" id="visualization">
							<div>
								<canvas id="canvas"></canvas>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 
				<div class="col-lg-6">
					<div class="portlet">
						<div class="portlet-heading">
							<h3 class="portlet-title text-dark">누적 대응 건수</h3>
						</div>
						<div class="portlet-body" id="line"></div>
					</div>				
				</div>
				-->
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

	<!-- modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Details</div>
				<div class="modal-body"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>
	
	<!-- d3.js -->
	<script src="js/d3.v3.min.js"></script>
	
	<!-- Chart.js -->
	<script src="js/Chart.js"></script>
	<script src="js/utils.js"></script>
	<script src="js/Chart.bundle.js"></script>
	<script src="js/chartjs-plugin-zoom.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js?ver=6.33"></script>
	<script src="js/visualization.js?ver=2.4"></script>
	
	<script>
		var data = getProcessList();
		var parse = JSON.parse(data);
		var xScale = d3.scale.linear().domain([0, 2500000]).range([-100, 100]);
		var yScale = d3.scale.linear().domain([0, 2000]).range([-100, 100]);
		for (i in parse.ProcessList) {
			parse.ProcessList[i].x = xScale(parse.ProcessList[i].x);
			parse.ProcessList[i].y = yScale(parse.ProcessList[i].y);
		}
		
		/* Notification */
		//checkMyNoti();
		
		/* Chart.js */
		function addData(chart, label, data) {
			chart.data.labels.push(label);
			chart.data.datasets.forEach((dataset) => {
				dataset.data.push(data);
			});
			chart.update();
		}
		
		function removeData(chart) {
			chart.data.labels.pop();
			chart.data.datasets.forEach((dataset) => {
				dataset.data.pop();
			});
			chart.update();
		}
		
		var color = Chart.helpers.color;
		var scatterChartData = {
			datasets: [{
				label: 'Process',
				borderColor: window.chartColors.red,
				backgroundColor: color(window.chartColors.red).alpha(0.2).rgbString(),
				data: parse.ProcessList
			}]
		};
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myScatter = Chart.Scatter(ctx, {
				data: scatterChartData,
				options: {
					title: {
						display: true,
						text: '보안 위협 시각화'
					},
					scales: {
						yAxes: [{
							display: true,
							gridLines: {
								zeroLineColor: "rgba(0, 255, 0, 1)",
								lineWidth: 1
							},
							ticks: {
								max: 100,
								min: -100
							},
							scaleLabel: {
								display: true,
								labelString: "독립성"
							}
						}],
						xAxes: [{
							display: true,
							gridLines: {
								zeroLineColor: "rgba(0, 255, 0, 1)"
							},
							ticks: {
								max: 100,
								min: -100
							},
							scaleLabel: {
								display: true,
								labelString: "지속성"
							}
						}]
					},
					pan: {
						enabled: true,
						mode: 'xy',
					},
					zoom: {
						enabled: true,
						mode: 'xy',
					},
					//events: ['click'],
					'onClick': function(evt, item) {
						var that = this;
						console.log(item);
						var popUrl = "/Secubot/popup.jsp?md5=" + parse.ProcessList[item[0]._index].MD5 + "&imagename=" + parse.ProcessList[item[0]._index].ImageName;
						var popOption = "width=700, height=400, scrollbars=no, status=no;";
						window.open(popUrl, popOption);
					},
					tooltips: {
						yPadding: 10,
						xPadding: 10,
						caretSize: 8,
						backgroundColor: 'rgba(72, 241, 12, 1)',
						titleFontColor: window.chartColors.black,
						bodyFontColor: window.chartColors.black,
						borderColor: 'rgba(0,0,0,1)',
						borderWidth: 4,
						callbacks: {
							label: function(tooltipItem, data) {
								var xLabel = data.datasets[0].data[tooltipItem.index].ImageName;
								return xLabel;
							}
						}
					},
					hover: {
						mode: 'nearest',
						intersect: true
					}
				}
			});
		};
		
		function clickFunc() {
			var popUrl = "/popup.jsp?md5=" + parse.ProcessList[1].MD5 + "&imagename=" + parse.ProcessList[1].ImageName;
			var popOption = "width=700, height=400, scrollbars=no, status=no;";
			window.open(popUrl, popOption);
		}

		document.getElementById('randomizeData').addEventListener('click', function() {
			scatterChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return {
						x: randomScalingFactor(),
						y: randomScalingFactor()
					};
				});
			});
			window.myScatter.update();
		});
		
		var todayProcess = todayProcessCount();
		var parseTodayProcess = JSON.parse(todayProcess);
		
		var todayNetwork = todayNetworkCount();
		var parseTodayNetwork = JSON.parse(todayNetwork);
		
		var todayRule = todayRuleCount();
		var parseTodayRule = JSON.parse(todayRule);
		
		var todayEvent = todayEventCount();
		var parseTodayEvent = JSON.parse(todayEvent);
	</script>
	
</body>
</html>