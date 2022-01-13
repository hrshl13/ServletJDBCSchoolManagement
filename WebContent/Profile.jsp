<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="com.Controllers.Profile"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page-</title>
</head>
<body>
	<% if (session==null){
		{
		    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
		    rd.forward(request,response);
		  }
			int userId = 0;
	} %>
	<%@include file="NavBar.jsp" %>
	Profile 
</body>
</html>