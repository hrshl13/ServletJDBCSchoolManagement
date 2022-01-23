<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewStudent,com.DAO.StudentDAO,com.Models.Student,java.util.List"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Assets/ViewStudent.css" type='text/css'>
</head>


<body>
<%
if (request.getParameter("StdID")!=null){
	int del = Integer.parseInt(request.getParameter("StdID"));
	int status = StudentDAO.delete(del);
	if (status==0){
		%> <p class="error">Unsuccessful!!</p><% 
	}else{
		%> <p class="suc">Successful!!</p><% 
	}
}
%>
<form action="ViewStudent" method="post">
<h1 style="text-align: center; font-family: monospace; color: #009879;">Students Information</h1>
    <br><br><br>
<select class="select" name="stdlist">
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
						
					</select>
					<input type="submit" id="subbtn" value="Submit" style="border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/>
</form>
<form action="AddStudent.jsp" method="post"><input type="submit" value="new" style="margin-left: 55%;border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/></form>
    <table class="content-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Roll no.</th>
                <th>Result</th>
                <th>Phone no.</th>
                <th>Email</th>
                <th>View</th>
                <th>Delete</th>
            </tr>
        </tread>
        <tbody>
        <% 
        List<Student> l = (List<Student>) request.getAttribute("List");
        %>
	   <%
		if (l != null){
			for (Student s:l){
				System.out.println(s.getStudent_id());
		%>
            <tr id="<%=s.getStudent_id()%>">
                <td><%=s.getFname() %></td>
                <td class="StdID"><%=s.getStudent_id() %></td>
                <td><%=s.getResult() %></td>
                <td><%=s.getPhone_no() %></td>
                <td><%=s.getEmail() %></td>
                <td><form action="UpdateStudent" method="post"><input type="hidden" name="Student_id" value="<%= s.getStudent_id() %>"  /> <input type="submit" value="View"  style="margin-top: 100px; border-radius: 5px 5px 5px 5px; background-color: #009879;color: #f3f3f3;"/></form></td>
                <td><button value="Delete" onclick="remove(<%=s.getStudent_id()%>)">Delete</button></td>
            </tr>
            <% 	}
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
	
	var url="ViewStudent?id="+id;
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
			alert("Student info Successfully Deleted!!!");
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