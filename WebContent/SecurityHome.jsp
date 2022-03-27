<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import = "com.ts.dbutility.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">-->
<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.1/solar/bootstrap.min.css" rel="stylesheet" integrity="sha384-5R1YdaymXlWnSzNCZhBMJnL6ZRBonq3cnj8A38eihLMaAb66oNJhErrQy9jIGHkl" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">-->
<title>Security HomePage</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.1/darkly/bootstrap.min.css" rel="stylesheet" integrity="sha384-ae362vOLHy2F1EfJtpMbNW0i9pNM1TP2l5O4VGYYiLJKsaejqVWibbP6BSf0UU5i" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.logoutLblPos{

   position:fixed;
   right:10px;
   top:5px;
}
</style>
</head>
<body style="background-image:url(visitors.jpg) ;background-position:center">
    <center>
    <!--<h1 style="text-decoration:underline">Visitor Details</h1>-->
    
    <div class = "row">
    
    
    <div class = "col-lg-6">
    <form action = "VisitorServlet" method="post">
  <fieldset>
  <h1 style="text-decoration:underline;color:black">Visitor Details</h1>
    <div class="form-group">
        <label for="flatNo" class="control-label col-lg-3"><large>Flat Number</large></label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder="Flat No">
        </div>
    </div>
    <div class="form-group">
        <label for="visitorName" class="control-label col-lg-3">Visitor Name</label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="visitorName" name = "visitorName" placeholder="Visitor Name">
        </div>
    </div>
    <div class="form-group">
        <label for="noOfVisitors" class="control-label col-lg-3">Number Of Visitors</label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="noOfVisitors" name = "noOfVisitors" placeholder="Number of visitors">
        </div>
    </div>
    <div class="form-group">
        <label for="purpose" class="control-label col-lg-3">Purpose</label>
        <div class="col-lg-5">
            <input type="text" class="form-control" id="purpose" name = "purpose" placeholder="">
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </div>
    </fieldset>
</form>
</div>

<form action = "SecurityServlet" method = "POST">
<div class="row">
<div class = "col-xs-6">
<div class="form-group">
        <label for="flatNo" class="control-label col-xs-12 text-center">Enter Flat Number to get information</label>
        <div class="col-xs-12">
            <input type="text" class="form-control" id="flatNo" name = "flatNo" placeholder="Flat No"/>
        </div>
    </div>
<button type="submit" class="btn btn-info" name="action" value = "GetVisitorDetailsServlet">Get Visitor Details</button>
<button type="submit" class="btn btn-info" name="action" value = "SecurityResidentServlet">Get Resident Details</button>


</div>
</div>
</form>
<form name="form1" method="post" action="welcome.html">
  <label class="logoutLblPos">
  <button class="btn btn-primary" name="submit2" type="submit" id="submit2" value="log out"><span class="glyphicon glyphicon-log-out"></span>Log out</button>
  </label>
</form>
</div>



</center>



</body>

</html>