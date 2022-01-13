<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<% 
	if (session==null)
	{
	    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
	    rd.forward(request,response);
	  } 
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	session.setMaxInactiveInterval(600);

%>
	<%@include file="NavBar.jsp" %>
	<h1>Welcome <%=name %></h1>

</body>
</html>