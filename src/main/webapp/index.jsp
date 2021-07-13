<%@page import="com.helper.FactoryProvider"%>
<html>
<head>


<%@include file="components/common.jsp" %>

</head>
<body>

<%@include file="navbar.jsp" %>
	<h2>Hello World!</h2>
	<%
	out.println(FactoryProvider.getFactory());
	%>
</body>
</html>
