<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.AssignmentsDAO, java.util.*,com.Models.AssignmentModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Assignments</title>
</head>
<body>

<%@include file="NavBar.jsp" %>

<div class="bigcontainer">
	<div class="smallcontainer" >
		Assignments!!!
		
		Click here to create a new assignment => <div class="addassign"></div>
		<ul>
			<li class="lyst">
				<div class="addform">
				<form action="editassign" method="post">
					<input type="text" name="asstopic" placeholder="Assignment Topic"/>
					<textarea rows="3" cols="50" name="assdesc" >Assignment description</textarea>
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
					
					<script>
					
					</script>
				</form>
				</div>
			</li>
			<%
				int id=0;
				List<AssignmentModel> list = AssignmentsDAO.getAssignmentByFacultyId(id);
				for(AssignmentModel assm : list){
					out.println("<li class='lyst'> <div class='asstopic'>"+assm.getAssignment_topic()+"</div>");
					out.println("<div class='assdesp'>"+assm.getAssignment_desp()+"</div></li>");
					out.println("<input type='button' id='rsltbtn' value='Show Details' class='rsltbtn'/></li>");
				}	
			%>
		
		
		</ul>
		
		
		
		
		
		
	</div>
    
		
		
</div>



</body>
</html>


































