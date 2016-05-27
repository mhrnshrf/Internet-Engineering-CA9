<%@page import="far.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="myStore">
  <head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css"></script>
    <script type="text/javascript" src="ui-bootstrap-tpls-1.3.2.min.js"></script>
    <script type="text/javascript" src="angular-messages.min.js"></script>
    <script type="text/javascript" src="app.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="ui-bootstrap-custom-1.3.2-csp.css">
    <link rel="stylesheet" href="css/fonts.min.css" /></head>

  </head>


  <body ng-app="myStore" ng-controller="LoginController as ctrl">
		<div class="background">
			<div class="container">
				<div class="row">
				<h2><em>به هسته‌ معاملات بورس خوش آمدید.</em></h2>
				</br></br>
				</div>
			  <div class="row">
			    <div class="col-sm-4 col-sm-push-8">
			    </div>
			    <div class="col-sm-4">
				    <div class="content">نام کاربری یا رمز عبور اشتباه است.</div>
            </br></br>
            <a href="index.jsp" class="btn btn-default btn-sm">بازگشت <span class="glyphicon glyphicon-repeat"></a>


			    </div>
			   	<div class="col-sm-4 col-sm-pull-8">

	    		</div>
			  </div>
			</div>
		</div>
	</body>
</html>

