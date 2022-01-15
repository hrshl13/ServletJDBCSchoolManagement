<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.SubjectDAO, com.Models.Subject, java.util.*, com.Models.Syllabus" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewSyllabus</title>
<link href="assets/viewstudentSyllabus.css" >
</head>
<body>
<%@include file="NavBar.jsp" %>
<h2>Your Syllabus</h2>
 
<form action="viewstudentSyllabus" method="post" class="custom-select" style="width:200px;">
  <select name="subject" id="subject">
  <option value="0">Select Subject :</option>
  
  <%
  	List<Subject> list = SubjectDAO.getAllSubjects();
  for(Subject s: list){
	  out.println("<option value =" + s.getSubject_id() + ">" + s.getSubject_name()+ "</option>");
  }
  %>
  </select>
  <button type="submit" class="submit"> Submit </button>
</form>
<%
	List<Syllabus> list2 = (List<Syllabus>) request.getAttribute("sub");
	if (list2 != null){
		for(Syllabus syllab: list2){
			out.println("<div class= 'label'>"  + syllab.getChapter() + "</div>");
		}
	}
%>
</body>
</html>