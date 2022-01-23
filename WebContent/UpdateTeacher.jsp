<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.Controllers.ViewTeacher,com.DAO.TeacherDAO,com.Models.Teacher,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Teacher</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Assets/UpdateTeacher.css" type='text/css'>
</head>

<body>
<form action="UpdateTeacher" method="post">
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
        Teacher l = (Teacher) request.getAttribute("List");
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
               <input type="date" class="input" value="<%= l.getDob()%>" name="dob">
           </div>
           <div class="acadamics tabshow">
                <h1 class="hg1">Academic info</h1>
                <h2 class="hg2">Subject ID</h2>
                <input type="number" class="input" value="<%= l.getSubject_id()%>" name="subject_id" disabled>
                <h2 class="hg2">Teacher ID</h2>
                <input type="number" class="input" value="<%= l.getFaculty_id()%>" name="faculty_id" disabled>
            </div> 
            <div class="contact tabshow">
                <h1 class="hg1">Contact info</h1>
                <h2 class="hg2">Address</h2>
                <input type="text" value="<%= l.getAddress()%>" name="address">
                <h2 class="hg2">Phone number</h2>
                <input type="text" class="input" value="<%= l.getPhone_no()%>" name="phone_no">
                <h2 class="hg2">Email</h2>
                <input type="email" class="input" value="<%= l.getEmail()%>" name="email">
            </div>
            <div class="login tabshow">
                <h1 class="hg1">login info</h1>
                <h2 class="hg2">Login ID</h2>
                <input type="text" class="input" value="<%= l.getLogin_id()%>" name="login_id" disabled>
                <h2 class="hg2">Password</h2>
                <input type="text" class="input" value="<%= l.getPasswd()%>" name="passwd" disabled>
            </div>
            <button class="btn" type="submit" name="submit_update" value="Update" style="margin-top: 360px; margin-left: 100px;">Update</button>       
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