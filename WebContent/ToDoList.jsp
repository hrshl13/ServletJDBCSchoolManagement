<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.ToDoListDAO, java.util.*,com.Models.ToDoListModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>To-Do</title>
<link rel="stylesheet" href="Assets/ToDo.css" type='text/css'>
</head>
<body>

	<!-- Getting userId for loading list -->
	<%@include file="NavBar.jsp" %>
	<%
		int userId=0;
		switch(type){
		case "Student":
			Student stud = (Student)session.getAttribute("obj");
			userId = stud.getStudent_id();
			break;
		case "Teacher":
			Teacher fac = (Teacher)session.getAttribute("obj");
			userId = fac.getFaculty_id() ;
			break;
		case "Principal":
			Principal prin = (Principal)session.getAttribute("obj");
			userId = prin.getPrincipal_id();
			break;
		}
	%>
	<h1 class="page-title">ToDo List</h1>
	<form id="add-task" action="ToDoList" method="post">
		<textarea class="input" name="taskDes" rows="3" cols="50"></textarea>
		<input type="hidden" name="userId" value=<%=userId%>/>
		<input class="submit" type="submit" value="Add"/>
	</form>
	<div id="all-tasks">
		<h2>Current Todo</h2>
		<div>
			<!-- Rendering Todo list by the given id -->
			<ul>
				<%
				List<ToDoListModel> list = ToDoListDAO.getAllTasksByStudentId(userId);
				if (list.size() == 0){
					%>
					
					<div class="free">Yayy!! No tasks To Do!</div>
					
					<%
					
				}else{
					for (ToDoListModel el : list){
						int taskId = el.getTask_id();
						%>
						<li class='task'>
							<input type='checkbox' id=<%=taskId %> name='task_'+<%=taskId %> />
							<label for='task_'+<%=taskId %> class=''><%=el.getTask() %></label>
						<li>
						<%
						}
					}
				%>
			</ul>
		</div>
	</div>
	
	<!-- Script for removing a task -->
	<script>
		var xmlHttpRequest;
		const checks = document.getElementsByClassName("task");
		console.log(checks);
		for (let check =0; check < checks.length;check++){
			console.log(checks[check]);
			checks[check].firstChild.addEventListener("click", e =>{
				console.log(window.ActiveXObject);
				if(window.XMLHttpRequest){
					
					request = new XMLHttpRequest();
					
				}
				else if(window.ActiveXObject){
					
					request = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				var url="ToDoList?id="+e.target.id;
				try{
					request.onreadystatechange=sendInfo;
					request.open("DELETE",url,true);
					request.send();
					
				}catch(e){
					alert("Unable to connect server");
				}
		        });
			}

		
		//Callback function after deletion
		function sendInfo(){  
			if(this.readyState == 4 && this.status == 200){  
				var responseVal=xmlHttpRequest.responseText;  
				console.log(responseVal);  
				if(responseVal >= 0){
					e = document.getElementById(responseVal);
					e.parentElement.style.animationPlayState = "running";
					e.target.parentElement.addEventListener('animationend', () => {
			        e.target.parentElement.remove();});
				}else{
					alert("Couldn't delete task!!\nThere's some issue on the server!!");
				}
			}  
		}
	</script>
</body>
</html>