<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isErrorPage="true"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Go Back Cheater!!!</title>
<style>
body{
	margin:0;
	padding:0;
	background: #4DFFFF; 
	color:#A90000;
	display:flex;
	flex-direction:column;
	height:100vh;
	width:100vw;
	justify-content:center;
	align-items:center;
	font-weight:900;
	font-size:8em;
}

.Link{
	font-weight:9;
	font-size:0.5em;
}

a{
  color:#5C0000;
}

a:hover {
  text-decoration: underline;
  color: #A90000;
  background-color: transparent;
}

</style>
</head>
<body>
	Forbidden Page - 403 Error<br>
	<div class="Link">Go back to <a href="${pageContext.request.contextPath}/Login.jsp">Login Page</a></div>
</body>
</html>