<%@ page import="java.sql.*" %>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" href="home.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<!--dropdown Jquery Script-->
<script>
  $(document).ready(function () {
    $(".carousel").carousel(
      {
        indicators: true,
		fullWidth:true
      });
    $(".dropdown-trigger").dropdown();
  });

</script>

<%! String cat, name, img;
int id;%>
<body>
  <!--NAVBAR-->
  <div class="navbar-fixed indigo darken-4">
    <nav>
      <div class="nav-wrapper">
        <a href="#" class="brand-logo center ">Tech Hybrid</a>
        <ul id="nav-mobile" class="center hide-on-med-and-down">
          <li><a href="home.jsp">Home</a></li>
        </ul>
        <ul>
          <li><a class="dropdown-trigger" data-target="dropdown1">Categories<i class="material-icons right">arrow_drop_down</i></a></li>
          <ul id="dropdown1" class="dropdown-content">
            <%
                        try
                        {
                        	Class.forName("com.mysql.jdbc.Driver");
                        	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
                        	Statement st = con.createStatement();
                        	ResultSet rs = st.executeQuery("select id, category from category"); 
							
	                        while(rs.next())
	                        {
	                        	id=rs.getInt(1);
	                        	cat=rs.getString(2);%>
	                        	<li><a href="book.jsp?imgid=<%=id%>"><%=cat %></a></li>
	                        	<%
	                        }
                        }
                        catch(Exception e)
                        {
                        	e.printStackTrace();
                        }
                        %>
          </ul>
        </ul>
        
        <ul id="nav-mobile" class="right hide-on-med-and-down">
        
        <% String userName=(String)session.getAttribute("userName");
        if(userName==null)
        {%>
        	<li><a href="loginRegister.jsp">Login</a></li>
        <%
        
        }
        
        else{%>
        	
       		 <li><a class="dropdown-trigger" data-target="dropdown2">Welcome <%=userName.toUpperCase()%><i class="material-icons right">arrow_drop_down</i></a></li>
         	 <ul id="dropdown2" class="dropdown-content">
	        	<li><a href="MyProfile.jsp">Profile</a></li>
	            <li><a href="logout.jsp">Logout</a></li>
            </ul>
            <li><a href="cart.jsp"><i class="material-icons right">add_shopping_cart</i></a></li>
        	<% 
        }
        %>
     
 		 </ul>
      </div>
    </nav>
  </div>

  <div class="carousel carousel-slider">
    <a href="#one" class="carousel-item"><img src="JEE-Textbooks-2020-PC.jpg"></a>
    <a href="#one" class="carousel-item"><img src="50off.jpg"></a>
  </div>
  
 
  <!--top offers-->

  <section id="top_offer">
    <h2 class="top_offer">Top offers</h2>
    <div class="container">
      <div class="row">
      <%
      try
	 {
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	 	Statement st = con.createStatement();
	 	ResultSet rs = st.executeQuery("select * from books order by rand() limit 4"); 
	
	  while(rs.next())
	  {
		  int book_id=rs.getInt(1);
		  int price = rs.getInt(12);
	  	%>
	  	<div class="col m3">
          <div class="card medium">
            <div class="card-image">
              	<img src="view.jsp?imgid=<%=book_id%>">
            </div>
            <h5 class="card-title"><%=rs.getString("name") %></h5>

            <p class="card-contents"> by <%= rs.getString("author1") %></p>

            <div class="card-action">
              <a href="bookDesc.jsp?bid=<%=book_id%>">View Details</a>
              <a href="Cart_insert.jsp?book_id=<%=book_id%>&price=<%=price%>">Cart</a>
            </div>
          </div>
        </div>
	  	<%
	  }
	 }
     catch(Exception e)
     {
     	e.printStackTrace();
     }
     %>
        
      </div>

    </div>
  </section>
  
  <!--new arrival-->
  <section id="new_arrival">
    <h2 class="new_arrival">New Arrivals</h2>
    <div class="container">

      <div class="row">
      
      <%
      try
	 {
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	 	Statement st = con.createStatement();
	 	ResultSet rs = st.executeQuery("select * from books order by rand() limit 4"); 
	
	  while(rs.next())
	  {
		  int book_id=rs.getInt(1);
		  int price = rs.getInt(12);
	  	%>
        <div class="col m3">
          <div class="card medium">
            <div class="card-image">
              	<img src="view.jsp?imgid=<%=book_id %>">
            </div>
            <h5 class="card-title"><%= rs.getString("name") %></h5>
            <p class="card-contents">by <%= rs.getString("author1") %></p>
            <div class="card-action">
              <a href="bookDesc.jsp?bid=<%=book_id%>">View Details</a>
              <a href="Cart_insert.jsp?book_id=<%=book_id%>&price=<%=price%>">Cart </a>
            </div>
          </div>
        </div>
        <%
	  }
	 }
     catch(Exception e)
     {
     	e.printStackTrace();
     }
     %>

      </div>
    </div>

  </section>

  <!--featured author-->

  <section id="prom-authors">
    <h2 class="featured_authors">Featured Authors</h2>
    <div class="container">
      <div class="row">
      
      <%
      try
	 {
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	 	Statement st = con.createStatement();
	 	ResultSet rs = st.executeQuery("select * from author order by rand() limit 4"); 
	
	  while(rs.next())
	  {
	  	%>
        <div class="author1 col m3">
              	<img src="viewAuthor.jsp?imgid=<%=rs.getInt(1)%>" class="avatar" alt="<%=name %>">
		          <p class="author"><%=rs.getString("name") %></p>

        </div>
        
        <%
	  }
	 }
     catch(Exception e)
     {
     	e.printStackTrace();
     }
     %>

      </div>
    </div>

  </section>

  <!--footer-->
  <footer class="page-footer">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">Tech Hybrid</h5>
          <p class="grey-text text-lighten-4">India's Largest Selling book website.</p>
        </div>
        <div class="col l4 offset-l2 s12">
          <h5 class="white-text">Contact us</h5>
          <ul>
            <li><a class="grey-text text-lighten-3" href="#!">+91 9619268843</a></li>
            <li><a class="grey-text text-lighten-3" href="#!">techhybrid@gmail.com</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
        © 2019 Copyright
        <a class="grey-text text-lighten-4 right" href="#!"></a>
      </div>
    </div>
  </footer>

</body>
</html>