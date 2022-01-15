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
	<% if(request.getAttribute("msg") != null) { %>
	    	<p class="error">
		     <%= request.getAttribute("msg") %>
		    </p>
	<% } %>
	<form id="add-task" action="ToDoList" method="post">
		<textarea class="input" name="taskDes" rows="3" cols="50" placeHolder="Task"></textarea>
		<input type="hidden" name="userId" value=<%=userId%> />
		<input class="submit" type="submit" value="Add"/>
	</form>
	<div id="all-tasks">
		<h2 class="section-title">Current Todo</h2>
			<div id="free">Yayy!! No tasks To Do!</div>
			<!-- Rendering Todo list by the given id -->
			<%
				List<ToDoListModel> list = ToDoListDAO.getAllTasksByUserId(userId);
				if (list.size() != 0){
			%>
			<ul>		
			<% 
					for (ToDoListModel el : list){
						int taskId = el.getTask_id();
						out.println("<li class='task'><input type='checkbox' onclick='remove("+taskId+")' class='check' id="+taskId+"  name='task_"+taskId+"'  />");
						out.println("<label for='task_"+taskId+"' class=''>"+el.getTask()+"</label> <li>");
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
			console.log(id);
			if(window.XMLHttpRequest){
				
				ajax = new XMLHttpRequest();
				
			}
			else if(window.ActiveXObject){
				
				ajax = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			
			var url="ToDoList?id="+id;
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
				console.log(responseVal);  
				if(responseVal >= 0){
					console.log(document.getElementsByClassName("task").length)
					e = document.getElementById(responseVal);
					e.parentElement.style.animationPlayState = "running";
					e.parentElement.addEventListener('animationend', () => {
				        e.parentElement.remove();
				        if(document.getElementsByClassName("task").length == 0){
							document.getElementById("free").style.display = "block";
						}
					});
					
				}else{
					alert("Couldn't delete task!!\nThere's some issue on the server!!");
				}
			}  
		}
	</script>
</body>
</html>