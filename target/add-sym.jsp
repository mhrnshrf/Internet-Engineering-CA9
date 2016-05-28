<%@page import="far.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  if (session != null && session.getAttribute("user") == null) {
    Database db = Database.getDB();
    Customer user = db.findCustByID(Integer.parseInt(request.getRemoteUser()));
    if (user != null) {
      session.setAttribute("user", user);
    }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Stock Exchange</title>
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
  <link rel="stylesheet" href="css/fonts.min.css" />

</head>
	<body>
		<div class="container">
			<%@include file="header.jsp" %>
		  <div class="row">
		    <div class="col-sm-4">
				      <%@include file="menu.jsp" %>
		    </div>
		    <div class="col-sm-4">
			    <div class="content">

					<h2>افزودن نماد</h2>
        </br></br>
        <a href="index.jsp" class="btn btn-default btn-sm">بازگشت به صفحه اصلی <span class="glyphicon glyphicon-repeat"></a>
			    </div>
		    </div>
        <div class="col-sm-4">
        </div>
		  </div>
		</div>
	</body>
</html>
