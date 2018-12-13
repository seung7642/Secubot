<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="shortcut icon" href="img/SecuBot_logo.png">

<title>SECUBOT - Adaptive SIEM & Security Configuration
	Management</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!--Animation css-->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- DataTables -->
<link href="assets/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">

<link href="css/withyou.css" rel="stylesheet">

<style>
div.tab-pane div.panel.panel-default {
	width: 25%;
	float: left;
	margin-left: 60px;
}
.panel-clear {
	clear: both;
}
li.notiActive {
	display: inline-block;
}
li.nonotiActive {
	display: none;
}
</style>

</head>

<body>

	<%@ include file="/WEB-INF/view/aside.jsp"%>

	<!--Main Content Start -->
	<section class="content">
		<%@ include file="/WEB-INF/view/header.jsp"%>

		<!-- Page Content Start -->
		<!-- ================== -->
		<div class="wraper container-fluid">
			<div class="page-title">
				<h3 class="title"></h3>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title text-dark">네트워크 정책목록</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive" data-pattern="priority-columns">
								<table id="datatable"
									class="table table-small-font table-bordered table-striped">
									<thead>
										<tr>
											<th data-priority="1" width="5%">#</th>
											<th data-priority="3" width="20%">정책명</th>
											<th data-priority="3" width="20%">srcIP</th>
											<th data-priority="3" width="20%">dstIP</th>
											<th data-priority="3" width="20%">port</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="network" items="${networkPage.list }">
											<tr>
												<td>#</td>
												<td>${network.getPolicyName() }</td>
												<td>${network.getSrcIP() }</td>
												<td>${network.getDstIP() }</td>
												<td>${network.getPort() }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<button type="button" class="btn btn-info btn-custom m-b-5" data-toggle="modal"
								data-placement="right" title="정책을 추가합니다."
								data-target="#myModal">추가</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End row -->

		</div>
		<!-- Page Content Ends -->
		<!-- ================== -->


		<!-- Footer Start -->
		<footer class="footer"> 2018 © SECUBOT - Adaptive SIEM &
			Security Configuration Management. </footer>
		<!-- Footer Ends -->
	</section>
	<!-- Main Content Ends -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<form class="form col-md-12 center-block" action="${pageContext.request.contextPath }/networkPolicy.do" method="POST">
						<div class="form-group md-form mb-4">
							<label for="policy_name">정책명</label>
							<select name="policy_name" id="policy_name" class="form-control">
								<option value="process_kill">Network Block</option>
							</select>
						</div>
						<div class="form-group">
							<label for="src_ip">srcIP</label>
							<input name="src_ip" type="text" class="form-control" id="src_ip" placeholder="srcIP...">
						</div>
						<div class="form-group">
							<label for="dst_ip">dstIP</label>
							<input name="dst_ip" type="text" class="form-control" id="dst_ip" placeholder="dstIP...">
						</div>
						<div class="form-group">
							<div id="spinner">
								<div class="input-group input-small">
									<input type="text" class="spinner-input form-control" maxlength="3" readonly>
									<div class="spinner-buttons input-group-btn btn-group-vertical">
										<button type="button" class="btn spinner-up btn-xs btn-default">
											<i class="fa fa-angle-up"></i>
										</button>
										<button type="button" class="btn spinner-down btn-xs btn-default">
											<i class="fa fa-angle-down"></i>
										</button>
									</div>
								</div>
							</div>
                        </div>
						<div class="form-group">
							<button class="btn btn-outline-secondary" data-dismiss="modal" aria-hidden="false">Cancle</button>
							<button type="submit" class="btn btn-success">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

	<script src="js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script src="js/jquery.dashboard.js"></script>
	
	<!-- ajax -->
	<script src="js/ajax.js?ver=1"></script>
	
	<script src="assets/datatables/jquery.dataTables.min.js"></script>
	<script src="assets/datatables/dataTables.bootstrap.js"></script>
	<script src="assets/spinner/spinner.min.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#datatable').dataTable();
            $('#spinner').spinner();
		});
		
		
		//checkMyNoti();
	</script>

</body>
</html>