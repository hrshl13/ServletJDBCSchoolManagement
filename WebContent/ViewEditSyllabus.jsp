<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View/Edit Syllabus</title>
</head>
<body>
<%@include file="NavBar.jsp" %>

<form>
	<input type="text" name="asstopic" placeholder="Assignment Topic"/>
	<textarea rows="3" cols="50" name="assdesc" >Assignment description</textarea>
	<select class="stdlist">
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
	<input type="submit" id="subbtn" value="Submit" />
</form>

</body>
</html>