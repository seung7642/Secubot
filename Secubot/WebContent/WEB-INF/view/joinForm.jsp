<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-reset.css" rel="stylesheet">

<!--Icon-fonts css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/ionicon/css/ionicons.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/helper.css" rel="stylesheet">


<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->

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
               <h3 class="text-center m-t-10"> Create a new Account </h3>
            </div> 

            <form class="form-horizontal m-t-40" action="${pageContext.request.contextPath}/join.do" method="post">
            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control" type="text" name="id" required placeholder="Id">
                	<c:if test="${errors.duplicateId }">
                		<div class="alert alert-danger" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							<span class="sr-only">Error:</span>
							Duplicate ID
						</div>
                	</c:if>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control" type="email" name="email" required placeholder="Email">
                </div>
            </div>
            
            <div class="form-group ">
                <div class="col-xs-12">
                    <input class="form-control " type="text" name="name" required placeholder="Username">
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12">
                    <input class="form-control " id="password" type="password" name="password" required placeholder="Password (영문+숫자 8자 이상)">
                	<c:if test="${errors.invalidPassword }">
                		<div class="alert alert-danger" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
							<span class="sr-only">Error:</span>
							Invalid Password
						</div>
                	</c:if>
                </div>
            </div>

            <div class="form-group ">
                <div class="col-xs-12">
                    <label class="cr-styled">
                        <input type="checkbox" checked>
                        <i class="fa"></i> 
                         I accept <strong><a href="#">Terms and Conditions</a></strong>
                    </label>
                </div>
            </div>
            
            <div class="form-group text-right">
                <div class="col-xs-12">
                    <button class="btn btn-purple w-md" type="submit" id="btnSubmit">Register</button>
                </div>
            </div>

            <div class="form-group m-t-30">
                <div class="col-sm-12 text-center">
                    <a href="${pageContext.request.contextPath}/login.do">Already have account?</a>
                </div>
            </div>
        </form>                                  
        
    </div>
</div>




<!-- js placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/pace.min.js"></script>
<script src="js/passwordCheck.js"></script>
    
<!--common script for all pages-->
<script src="js/jquery.app.js"></script>

</body>
</html>
