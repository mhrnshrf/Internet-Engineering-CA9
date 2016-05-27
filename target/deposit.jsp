<%@page import="far.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Stock Exchange</title>

	<%
	int id, amount;
	try{
		id = Integer.parseInt(request.getParameter("id"));
	    amount = Integer.parseInt(request.getParameter("amount"));
	}
	catch(NumberFormatException b){
		String er = "لطفا عدد وارد کنید";
		request.setAttribute("error", er);
	%>
			<jsp:forward page = "err.jsp"/>
	<%
	}

	String res = new String();
    Symbol s;

    if(!Customer.exist(id))
        res = "کاربری با این شناسه وجود ندارد";
    else{
        WaitingCustomer c = new WaitingCustomer(Customer.getCustomer(id), amount);
        WaitingCustomer.waitList.add(c);
        res = "درخواست شما در صف قرار گرفت";
    }

    request.setAttribute("res", res);
    %>

    <jsp:forward page = "response.jsp"/>

</body>
</html>