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

<form action="ViewEditSyllabus" method="post">
<h1 style="text-align: center; font-family: monospace; color: #009879;">Edit Syllabus</h1>
    <br>
<select class="stdlist" name="stdlist"">
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
					</select><br>
					<input type="submit" id="subbtn" value="Submit" />
</form>

<p class="subhead">Your Syllabus for this Term:</p>
<% 
List<Syllabus> l = (List<Syllabus>) session.getAttribute("List");
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
				<td><button value="Delete" onclick="remove(<%=sub.getSyllabus_id()%>)">Delete</button></td>
			</tr>	
		<% 	}
		} %>
	</table>
</div>
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
			alert("Chapters Successfully Deleted!!!");
			e = document.getElementById(responseVal);
			 e.parentElement.remove();
				}
			else{
			alert("Couldn't delete task!!\nThere's some issue on the server!!");
		}
	}  
}
</script>
</body>
</html>