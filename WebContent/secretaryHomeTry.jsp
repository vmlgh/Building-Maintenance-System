<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ts.dao.ResidentDAO" %>
    <%@page import="java.sql.*" %> 
    <%@page import="java.util.*" %> 
    <%@ page import="com.ts.dto.Resident" %>
    <%@ page import = "com.ts.dbutility.DBConnection" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Secretary Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/darkly/bootstrap.min.css" rel="stylesheet" integrity="sha384-w+8Gqjk9Cuo6XH9HKHG5t5I1VR4YBNdPt/29vwgfZR485eoEJZ8rJRbm3TR32P6k" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
    var param = document.getElementById("selectedTabInput").value;
    if (param != 0) {
        $('#tabs').tabs({
            active : param
        });
    } else {
        $('#tabs').tabs();
    }
});
</script>
  
<style>
div.container{
/*text-align: left;*/
    margin: 0;
    /*font-size: 20px;*/
    padding:1em;
}
.container {
    position: relative;
    background: rgba(0, 0, 0, 0);
    max-width: 1920px;
    margin: 0 auto;
}
container img {vertical-align: middle;}
.container .content {
font-family: Arial, Helvetica, sans-serif;;
font-size:20px;
    position: absolute;
     /*opacity: 0.6;*/
     margin:0;
    /*filter: alpha(opacity=60); */
    bottom:0;
    top: 0;
    /*background: rgba(0, 0, 0, 1.0); /* Black background with transparency */
    color: #f1f1f1;
    width: 100%;
    padding: 20px;
}
button {
 border: 2px solid #555555;
 border-radius: 2px;
  outline: 0;
  display: inline-block;
  border-radius:20%;
  color: white;
  background-color: #000066;
  text-align: center;
 	cursor: pointer;
  
  font-size: 20px;
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
    color:black;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
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
    background-color: #264d73;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #264d73;
    color: white;
}

</style>
</head>
<body>
<% 
//Resident resident = (Resident)request.getAttribute("resident"); 
ResidentDAO residentDAO = new ResidentDAO();
List<Resident> residentList=residentDAO.getAllResidents();
request.setAttribute("residentList", residentList);
   %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<!-- <form action="Entertainment/index1.jsp">
  <input type="image" src="Game-Center-icon.png" alt="Submit" width="50" height="50">
</form> -->
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<div class="navbar-collapse collapse"  id="navbarColor01">
<ul class="navbar-nav mr-auto">
    
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#addResident"><i class="fas fa-ticket-alt"></i> Add resident details</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#getvinfo"><i class="far fa-user-circle"></i> Display all residents</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#getrinfo"><i class="far fa-user-circle"></i> Get resident details</a>
  </li>
</ul>
</ul>
<form name="form1" method="post" action="welcome.html">
  <label class="logoutLblPos">
  <button class="btn btn-secondary my-2 my-sm-0" name="submit2" type="submit" id="submit2" value="log out"><i class="fas fa-sign-out-alt"></i>Log out</button>
  </label>
</form>
</div>
</nav>

<div id="myTabContent" class="tab-content">
<!-- tab1 -->
  <div class="tab-pane" id="addResident">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-12">
    <form method="post" action="ResidentServlet">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> Fill resident details </legend></div>
  	<div class="card-body">
  	<fieldset>
        <div class="form-group row">
            <label for="flatNo" class="col-sm-2 col-form-label">FlatNo</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder="FlatNo" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="userName" class="col-sm-2 col-form-label">UserName</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="userName" name = "userName" placeholder="UserName" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name = "password" placeholder="Password" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="familySize" class="col-sm-2 col-form-label">Number Of Occupants</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="familySize" name = "familySize" placeholder="NoOfOccupants" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="contactNo" class="col-sm-2 col-form-label">Contact Number</label>
            <div class="col-sm-10">
            <input type="number" class="form-control" id="contactNo" name = "contactNo" placeholder="contactNo" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-2 col-form-label">E-mail</label>
            <div class="col-sm-10">
            <input type="email" class="form-control" id="email" name = "email" placeholder="e-mail" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="status" class="col-sm-2 col-form-label">Type of Occupant</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="status" name = "status" placeholder="Owner/Tenant" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="occupation" class="col-sm-2 col-form-label">Occupation</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="occupation" name = "occupation" placeholder="occupation" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="place" class="col-sm-2 col-form-label">Native</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="place" name = "place" placeholder="Native" required>
        </div>
        </div>
        <div class="form-group row">
            <label for="ownerContactNo" class="col-sm-2 col-form-label">Owner Contact Number</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="ownerContactNo" name = "ownerContactNo" placeholder="OwnerContactNumber" required>
        </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </fieldset>
    </div>
  </div>
  </div>
  </div>
