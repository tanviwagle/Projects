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
    <link rel="stylesheet" href="desc.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<!--dropdown Jquery Script-->
<script>
    $(document).ready(function () {
        $(".carousel").carousel();

        $(".dropdown-trigger").dropdown();
    });

    $(document).ready(function () {
        
        $(".dropdown-trigger").dropdown();
      });
</script>
<body>

<%!
String name, year, isbn, lang, desc, bind, img, cat, auth1, auth2, auth3;
int edition, pages, price, id;
float mrp, disc;

%>
<%
int book_id = Integer.parseInt(request.getParameter("bid"));
%>

<%
try
{
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from books where id="+book_id); 
	while(rs.next()) 
	{  
	     name=rs.getString(2);
	     year=rs.getString(3); 
	     edition=rs.getInt(4);      
	     isbn=rs.getString(5);      
	     pages=rs.getInt(6);   
	     mrp=rs.getFloat(7);     
	     lang=rs.getString(8);
	     desc=rs.getString(9);
	     bind=rs.getString(10);    
	     img=rs.getString(11);        
	     price=rs.getInt(12);       
	     disc=rs.getFloat(13); 
	     auth1=rs.getString(14);
	     auth2=rs.getString(15);
	     auth3=rs.getString(16);
	   }
	  } catch(Exception e)
        {
    		e.printStackTrace(); 
        }

%>
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

    <section id="book_desc">
        <div class="container">
            <div class="row">
                <div class="col m5">
                    <div class="carousel">
                        <%
						      try
							 {
							 	Class.forName("com.mysql.jdbc.Driver");
							 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
							 	Statement st = con.createStatement();
								ResultSet rs=st.executeQuery("select * from images where bookId="+book_id+" limit 4"); 
								  while(rs.next())
								  {
								  	%>
								  	<a class="carousel-item"><img src="bookDescImage.jsp?imgid=<%=rs.getInt(1)%>"></a>
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
                <div class=" desc col m7">
                    <h3><%=name %></h3>
                    <p>
                    By author: <%=auth1 %>  <%=auth2 %>   <%=auth3 %> | Publisher: Vintage Publishing | Released: <%=year %></p>
                    <p> <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                    </p>
                    <p>Ships within 3-4 Business Days</p>
                    <h5>Price: &#8377; <strike><%=mrp %></strike></h5>
                    <h5 class="new_price">Price: &#8377; <%=price %></h5>

                 <!--   <a class="waves-effect waves-light btn">Buy Now</a> -->
                    <a href="Cart_insert.jsp?book_id=<%=book_id%>&price=<%=price%>" class="waves-effect waves-light btn">Add to Cart</a>
                </div>
            </div>
            <hr>

            <div class="row">
                <div class="col m12" style="width: 75%; align: center;">
                    <h4>About the Book</h4>
                    <p style="word-wrap: break-word;"><%=desc %><p>
                            <p>ISBN-13: <%=isbn %></p>
                            <p>Publisher: <%=name %></p>
                            <p>Publisher Date: <%=year %></p>
                            <p>Binding: <%=bind %></p>
                            <p>Edition: <%=edition %></p>
                            <p>Language: <%= lang %></p>
                </div>
            </div>
            <hr>
        </div>


    </section>
    </body>
</html>