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
		String userId="";
		switch(type){
		case "Student":
			Student stud = (Student)session.getAttribute("obj");
			userId = stud.getLogin_id();
			break;
		case "Teacher":
			Teacher fac = (Teacher)session.getAttribute("obj");
			userId = fac.getLogin_id() ;
			break;
		case "Principal":
			Principal prin = (Principal)session.getAttribute("obj");
			userId = prin.getLogin_id();
			break;
		}
	%>
	<h1 class="page-title">ToDo List</h1>
	<form id="add-task" action="ToDoList" method="post">
		<textarea class="input" name="taskDes" rows="3" cols="50" placeHolder="Task"></textarea>
		<input type="hidden" name="userId" value=<%=userId%> />
		<input class="submit" type="submit" value="Add"/>
	</form>
	<div id="all-tasks">
		<h2>Current Todo</h2>
		<div>
			<!-- Rendering Todo list by the given id -->
			<ul>
				<%
				List<ToDoListModel> list = ToDoListDAO.getAllTasksByUserId(userId);
				if (list.size() == 0){
					%>
					
					<div class="free">Yayy!! No tasks To Do!</div>
					
					<%
					
				}else{
					for (ToDoListModel el : list){
						int taskId = el.getTask_id();
						out.println("<li class='task'><input type='checkbox' class='check' id="+taskId+"  name='task_"+taskId+"'  />");
						out.println("<label for='task_"+taskId+"' class=''>"+el.getTask()+"</label> <li>");
						}
					}
				%>
			</ul>
		</div>
	</div>
	
	<!-- Script for removing a task -->
	<script>
		var ajax;
		const checks = document.getElementsByClassName("check");
		for (let check =0; check < checks.length;check++){
			checks[check].addEventListener("click",remove);
		}

		//OnClick function for checkBoxes
		function remove (e){
			console.log("event");
			console.log(window.ActiveXObject, window.XMLHttpRequest);
			if(window.XMLHttpRequest){
				
				ajax = new XMLHttpRequest();
				
			}
			else if(window.ActiveXObject){
				
				ajax = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			
			var url="ToDoList?id="+e.target.id;
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