<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="shortcut icon" href="img/favicon_1.ico">

<title>Adaptive SIEM & Security Configuration Management</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!-- animate CSS -->
<link href="css/animate.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css?ver=1" rel="stylesheet">
<link href="css/helper.css?ver=1" rel="stylesheet">
        
<style>
.help-block {
	color: red;
	font-size: 12px;
}
</style>

</head>


<body>

	<div class="wrapper-page animated fadeInDown">
		<div class="panel panel-color panel-primary">
			<div class="panel-heading"> 
				<h3 class="text-center m-t-10"> Sign In to <strong>SECUBOT</strong> </h3>
			</div> 

			<form class="form-horizontal m-t-40" action="${pageContext.request.contextPath}/login.do" method="post">
				<div class="form-group ">
					<div class="col-xs-12">
						<input class="form-control" type="text" name="id" placeholder="Id">
					</div>
				</div>
				<div class="form-group ">
	                        
				<div class="col-xs-12">
					<input class="form-control" type="password" name="password" placeholder="Password">
					<c:if test="${!errors.idOrPwNotMatch }">
						<p class="help-block" id="passwordError"></p>
					</c:if>
					<c:if test="${errors.idOrPwNotMatch }">
						<div class="alert alert-danger" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							<span class="sr-only">Error:</span>
							check password.
						</div>
					</c:if>
				</div>
				</div>
	
				<div class="form-group ">
					<div class="col-xs-12">
						<label class="cr-styled">
							<input type="checkbox" checked>
							<i class="fa"></i> 
							Remember me
						</label>
					</div>
				</div>
	                    
				<div class="form-group text-right">
					<div class="col-xs-12">
						<button class="btn btn-purple w-md" type="submit" id="btnSubmit">Log In</button>
					</div>
				</div>
				<div class="form-group m-t-30">
					<div class="col-sm-7">
						<a href="recoverpw.html"><i class="fa fa-lock m-r-5"></i> Forgot your password?</a>
					</div>
					<div class="col-sm-5 text-right">
						<a href="${pageContext.request.contextPath}/join.do">Create an account</a>
					</div>
				</div>
			</form>

		</div>
	</div>

    


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/pace.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/jquery.scrollTo.min.js"></script>
	<!-- <script src="js/passwordCheck.js"></script> -->
	
	<!--common script for all pages-->
	<script src="js/jquery.app.js"></script>

</body>
</html>