<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Secretary Home Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;
height:100%;
margin: 0;
padding: 15em;
bottom: 0;
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
    background-color:  #cc6600;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color:  #cc6600;
    color: white;
}

.logoutLblPos{

   position:fixed;
   right:10px;
   top:5px;
}
</style>
</head>
<body class = "img-responsive" style="background-image:url(choice.jpg) ;background-position:center; background-size: cover; background-repeat: no-repeat">
<center>

<!-- <h2>Animated Modal with Header and Footer</h2>-->

<!-- Trigger/Open The Modal -->
<button id="myBtn" type="submit" class="btn btn-warning">Add new Resident</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <center><h2>Occupant details form</h2></center>
    </div>
    <div class="modal-body">
      <!--<p>Some text in the Modal Body</p>
      <p>Some other text...</p>-->
 <center>
<fieldset>
<form action="ResidentServlet" method="POST">
<h2>Please enter the occupant details</h2>

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
        <div class="checkbox">
            <label><input type="checkbox"> Remember me</label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
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
<center>
<br><br>
<!-- <br><a href="DisplayAllResidents">Display All Residents</a><br>-->
<form action="DisplayAllResidents" method="POST">
<div class="form-group">
 <button type="submit" class="btn btn-warning">Display All Residents</button> 
</div>
</form>
<form action="ResidentDetailsServlet" method="POST">
<div class="form-group">
  <label class="col-form-label" style="color: white" for="flatNo">Flat Number</label><br>
  <input type="text" style="width:20%" class="form-control" placeholder="FlatNo" id="flatNo" name="flatNo"/><br>
<button type="submit" class="btn btn-warning">Get Information</button>
</div>
</form>

<form name="form1" method="post" action="welcome.html">
  <label class="logoutLblPos">
  <button class="btn btn-primary" name="submit2" type="submit" id="submit2" value="log out"><span class="glyphicon glyphicon-log-out"></span>Log out</button>
  </label>
</form>
<!-- <form action="ResidentDetailsServlet" method="POST">
FlatNo:
<input type = "text" name = "flatNo" placeholder = "flatNo"/><br>
<button type="submit" class="btn btn-warning">Get Information</button>
</form>-->
</center>

</center>
</body>
</html>
