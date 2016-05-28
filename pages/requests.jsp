<%@page import="far.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Stock Exchange</title>
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
	<body>
		<div class="container">
			<%@include file="header.jsp" %>
		  <div class="row">
		    <div class="col-sm-4">
				<%@include file="menu.jsp" %>
		    </div>
		    <div class="col-sm-4">
			    <div class="content">
		            <div id="sell-table">
			            <FORM method="POST" ACTION="ConfirmDepo.action">
			              <table>
			                <tr>
			                  <th>لیست درخواست‌ها</th>
			                </tr>
			                <tr>
			                  <th>شناسه</th>
			                  <th>میزان</th>
			                  <th>انتخاب</th>
			                </tr>
			                <%
			                for(int i=0; i<WaitingCustomer.waitList.size(); i++){
			                  int id = WaitingCustomer.waitList.get(i).getID();
			                  int amount = WaitingCustomer.waitList.get(i).getAmount();

			                %>
			                  <tr>
			                    <td><%=id%></td>
			                    <td><%=amount%></td>
			                    <td> <input type="checkbox" name="accepts" value=<%=Integer.toString(id)%> /> </td>
			                  </tr>
			                <% } %>
			              </table>
			              <input class="btn btn-default btn-sm" type="submit" value="ثبت"/>
		            </div>
			    </div>
		    </div>
        <div class="col-sm-4">
        </div>
		  </div>
		</div>
	</body>
</html>
