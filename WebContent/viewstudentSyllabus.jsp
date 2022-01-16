<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.DAO.SubjectDAO, com.Models.Subject, java.util.*, com.Models.Syllabus" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewSyllabus</title>
<link href="Assets/viewstudentSyllabus.css" rel="stylesheet" type="text/css" >
</head>
<body>
<%@include file="NavBar.jsp" %>
<h1 class="title"> <i class='fas fa-book-open' style='font-size:48px; color:#191a38'></i>
 Have a look at your Syllabus! <i class="fa fa-book" style="font-size:48px;color:#191a38"></i>
  </h1> 
<form action="viewstudentSyllabus" method="post" class="addform" style="width:200px;">
  <select name="subject" class="subject">
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
<div class="container">

<div class="card">
<%
	List<Syllabus> list2 = (List<Syllabus>) request.getAttribute("sub");
	if (list2 != null){
		for(Syllabus syllab: list2){
			out.println("<ul class= 'lyst' style='list-style-type:disc'> "  + syllab.getChapter() +  "</ul>");
		}
	}
%>
</div>
</div>
</body>
</html>