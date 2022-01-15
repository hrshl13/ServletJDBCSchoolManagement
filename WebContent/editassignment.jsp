<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.AssignmentsDAO, java.util.*,com.Models.AssignmentModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Assignments</title>
<link rel="stylesheet" href="Assets/editAssign.css" type='text/css'>
</head>
<body>

<%@include file="NavBar.jsp" %>
<div class="container">
		<h1 class="page-title">Assignments!!!</h1>
		<form class="addform" action="editassign" method="post">
			<input class="input" type="text" name="asstopic" placeholder="Assignment Topic"/>
			<textarea class="input" rows="3" cols="50" name="assdesc" placeholder="Assignment description"></textarea>
			<select class="stdlist input" name="stdlist">
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
			<input class="submit" type="submit" id="subbtn" value="Submit" />
			
		</form>
		<h2 class="section-title">Current Assignments</h2>
		<ul class="lyst">		
			<!-- Getting userId for loading list -->
			<%
			int id=0;
			Teacher fac = (Teacher)session.getAttribute("obj");
			id = fac.getFaculty_id() ;
			List<AssignmentModel> list = AssignmentsDAO.getAssignmentByFacultyId(id);
			System.out.println(list.size());
			System.out.println(list);
				if (list.size() == 0){
					%>
					
					<div class="noassign">Currently no assignments are assigned.
						<br />
					Click here to create a new assignment and start tormenting students.</div>
					
					<%
					
				}else{
					for(AssignmentModel assm : list){
						out.println("<li class='assign'> <div class='asstopic'>"+assm.getAssignment_topic()+"</div>");
						out.println("<div class='assdesp'>"+assm.getAssignment_desp()+"</div>");
						out.println("<div class='assstd'>"+assm.getStd()+"</div>");
						out.println("<form action='assignDetails' method='get'> <input type='hidden' value="+ assm.getAssignment_id()+" name='assid'/> <input type='submit' class='subbtn' value='Details' /> </form></li>");
						}
					}
			 		%>
		</ul>
</div>
</body>
</html>


