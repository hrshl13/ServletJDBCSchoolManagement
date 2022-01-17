<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewTeacher,com.DAO.TeacherDAO,com.Models.Teacher,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    .select{
        padding: 8px 12px;
        color: white;
        font-weight: bold;
        background-color: #eeeeee;
        border: 1px solid #dddddd;
        border-radius: 5px;
        background-color: #009879;
        color: #dddddd;
        margin: 0 0 0 570px;
    }

    .content-table{ 
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 0.9em;
        /* min-width: 400px; */
        width: 40%;
        font-size: 15px;
        font-family: monospace;
        border-radius: 5px 5px 0 0;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        margin-left: auto;
        margin-right: auto;
    }
    .content-table tr td button{
        border-radius: 5px 5px 5px 5px;
        background-color: #009879;
        color: #f3f3f3;
    }
    .content-table thead tr{
        background-color: #009879;
        color: #ffffff;
        text-align: left;
        font-weight: bold;
    }
    .content-table th,
    .content-table td{
        padding: 12px 15px;
    }
    .content-table tbody tr{
        border-bottom: 1px solid #dddddd;
    }
    .content-table tbody tr:nth-of-type(even){
        background-color: #f3f3f3;
    }
    .content-table tbody tr:last-of-type{
        border-bottom: 2px solid #009879;
    }
    .content-table tbody tr:hover{
        color: #009879;
    }

</style>

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
<form action="#" method="post">   
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
            <tr>
                <td><%=s.getFaculty_id() %></td>
                <td><%=s.getFname() %></td>
                <td><%=s.getLname() %></td>
                <td><%=s.getPhone_no() %></td>
                <td><%=s.getEmail() %></td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
         <% }
		 } %>
            <tr>
                <td>183</td>
                <td>Dipa</td>
                <td>ranjan</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
            <tr>
                <td>343</td>
                <td>Ashoka</td>
                <td>pradhan</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>