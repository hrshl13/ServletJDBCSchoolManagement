<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="Error.jsp"
    pageEncoding="ISO-8859-1"%>

<% 
	if (session==null)
	{
	    response.sendRedirect("Forbidden.jsp");
	    return;
	  } 
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	session.setMaxInactiveInterval(600);

%>
<%@include file="NavBar.jsp" %>
<% if(request.getAttribute("msg") != null) { %>
	    	<p class="error">
		     <%= request.getAttribute("msg") %>
		    </p>
		<% } %>

<!DOCTYPE html>
<html>
<head>
<title>Change Password Page</title>
<style>
body{
    background-image: linear-gradient(to right, #4ca1af, #c4e0e5);
    align-items:center;

}
.Container{
    margin-top:2vw;
    margin-bottom:1vw;
    margin-right:3vw;
    display: flex;
    width:30vw;
    padding:2vw 3vw;
    align-self: flex-end;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    align-content: center;
    border-radius: 1vw;
    margin-left: auto;
    margin-right: auto;
    /* box-shadow: 1px 1px 10px rgb(253, 145, 95); */
    background: linear-gradient(
        114deg,
        rgba(255, 255, 255, 0.48) 1.41%,
        rgba(255, 255, 255, 0.34) 99.96%
    );
    backdrop-filter: blur(8px);
    border: 1px solid rgba(80, 80, 80, 0.445);
    background-repeat: no-repeat;
}
.Container h1{
    color:rgb(6, 2, 56);
    font-size:3vw;
}
.Container input{
    color:rgb(6, 2, 56);
    /* color:rgb(5, 5, 5); */
}
.Container input[type="password"]{
    margin: 0.5vw 0vw;
    color:rgb(5, 5, 5);
    font-size: 1.3vw;
    background:transparent;
    padding:0.5vw 0.8vw;
    border-radius:0.3vw;
    border:0.2vw solid rgba(5, 5, 5, 0.671);
}
.Container input[type="password"]:hover{
    transform: translate(0,-3px);
    cursor:pointer;
    transition:0.5s;
    background:linear-gradient(to right, #ddd6f3 , #faaca8);
}
.Container input[type="password"]:focus{
    /* border:none; */
    cursor:pointer;
    color:rgb(5, 5, 5);
    transition:0.5s;
    background:linear-gradient(to right, #ddd6f3 , #faaca8);
}
.Container input[type="password"]::placeholder{
    color:rgba(5, 5, 5, 0.671);
}
.Container input[type="password"]:hover::placeholder{
    color:rgb(5, 5, 5);
}
.Container button[type="submit"]{
    margin-top:1vw;
    padding:1vh 1vw;
    border-radius: 0.3vw;
    height: 2.5vw;
    border:none;
    font-size:1.3vw;
    font-family: 'Nunito';
    color:rgb(6, 2, 56);
    background:linear-gradient(to right, #56ab2f, #a8e063);
}
.Container button[type="submit"]:hover{
    /* border:none; */
    transform: translate(0,-3px);
    cursor:pointer;
    transition:0.5s;
    background:linear-gradient(to right, #56ab2f , #a8e063) ;
    /* background-color:rgb(182, 241, 64); */
}
.Container button[type="submit"]:active{
    background-color:rgba(72, 217, 253, 0.835);
    transform: translate(0,5px);
}
.error {
  position:centre;
  border-radius: 0.4vw;
  padding: 1vw;
  border: 0.1vw solid #ff304f;
  color: #ff304f;
  box-shadow: 0.2vw 0.2vw 0.8vw 0.2vw #fdc6ce;
  background-color: #fdc6ce;
}
</style>
</head>
<body>

        <form action="ChangePassword" method="post">
        <div class="Container">
            <h1>Change Password</h1>
            <label for="old"></label>
            <input type="password" name="curpass" id="curpass" placeholder="Current Password" >
            <label for="new"></label>
            <input type="password" name="newpass" id="newpass" placeholder="New Password">
            <label for="repeat"></label>
            <input type="password" name="repass" id="repass" placeholder="Repeat New Password">

           <button type="submit">Submit</button>
        </div>
        </form>
 
</body>

</html>