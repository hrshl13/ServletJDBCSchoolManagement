<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewTeacher,com.DAO.TeacherDAO,com.Models.Teacher,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Assets/ViewTeacher.css" type='text/css'>
</head>


<body>
<%
if (request.getParameter("TeacherID")!=null){
	int del = Integer.parseInt(request.getParameter("TeacherID"));
	int status = TeacherDAO.deleteTeacher(del);
	if (status==0){
		%> <p class="error">Unsuccessful!!</p><% 
	}else{
		%> <p class="suc">Successful!!</p><% 
	}
}
%>
<form action="ViewTeacher" method="post">
    <h1 style="text-align: center; font-family: monospace; color: #009879;">Teacher Information</h1>
    <br><br><br>
<select class="select" name="sbjlist">
						<option value="1">maths</option>
						<option value="2">science</option>
						<option value="3">english</option>
						<option value="4">history</option>
						<option value="5">geography</option>
						<option value="6">hindi</option>
						<option value="7">sanskrit</option>
						<option value="8">marathi</option>
					</select>
					<input type="submit" id="subbtn" value="Submit" style="border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/>
    <br><br>
</form>
<form action="AddTeacher.jsp" method="post"><input type="submit" value="new" style="margin-left: 55%;border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/></form>
   
    <table class="content-table">
        <thead>
            <tr>
                <th>ID</th>
                <th colspan="2">Name</th>
                <th>Phone no.</th>
                <th>Email</th>
                <th>View</th>
                <th>Delete</th>
            </tr>
        </tread>
        <tbody>
        <% 
        List<Teacher> l = (List<Teacher>) request.getAttribute("List");
        %>
	   <%
		if (l != null){
			for (Teacher s:l){
		%>
            <tr id="<%=s.getFaculty_id()%>">
                <td class="StdID"><%=s.getFaculty_id() %></td>
                <td><%=s.getFname() %></td>
                <td><%=s.getLname() %></td>
                <td><%=s.getPhone_no() %></td>
                <td><%=s.getEmail() %></td>
                <td><form action="UpdateTeacher" method="post"><input type="hidden" name="Faculty_id" value="<%= s.getFaculty_id() %>"  /> <input type="submit" value="View"  style="border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/></form></td>
                <td><button value="Delete" onclick="remove(<%=s.getFaculty_id()%>)">Delete</button></td>
            </tr>
         <% }
		 } %>
        </tbody>
    </table>


<script>
function remove(id){
	if(window.XMLHttpRequest){
		
		ajax = new XMLHttpRequest();
		
	}
	else if(window.ActiveXObject){
		
		ajax = new ActiveXObject("Microsoft.XMLHTTP");
	} 
	
	var url="ViewTeacher?id="+id;
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
			alert("Teacher info Successfully Deleted!!!");
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