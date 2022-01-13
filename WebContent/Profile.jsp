<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	import="java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page-</title>
</head>
<body>

	<%@include file="NavBar.jsp" %>
	<% 
	HashMap<String,String> D=new HashMap<String,String>();
	%>
	<table>
	<% 
	 for(Map.Entry<String, String> m : D.entrySet()){    
			out.println("<tr><td class='Key'>"+m.getKey()+"</td><td class='Element'>"+m.getValue()+"</td></tr>");
			System.out.println(m.getKey()+" : "+m.getValue());
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