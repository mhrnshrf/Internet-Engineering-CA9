<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.3/angular-animate.js"></script>
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
		<link rel="stylesheet" href="css/fonts.min.css" />
</head>


<div class="row">
    <%-- <div class="col-sm-2">
      <div id="logo">
        <img id="stock-logo" class="img-responsive" src="Tehran_Stock_Exchange_Logo.png" />
      </div>
    </div>
    <div class="col-sm-10">
      <div id="top" class="jumbotron">
          <h2>سامانه هسته معاملات بورس</h2></br>
        <i>نسخه آزمایشی</i>
      </div>
    </div> --%>
	<div class="col-sm-12">
		<div class="row">
	 		<div id="top" class="jumbotron">
			   	<h2>سامانه هسته معاملات بورس</h2></br>
				<i>نسخه آزمایشی</i>
			</div>
			<div id="welcome">
				<em>خوش آمدید </em>
				<em><a href="logout.jsp">خروج</a></em>
				<em>${user.getName()}</em>&nbsp;
				<em>${user.getFamily()}</em>&nbsp;
			</div>
		</div>
  </div>
</div>
