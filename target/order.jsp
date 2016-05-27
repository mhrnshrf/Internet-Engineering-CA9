<%@page import="far.*"%>
<%@page import="java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" ng-app="myStore">
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
	<body ng-controller="StoreController as store">
		<div class="container">
			<%@include file="header.jsp" %>
		  <div class="row">
        <div class="col-sm-4">
          <%@include file="menu.jsp" %>
        </div>
		    <div class="col-sm-4">
          <h4><i>نمادهای موجود در سامانه</i></h4>
          </br>
          <ul>
            <%
              ArrayList<String> list = Database.getDB().getAllSymbols();
              String[] symbols = new String[50];
              for (int i = 0; i < list.size() ;i++ ) {
                symbols[i] = list.get(i);
              }
              // session.setAttribute("u", session.getAttribute("user").getID());
              Customer c =  (Customer)session.getAttribute("user");
              System.out.println( c.getID());
              session.setAttribute("symbols", symbols);
              session.setAttribute("list", list);
              session.setAttribute("size", list.size());
              for (int i = 0; i < list.size() ;i++ ) {

              session.setAttribute("sym", list.get(i));
              // session.setAttribute("i", i.toString());
              // System.out.println("sym: "+session.getAttribute("sym")+"list i:"+list.get(i));
              // System.out.println(list.size());
            %>
            <%-- <c:forEach var="i" begin="0" end="2"> --%>
            <li>
                <div  ng-controller="ModalDemoCtrl" >
                    <script type="text/ng-template" id="myModalContent.html">
                      <div name="mymodal">
                        <form name="reqForm" role="form" action="Order.action">
                        <div class="modal-header">
                            <h3 class="modal-title">ایجاد درخواست </h3>
                        </div>
                        <div class="modal-body">
                          <div class="alert alert-info">
                          <!-- <strong><i>» سهام&nbsp;${sym}</i></strong> -->
                          <strong><i>» سهام&nbsp;${sym}</i></strong>
                          </div>
                          <input type="hidden" name="id" value="${user.getID()}">
                          <input type="hidden" name="instrument" value="${sym}">

                            <label for="quantity" class="control-label">تعداد</label>
                                  <input type="number" min="0"
                                   placeholder="تعداد به رقم"
                                   name="quantity"
                                   class="form-control"
                                   id="quantity"
                                   ng-model="selected.quantity"
                                   required />
                                   <div ng-messages="reqForm.quantity.$error" ng-if="reqForm.quantity.$touched">
                                  <div ng-message="required" class="error-msg">لطفا تعداد را وارد کنید.</div>
                                </div> </br>

                            <label for="price" class="control-label">قیمت</label>
                            <input type="number" min="0"
                                   name="price"
                                   class="form-control"
                                   id="price"
                                   ng-model="selected.price"
                                     placeholder="قیمت به ریال"
                                   required />
                                   <div ng-messages="reqForm.price.$error" ng-if="reqForm.price.$touched">
                                  <div ng-message="required" class="error-msg">لطفا قیمت را وارد کنید.</div>
                                </div> </br>
                                <!-- <input type="radio" name="bs" value="buy" checked> Male<br>
                                <input type="radio" name="bs" value="sell"> Female<br> -->
                            <div ng-controller="ButtonsCtrl">
                            <div class="btn-group">
                                <label class="btn btn-primary" name="bs" ng-model="selected.bs" uib-btn-radio="'sell'">
                                  <input type="radio" name="bs" value="sell" >فروش</label>
                                <label class="btn btn-primary" name="bs" ng-model="selected.bs" uib-btn-radio="'buy'">
                                  <input type="radio" name="bs" value="buy" checked="true">خرید</label>
                            </div></br></br>
                            <div class="btn-group">
                                <label class="btn btn-primary" name="type" ng-model="selected.type" uib-btn-radio="'IOC'">
                                  <input type="radio" name="type" value="IOC">IOC</label>
                                <label class="btn btn-primary" name="type" ng-model="selected.type" uib-btn-radio="'MPO'">
                                  <input type="radio" name="type" value="MPO">MPO</label>
                                <label class="btn btn-primary" name="type" ng-model="selected.type" uib-btn-radio="'GTC'">
                                  <input type="radio" name="type" value="GTC" checked="true" >GTC</label>
                            </div></br></br>
                             <cite class="clearfix" >
                              <blockquote ><i><font size="3">{{selected.bs === 'buy' ? 'خرید' : 'فروش'}}&nbsp;{{selected.quantity}}&nbsp;سهام&nbsp;${sym}&nbsp;به قیمت&nbsp;{{selected.price}}&nbsp;ریال از نوع
                                {{selected.type}}</font>
                              </i></blockquote>
                             </cite>
                           </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success" type="submit"  ng-click="ok(reqForm)">ثبت</button>
                            <button class="btn btn-danger" type="button" ng-click="cancel()">لغو</button>
                        </div>
                      </form>
                      </div>
                    </script>

                    <button type="button" class="btn btn-default" name="stock" ng-click="open('sm', symol.name)">
                      ${sym}

                      <%-- <c:out value="${symbols[i]}"/> --%>
                    </button>
                    </br></br>

                    <!-- <div ng-show="selected">Selection from a modal: {{selected.symbol}}</div> -->
                </div>
              <li>
                <%}%>
                <%-- </c:forEach> --%>
                </br></br>
          </ul>

			    <%-- <form class="form-req" method="POST" action="Buy.action">
  					<input class="form-control" placeholder="شناسه" name="id" type="text"/><br/>
  					<input class="form-control" placeholder="نماد" name="instrument" type="text"/><br/>
  					<input class="form-control" placeholder="قیمت پیشنهادی" name="price" type="text"/><br/>
  					<input class="form-control" placeholder="تعداد سهم" name="quantity" type="text"/><br/>
  					<input class="form-control" placeholder="نوع درخواست" name="type" type="text"/><br/>
  					<input type="submit" value="ثبت درخواست"/>
  				</form> --%>
		    </div>
        <div class="col-sm-4">
          <%-- <c:out value="${Customer.list.size()}"/> --%>

        </div>
		  </div>
		</div>
	</body>
</html>
