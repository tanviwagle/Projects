<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Sidebar 01</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/styleAdmin.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
		
	<script>
	function home()
	{
		var xhttp=new XMLHttpRequest();
		console.log("Here");
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    document.getElementById("table").innerHTML = this.responseText;
		    }
		 };
		 xhttp.open("GET", "addDetail.jsp", true);
		 xhttp.send();
	}
	
	function user()
	{
		var xhttp=new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    document.getElementById("table").innerHTML = this.responseText;
		    }
		 };
		 xhttp.open("GET", "viewUser.jsp", true);
		 xhttp.send();
	}
	
	function feedback()
	{
		var xhttp=new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    document.getElementById("table").innerHTML = this.responseText;
		    }
		 };
		 xhttp.open("GET", "viewFeedback.jsp", true);
		 xhttp.send();
	}
	
	function details()
	{
		var xhttp=new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    document.getElementById("table").innerHTML = this.responseText;
		    }
		 };
		 xhttp.open("GET", "fetchDetails.jsp", true);
		 xhttp.send();
	}
	
    function deleteRecord(id){
        window.location.replace('deleteDetail.jsp?id='+id);
    }
    function updateRecord(id){
    	var xhttp=new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    document.getElementById("table").innerHTML = this.responseText;
		    }
		 };
		 xhttp.open("GET", "updateDetail.jsp?id="+id, true);
		 xhttp.send();
    }
    </script>
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="slider_text text-center">
		  			<h3>CARZANIA</h3>
		  		</a>
		  		<br>
		  		<p style="font-size:20px">Welcome ADMIN!!</p>
                   
		  		<br><br>
		        <ul class="list-unstyled components mb-5">
		          <li>
		            <a onClick="home()">Add details</a>
		          </li>
		          <li>
		            <a onClick="details()">View/Delete/Update details</a>
		          </li>
		          <li>
		              <a onClick="user()">Users</a>
		          </li>
		          <li>
	              	<a onClick="feedback()">Feedback</a>
		          </li>
		          <li>
	              <a href="logout.jsp">Logout</a>
		          </li>
		        </ul>


		      </div>
	    	</nav>

      <div id="content" class="p-4 p-md-5">
		<div class="card" id="table" style="width:100%">
      		<h1 class="slider_text text-center">Welcome to CARZANIA Admin Page</h1>
    	</div>
	</div>
	</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>