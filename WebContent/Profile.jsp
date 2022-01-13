<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
	import="java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page-</title>
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
	<% 
		Dictionary d = (Dictionary)session.getAttribute("Details");
	%>
	<table align="center">
	<% 
		Enumeration enm=d.keys();
		Enumeration emn=d.elements();
		while(enm.hasMoreElements()){ 
			out.println("<tr><td class='Key'>");
			enm.nextElement();
			out.println("</td><td class='Element'>");
			emn.nextElement();
			out.println("</td></tr>");
		}
	%>
	</table>
	<form action="ChangePassword.jsp" method="post">
	<button type="submit">Change Password</button>
	</form>
	<form action="Logout" method="post">
	<button type="submit">Logout</button>
	</form>
</body>
</html>