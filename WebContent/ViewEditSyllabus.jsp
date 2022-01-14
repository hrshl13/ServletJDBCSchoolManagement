<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewEditSyllabus,com.DAO.SyllabusDAO,com.Models.Syllabus,java.util.List;"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View/Edit Syllabus</title>
</head>
<body>
<%-- <%@include file="NavBar.jsp" %> --%>

Your Syllabus for this Term:
<% 
ViewEditSyllabus ves = new ViewEditSyllabus();
ves.processRequest(request, response);
List<Syllabus> l =(List<Syllabus>) session.getAttribute("List");
%>
<div class="List">
	<table>
		<% for(int i=0;i<l.size();i++){ %>
			<tr>
				<td><% Syllabus s = (Syllabus) l[i]; %></td>
				<td></td>
				<td></td>
			</tr>	
		} %>
	<table>
</div>

</body>
</html>