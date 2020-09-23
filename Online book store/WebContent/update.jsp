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
<title>Insert title here</title>
<link href="sabka.css" rel = "stylesheet" type = "text/css">

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

<%! String cat, name, img; %>
<body>
  <!--NAVBAR-->
  <div class="navbar-fixed indigo darken-4">
    <nav>
      <div class="nav-wrapper">
        <a href="home.jsp" class="brand-logo center ">Tech Hybrid</a>
        <ul id="nav-mobile" class="center hide-on-med-and-down">
          <li><a href="home.jsp">Home</a></li>
          <li><a href="badges.html">About us</a></li>
          <li><a href="collapsible.html">New Arrivals</a></li>
          <li><a href="collapsible.html">Best Sellers</a></li>
        </ul>
        <ul>
          <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Categories<i class="material-icons right">arrow_drop_down</i></a></li>
          <ul id="dropdown1" class="dropdown-content">
            <%
                        try
                        {
                        	Class.forName("com.mysql.jdbc.Driver");
                        	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
                        	Statement st = con.createStatement();
                        	ResultSet rs = st.executeQuery("select category from category"); 
							
	                        while(rs.next())
	                        {
	                        	cat=rs.getString(1);%>
	                        	<li><a href="demo.jsp?cat=<%=cat%>"><%=cat %></a></li>
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
            <li><a href="Cart"><i class="material-icons right">add_shopping_cart</i></a></li>
        	<% 
        }
        %>
     
 		 </ul>
      </div>
    </nav>
  </div>

<div id="top"  class="animate form">
			<br><br><br><br><br><br><br><br>
    
            <section>			
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form id="form" action="MyProfile.jsp"  autocomplete="on">
                            <%@page language="java"%>
							<%@page import="java.sql.*"%>
                            <%
								String fname = request.getParameter("firstnamesignup");
								String lname = request.getParameter("lastnamesignup");
								String email = request.getParameter("emailsignup");
								String mob = request.getParameter("mobilesignup");
								String add1 = request.getParameter("addressline1");
								String add2 = request.getParameter("addressline2");
								String city = request.getParameter("city");
								String pin = request.getParameter("pincode");
								String state = request.getParameter("state");
								
								try
								{
									Class.forName("com.mysql.jdbc.Driver");
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/obs", "root", "root");
									String email_id = (String)session.getAttribute("login_session");
									String query = "update customer set first_name=?,last_name=?,email=?,mobile=?,address1=?,address2=?,city=?,pincode=?,state=? where email='"+email_id+"'";
									PreparedStatement ps  = conn.prepareStatement(query);
									ps.setString(1, fname);
									ps.setString(2, lname);
									ps.setString(3, email);
									ps.setString(4, mob);
									ps.setString(5, add1);
									ps.setString(6, add1);
									ps.setString(7, city);
									ps.setString(8, pin);
									ps.setString(9, state);
									int i=ps.executeUpdate();
									
								}
								catch(Exception e)
								{
									out.println("YOU ARE IN CATCH BLOCK");
								}
								
								
							%> 
                                <p class="signin button"> 
                                <br><br>
									<input type="submit" value="OK" id="editProfile" />
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>

</body>
</html>