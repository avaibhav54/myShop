<%@page import="com.entities.User"%>
<%
User user= (User)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message","You are not logged in login First");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/common.jsp" %>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="navbar.jsp" %>
<h1>hello noremal user</h1>
</body>
</html>