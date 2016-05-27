<%@page import="far.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Stock Exchange</title>

<%
    String name;
    name = request.getParameter("name");
    Symbol s = Symbol.getSymbol(name);
    if(s == null){
        String er = "این نماد موجود نیست";
        request.setAttribute("error", er);
        %> <jsp:forward page = "err.jsp"/> <%
    }
    request.setAttribute("sym", s);
    %>
    <jsp:forward page = "printSymbol.jsp"/>

</body>
</html>