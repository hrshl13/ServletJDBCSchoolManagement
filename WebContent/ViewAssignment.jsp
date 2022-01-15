<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    import="com.Models.Student, com.Models.AssignmentModel, com.DAO.AssignmentsDAO, java.util.List, com.DAO.SubmissionDAO"%>
<!DOCTYPE html>
<html>
<head>
<%-- <link rel="stylesheet" href="Assets/ViewAssignment.css" type='text/css'> --%>
<link rel="stylesheet" href="Assets/ToDo.css" type='text/css'>
<meta charset="ISO-8859-1">
<title>View Assignments</title>
 <%-- 

--%>
</head>
<body>
<%@include file="NavBar.jsp" %>
<% if(request.getAttribute("msg") != null) { %>
	    	<p class="error">
		     <%= request.getAttribute("msg") %>
		    </p>
	<% } %>
<div id="all-tasks">
		<h2 class="section-title">Remaining Assignments</h2>
			<div id="free">Woohooo!! No Assignments Left!</div>
			<!-- Rendering Assignment list by the Student's Standard -->
			<%
			Student student = (Student) session.getAttribute("obj");
			String std = student.getStandard();
			List<AssignmentModel> list =  AssignmentsDAO.getAssignmentByStandard(std);
				if (list.size() != 0){
			%>
			<ul>		
			<% 
					for (AssignmentModel Am : list){
						int AssgnId = Am.getAssignment_id();
							if (!SubmissionDAO.checkSubmitted(AssgnId, student.getStudent_id())){
								out.println("<li class='task'><input type='checkbox' onclick='remove("+AssgnId+")' class='check' id="+AssgnId+"  name='task_"+AssgnId+"'  />");
								out.println("<label for='task_"+AssgnId+"' class=''>"+Am.getAssignment_topic()+"</label> <li>");
							}
						
						}
			%>
			</ul>
			<%} %>
	</div>

	<!-- Script for removing a task -->
	<script>
		var ajax;
		if(document.getElementsByClassName("task").length != 0){
			document.getElementById("free").style.display = "none";
		}
		//OnClick function for checkBoxes
		function remove (id){
			if(window.XMLHttpRequest){
				
				ajax = new XMLHttpRequest();
				
			}
			else if(window.ActiveXObject){
				
				ajax = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			
			var url="ViewAssignment?id="+id;
			try{
				ajax.onreadystatechange=sendInfo;
				ajax.open("DELETE",url,true);
				ajax.send();
				
			}catch(e){
				alert("Unable to connect server");
			}
	      }
		//Callback function after deletion
		function sendInfo(){  
			if(this.readyState == 4 && this.status == 200){  
				var responseVal= ajax.responseText;  
				if(responseVal >= 0){
					e = document.getElementById(responseVal);
					e.parentElement.style.animationPlayState = "running";
					e.parentElement.addEventListener('animationend', () => {
				        e.parentElement.remove();
				        if(document.getElementsByClassName("task").length == 0){
							document.getElementById("free").style.display = "block";
						}
					});
					
				}else{
					alert("Couldn't submit the Assignment!!\nThere's some issue on the server!!");
				}
			}  
		}
	</script>
	
<%-- 
--%>
  
</body>
</html>