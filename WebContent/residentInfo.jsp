<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    <%@ page import = "com.ts.dbutility.DBConnection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Resident Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
body {font-family: Arial, Helvetica, sans-serif;}
.container {
    position: relative;
    background: rgba(0, 0, 0, 0);
    max-width: 1920px;
    margin: 0 auto;
}.container img {vertical-align: middle;}
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
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
</head>
<body style="background-image:url(visitors.jpg) ;background-position:center;background-repeat:no-repeat;padding:5em">
<div class="container">
<!--<img src="img2.jpg" alt="Notebook" style="width:100%">-->
 <div class="content">
<h1><b>PROFILE</b></h1>

<% 
String flatNo= session.getAttribute("flatNo").toString();
PreparedStatement pst = null;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Residents where flatNo="+flatNo+"";
pst = conn.prepareStatement(QUERY);
ResultSet rs = pst.executeQuery(QUERY);
while(rs.next()){
 %>


		
			<b>Flat number : </b> <%= rs.getInt(1) %><br>
			<b>User name : </b> <%= rs.getString(2) %><br>
			<b>Number of occupants :</b>  <%= rs.getInt(4) %><br>
			<b>Occupant contact number :</b>  <%= rs.getString(5) %><br>
			<b>email :</b>  <%= rs.getString(6) %><br>
			<b>Type of resident :</b>  <%= rs.getString(7) %><br>
			<b>Occupation : </b> <%= rs.getString(8) %><br>
			<b>Native :</b>  <%= rs.getString(9) %><br>
			<b>Owner contact number :</b>  <%= rs.getString(10) %><br>
			<br>
			<br>
		
<%}
}
catch(SQLException e){}%>			
			
<!--<a href="edit.jsp">EditProfile</a>-->
<button class="btn btn-info" id="myBtn">Edit Profile</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Occupant details form</h2>
    </div>
    <div class="modal-body">
      
 <center>
<fieldset>
<form method="POST" action="updateResident.jsp">
<%
//String flatNo1=session.getAttribute("flatNo").toString();
//int no=Integer.parseInt(flatNo1);
System.out.println(flatNo);
PreparedStatement pst1 = null;
//session.setAttribute("flatNo", flatNo1);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Residents where flatNo="+flatNo+"";
pst1 = conn.prepareStatement(QUERY);
//pst1.setString(1,flatNo);

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
<form action="delete.jsp" method>
<button class="btn btn-info" type = submit name="action" >Delete Resident</button>
<br>
</form>
<button class="btn btn-info" id="myBtn2">Fill Bill details</button>

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
//int no=Integer.parseInt(flatNo);
//PreparedStatement pst = null;
//session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Bills where flatNo='"+flatNo+"'";
pst = conn.prepareStatement(QUERY);
ResultSet rs = pst.executeQuery(QUERY);
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
<br>
<button class="btn btn-info" id="myBtn1">Check Dues</button>

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
int no=Integer.parseInt(flatNo);
//PreparedStatement pst = null;
session.setAttribute("flatNo", flatNo);
//int sumcount=0;
try(Connection conn = DBConnection.getConnection();) {
final String QUERY = "select * from Bills where flatNo='"+no+"'";
pst = conn.prepareStatement(QUERY);
ResultSet rs = pst.executeQuery(QUERY);

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
</body>
</html>