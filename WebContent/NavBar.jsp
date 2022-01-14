<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Models.Student,com.Models.Teacher, com.Models.Principal" %>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
<link rel="stylesheet" href="Assets/NavBar.css" type='text/css'>


	<%
	if (session.getAttribute("type") == null)
	{
		response.sendRedirect("Forbidden.jsp");
		return;
	}
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	session.setMaxInactiveInterval(600);
	
	
	String type = (String)session.getAttribute("type");
	String name = null;
	switch(type){
	case "Student":
		Student stud = (Student)session.getAttribute("obj");
		name = stud.getFname()+" "+stud.getLname();
		break;
	case "Teacher":
		Teacher fac = (Teacher)session.getAttribute("obj");
		name = fac.getFname()+" "+fac.getLname();
		break;
	case "Principal":
		Principal prin = (Principal)session.getAttribute("obj");
		name = prin.getFname()+" "+prin.getLname();
		break;
	}

	%>
<div id = "top">
	<div id="logoProfile">
		<h1 id="site-name">School Management</h1>
		<div>
			<a class="pro-link" href="${pageContext.request.contextPath}/Profile.jsp"><%=name %></a>
			<form action="Logout" method="post"><button name="logout" type="submit" class="logout"><i class="fas fa-sign-out-alt"></i></button></form>
		</div>
		
	</div>
	<ul class="nav">
		<li>
			<a href="${pageContext.request.contextPath}/HomePage.jsp">Home</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/ToDoList.jsp">To-Do</a>
		</li>
		<!-- TODO: Add links to respective pages -->
		<%
			
			switch(type){
			case "Student":%>
				<li><a href='${pageContext.request.contextPath}/' >Assignment</a></li>
				<li><a href='${pageContext.request.contextPath}/' >Syllabus</a></li>
		<%
				break;
			case "Teacher":
		%>
				<li><a href='${pageContext.request.contextPath}/editassignment.jsp' >Assignment</a></li>
				<li><a href='${pageContext.request.contextPath}/' >Manage Syllabus</a></li>
		<% 
				break;
			case "Principal":
		%>
		
				<li><a href='${pageContext.request.contextPath}/' >Manage Faculties</a></li>
				<li><a href='${pageContext.request.contextPath}/' >Manage Students</a></li>
		<%
				break;
			}
		%>
	</ul>
</div>

