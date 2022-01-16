<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	import="java.util.*, com.Controllers.Profile, java.io.*,java.util.Map.Entry"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@include file="NavBar.jsp" %>
<title>Profile Page-<%=name%></title>
<!-- css links -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<%-- <link rel="stylesheet" href="Profile.css" type='text/css'>--%>
<style>
body {
    background: #67B26F;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    padding: 0;
    margin: 0;
    font-family: 'Lato', sans-serif;
    color: goldenrod;
    }
    .student-profile .card {
    border-radius: 10px;
    }
    .student-profile .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 10px solid #ccc;
    border-radius: 50%;
    }
    .student-profile .card h3 {
    font-size: 20px;
    font-weight: 700;
    }
    .student-profile .card p {
    font-size: 16px;
    color: rgb(93, 161, 184);
    }
    .student-profile .table th,
    .student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    color: rgb(93, 161, 184);
    }
    .Probtn button{
        color: #0099CC;
        background: #96d2e6;
        border: 2px solid #0099CC;
        border-radius: 6px; 
        border: none;      
        color: white;      
        padding: 5px 5px;      
        text-align: center;      
        display: inline-block; 
        margin-top: 20px;
        margin-left: 50px;     
        font-size: 16px;            
        -webkit-transition-duration: 0.4s; 
        /* Safari */      
        transition-duration: 0.4s;            
        text-decoration: none;      
        text-transform: uppercase;
        background-color: lightgray;
        color: #008CBA;
        border: 2px solid #008CBA;
        font-weight: bold;
    }
    .Probtn button:hover {
        background-color: #008CBA;
        color: white;
    }</style>
</head>
<body>
	<% 
	Profile p = new Profile();
	p.processRequest(request, response);
	PrintWriter t = response.getWriter();
	HashMap<String,String> d = (HashMap<String,String>)session.getAttribute("Details");
%>
 <div class="student-profile py-4">
        <div class="container">
          <div class="row">
            <div class="col-lg-4">
              <div class="card shadow-sm" style="border-bottom: 8px solid #165368;">
                <div class="card-header bg-transparent text-center">
                    <div class="profile_img"><i class="fa fa-user" style="font-size: 120px; color: rgb(169, 169, 169);"></i></div>
                  <h3><%=d.get("Name") %></h3>
                </div>
                <div class="card-body">
                  <p class="mb-0"><strong class="pr-1"><%=session.getAttribute("type")%> ID:</strong><%=d.get("Login ID")%></p>
                </div>
              </div>
            </div>
            <div class="col-lg-8">
              <div class="card shadow-sm" style="border-bottom: 8px solid #165368;">
                <div class="card-header bg-transparent border-0">
                  <h3 class="mb-0">Personal Information</h3>
                </div>
                <div class="card-body pt-0">
                  <table class="table table-bordered">
                    <tr>
                        <th width="30%">Gender</th>
                        <td width="2%">:</td>
                        <td><%=d.get("Gender")%></td>
                    </tr>
                    <tr>
                      <th width="30%">Birth Date</th>
                      <td width="2%">:</td>
                      <td><%=d.get("Date of Birth")%></td>
                    </tr>
                    <% if (session.getAttribute("type").equals("Student")){ %>
	                    <tr>
	                        <th width="30%">Admission Date</th>
	                        <td width="2%">:</td>
	                        <td><%=d.get("Admission Date")%></td>
	                    </tr>
	                    <tr>
	                        <th width="30%">Class</th>
	                        <td width="2%">:</td>
	                        <td><%=d.get("Standard")%></td>
	                    </tr>
                    <% }else if(session.getAttribute("type").equals("Teacher")){  %>
                    <tr>
	                        <th width="30%">Subject ID</th>
	                        <td width="2%">:</td>
	                        <td><%=d.get("Subject ID")%></td>
	                </tr>
	               <% }else{;} %>
                  </table>
                </div>
              </div>
              <div class="card shadow-sm" style="margin-top: 20px; border-bottom: 8px solid #165368;">
                <div class="card-header bg-transparent border-0">
                  <h3 class="mb-0">Contact Information</h3>
                </div>
                <div class="card-body pt-0">
                  <table class="table table-bordered">
                    <tr>
                      <th width="30%">Address</th>
                      <td width="2%">:</td>
                      <td><%=d.get("Address")%></td>
                    </tr>
                    <tr>
                      <th width="30%">Phone Number</th>
                      <td width="2%">:</td>
                      <td><%=d.get("Phone Number")%></td>
                    </tr>
                    <tr>
                        <th width="30%">Email Address</th>
                        <td width="2%">:</td>
                        <td><%=d.get("Email")%></td>
                    </tr>
                  </table>
                </div>
              </div>
              <div class="Probtn">
                  <form action="Logout" method="post">
					<button type="submit">Logout</button>
					</form>
                  <form action="ChangePassword.jsp" method="post">
					<button type="submit">Change Password</button>
	      			</form>
            </div>
          </div>
        </div>
      </div>
      </div>
</body>
</html>