<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Login Page</h1>
<% if(request.getAttribute("msg") != null) { %>
    <p style="color: red">
     <%= request.getAttribute("msg") %>
    </p>
<% } %>

<form action="Login" method="post">
	<input type="text" name="uname" placeholder="Login ID"><br>
	<input type="password" name="passwd" placeholder="Password"><br>
	<button type="submit">Login</button>
</form>
</body>
</html>
