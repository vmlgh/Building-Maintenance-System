<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ page import = "com.ts.dbutility.DBConnection" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.ts.dto.Resident" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resident Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Resident Profile</title>
<!--<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.1/darkly/bootstrap.min.css" rel="stylesheet" integrity="sha384-ae362vOLHy2F1EfJtpMbNW0i9pNM1TP2l5O4VGYYiLJKsaejqVWibbP6BSf0UU5i" crossorigin="anonymous">-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function closeSelf (f) {
     f.submit();
     window.close();
  }

</script>


<style>
body {font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    font-size: 20px;
    padding:5em;
    
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

div.a{
text-align: left;
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
.logoutLblPos{

   position:fixed;
   right:10px;
   top:5px;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 25px;
    
}


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: "Comic Sans MS", cursive, sans-serif;
}



button {
 
  outline: 0;
  display: inline-block;
  border-radius:20%;
  color: white;
  background-color: #220066;
  text-align: center;
  cursor: pointer;
  
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}

.container {
    position: relative;
    max-width: 2000px;
    margin: 0 auto;
}
.container .content {
    position: absolute;
    top: 0;
    /*background: rgba(0, 0, 0, 0.5);  Black background with transparency 
    color: black;
    width: 100%;
    padding: 20px;
}-->
</head>
<body style="background-image:url(resProf1.jpg) ;background-position:center; background-size: cover">


<div class="container">
  <!-- <img src="profile1.jpg" alt="Notebook" style="width:100%;">-->
  <div class="content">
  <% 
Resident resident = (Resident)request.getAttribute("resident"); 
   session.setAttribute("flatNo",resident.getFlatNo());
   
   %>
   <% //String flatNo = request.getParameter("flatNo");
   //session.setAttribute("flatNo",flatNo);
   %>
<form action="Entertainment/index1.jsp">
  <input type="image" src="Game-Center-icon.png" alt="Submit" width="100" height="100" style="position: absolute;
top: 10px;
left: 10px;">
</form>
<div class = "card">

<center>
<div class="a">
<h1 style="text-decoration:underline">PROFILE</h1>


			<b>Flat Number </b>  : ${resident.flatNo}<br>
			<b>UserName</b> : ${resident.userName}<br>
			<b>No Of Occupants</b> : ${resident.familySize}<br>
			<b>Occupant Contact No</b> : ${resident.contactNo}<br>
			<b>Email </b>: ${resident.email}<br>
			<b>Type Of Resident</b>: ${resident.status}<br>
			<b>Occupation</b> : ${resident.occupation}<br>
			<b>Native </b>	: ${resident.place}<br>
			<b>Owner Contact No</b> : ${resident.ownerContactNo}<br>	
</div>
</center>			


<!-- <h2>Animated Modal with Header and Footer</h2>-->

<!-- Trigger/Open The Modal -->
<!--<form action="https://paytm.com/" method>
<button class = "btn btn-warning" type = submit name="action" >Pay bills now</button>
</form>-->
<button class="btn btn-warning" style="color:brown" id="myBtn">Check Dues</button>
<button class="btn btn-warning" style="color:brown" id="myBtn1">Change Password</button>
</div>


</div>
</div>
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Bill Details</h2>
    </div>
    <div class="modal-body">
      <!--<p>Some text in the Modal Body</p>
      <p>Some other text...</p>-->
 <center>
<fieldset>
<%
//String flatNo = request.getAttribute("flatNo").toString();
String flatNo = session.getAttribute("flatNo").toString();
//int no=Integer.parseInt(flatNo);
//System.out.println(no);
PreparedStatement pst = null;
//session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Bills where flatNo =" + flatNo + "";
pst = conn.prepareStatement(QUERY);
//pst.setInt(1, no);
ResultSet rs = pst.executeQuery(QUERY);

while(rs.next()){
%>

<b>MAINTENANCE</b>:<%=rs.getString(2) %><br>
<b>ELECTRICITY:</b><%=rs.getString(3)%><br>
<b>WATER:</b><%=rs.getString(4) %><br>

<form action="https://paytm.com/" method>
<button class = "btn btn-warning" type = submit name="action" >Pay bills now</button>
</form>
<!-- <div class="form-group row">
            <label for="maintenance" class="col-sm-2 col-form-label">MAINTENANCE</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="maintenance" name = "maintenance" value=<%=rs.getString(2) %>>
</div>
</div>
<div class="form-group row">
            <label for="electricity" class="col-sm-2 col-form-label">ELECTRICITY</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="electricity" name = "electricity" value=<%=rs.getString(3) %>>
</div>
</div>
<div class="form-group row">
            <label for="water" class="col-sm-2 col-form-label">WATER</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="water" name = "water" value=<%=rs.getString(4) %>>
</div>
</div>-->
<%
}

}

catch(SQLException e){}
%>
</fieldset>
</center>
    </div>
    <div class="modal-footer">
      <!--<h3></h3>-->
    </div>
  </div>

</div>


<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<div id="myModal1" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Change Password</h2>
    </div>
    <div class="modal-body">
      <!--<p>Some text in the Modal Body</p>
      <p>Some other text...</p>-->
 <center>
<fieldset>
<form method="post" onsubmit="return closeSelf(this);" action="changePassword.jsp">
<div class="form-group row">
            <label for="newPassword" class="col-sm-3 col-form-label">New Password</label>
            <div class="col-sm-9">
            <input type="password" class="form-control" id="newPassword" name = "newPassword" placeholder = "new password">
</div>
</div>
<div class="form-group row">
            <label for="confirmPassword" class="col-sm-3 col-form-label">Confirm Password</label>
            <div class="col-sm-9">
            <input type="password" class="form-control" id="confirmPassword" name = "confirmPassword" placeholder = "confirm password">
</div>
</div>

<button class = "btn btn-info" type ="submit" name="action">Change Password</button>


</form>
</fieldset>
</center>
    </div>
    <div class="modal-footer">
      <!--<h3></h3>-->
    </div>
  </div>

</div>

<script>
// Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close")[1];

// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>



  

<form name="form1" method="post" action="welcome.html">
  <label class="logoutLblPos">
  <button class="btn btn-primary" name="submit2" type="submit" id="submit2" value="log out"><span class="glyphicon glyphicon-log-out"></span>Log out</button>
  </label>
</form>
</body>
</html>