<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewEditSyllabus,com.DAO.SyllabusDAO,com.Models.Syllabus,java.util.List"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View/Edit Syllabus</title>
</head>
<body>

<%-- <%@include file="NavBar.jsp" %> --%>
<%
int del = Integer.parseInt(request.getParameter("sylID"));
int status = SyllabusDAO.delete(del);
if (status==0){
	%> <p class="error">Unsuccessful!!</p><% 
}else{
	%> <p class="suc">Successful!!</p><% 
}
%>
<form action="ViewEditSyllabus" method="post">
<select class="stdlist" name="stdlist">
						<option value="I">I</option>
						<option value="II">II</option>
						<option value="III">III</option>
						<option value="IV">IV</option>
						<option value="V">V</option>
						<option value="VI">VI</option>
						<option value="VII">VII</option>
						<option value="VIII">VIII</option>
						<option value="IX">IX</option>
						<option value="X">X</option>
					</select>
					<input type="submit" id="subbtn" value="Submit" />
</form>
Your Syllabus for this Term:
<% 
ViewEditSyllabus ves = new ViewEditSyllabus();
ves.processRequest(request, response);
List<Syllabus> l =(List<Syllabus>) session.getAttribute("List");
%>

<div class="List">
	<table>
	<tr>
		<th>ID</th>
		<th>Chapters</th>
		<th>Delete</th>
	</tr>
		<% for(int i=0;i<l.size();i++){
			Syllabus sl = new Syllabus();
			sl = (Syllabus) l.get(i);
			%>
			<tr><form action="#" method="post">
				<td><div class="sylID"><%=sl.getSyllabus_id()%></div></td>
				<td><div class="chapName"><%=sl.getChapter()%></div></td>
				<td><button type="submit" name="Delete">Delete</button></form></td>
			</tr>	
		<% } %>
	<table>
</div>

</body>
</html>