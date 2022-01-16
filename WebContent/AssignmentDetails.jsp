<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.DAO.AssignmentsDAO, com.DAO.StudentDAO,com.DAO.SubmissionDAO, java.util.*,com.Models.AssignmentModel, com.Models.Submission" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignment details</title>
</head>
<body>

<%@include file="NavBar.jsp" %>
<div class="bigcontainer">
	<div class="smallcontainer" >
		Students!!!
		
		
		 
		<ul>
		
			
			<!-- Getting assignId for loading student list -->
	
	
			<%
			
			int id =(int)request.getAttribute("getassid");
			System.out.println(id);	
			AssignmentModel ass = AssignmentsDAO.getAssignmentByAssign_ID(id);			
			System.out.println(ass);
			out.println("<div class='showtopic'>"+ass.getAssignment_topic()+"</div>");
			out.println("<div class='showdesp'>"+ass.getAssignment_desp()+"</div>");
			

			List<Submission> list = SubmissionDAO.getSubmissionsBy_Assignment_ID(id);
			System.out.println(list.size());
			System.out.println(list);
				if (list.size() == 0){
					out.println("<div class='noassign'>Currently no students have done this assignment.</div>");
					
					
				}else{
					%> <form action='assigndet' method='post'>  <%
					for(Submission assm : list){
						int stuid= assm.getStudent_id();
						Student stuname = StudentDAO.getStudentById(stuid);
						out.println("<li class='lyst'> <div class='asstopic'>"+stuname.getFname()+" "+stuname.getLname()+"</div>");
						out.println("<input type='hidden' name='asslst' value='"+list+"'><input type='number' name='marks_"+assm.getSubmission_id()+"' id= min='0' max='500' value="+assm.getMarks()+" /> </li>");
						}
					}
			 		%>
			 		 <!-- name='marks_"+assm.getSubmission_id()+"' -->
		 <input type='submit' class='addmksbtn' value='Add marks' /> 
		 </form>
		</ul>
		
		
	</div>
    
		
		
</div>



</body>

</html>