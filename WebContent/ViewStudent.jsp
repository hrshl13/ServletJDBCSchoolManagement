<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewStudent,com.DAO.StudentDAO,com.Models.Student,java.util.List"%>
    

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
		%>
            <tr>
              <form action="#" method="post">
                <td><%=s.getFname() %></td>
                <td class="StdID"><%=s.getStudent_id() %></td>
                <td><%=s.getResult() %></td>
                <td><%=s.getPhone_no() %></td>
                <td><%=s.getEmail() %></td>
                <td><button>View</button></td>
                <td><button value="Delete">Delete</button></td>
              </form>
            </tr>
            <% 	}
		} %>
            <tr>
                <td>Dipa ranjan</td>
                <td>183</td>
                <td>B+</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
        </tbody>
    </table>
</body>
</html>