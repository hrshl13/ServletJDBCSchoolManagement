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
if (request.getParameter("sylID")!=null){
	int del = Integer.parseInt(request.getParameter("sylID"));
	int status = SyllabusDAO.delete(del);
	if (status==0){
		%> <p class="error">Unsuccessful!!</p><% 
	}else{
		%> <p class="suc">Successful!!</p><% 
	}
}
%>
<style>
    .stdlist{
        padding: 8px 12px;
        color: white;
        font-weight: bold;
        background-color: #eeeeee;
        border: 1px solid #dddddd;
        border-radius: 5px;
        background-color: #009879;
        color: #dddddd;
        margin: 0 0 0 570px;
    }

    .content-table{
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 0.9em;
        /* min-width: 400px; */
        width: 40%;
        font-size: 15px;
        font-family: monospace;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        margin-left: auto;
        margin-right: auto;
    }
    .content-table tr td button{
        border-radius: 5px 5px 5px 5px;
        background-color: #009879;
        color: #f3f3f3;
    }
    .content-table thead tr{
        background-color: #009879;
        color: #ffffff;
        text-align: left;
        font-weight: bold;
    }
    .content-table th,
    .content-table td{
        padding: 12px 15px;
    }
    .content-table tbody tr{
        border-bottom: 1px solid #dddddd;
    }
    .content-table tbody tr:nth-of-type(even){
        background-color: #f3f3f3;
    }
    .content-table tbody tr:last-of-type{
        border-bottom: 2px solid #009879;
    }
    .content-table tbody tr:hover{
        color: #009879;
    }

</style>

<form action="ViewEditSyllabus" method="post">
<h1 style="text-align: center; font-family: monospace; color: #009879;">Edit Syllabus</h1>
    <br><br><br>
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

List<Syllabus> l = (List<Syllabus>) session.getAttribute("List");
%>

<div class="content-table">
	<table>
	<tr>
		<th>ID</th>
		<th>Chapters</th>
		<th>Delete</th>
	</tr>
	<% if(l.size()!=0){
	for (Syllabus sub:l){
		%>
			<tr><form action="#" method="post">
				<td><div class="sylID"><%=sub.getSyllabus_id()%></div></td>
				<td><div class="chapName"><%=sub.getChapter()%></div></td>
				<td><button type="submit" value="Delete">Delete</button></form></td>
			</tr>	
		<% } }%>
	<table>
</div>

</body>
</html>