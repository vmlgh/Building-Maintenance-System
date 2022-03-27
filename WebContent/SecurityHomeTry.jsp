<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.ts.dao.VisitorDAO" %>
    <%@page import="com.ts.dto.Visitor" %>
    <%@page import="com.ts.dto.Resident" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Security Home</title>
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
</style>
</head>
<body>
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
    <a class="nav-link" data-toggle="tab" href="#addvisitor"><i class="fas fa-ticket-alt"></i> Add visitor details</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#getvinfo"><i class="far fa-user-circle"></i> Get visitor details</a>
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
  <div class="tab-pane" id="addvisitor">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-6">
    <form method="post" action="VisitorServlet">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> Fill visitor details </legend></div>
  	<div class="card-body">
  	<fieldset>
    <div class="form-group">
        <label for="flatNo" class="control-label col-lg-4"><large>Flat Number</large></label>
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder="Flat No">
    </div>
    <div class="form-group">
        <label for="visitorName" class="control-label col-lg-4">Visitor Name</label>
       
            <input type="text" class="form-control" id="visitorName" name = "visitorName" placeholder="Visitor Name">
      
    </div>
    <div class="form-group">
        <label for="noOfVisitors" class="control-label col-lg-4">Number Of Visitors</label>
        
            <input type="text" class="form-control" id="noOfVisitors" name = "noOfVisitors" placeholder="Number of visitors">
      
    </div>
    <div class="form-group">
        <label for="approval" class="control-label col-lg-4">Purpose</label>
       
            <input type="text" class="form-control" id="purpose" name = "purpose" placeholder="Family/Package delivery/other">
        
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
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
  <div class="col-lg-6">
<form id = "form" method = "post" action="GetVisitorDetails">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend>Enter flat number</legend></div>
  	<div class="card-body">
  <fieldset>
  
<div class="form-group row">
            <label for="flatNo" class="col-sm-2 col-form-label">Flat Number</label>
            <div class="col-sm-10">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder = "flat No">
            </div>
</div>
<button class = "btn btn-primary" type ="submit" name="action">Get Visitor details</button>
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
	<div class="card-header"><legend><i class="fas fa-user-edit"></i> Visitor details </legend></div>
  	<div class="card-body">
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
  </div>
</div>
</div>
</div>
</div>

<!-- tab 3 -->
<div class="tab-pane <c:if test="${activeTab == 'getrinfo'}">active</c:if>" id="getrinfo">
  <div class="bs-docs-section">
  <div class="row">
  <div class="col-lg-6">
<form id = "form" method = "post" action="GetResidentDetails">
    <div class="container">
    <div class="a">
	<div class="card border-info mb-3" style="max-width: 45rem;">
	<div class="card-header"><legend>Enter flat number</legend></div>
  	<div class="card-body">
  <fieldset>
  
<div class="form-group row">
            <label for="flatNo" class="col-sm-2 col-form-label">Flat Number</label>
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
</div>
</div>
</div>
</div>
</body>
</html>