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
  <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.1/darkly/bootstrap.min.css" rel="stylesheet" integrity="sha384-ae362vOLHy2F1EfJtpMbNW0i9pNM1TP2l5O4VGYYiLJKsaejqVWibbP6BSf0UU5i" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <style>
* {
    box-sizing: border-box;
}
body {
    margin: 0;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 25px;
    
}
.container {
    position: relative;
    background: rgba(0, 0, 0, 0.5);
    max-width: 1920px;
    margin: 0 auto;
}
.container img {vertical-align: middle;}
.container .content {
font-family: "Comic Sans MS", cursive, sans-serif;
    position: absolute;
     /*opacity: 0.6;*/
     margin:0;
    /*filter: alpha(opacity=60); For IE8 and earlier */
    bottom:0;
    top: 0;
    /*background: rgba(0, 0, 0, 0); /* Black background with transparency */
    color: #f1f1f1;
    width: 100%;
    padding: 30px;
}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 200px;
  margin: auto;
  text-align: center;
  font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>-->
</head>
<body style="background-image:url(wiseproject2.jpg) ;background-position:center; background-size: cover">
<div class="container">
<!--<img src="wiseproject2.jpg" alt="Notebook" style="width:100%;">-->
 <div class="content">
 <div class = "card">
 <center><h1 style="color:black; background-color: #B0B0B0">Visitor Details</h1></center>
   <table class="table table-hover">
    <thead style="color:white">
      <tr  style="background-color:#404040;">
			<th>Visitor Name</th>
			<th>No.Of Visitors</th>
			<th>Visit Time</th>
			<th>Purpose</th>
      </tr>
    </thead>
    <tbody style="color:white; opacity: 10" >
     <c:forEach items="${visitorList}" var="visitor">
			<tr>
				<td>${visitor.visitorName}</td>
				<td>${visitor.noOfVisitors}</td>
				<td>${visitor.visitTime}</td>
				<td>${visitor.purpose}</td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
  </div>
  </div>
</div>
</body>
</html>