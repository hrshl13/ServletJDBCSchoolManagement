<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Assets/Login.css" type='text/css'>
<title>Login</title>
</head>
<body>
	<form id="login" action="Login" method="post">
		<h1 class="page-title">Login Page</h1>
		<% if(request.getAttribute("msg") != null) { %>
	    	<p class="error">
		     <%= request.getAttribute("msg") %>
		    </p>
		<% } %>
		<input class="input" type="text" name="uname" placeholder="Login ID"><br>
		<input class="input" type="password" name="passwd" placeholder="Password"><br>
		<button class="submit" type="submit">Login</button>
	</form>
</body>
</html>
