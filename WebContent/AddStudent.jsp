<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Assets/AddStudent.css" type='text/css'>
</head>


<body>
<%@include file="NavBar.jsp" %>
<% if(request.getAttribute("msg") != null) { %>
   <p class="error">
     <%= request.getAttribute("msg") %>
   </p>
<% } %>


<div class="wrapper">
        <div class="title">
            New Student
        </div>
        <form action="AddStudent" method="post">
            <div class="input_field">
                <label>First Name</label>
                <input type="text" class="input" name="fname">
            </div>
            <div class="input_field">
                <label>Last Name</label>
                <input type="text" class="input" name="lname">
            </div>
            <div class="input_field">
                <label>Gender</label>
                <select class="custom_select" name="gender">
                    <option value="male">male</option>
                    <option value="female">female</option>
                </select>
            </div>
            <div class="input_field">
                <label>Phone</label>
                <input type="text" class="input" name="phone_no">
            </div>
            <div class="input_field">
                <label>email</label>
                <input type="email" class="input" name="email">
            </div>
            <div class="input_field">
                <label>Birth date</label>
                <input type="date" class="input" name="dob">
            </div>
            <div class="input_field">
                <label>admission date</label>
                <input type="date" class="input" name="admission_date">
            </div>
            <div class="input_field">
                <label>Address</label>
                <textarea class="input" style="resize: none; height: 125px;" name="address"></textarea>
            </div>
            <div class="input_field">
                <label>login ID</label>
                <input type="text" class="input" name="login_id">
            </div>
            <div class="input_field">
                <label>password</label>
                <input type="password" class="input" name="passwd">
            </div>
            <div class="input_field">
                <label>Standard</label>
                <select class="custom_select" name="standard">
                    <option value="I">first</option>
                    <option value="II">second</option>
                    <option value="III">third</option>
                    <option value="IV">fourth</option>
                    <option value="V">fifth</option>
                    <option value="VI">sixth</option>
                    <option value="VII">seventh</option>
                    <option value="VIII">eighth</option>
                    <option value="IX">nineth</option>
                    <option value="X">tenth</option>
                </select>          
            </div>
            <div class="input_field">
                <button type="submit" class="btn">Add Student</button>
            </div>
        </form>
    </div>
</body>
</html>