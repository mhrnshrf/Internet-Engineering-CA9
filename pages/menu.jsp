<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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


<%-- <div id="navbar">
  	<ul>
	  <li><a href="regpage.jsp">عضویت</a></li>
	  <li><a href="depositpage.jsp">واریز</a></li>
	  <li><a href="sellpage.jsp">فروش سهام</a></li>
	  <li><a href="buypage.jsp">خرید سهام</a></li>
	  <li><a href="queuepage.jsp">وضعیت بازار</a></li>
	</ul>
</div> --%>

<!-- Sidebar -->
       <div id="sidebar-wrapper">
           <nav id="spy">
               <ul class="sidebar-nav nav">
                   <li>
                       <a href="Info.action">
                         <i class="glyphicon glyphicon-user"></i>&nbsp;
                           <span class="fa fa-anchor solo">حساب کاربری</span>
                       </a>
                   </li>
                   <li>
                       <a href="order.jsp">
                         <i class="glyphicon glyphicon-transfer"></i>&nbsp;
                           <span class="fa fa-anchor solo">خرید و فروش</span>
                       </a>
                   </li>
                   <li>
                       <a href="status.jsp">
                         <i class="glyphicon glyphicon-stats"></i>&nbsp;
                           <span class="fa fa-anchor solo">وضعیت بازار</span>
                       </a>
                   </li>
                   <li>
                       <a href="requests.jsp">
                         <i class="glyphicon glyphicon-bitcoin"></i>&nbsp;
                           <span class="fa fa-anchor solo">تاییدهای مالی</span>
                       </a>
                   </li>
                   <li>
                     <a href="add-sym.jsp">
                       <i class="glyphicon glyphicon-plus"></i>&nbsp;
                       <span class="fa fa-anchor solo">افزودن نماد</span>
                     </a>
                   </li>
                   <li>
                     <a href="config.jsp">
                       <i class="glyphicon glyphicon-cog"></i>&nbsp;
                       <span class="fa fa-anchor solo">تنظیمات سامانه</span>
                     </a>
                   </li>
               </ul>
           </nav>
       </div>
