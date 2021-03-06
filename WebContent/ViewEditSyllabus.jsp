<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewEditSyllabus,com.DAO.SyllabusDAO,com.Models.Syllabus,java.util.List"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View/Edit Syllabus</title>
<link rel="stylesheet" href="Assets/ViewEditSyllabus.css" type='text/css'>
<style>
   .error {
  position:centre;
  border-radius: 0.4vw;
  padding: 1vw;
  border: 0.1vw solid #ff304f;
  color: #ff304f;
  box-shadow: 0.2vw 0.2vw 0.8vw 0.2vw #fdc6ce;
  background-color: #fdc6ce;
}
</style>
</head>
<body>
<%@include file="NavBar.jsp" %>
<%
if (request.getParameter("sylID")!=null){
	int del = Integer.parseInt(request.getParameter("sylID"));
	int status = SyllabusDAO.delete(del);
	if (status==0){
		%> <p class="error">Unsuccessful!!</p><% 
	}else{
		%> <p class="suc">Successful!!</p><% 
	}
}
%>
<% if(request.getAttribute("msg") != null) { %>
	    	<p class="error">
		     <%= request.getAttribute("msg") %>
		    </p>
		<% } %>
<div class="SyllabusPage">
<form action="#" method="post">
<h1 class="head">Edit Syllabus</h1>

<select class="stdlist" name="stdlist">
						<option value="none" selected disabled hidden>Select Standard</option> 
						<option value="I">I</option>
						<option value="II">II</option>
						<option value="III">III</option>
						<option value="IV">IV</option>
						<option value="V">V</option>
						<option value="VI">VI</option>
						<option value="VII">VII</option>
						<option value="VIII">VIII</option>
						<option value="IX">IX</option>
						<option value="X">X</option>
					</select>&nbsp;
					<input type="submit" id="subbtn" value="Submit" />
</form>

<p class="subhead">Your Syllabus for this Term:</p>
<% 
String standard = request.getParameter("stdlist");
List<Syllabus> l = SyllabusDAO.getSyllabusByStandard(standard);
//List<Syllabus> l = (List<Syllabus>) session.getAttribute("List");
%>

<div class="content-table">
	<table>
	<tr>
		<th>ID</th>
		<th>Chapters</th>
		<th>Delete</th>
	</tr>
	<%
		if (l != null){
			for (Syllabus sub:l){
		%>
			<tr id="<%=sub.getSyllabus_id()%>">
				<td><div class="sylID"><%=sub.getSyllabus_id()%></div></td>
				<td><div class="chapName"><%=sub.getChapter()%></div></td>
				<td><button class="delBtn" value="Delete" onclick="remove(<%=sub.getSyllabus_id()%>)">Delete</button></td>
			</tr>	
		<% 	}
		} %>
	</table>
</div>
<h1 class="head">Add Syllabus</h1>
<form class="add-syl" action="ViewEditSyllabus" method="post">
		<input type="text" id="newSyl" name="newSyl" placeholder="Add New Chapter"/>
<select class="stdlist" name="std" >
						<option value="none" selected disabled hidden>Select Standard</option> 
						<option value="I">I</option>
						<option value="II">II</option>
						<option value="III">III</option>
						<option value="IV">IV</option>
						<option value="V">V</option>
						<option value="VI">VI</option>
						<option value="VII">VII</option>
						<option value="VIII">VIII</option>
						<option value="IX">IX</option>
						<option value="X">X</option>
					</select>&nbsp;
		<input id="subbtn" type="submit" value="Add Chapter"/>
	</form>
<script>
function remove(id){
	if(window.XMLHttpRequest){
		
		ajax = new XMLHttpRequest();
		
	}
	else if(window.ActiveXObject){
		
		ajax = new ActiveXObject("Microsoft.XMLHTTP");
	} 
	
	var url="ViewEditSyllabus?id="+id;
	try{
		ajax.onreadystatechange=sendInfo;
		ajax.open("DELETE",url,true);
		ajax.send();
		
	}catch(e){
		alert("Unable to connect server");
	}
  }
function sendInfo(){  
	if(this.readyState == 4 && this.status == 200){  
		var responseVal= ajax.responseText;  
		if(responseVal >= 0){
			alert("Chapter Successfully Deleted!!!");
			e = document.getElementById(responseVal);
			 e.parentElement.remove();
				}
			else{
			alert("Couldn't delete task!!\nThere's some issue on the server!!");
		}
	}  
}
</script>
</div>
</body>
</html>