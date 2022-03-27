<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
* {
    box-sizing: border-box;
}
body {
    margin: 0;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 15px;
    padding:0
    
}
.container {
    position: relative;
    background: rgba(0, 0, 0, 0);
    max-width: 1920px;
    margin: 0 auto;
}
.container img {vertical-align: middle;}
.container .content {
font-family: "Comic Sans MS", cursive, sans-serif;
    position: absolute;
     opacity: 0.6;
     margin:0;
    filter: alpha(opacity=60); /* For IE8 and earlier */
    bottom:0;
    top: 0;
    color: #f1f1f1;
    width: 100%;
    padding: 50px;
}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 200px;
  margin: auto;
  text-align: center;
  font-family: "Comic Sans MS", cursive, sans-serif;
}

.td{
color:#000000;
}
</style>
</head>
<body>
<div class="container">
<img src="dispAllRes.jpg" alt="Notebook" style="width:100%;">
 <div class="content">
 <div class = "card">
 <center><h1 style="color:black;">RESIDENTS DETAILS</h1></center>
   <table class="table table-hover" border=3>
    <thead style="color:white">
      <tr  style="background-color: #11001a">
       <th>FlatNo</th>
			<th>OccupantName</th>
			<!--<th>Password</th>-->
			<th>No.Of Occupants</th>
			<th>Occupant Contact No.</th>
			<th>Email</th>
			<th>Type of Occupant</th>
			<th>Occupation</th>
			<th>Place</th>
			<th>OwnerContactNo</th>
      </tr>
    </thead>
    <tbody style="color:#000000;background-color:#bfbfbf">
     <c:forEach items="${residentList}" var="resident">
			<tr>
				<td><b>${resident.flatNo}</td></b>
				<b><td><b>${resident.userName}</b></td>
				<!--<td>${resident.password}</td>-->
				<td><b>${resident.familySize}</b></td>
				<td><b>${resident.contactNo}</b></td>
				<td><b>${resident.email}</b></td>
				<td><b>${resident.status}</b></td>
				<td><b>${resident.occupation}</b></td>
				<td><b>${resident.place}</b></td>
				<td><b>${resident.ownerContactNo}</b></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
  </div>
  </div>
</div>
</body>
</html>