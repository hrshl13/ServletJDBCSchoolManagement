<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.DAO.ToDoListDAO, java.util.*,com.Models.ToDoListModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ToDo</title>
</head>
<body>
	<!-- Getting userId for loading list -->
	<%
	if (session == null)
		  {
		    RequestDispatcher rd = request.getRequestDispatcher("Forbidden.jsp");
		    rd.forward(request,response);
		  }
			int userId = 0;
	%>
	<%@include file="NavBar.jsp" %>
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
		<%
		List<ToDoListModel> list = ToDoListDAO.getAllTasksByStudentId(userId);
			for (ToDoListModel el : list){
				int taskId = el.getTask_id();
				out.println("<li class='task'><input type='checkbox' id="+taskId+"  name='task_"+taskId+"' />");
				out.println("<label for='task_"+taskId+"' class=''>"+el.getTask()+"</label><li>");
			}
		%>
		</ul>
	</div>
</body>
</html>