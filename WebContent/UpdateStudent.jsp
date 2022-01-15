<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
    body{
        /* background: linear-gradient(to right, #2ed573, #f9ca24); */
        overflow-x: hidden;
    }
    .container{
        background: #fff;
        width: 540px;
        height: 450px;
        margin: 0 auto;
        position: relative;
        margin-top: 10%;
        box-shadow: 2px 5px 20px rgba(119,119,119,.5);
    }
    .leftbox{
        float: left;
        top: -5%;
        left: 5%;
        position: absolute;
        width: 15%;
        height: 110%;
        background: #2ed573;
        box-shadow: 3px 3px 10px rgba(119,119,119,.5);
        border: .1em solid #fff;
    }
    nav a{
        list-style: none;
        padding: 35px;
        color: #fff;
        font-size: 1.1em;
        display: block;
        transition: all .3s ease-in-out;
    }
    nav a:hover{
        color: #10ac84;
        cursor: pointer;
        transform: scale(1.2);
    }
    nav a:first-child{
        margin-top: 7px;
    }
    .rightbox{
        width: 60%;
        margin-left: 27%;
        /* padding-top: 5px; */
    }
    .tabshow{
        transition: all .5s ease-in;
        width: 80%;
        position: absolute;
    }
    h1{
        font-family: monospace;
        color: #7ed386;
        margin-top: 40px;
        margin-bottom: 35px;
    }
    h2{
        color: #777;
        font-family: 'Courier New', Courier, monospace;
        text-transform: uppercase;
        font-size: 15px;
        letter-spacing: 1px;
        margin-left: 2px;
        margin-top: 10px;
    }
    .input, p{
        border: 0;
        border-bottom: 1px solid #3fb6a8;
        width: 80%;
        font-size: .9em;
        color: #070707;
        outline: none;
    }
    .btn{
        text-transform: uppercase;
        font-size: 15px;
        border: 0;
        color: #fff;
        border: 0;
        color: #fff;
        background: #7ed386;
        padding: 7px 15px;
        box-shadow: 0px 2px 4px 0px rgba(0,0,0,.2);
        margin-top: 15px;
    }
    

</style>

<body>

   <div class="container">
        <div class="leftbox">
            <nav>
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
           <div class="profile tabshow">
               <h1>personal info</h1>
               <h2>First name</h2>
               <input type="text" class="input" value="Jonny">
               <h2>Last name</h2>
               <input type="text" class="input" value="depp">
               <h2>Gender</h2>
               <input type="text" class="input" value="male">
               <h2>Birthday</h2>
               <input type="date" class="input" value="11/7/2002">
               <button class="btn">update</button>
           </div>
           <div class="acadamics tabshow">
                <h1>Acadamic info</h1>
                <h2>Admission Date</h2>
                <input type="date" class="input" value="22/1/2012">
                <h2>Student ID</h2>
                <input type="number" class="input" value="8700">
                <h2>Standard</h2>
                <input type="text" class="input" value="VII">
                <h2>Result</h2>
                <input type="text" class="input" value="A+">
                <button class="btn">update</button>
            </div> 
            <div class="contact tabshow">
                <h1>Contact info</h1>
                <h2>Address</h2>
                <input type="text" class="input" value="Mumbai-70">
                <h2>Phone number</h2>
                <input type="text" class="input" value="654389754">
                <h2>Email</h2>
                <input type="email" class="input" value="Examp@gmail.com">
                <button class="btn">update</button>
            </div>
            <div class="login tabshow">
                <h1>login info</h1>
                <h2>Login ID</h2>
                <input type="text" class="input" value="User187">
                <h2>Password</h2>
                <input type="text" class="input" value="VII187">
                <button class="btn">update</button>
            </div>    
        </div>
    </div>

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