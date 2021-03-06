<%@page import="far.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Stock Exchange</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.css"> -->
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="mystyle.css">

<% 
String[] accepts = request.getParameterValues("accepts");
if(accepts != null)
	for (int i = 0; i < accepts.length; i++) {
		Customer.getCustomer(Integer.parseInt(accepts[i])).deposit(WaitingCustomer.findAmount(Integer.parseInt(accepts[i])));
		WaitingCustomer.waitList.remove(i);
	}

 %>

</head>
	<body>
		<div class="container">
			<%@include file="header.jsp" %>
		  <div class="row">
		    <div class="col-sm-4 col-sm-push-8">
				<%@include file="menu.jsp" %>
		    </div>
		    <div class="col-sm-8 col-sm-pull-4">
			    <div class="content">
					<h2>Selected deposits done.</h2>
			    </div>
		    </div>
		  </div>
		</div>
	</body>
</html>

