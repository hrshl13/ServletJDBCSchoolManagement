<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {  
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}
:root {
  --mainColor: #000;
}	
body {
  width: 100vw;
  height: 1100px;
  overflow-x: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ccc;
}
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-track {
  background: #ccc;
}
::-webkit-scrollbar-thumb {
  background: var(--mainColor);
}
.main {
  width: 92%;
  height: 90%;
  background-color: #fff;
}
.main header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.main header h1 {
  position: relative;
  top: 25px;
  left: -20px;
  width: 220px;
  padding: 10px;
  color: #fff;
  background-color: var(--mainColor);
}
.main header h1::before {
  content: "";
  position: absolute;
  bottom: -20px;
  left: 0;
  border-width: 10px;
  border-style: solid;
  border-color: var(--mainColor) var(--mainColor) transparent transparent;
}

.main .tasks {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column wrap;
  position: relative;
  top: 5%;
}
.main .tasks div {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  margin: 10px 0;
  padding: 10px;
  width: 80%;
  height: 60px;
  background-color: #ddd;
  transition: 0.2s;
}
.tasks div:hover {
  background-color: #aaa;
}
.main .tasks input[type="checkbox"] {
  appearance: none;
}
.main .tasks label {
  position: relative;
  margin-left: 40px;
  font-weight: bold;
  cursor: pointer;
}
.main .tasks label::before {
  content: "";
  position: absolute;
  top: -5px;
  left: -40px;
  width: 25px;
  height: 25px;
  background-color: #fff;
  border: 1px solid #777;
  border-radius: 5px;
}
.main .tasks input[type="checkbox"]:checked + label::after {
  content: "";
  position: absolute;
  left: -34px;
  top: 1px;
  width: 15px;
  height: 15px;
  background-color: var(--mainColor);
  border-radius: 4px;
}
.main .tasks img {
  width: 30px;
  height: 30px;
  margin-left: 10px;   
  transition: 0.5s;
}
.tasks div:hover img {
  margin-left: 25px;
}
.main .tasks input[type="checkbox"]:checked + label {
  text-decoration: line-through wavy var(--mainColor);
}
.main .tasks input[type="checkbox"]:checked + label,
.main .tasks input[type="checkbox"]:checked ~ img {
  opacity: 0.7;
}
/*custom inpu file*/
.custom-file-input {
  color: transparent;

}
.custom-file-input::-webkit-file-upload-button {
  visibility: hidden;
}

.custom-file-input::before {
	content: "Upload File";
    color: #fff;
    display: inline-block;
    background: #000000;
    padding: 10px 22px;
    outline: none;
    white-space: nowrap;
    -webkit-user-select: none;
    cursor: pointer;
    font-weight: 600;
    border-radius: 2px;
    outline: none;
  
.custom-file-input:focus {
	outline: none !important;

}
/*.custom-file-input:active::before {
	    transform: scale(.9) translate(0px, 2px);	   
}
</style>
</head>
<body>
<div class="main">
  <header>
    <h1>Assignments</h1>
  </header>
  <form action="db.py" method="POST" class="tasks" id="daily-tasks">
        <div>
      <input type="checkbox" id="task1" checked>
      <label for="task1">Assignment 01</label> 
      <div class="custom-file">
      <input type="file" class="custom-file-input">
</div>
    </div>
    <div>
      <input type="checkbox" id="task2">
      <label for="task2">Assignment 02</label>
    </div>

    <div>
      <input type="checkbox" id="task3">
      <label for="task3">Assignment 03</label>
    </div>
    <div>
      <input type="checkbox" id="task4">
      <label for="task4">Assignment 04</label>
    </div>
    <div>
      <input type="checkbox" id="task5">
      <label for="task5">Assignment 05</label>
    </div>
    <div>
      <input type="checkbox" id="task6">
      <label for="task6">Assignment 06</label>
    </div>
    <div>
      <input type="checkbox" id="task7">
      <label for="task7">Assignment 07</label>
    </div>
    <div>
      <input type="checkbox" id="task8">
      <label for="task8">Assignment 08</label>
    </div>
    <div>
      <input type="checkbox" id="task9">
      <label for="task9">Assignment 09</label>
    </div>
    <div>
      <input type="checkbox" id="task10">
      <label for="task10">Assignment 10</label>
    </div>
  </form>
  </div>
</body>
</html>