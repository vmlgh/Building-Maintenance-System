<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@ page import = "com.ts.dbutility.DBConnection" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.ts.dto.Resident" %>
    <%@page import="java.sql.*" %> 
<%@page import="com.ts.dao.ResidentDAO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resident Profile</title>
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
  $( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker1" ).datepicker();
    $( "#datepicker2" ).datepicker();
    $( "#datepicker3" ).datepicker();
    $( "#datepicker4" ).datepicker();
  } );
  
  $(function () {
	  var hash = $.trim( window.location.hash );

	  if (hash) $('a[href$="'+hash+'"]').trigger('click');

	  });
  
  
  var supports_input_validity = function()
  {
    var i = document.createElement("input");
    return "setCustomValidity" in i;
  }
  
  window.onload = function () {
      var txtPassword = document.getElementById("newPassword");
      var txtConfirmPassword = document.getElementById("confirmPassword");
      txtPassword.onchange = ConfirmPassword;
      txtConfirmPassword.onkeyup = ConfirmPassword;
      function ConfirmPassword() {
          txtConfirmPassword.setCustomValidity("");
          if (txtPassword.value != txtConfirmPassword.value) {
              txtConfirmPassword.setCustomValidity("Passwords do not match.");
          }
      }
  }
  
  
  function validateBookings(element){
	  if(supports_input_validity()) {
			var id = element.getAttribute('id');
			console.log("id:" + id);
		    var idInput = document.getElementById(id);
		    if(element.value < 1){
		    	idInput.setCustomValidity("please give the number of bookings");
		    } else if (element.value > 6){
		    	idInput.setCustomValidity("Sorry!! more than 6 bookings are not allowed");
		    } else {
		    	idInput.setCustomValidity("");
		    }
	    
	    
	  }
  }



  
  
  </script>
<script type="text/javascript">
  function closeSelf (f) {
     f.submit();
     window.close();
  }
  
  

</script>


<style>
body {font-family: Arial, Helvetica, sans-serif;
    margin: 0;
    font-size: 15px;
    padding:0px 0px;
    
}

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
    /*background-color: rgb(0,0,0); /* Fallback color */
    /*background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    /*background-color: #fefefe;*/
    margin: auto;
    padding: 0;
    border: 1px solid #000;
    width: 60%;
   /* box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);*/
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

div.container{
/*text-align: left;*/
    margin: 0;
    /*font-size: 20px;*/
    padding:1em;
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
    color: #ffffff;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    /*color: #000;*/
    color:#ffffff;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    /*padding: 2px 16px;*/
    /*background-color: #5cb85c;*/
    background-color:#000000;
    color: white;
    float: left;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #000000;
    color: white;
}
.logoutLblPos{

   /*position:right;*/
   float:right;
   right:10px;
   top:5px;
}
/*.button:hover {background-color: #3e8e41}

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
}*/
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>


<body>
<% 
//Resident resident = (Resident)request.getAttribute("resident"); 
ResidentDAO residentDAO = new ResidentDAO();
String userName = session.getAttribute("userName").toString();
String password = session.getAttribute("password").toString();
Resident resident = residentDAO.getResidentProfile(userName,password);
session.setAttribute("flatNo", resident.getFlatNo());
   
   %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<!--<form action="Entertainment/index1.jsp">
  <input type="image" src="Game-Center-icon.png" alt="Submit" width="50" height="50">
</form>-->
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
<div class="navbar-collapse collapse"  id="navbarColor01">
<ul class="navbar-nav mr-auto">
    
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#amenities"><i class="fas fa-ticket-alt"></i> Amenities</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#profile"><i class="far fa-user-circle"></i> Profile</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#editProfile"><i class="fas fa-edit"></i> Edit Details</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#checkDues"><i class="fas fa-receipt"></i> Dues</a>
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
   
  <!-- tab4 -->
  <div class="tab-pane" id="checkDues">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-6">
  <form action="https://paytm.com/" method>
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-receipt"></i> Dues</legend></div>
  	<div class="card-body">
  <center>
