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
<html ng-app="myStore">
<head>
  <title>Stock Exchange</title>
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
	<body ng-controller="StoreController as store">
		<div class="container">
			<%@include file="header.jsp" %>
		  <div class="row">
		    <div class="col-sm-4">
				      <%@include file="menu.jsp" %>
		    </div>
		    <div class="col-sm-8">

        <div class="row">
          <div class="profile">
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="well well-sm">
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <img src="pro.png" />
                            </div>
                            <div class="col-sm-6 col-md-8">
                                <h4>
                                    ${other.getName()}&nbsp${other.getFamily()}</h4>
                                <small><cite title="Tehran, Iran"><i class="glyphicon glyphicon-map-marker">
                                </i>&nbspتهران، ایران </cite></small>
                                <p>
                                    <i class="glyphicon glyphicon-user"></i>&nbsp${other.getID()}
                                    <br />
                                    <i class="glyphicon glyphicon-envelope"></i>&nbsp${other.getEmail()}
                                    <br />
                                    <i class="glyphicon glyphicon-usd"></i>&nbsp${other.getCash()}
                                    <br />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		    </div>
        <%-- <div class="col-sm-4">
        </div> --%>
		  </div>
		</div>
	</body>
</html>
