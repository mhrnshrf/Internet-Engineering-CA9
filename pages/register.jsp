<%@page import="far.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Stock Exchange</title>
<%
int id;
String name, family, pass, email;
try{
    id = Integer.parseInt(request.getParameter("id"));
    name = request.getParameter("name");
    family = request.getParameter("family");
    pass = request.getParameter("pass");
    email = request.getParameter("email");
}
catch(NumberFormatException b){
		String er = "شناسه کاربری معتبر نیست";
		request.setAttribute("error", er); %>
		<jsp:forward page = "err.jsp"/>
<%
}
String res = new String();
if(!Customer.exist(id) && id != 1){
	Customer c = new Customer(0, id, name, family, pass, email);
	Database.getDB().insertCust(c);
	res = "کاربر جدید افزوده شد";
}
else
	res = "شناسه تکراری است";

request.setAttribute("res", res);
%>

<jsp:forward page = "response.jsp"/>