<fieldset>
<%
//String flatNo = request.getAttribute("flatNo").toString();
String flatNo = session.getAttribute("loggedUser").toString();
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


<button class = "btn btn-primary" type = submit name="action" >Pay bills now</button>

<%
}

}

catch(SQLException e){}
%>
</fieldset>
</center>
</div>
</div>
</div>
</div>
</form>
  
  </div>
  </div>
  </div>
  </div>
  
  <!-- tab3 -->
  <div class="tab-pane" id="editProfile">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-6">
    <form method="post" action="editResidentDetails.jsp">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> Edit Profile</legend></div>
  	<div class="card-body">
  <fieldset>
    <div class="form-group row">
      <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
      <div class="col-sm-10">
        <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" value="email@example.com">
      </div>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" value="<%= resident.getEmail() %>">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
      <label for="userName">userName</label>
        <input type="text" class="form-control" id="userName" name="userName" value="<%= resident.getUserName() %>">
    </div>
    
    <div class="form-group">
      <label for="occupantContactNo">Occupant Contact No</label>
        <input type="text" class="form-control" id="occupantContactNo" name="contactNo" value="<%= resident.getContactNo() %>">
    </div>
    <div class="form-group">
      <label for="noOfOccupants">No Of Occupants</label>
      
        <input type="text" class="form-control" id="noOfOccupants" name="noOfOccupants" value="<%= resident.getFamilySize() %>">
     
    </div>
    <div class="form-group">
      <label for="occupation">Occupation</label>
      
        <input type="text" class="form-control" id="occupation" name="occupation" value="<%= resident.getOccupation() %>">
      
    </div>
    <div class="form-group">
      <label for="native">Native</label>
        <input type="text" class="form-control" id="native" name="place" value="<%= resident.getPlace() %>">
      
    </div>
    
    <!--<div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>-->
    <button type="submit" class="btn btn-primary">Submit</button>
  </fieldset>
  </div>
  </div>
  </div>
  </div>
</form>
</div>
<div class="col-lg-6">
    <form id="form" method="post" onsubmit="return closeSelf(this);" action="changePassword.jsp">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-unlock-alt"></i> Change Password</legend></div>
  	<div class="card-body">
  <fieldset>
  
<div class="form-group row">
            <label for="newPassword" class="col-sm-3 col-form-label">New Password</label>
            <div class="col-sm-9">
            <input type="password" class="form-control" id="newPassword" name = "newPassword" placeholder = "new password" required pattern="(?=.*\d)(?=.*[a-z]).{6,}" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers.">
</div>
</div>
<div class="form-group row">
            <label for="confirmPassword" class="col-sm-3 col-form-label">Confirm Password</label>
            <div class="col-sm-9">
            <input type="password" class="form-control" id="confirmPassword" name = "confirmPassword" placeholder = "confirm password" required pattern="(?=.*\d)(?=.*[a-z]).{6,}" title="Please enter the same Password as above.">
</div>
</div>

<button class = "btn btn-primary" type ="submit" name="action"><i class="fas fa-key"></i> Change Password</button>
  
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
  <div class="tab-pane active show" id="profile">
  <div class="container">
  <div class="content">
<div class="a">
<div class="card border-info mb-3" style="max-width: 45rem;">
  <div class="card-header"><h3><i class="fas fa-user-circle"></i>PROFILE</h3></div>
  <div class="card-body">
           <table class="table table-hover">
         <tbody>
        <tr class="table-active">
        <th scope="row">Flat Number</th>
        <td><%= resident.getFlatNo() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">UserName</th>
        <td><%= resident.getUserName() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">No Of Occupants</th>
        <td><%= resident.getFamilySize() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Occupant Contact No</th>
        <td><%= resident.getContactNo() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Email</th>
        <td><%= resident.getEmail() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Type Of Resident</th>
        <td><%= resident.getStatus() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Occupation</th>
        <td><%= resident.getOccupation() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Native</th>
        <td><%= resident.getPlace() %></td>
        </tr>
        <tr class="table-active">
        <th scope="row">Owner Contact No</th>
        <td><%= resident.getOwnerContactNo() %></td>
        </tr>
        </tbody>
        </table>
  
  
 </div>
