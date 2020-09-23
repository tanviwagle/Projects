<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home</title>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" href="home.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>

<body>
  <!--NAVBAR-->
  <div class="navbar-fixed indigo darken-4">
    <nav>
      <div class="nav-wrapper">
        <a href="adminHome.jsp" class="brand-logo center ">Tech Hybrid</a>
        <ul id="nav-mobile" class="center hide-on-med-and-down">
          <li><a href="bookAdd.jsp">Add Book</a></li>
          <li><a href="Update1.jsp">Update Book</a></li>
          <li><a href="bookDelete.jsp">Delete Book</a></li>
        </ul>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </div>
    </nav>
  </div>
  </body>
  </html>