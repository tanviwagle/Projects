<%@ page import="java.sql.*" %>
<html>
    <head> 
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <title> books</title>
        <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" href="home.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        
        <link rel="stylesheet" href="st.css">
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
        </head>
        <body > 
            <div class="navbar-fixed indigo darken-4">
    <nav>
      <div class="nav-wrapper">
        <a href="home.jsp" class="brand-logo center ">Tech Hybrid</a>
        <ul id="nav-mobile" class="center hide-on-med-and-down">
          <li><a href="home.jsp">Home</a></li>
        </ul>
        <ul>
          <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Categories<i
                class="material-icons right">arrow_drop_down</i></a></li>
          <ul id="dropdown1" class="dropdown-content">
            <%
                        try
                        {
                        	Class.forName("com.mysql.jdbc.Driver");
                        	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
                        	Statement st = con.createStatement();
                        	ResultSet rs = st.executeQuery("select id,category from category"); 
							
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

    

                
            <section id="top_offer">
       <div class="container">
       <h2>Books Available:</h2>
      <div class="row">
      <%
      try
	 {
    	  int id=Integer.parseInt(request.getParameter("imgid"));
	 	Class.forName("com.mysql.jdbc.Driver");
	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	 	Statement st = con.createStatement();
	 	ResultSet rs = st.executeQuery("select * from books where category1="+id+" or category2="+id+" or category3="+id); 
	 	
	  while(rs.next())
	  {
		  
		  int book_id=rs.getInt(1);
		  int price = rs.getInt(12);
	  	%>
		  	<div class="col m3">
	          <div class="card medium">
	            <div class="card-image">
	              	<img src="viewBook.jsp?imgid=<%=rs.getInt(1)%>">
	            </div>
	            <h5 class="card-title"><%= rs.getString("name") %></h5>
	
	            <p class="card-contents"></p>
	
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
             

</body>
</html>