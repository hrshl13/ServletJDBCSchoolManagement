<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<form action="ViewStudent" method="post">
    <h1 style="text-align: center; font-family: monospace; color: #009879;">Students Information</h1>
    <br><br><br>

    <select class="select">
        <option selected disabled>Class</option>
        <option value="5th">fifth</option>
        <option value="6th">sixth</option>
        <option value="7th">fifth</option>
        <option value="8th">seventh</option>
        <option value="9th">eighth</option>
        <option value="10th">nineth</option>
    </select>
    <br><br>
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
            <tr>
                <td>Arun upadhay</td>
                <td>123</td>
                <td>A+</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
            <tr>
                <td>Dipa ranjan</td>
                <td>183</td>
                <td>B+</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><form action=""><button>Delete</button></form></td>
            </tr>
            <tr>
                <td>Ashoka pradhan</td>
                <td>242</td>
                <td>A+</td>
                <td>2736826832</td>
                <td>abc@gmail.com</td>
                <td><button>View</button></td>
                <td><button>Delete</button></td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>