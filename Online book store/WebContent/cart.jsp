<%@ page import="java.sql.*" %>
    
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
          <ul>
          <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Categories<i class="material-icons right">arrow_drop_down</i></a></li>
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
  
	<div id="top"/ class="hiddenanchor">
			<br><br>
    
    
            <section>			
                <div id="container_demo"  style="padding-left:80px; padding-right:80px;"  >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                        <script>
							function user_alert()
							{
								alert("Order successfully placed! Happy Shopping!");
							}
							</script>
                            <form  action="Cart_delete.jsp" autocomplete="on" onclick="user_alert()"> 
                               <h1>CART</h1> 
                                <% 
                                	String session_email = (String)session.getAttribute("login_session");
                                	{
                                %>
                                <table style="width:100%">
								  <tr>
								    <th>Sr. no.</th>
								    <th>Book</th>
								    <th>Mode of payment</th>
								    <th>Price (&#8377;)</th>
								  </tr> 
								  
								  <%
								  int book_id, sr_no=0;
								  
			                        try
			                        {
			                        	Class.forName("com.mysql.jdbc.Driver");
			                        	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
			                        	Statement st = con.createStatement();
			                        	ResultSet rs1 = st.executeQuery("select id from cart where user_email='"+session_email+"'");
			                        	while(rs1.next())
			                        	{
			                        		int cart_book_id = rs1.getInt(1);
			                        	
			                        		ResultSet rsCart = st.executeQuery("select books.name, cart.price from books,cart where books.id = "+cart_book_id+" and cart.user_email='"+session_email+"'"); 
										
					                        while(rsCart.next())
					                        {
					                        	%>
					                        	<tr>
					                        	<td><%= ++sr_no %></td>
					                        	<td><%= rsCart.getString(1) %></td>
					                        	<td>Cash On Delivery</td>
					                        	<td><%= rsCart.getInt(2) %></td>		                        	
					                        	</tr>
					                        	<%
					                        }
			                        	} 
			                        	
										
			                        }
			                        
			                        catch(Exception e)
			                        {
			                        	e.printStackTrace();
			                        }
			                        %>
								  
								 </table>
								 
								 <% } //closing else statement %>
								 
  								<p>
  								<div class="Buy_button" align="right" style="padding-right: 400px;"> 
                                    <input type="submit" id="buy_button" value="Buy" style="padding: 16px 500px;" /> 
								</div>
                               </p>
                            </form>
                        </div>
                    </div>						
                </div>                  
            </section>
        </div>
		
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
	
	