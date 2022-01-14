<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	import="java.util.*, com.Controllers.Profile, java.io.*,java.util.Map.Entry"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@include file="NavBar.jsp" %>
<title>Profile Page-<%=name%></title>
</head>
<body>

	<table>
	<% 
	Profile p = new Profile();
	p.processRequest(request, response);
	PrintWriter t = response.getWriter();
	HashMap<String,String> d = (HashMap<String,String>)session.getAttribute("Details");
	for(Entry<String, String> m : d.entrySet()){  %>
	<tr>
		<td class='Key'><%=m.getKey()%></td>
		<td class='Element'><%=m.getValue()%></td>
	</tr>
	<%}%>
	</table>
	<form action="ChangePassword.jsp" method="post">
	<button type="submit">Change Password</button>
	</form>
	<form action="Logout" method="post">
	<button type="submit">Logout</button>
	</form>
</body>
</html>