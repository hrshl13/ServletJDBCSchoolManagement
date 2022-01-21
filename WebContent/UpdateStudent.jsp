<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewStudent,com.DAO.StudentDAO,com.Models.Student,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Assets/UpdateStudent.css" type='text/css'>
</head>


<body>
<form action="UpdateStudent" method="post">
   <div class="container">
        <div class="leftbox">
            <nav class="navIcon">
                <a onclick="tabs(0)" class="tab active">
                    <i class="fa fa-user"></i>
                </a>
                <a onclick="tabs(1)" class="tab">
                    <!-- <i class="fa fa-pencil-square-o"></i> -->
                    <i class="fa fa-graduation-cap"></i>
                </a>
                <a onclick="tabs(2)" class="tab">
                    <i class='fa fa-phone'></i>
                </a>
                <a onclick="tabs(3)" class="tab">
                    <i class="fa fa-cog"></i>
                </a>
            </nav>
        </div>
        <div class="rightbox">
        <% 
        Student l = (Student) request.getAttribute("List");
        %>
	    <%
		if (l != null){
			
		%>
           <div class="profile tabshow">
               <h1 class="hg1">personal info</h1>
               <h2 class="hg2">First name</h2>
               <input type="text" class="input" value="<%= l.getFname()%>" name="fname">
               <h2 class="hg2">Last name</h2>
               <input type="text" class="input" value="<%= l.getLname()%>" name="lname">
               <h2 class="hg2">Gender</h2>
               <input type="text" class="input" value="<%= l.getGender()%>" name="gender">
               <h2 class="hg2">Birthday</h2>
               <input type="text" class="input" value="<%= l.getDob()%>" name="dob">
           </div>
           <div class="acadamics tabshow">
                <h1 class="hg1">Acadamic info</h1>
                <h2 class="hg2">Admission Date</h2>
                <h3 class="input" name="admission_date"><%= l.getAdmission_date()%></h3>
                <h2 class="hg2">Student ID</h2>
                <h3 class="input" name="student_id"><%= l.getStudent_id()%></h3>
                <h2 class="hg2">Standard</h2>
                <h3 class="input" name="standard"><%= l.getStandard()%></h3>
                <h2 class="hg2">Result</h2>
                <h3 class="input" name="result"><%= l.getResult()%></h3>
            </div> 
            <div class="contact tabshow">
                <h1 class="hg1">Contact info</h1>
                <h2 class="hg2">Address</h2>
                <input type="text" class="input" value="<%= l.getAddress()%>" name="address">
                <h2 class="hg2">Phone number</h2>
                <input type="text" class="input" value="<%= l.getPhone_no()%>" name="phone_no">
                <h2 class="hg2">Email</h2>
                <input type="email" class="input" value="<%= l.getEmail()%>" name="email">
            </div>
            <div class="login tabshow">
                <h1 class="hg1">login info</h1>
                <h2 class="hg2">Login ID</h2>
                <h3 class="input" name="login_id"><%= l.getLogin_id()%></h3>
                <h2 class="hg2">Password Hash</h2>
                <h3 class="input" name="passwd"><%= l.getPasswd()%></h3>
               
            </div> 
            <button class="btn" type="submit" name="submit_update" value="Update">Update</button>   
        </div>
            <% 
		} %>
    </div>
</form>
    <script src="jquery/jquer.js"></script>
    <script>
        const tabBtn = document.querySelectorAll(".tab");
        const tab = document.querySelectorAll(".tabshow");
        function tabs(panelIndex){
            tab.forEach(function(node){
                node.style.display = "none";
            });
            tab[panelIndex].style.display = "block";
        }
        tabs(0);
    </script>
    <script>
        $(".tab").click(function () {
            $(this).addClass("active").siblings().removeClass("active")
        })
    </script>
</body>
</html>





















