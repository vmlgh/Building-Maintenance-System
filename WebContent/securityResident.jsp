<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "com.ts.dto.Resident" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.a{
text-align:left;
}
</style>

</head>
<body style="background-image:url(secRes.jpg) ;background-position:center; background-size: cover; background-repeat: no-repeat;color:white;font-size:25px;padding:5em">


<%
Resident resident = (Resident)request.getAttribute("resident"); 

%>
<center>
<div class="a">
<h2>Profile</h2>



		
			<b>Flat Number:</b> ${resident.flatNo}<br>
			<b>UserName:</b> ${resident.userName}<br>
			<b>No Of Occupants:</b> ${resident.familySize}<br>
			<b>Occupant Contact Number:</b> ${resident.contactNo}<br>
			<b>Email:</b> ${resident.email}<br>
			<b>Type Of Resident:</b> ${resident.status}<br>
			<b>Occupation:</b> ${resident.occupation}<br>
			<b>Native:</b> ${resident.place}<br>
			<b>Owner Contact Number:</b> ${resident.ownerContactNo}<br>
</div>
</center>

</body>
</html>