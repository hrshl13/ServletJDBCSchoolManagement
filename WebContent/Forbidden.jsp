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
	height:100vh;
	width:100vw;
	justify-content:center;
	align-items:center;
	font-weight:900;
	font-size:8em;
}
.Link{
	height:1vh;
	width:1vw;
	justify-content:center;
	align-items:center;
	font-weight:9;
	font-size:1em;
	display:flex;
}
a:link {
  color: green;
  background-color: transparent;
  text-decoration: none;
}

a:visited {
  color: pink;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}

a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}
</style>
</head>
<body>
	Forbidden Page - 403 Error<br>
	<div class="Link">Go back to <a href="${pageContext.request.contextPath}/Login.jsp">Login Page</a></div>
</body>
</html>