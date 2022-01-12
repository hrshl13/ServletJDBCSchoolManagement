<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.lang.String.*;" %>
<ul>
	<li>
		<a href="${pageContext.request.contextPath}/HomePage.jsp">Home</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/ToDoList.jsp">To-Do</a>
	</li>
	<!-- TODO: Add links to respective pages -->
	<%
		String choice = "";
		switch(choice){
		case "student":
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Assignment</a></li>");
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Syllabus</a></li>");
			break;
		case "faculty":
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Assignment</a></li>");
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Syllabus</a></li>");
			break;
		case "principal":
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Manage Faculties</a></li>");
			out.println("<l1><a href='${pageContext.REQUEST.contextPath}/' >Manage Students</a></li>");
			break;
		}
	%>
</ul>