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
 <style>
* {  
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}
:root {
  --mainColor: #000;
}	
body {
  width: 100vw; 
  height: 1100px;
  overflow-x: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ccc;
}
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-track {
  background: #ccc;
}
::-webkit-scrollbar-thumb {
  background: var(--mainColor);
}
.main {
  width: 92%;
  height: 90%;
  background-color: #fff;
}
.main header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.main header h1 {
  position: relative;
  top: 25px;
  left: -20px;
  width: 220px;
  padding: 10px;
  color: #fff;
  background-color: var(--mainColor);
}
.main header h1::before {
  content: "";
  position: absolute;
  bottom: -20px;
  left: 0;
  border-width: 10px;
  border-style: solid;
  border-color: var(--mainColor) var(--mainColor) transparent transparent;
}

.main .tasks {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column wrap;
  position: relative;
  top: 5%;
}
.main .tasks div {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  margin: 10px 0;
  padding: 10px;
  width: 80%;
  height: 60px;
  background-color: #ddd;
  transition: 0.2s;
}
.tasks div:hover {
  background-color: #aaa;
}
.main .tasks input[type="checkbox"] {
  appearance: none;
}
.main .tasks label {
  position: relative;
  margin-left: 40px;
  font-weight: bold;
  cursor: pointer;
}
.main .tasks label::before {
  content: "";
  position: absolute;
  top: -5px;
  left: -40px;
  width: 25px;
  height: 25px;
  background-color: #fff;
  border: 1px solid #777;
  border-radius: 5px;
}
.main .tasks input[type="checkbox"]:checked + label::after {
  content: "";
  position: absolute;
  left: -34px;
  top: 1px;
  width: 15px;
  height: 15px;
  background-color: var(--mainColor);
  border-radius: 4px;
}
.main .tasks img {
  width: 30px;
  height: 30px;
  margin-left: 10px;   
  transition: 0.5s;
}
.tasks div:hover img {
  margin-left: 25px;
}
.main .tasks input[type="checkbox"]:checked + label {
  text-decoration: line-through wavy var(--mainColor);
}
.main .tasks input[type="checkbox"]:checked + label,
.main .tasks input[type="checkbox"]:checked ~ img {
  opacity: 0.7;
}

</style>
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
		if(document.getElementsByClassName("Assgn").length != 0){
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
	
<%-- <div class="main">
  <header>
    <h1>Assignments</h1>
  </header>
  <form action="ViewAssignment" method="post" class="tasks" id="daily-tasks">
       <div>
      	<input type="checkbox" id="task1" checked>
      	<label for="task1">Assignment 01</label> 
	</div>

  </form>
  </div>
--%>
  
</body>
</html>