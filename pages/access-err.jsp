<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>Error encountered!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-rtl/3.2.0-rc2/css/bootstrap-rtl.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
	<body>
	<div class="container">
		<%@ include file="header.jsp" %>
	<%-- <%@include file="header.jsp" %> --%>
	<div class="row">
		<div class="col-sm-4">
		</div>
		<div class="col-sm-4">
			<div class="content">شما به این گزینه دسترسی ندارید.</div>
			</br></br>
			<a href="index.jsp" class="btn btn-default btn-sm">بازگشت به صفحه اصلی <span class="glyphicon glyphicon-repeat"></a>

		</div>
		<div class="col-sm-4 col">

		</div>
	</div>
</div>

	</body>
</html>
