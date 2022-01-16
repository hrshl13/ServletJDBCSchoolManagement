<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.DAO.AssignmentsDAO, com.DAO.StudentDAO,com.DAO.SubmissionDAO, java.util.*,com.Models.AssignmentModel, com.Models.Submission" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment details</title>
<link rel="stylesheet" href="Assets/assignDetails.css" type='text/css'>
</head>
<body>

<%@include file="NavBar.jsp" %>
<div class="container">

		<%
		int id =(int)request.getAttribute("getassid");
		System.out.println(id);	
		AssignmentModel ass = AssignmentsDAO.getAssignmentByAssign_ID(id);			
		System.out.println(ass);
		out.println("<h1 class='topic'>"+ass.getAssignment_topic()+"</h1>");
		out.println("<div class='desp'>"+ass.getAssignment_desp()+"</div>");
		%>
		<h3>Students!!!</h3>
			<!-- Getting assignId for loading student list -->
			<%
			List<Submission> list = SubmissionDAO.getSubmissionsBy_Assignment_ID(id);
			System.out.println(list.size());
			System.out.println(list);
				if (list.size() == 0){
					out.println("<div class='noassign'>Currently no students have done this assignment.</div>");
					
					
				}else{
					%> 
					<form action='assigndet' method='post'> 
					<input type='submit' class='subbtn' value='Add Marks' /> 
					<ul class="lyst">
					<%
					for(Submission assm : list){
						int stuid= assm.getStudent_id();
						Student stuname = StudentDAO.getStudentById(stuid);
						out.println("<li class='stud'> <div class='asstopic'>"+stuname.getFname()+" "+stuname.getLname()+"</div>");
						out.println("<input type='number' name='marks_"+assm.getSubmission_id()+"' id= min='0' max='500' value="+assm.getMarks()+" /> </li>");
						}
					}
			 		%>
			 		</ul>
		 	
		 </form>
		
	</div>



</body>

</html>