</form>
</div>
</div>
</div>
</div>
<!-- tab2 -->
  <div class="tab-pane <c:if test="${activeTab == 'getvinfo'}">active</c:if>" id="getvinfo">
  <div class="bs-docs-section">
  <div class="row">
<div class="col-lg">
<div class="container">
    <div class="a">
	<div class="card border-info" style="max-width: 100rem;">
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> All residents </legend></div>
  	<div class="card-body">
   <table class="table table-hover" border=3>
    <thead style="color:white">
      <tr>
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
				<td><b>${resident.flatNo}</b></td>
				<td><b>${resident.userName}</b></td>
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
  </div>
</div>
</div>
</div>
</div>

<!-- tab 3 -->
<div class="tab-pane <c:if test="${activeTab == 'getrinfo'}">active</c:if>" id="getrinfo">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-3">
<form id = "form" method = "post" action="ResidentDetailsServlet">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend>Enter flat number</legend></div>
  	<div class="card-body">
  <fieldset>
  
<div class="form-group row">
            <div class="col-sm-10">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder = "flat No">
            </div>
</div>
<button class = "btn btn-primary" type ="submit" name="action">Get Resident details</button>
</fieldset>
</div>  
  </div>
  </div>
  </div>
  </form>
  </div>
<div class="col-lg-6">
<div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> Resident details </legend></div>
  	<div class="card-body">
