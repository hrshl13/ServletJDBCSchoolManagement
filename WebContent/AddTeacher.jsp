<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    body{
        background: #fec107;
        padding: 0 10px;
    }
    .wrapper{
        max-width: 500px;
        width: 100%;
        background: #fff;
        margin: 20px auto;
        padding: 30px;
        box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15);
    }
    .wrapper .title{
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 25px;
        color: #fec107;
        text-align: center;
    }
    .wrapper form .input_field{
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }
    .wrapper form .input_field label{
        width: 200px;
        color: #757575;
        margin-right: 10px;
        font-size: 14px;
    }
    .wrapper form .input_field .input{
        width: 100%;
        outline: none;
        border: 1px solid #d5dbd9;
        font-size: 15px;
        padding: 8px 10px;
        border-radius: 3px;
        transition: all 0.3s ease;
    }
    .wrapper form .input_field .custom_select{
        position: relative;
        width: 100%;
        height: 37px;
    }
    .wrapper form .input_field .custom_select select{
        -webkit-appearance: none;
        appearance: none;
        border: 1px solid #d5dbd9;
        width: 100%; height: 100%;
        padding: 8px 10px; 
        border-radius: 3px;
        outline: none;
    }
    .wrapper form .input_field .btn{
        width: 100%;
        padding: 8px 10px;
        font-size: 15px;
        border: 0;
        background: #fec107;
        color: #fff;
        border-radius: 3px;
        outline: none;
    }
    
</style>
<body>
<div class="wrapper">
        <div class="title">
            New Faculty
        </div>
        <form action="AddTeacher">
            <div class="input_field">
                <label>First Name</label>
                <input type="text" class="input" name="fname">
            </div>
            <div class="input_field">
                <label>Last Name</label>
                <input type="text" class="input" name="lname">
            </div>
            <div class="input_field">
                <label>Birth date</label>
                <input type="date" class="input" name="dob">
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
                <input type="number" class="input" name="phone_no">
            </div>
            <div class="input_field">
                <label>email</label>
                <input type="email" class="input" name="email">
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
                <label>Subject ID</label>
                <input type="number" class="input" name="subject_id">       
            </div>
            <div class="input_field">
                <button type="submit" class="btn">Add Student</button>
            </div>
        </form>
    </div>
</body>
</html>