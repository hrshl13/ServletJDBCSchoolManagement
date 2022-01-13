<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.ToDoListDAO, java.util.*,com.Models.ToDoListModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>To-Do</title>
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
	<h1>ToDo List</h1>
	<h2>Add Task</h2>
	<form action="/ToDoList" method="post">
		<textarea name="taskDes" rows="3" cols="50"></textarea>
		<input type="hidden" name="userId" value=<%=userId%>/>
		<input type="submit" value="Add"/>
	</form>
	<hr/>
	<h2>Current Todo</h2>
	<div>
		<!-- Rendering Todo list by the given id -->
		<ul>
		<li class="task"><input type='checkbox' id=1  name='task_1' />Task 1</li>
		<li class="task"><input type='checkbox' id=2  name='task_2' />Task 2</li>
		<li class="task"><input type='checkbox' id=3  name='task_3' />Task 3</li>
		<li class="task"><input type='checkbox' id=4  name='task_4' />Task 4</li>
		<%
		List<ToDoListModel> list = ToDoListDAO.getAllTasksByStudentId(userId);
		if (list.size() == 0){
			%>
			
			<div>Yayy!! No tasks To Do!</div>
			
			<%
			
		}else{
			for (ToDoListModel el : list){
				int taskId = el.getTask_id();
				%>
				<li>
					<input class='task' type='checkbox' id=<%=taskId %> name='task_'+<%=taskId %> />
					<label for='task_'+<%=taskId %> class=''><%=el.getTask() %></label>
				<li>
				<%
				}
			}
		%>
		</ul>
	</div>
	<style>
		@keyframes hide {
		    0% {
		        opacity: 1;
		        height: 100%;
		        line-height: 100%;
		        padding: 20px;
		        margin-bottom: 10px;
		    }
		    75% {
		        opacity: 0;
		        height: 100%;
		        line-height: 100%;
		        padding: 20px;
		        margin-bottom: 10px;
		    }
		    100% {
		        opacity: 0;
		        height: 0px;
		        line-height: 0px;
		        padding: 0px;
		        margin-bottom: 0px;
		    }
		}
		.task{
			background-color: #77dd11;
		    padding: 20px;
		    margin-bottom: 10px;
		    animation-name: hide;
		    animation-duration: 2s;
		    animation-fill-mode: forwards;
		    animation-play-state: paused;
		}
	</style>
	<script>
		var xmlHttpRequest;
		const checks = document.getElementsByClassName("task");
		console.log(checks);
		checks.forEach(check=>{
			console.log(e.target.id);
			check.firstChild.addEventListener("click", e =>{
				e.target.parentElement.style.animationPlayState = "running";
				e.target.parentElement.addEventListener('animationend', () => {
		            e.target.parentElement.remove();
		        });
			})
		});
		
		if(window.XMLHttpRequest){  
			xmlHttpRequest=new XMLHttpRequest();  
		} else if(window.ActiveXObject){  
			xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");  
		}
		
		function getInfo(){  
			if(this.readyState == 4 && this.status == 200){  
				var responseVal=xmlHttpRequest.responseText;  
				console.log(responseVal);  
				if(responseVal != 1){
					
				}
			}  
		}
	</script>
</body>
</html>