</div>


			
</div>
<!--</center>-->			


<!-- <h2>Animated Modal with Header and Footer</h2>-->

<!-- Trigger/Open The Modal -->
<!--<form action="https://paytm.com/" method>
<button class = "btn btn-warning" type = submit name="action" >Pay bills now</button>
</form>-->




</div>
</div>

  
  </div>
  <!-- tab1 -->

  <div class="tab-pane" id="amenities">
  <div class="container-fluid" style="padding-top: 70px">
  
  <div class="row justify-content-around">
  <div class="col-lg-4">
  <div class="card border-info">
    <img class="card-img-top" src="Entertainment/theatre1.jpg" alt="Card image" style="width:100%;height: 10rem;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">Theatre</h4>
      <p class="card-text">Bringing the world inside!</p>
      <form autocomplete="off" action="Amenities"  method="POST">
      <fieldset>
      <div class="form-group">
      <label for="datepicker">Day</label>
        <input type="text" class="form-control" id="datepicker" name="datepicker" placeholder="mm/dd/yyyy">
      </div>
    <div class="form-group">
      <label for="slotpicker">slot</label>
      <select class="form-control" id="slotpicker" name="slotpicker">
        <option>select</option>
        <option>1 (7:00AM-10:00AM)</option>
        <option>2 (10:30PM-2:30PM)</option>
        <option>3 (3:00PM-6:00PM)</option>
        <option>4 (6:30PM-10:00PM)</option>
      </select>
    </div>
    <div class="form-group">
      <label for="bookings">bookings</label>
        <input type="text" class="form-control" id="bookings1" name="bookings" placeholder="1-6" onkeyup="validateBookings(this);">
      </div>
    <button type="submit" class="btn btn-primary" name="action" value="Theatre">Submit</button>
    </fieldset>
    </form>
      

    </div>
  </div>
  </div>
  <div class="col-lg-4">
  <div class="card border-info">
    <img class="card-img-top" src="Entertainment/football1.jpg" alt="Card image" style="width:100%;height: 10rem;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">Football</h4>
      <p class="card-text">Let's get the ball rolling!!!</p>
      <form autocomplete="off" action="Amenities"  method="POST">
      <fieldset>
      <div class="form-group">
      <label for="datepicker1">Day</label>
        <input type="text" class="form-control" id="datepicker1" name="datepicker" placeholder="mm/dd/yyyy">
      </div>
    <div class="form-group">
      <label for="slotpicker">slot</label>
      <select class="form-control" id="slotpicker" name="slotpicker">
        <option>select</option>
        <option>1 (7:00AM-10:00AM)</option>
        <option>2 (10:30PM-2:30PM)</option>
        <option>3 (3:00PM-6:00PM)</option>
        <option>4 (6:30PM-10:00PM)</option>
      </select>
    </div>
    <div class="form-group">
      <label for="bookings">bookings</label>
        <input type="text" class="form-control" id="bookings2" name="bookings" placeholder="1-6" onkeyup="validateBookings(this);">
      </div>
    <button type="submit" class="btn btn-primary"  name="action" value="Football">Submit</button>
    </fieldset>
    </form>
    </div>
  </div>
  </div>
  <div class="col-lg-4">
  <div class="card border-info">
    <img class="card-img-top" src="Entertainment/badminton1.jpg" alt="Card image" style="width:100%;height: 10rem;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">Badminton</h4>
      <p class="card-text">Let the RACKET do the talking!!</p>
      <form autocomplete="off" action="Amenities"  method="POST">
      <fieldset>
      <div class="form-group">
      <label for="datepicker2">Day</label>
        <input type="text" class="form-control" id="datepicker2" name="datepicker" placeholder="mm/dd/yyyy">
      </div>
    <div class="form-group">
      <label for="slotpicker">slot</label>
      <select class="form-control" id="slotpicker" name="slotpicker">
        <option>select</option>
        <option>1 (7:00AM-10:00AM)</option>
        <option>2 (10:30PM-2:30PM)</option>
        <option>3 (3:00PM-6:00PM)</option>
        <option>4 (6:30PM-10:00PM)</option>
      </select>
    </div>
    <div class="form-group">
      <label for="bookings">bookings</label>
        <input type="text" class="form-control" id="bookings3" name="bookings" placeholder="1-6" onkeyup="validateBookings(this);">
      </div>
    <button type="submit" class="btn btn-primary" name="action" value="Badminton">Submit</button>
    </fieldset>
    </form>
    </div>
  </div>
  </div>
  </div>
  <br><br>
  <div class="row justify-content-around">
  <div class="col-lg-4">
  <div class="card border-info" >
    <img class="card-img-top" src="Entertainment/swimmingpool1.jpg" alt="Card image" style="width:100%;height: 10rem;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">Swimming Pool</h4>
      <p class="card-text">Wanna turn heads? Make waves!</p>
     <form autocomplete="off" action="Amenities"  method="POST">
      <fieldset>
      <div class="form-group">
      <label for="datepicker3">Day</label>
        <input type="text" class="form-control" id="datepicker3" name="datepicker" placeholder="mm/dd/yyyy">
      </div>
    <div class="form-group">
      <label for="slotpicker">slot</label>
      <select class="form-control" id="slotpicker" name="slotpicker">
        <option>select</option>
        <option>1 (7:00AM-10:00AM)</option>
        <option>2 (10:30PM-2:30PM)</option>
        <option>3 (3:00PM-6:00PM)</option>
        <option>4 (6:30PM-10:00PM)</option>
      </select>
    </div>
    <div class="form-group">
      <label for="bookings">bookings</label>
        <input type="text" class="form-control" id="bookings4" name="bookings" placeholder="1-6" onkeyup="validateBookings(this);">
      </div>
    <button type="submit" class="btn btn-primary" name="action" value="Swimmingpool">Submit</button>
    </fieldset>
    </form>
    </div>
  </div>
  </div>
  <div class="col-lg-4">
  <div class="card border-info">
    <img class="card-img-top" src="Entertainment/gym.jpg" alt="Card image" style="width:100%;height: 10rem;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">Gym</h4>
      <p class="card-text">Commit to be fit</p>
      <form autocomplete="off" action="Amenities"  method="POST">
      <fieldset>
      <div class="form-group">
      <label for="datepicker4">Day</label>
        <input type="text" class="form-control" id="datepicker4" name="datepicker" placeholder="mm/dd/yyyy">
      </div>
    <div class="form-group">
      <label for="slotpicker">slot</label>
      <select class="form-control" id="slotpicker" name="slotpicker">
        <option>select</option>
        <option>1 (7:00AM-10:00AM)</option>
        <option>2 (10:30PM-2:30PM)</option>
        <option>3 (3:00PM-6:00PM)</option>
        <option>4 (6:30PM-10:00PM)</option>
      </select>
    </div>
    <div class="form-group">
      <label for="bookings">bookings</label>
        <input type="text" class="form-control" id="bookings5" name="bookings" placeholder="1-6" onkeyup="validateBookings(this);">
      </div>
    <button type="submit" class="btn btn-primary" name="action" value="Gym">Submit</button>
    </fieldset>
    </form>
    </div>
  </div>
  </div>
  
  </div>
</div>
    
  </div>
</div>
</body>
</html>