<table class="table table-hover">
         <tbody>
        <tr class="table-active">
        <th scope="row">Flat Number</th>
        <td>${resident.getFlatNo()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">UserName</th>
        <td>${resident.getUserName()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">No Of Occupants</th>
        <td>${resident.getFamilySize()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Occupant Contact No</th>
        <td>${resident.getContactNo()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Email</th>
        <td>${resident.getEmail()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Type Of Resident</th>
        <td>${resident.getStatus()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Occupation</th>
        <td>${resident.getOccupation()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Native</th>
        <td>${resident.getPlace()}</td>
        </tr>
        <tr class="table-active">
        <th scope="row">Owner Contact No</th>
        <td>${resident.getOwnerContactNo()}</td>
        </tr>
        </tbody>
        </table>
  
  </div>
  </div>
  </div>
  </div>
</div>
<div class="col-lg-3">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend>Manage details</legend></div>
  	<div class="card-body">
  <fieldset>
  <form action="delete.jsp">
<button class="btn btn-primary" type = submit name="action" >Delete Resident</button>
<br></br>
</form>
<button class="btn btn-primary" id="myBtn">Edit Profile</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Occupant details form</h2>
    </div>
    <div class="modal-body">
 <div>    
<fieldset>
<form method="POST" action="updateResident.jsp">
<%
String flatNo=session.getAttribute("flatNo").toString();
//int no=Integer.parseInt(flatNo);
PreparedStatement pst1 = null;
//session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Residents where flatNo='"+flatNo+"'";
pst1 = conn.prepareStatement(QUERY);
//pst1.setString(1,no);

ResultSet rs1 = pst1.executeQuery(QUERY);
while(rs1.next()){
%>
<h2>Please edit the required occupant details</h2>

        <!--<div class="form-group row">
            <label for="flatNo" class="col-sm-2 col-form-label">FlatNo</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" value="/>
        </div>
        </div>-->
        <div class="form-group row">
            <label for="userName" class="col-sm-2 col-form-label">UserName</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="userName" name = "userName" value="<%=rs1.getString(2)%>"/>
        </div>
        </div>
        
        <!--<div class="form-group row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name = "password" value="<%=rs1.getString(3)%>"/>
        </div>
        </div>-->
        <div class="form-group row">
            <label for="familySize" class="col-sm-2 col-form-label">Number Of Occupants</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="familySize" name = "familySize" value="<%=rs1.getInt(4)%>"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="contactNo" class="col-sm-2 col-form-label">Contact Number</label>
            <div class="col-sm-10">
            <input type="number" class="form-control" id="contactNo" name = "contactNo" value="<%=rs1.getString(5)%>"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="email" class="col-sm-2 col-form-label">E-mail</label>
            <div class="col-sm-10">
            <input type="email" class="form-control" id="email" name = "email" value="<%=rs1.getString(6)%>"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="status" class="col-sm-2 col-form-label">Type of Occupant</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="status" name = "status" value="<%=rs1.getString(7)%>"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="occupation" class="col-sm-2 col-form-label">Occupation</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="occupation" name = "occupation" value="<%=rs1.getString(8)%>"/>
        </div>
        </div>
        <div class="form-group row">
            <label for="place" class="col-sm-2 col-form-label">Native</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="place" name = "place" value="<%=rs1.getString(9)%>"/>
        </div>
        </div>
        
        <div class="form-group row">
            <label for="ownerContactNo" class="col-sm-2 col-form-label">Owner Contact Number</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="ownerContactNo" name = "ownerContactNo" value="<%=rs1.getString(10)%>"/>
        </div>
        </div>
        <!--<div class="checkbox">
            <label><input type="checkbox"> Remember me</label>
        </div>-->
        <button type="submit" class="btn btn-primary">submit</button>
</form>
</fieldset>

    </div>
    <div class="modal-footer">
      <!--<h3></h3>-->
    </div>
  </div>

</div>
<%
}
}
catch(SQLException e){}
%>
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
<br></br>
<button class="btn btn-primary" id="myBtn2">Fill Bill Details</button>
<!-- The Modal -->
<div id="myModal2" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Bill details</h2>
    </div>
    <div class="modal-body">
      
 <center>
<fieldset>
<form method="post" action="updateBill.jsp">
<%

//String flatNo= session.getAttribute("flatNo").toString();
//int no1=Integer.parseInt(flatNo);
PreparedStatement pst0 = null;
//session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Bills where flatNo='"+flatNo+"'";
pst0 = conn.prepareStatement(QUERY);
ResultSet rs = pst0.executeQuery(QUERY);
if(rs.next() == false){
	final String SELECTQUERY = "insert into Bills values(?,?,?,?)";
	PreparedStatement pst3 = conn.prepareStatement(SELECTQUERY);
	pst3.setInt(1,Integer.parseInt(flatNo));
	pst3.setDouble(2,0);
	pst3.setDouble(3,0);
	pst3.setDouble(4,0);
	int rs1 = pst3.executeUpdate();
	
	PreparedStatement pst2 = conn.prepareStatement(QUERY);
	rs = pst2.executeQuery(QUERY);
}

rs.beforeFirst();
while(rs.next()){
%>
<div class="form-group row">
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
</div>
<button type="submit" class="btn btn-primary">update</button>
</form>
</fieldset>
</center>
</div>
<div class="modal-footer">
      <!--<h3></h3>-->
    </div>
</div>
</div>
<%
}

}

catch(SQLException e){}
%>	
<script>
//Get the modal
var modal2 = document.getElementById('myModal2');

// Get the button that opens the modal
var btn2 = document.getElementById("myBtn2");

// Get the <span> element that closes the modal
var span2 = document.getElementsByClassName("close")[1];

// When the user clicks the button, open the modal 
btn2.onclick = function() {
    modal2.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span2.onclick = function() {
    modal2.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal2) {
        modal2.style.display = "none";
    }
}
</script>	
<!-- <a href="checkDues.jsp">Check Dues</a>-->
<br></br>
<button class="btn btn-primary" id="myBtn1">Check Dues</button>

<!-- The Modal -->
<div id="myModal1" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Bill details</h2>
    </div>
    <div class="modal-body">
      
 <center>
<fieldset>
<form>
<%
//String flatNo=session.getAttribute("flatNo").toString();
//int no2=Integer.parseInt(flatNo);
PreparedStatement pst2 = null;
//session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Bills where flatNo='"+flatNo+"'";
pst2 = conn.prepareStatement(QUERY);
ResultSet rs = pst2.executeQuery(QUERY);

while(rs.next()){
%>
<b>MAINTENANCE</b>:<%=rs.getString(2) %><br>
<b>ELECTRICITY:</b><%=rs.getString(3)%><br>
<b>WATER:</b><%=rs.getString(4) %><br>
</form>
</fieldset>
</center>
    </div>
    <div class="modal-footer">
      <!--<h3></h3>-->
    </div>
  </div>

</div>
<%
}

}

catch(SQLException e){}
%>	
<script>
//Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("myBtn1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close")[2];

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
</div>
</div>		
</fieldset>
</div>  
  </div>
  </div>
  </div>

  </div>
</div>
</div>
</div>
</div>
</body>
</html>