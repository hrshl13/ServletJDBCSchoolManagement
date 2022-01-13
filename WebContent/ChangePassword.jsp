<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
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
<body>
<centre>Change Passowrd</centre>
<form action="ChangePassword" method="post">
	<table align="center">
		<tr>
			<td>Current Password</td>
			<td><input type="password" name="curpass"></td>
		</tr>
		<tr>
			<td>New Password</td>
			<td><input type="password" name="newpass"></td>
		</tr>
		<tr>
			<td>Retype New Password</td>
			<td><input type="password" name="repass"></td>
		</tr>
		<tr>
		<td colspan="2"><button type="submit">Change Password</button></td>
		</tr>
	</table>
</form>
</body>
</html>