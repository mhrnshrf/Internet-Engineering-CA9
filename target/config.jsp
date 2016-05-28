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
            <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
              <div class="box">
                  <a ng-click="roleEn=true" ng-hide="roleEn"><strong>نقش دادن به دیگران »</strong></a>
                  <div ng-show="roleEn">
                    <a ng-click="roleEn=false"><b>. . .</b></a></br></br>
                    <!--  Deposit Form -->
                    <form name="depositForm" action="ChangeRole.action">

                      <fieldset class="form-group">
                        <input  type="number" min="0" class="form-control" name="client" placeholder="شناسه کاربری"/>
                      </fieldset>
                      <fieldset class="form-group">
                        <input  type="text" min="0" class="form-control" name="role" placeholder="نقش"/>
                      </fieldset>
                      <fieldset class="form-group">
                        <input class="btn btn-default btn-sm" type="submit" value="اعمال" />
                      </fieldset>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

      <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
          <div class="well well-sm">
            <div class="box">
                <a ng-click="depositEn=true" ng-hide="depositEn"><strong>مشاهده پروفایل کاربران »</strong></a>
                <div ng-show="depositEn">
                  <a ng-click="depositEn=false"><b>. . .</b></a></br></br>
                  <!--  Deposit Form -->
                  <form name="depositForm" action="Others.action">

                    <fieldset class="form-group">
                      <input  type="number" min="0" class="form-control" name="client" placeholder="شناسه کاربری"/>
                    </fieldset>
                    <fieldset class="form-group">
                      <input class="btn btn-default btn-sm" type="submit" value="مشاهده" />
                    </fieldset>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
          <div class="well well-sm">
            <div class="box">
                <a href="Report.action"><strong>دریافت گزارش »</strong></a>
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
