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
<title>Edit Profile</title>
<link href="sabka.css" rel = "stylesheet" type = "text/css">
<script src="myScript.js"></script>
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
                        	<%@page language="java"%>
							<%@page import="java.sql.*"%>
							<%
							
							
							
							
								try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/obs", "root", "root");
								String email_id = (String)session.getAttribute("login_session");
								String query = "select * from customer where email='"+email_id+"'";
								Statement st = conn.createStatement();
								ResultSet rs = st.executeQuery(query);
								if(rs.next()){
								
							%>
                            <form  id="form" action="update.jsp" autocomplete="on" method="POST"> 
                                <h1>Edit Profile</h1> 
                                <p> 
                                    First Name<font color="red">*</font>
                                    <input id="firstnamesignup" name="firstnamesignup" required="required" type="text" value="<%=rs.getString("first_name")%>" />
                                </p>
								<p> 
                                    Last Name
                                    <input id="lastnamesignup" name="lastnamesignup" type="text" placeholder="" value="<%=rs.getString("last_name")%>"/>
                                </p>
                                <p> 
                                     Email Address<font color="red">*</font>
                                    <input id="emailsignup" name="emailsignup"  type="email" placeholder="" value="<%=rs.getString("email")%>"/> 
                                </p><!--
                                <p> 
                                    Password<font color="red">*</font>
                                    <input id="password" name="password" required="required" type="password" placeholder=""  
									title="Password must contain Minimum 8 characters" pattern=".{8,}$"/>
                                </p>-->
								<p> 
                                     Mobile<font color="red">*</font>
                                    <input id="mobilesignup" name="mobilesignup" required="required" type="tel" placeholder="" value="<%=rs.getString("mobile")%>"
                                    pattern="^\d{10}$"/> 
                                </p>
								<p> 
                                     Address Line 1<font color="red">*</font>
                                    <input id="addressline1" name="addressline1" required="required" type="text" placeholder="" value="<%=rs.getString("address1")%>"/> 
                                </p>
								<p> 
                                     Address Line 2<font color="red">*</font>
                                    <input id="addressline2" name="addressline2" required="required" type="text" placeholder="" value="<%=rs.getString("address2")%>"/> 
                                </p>
								<p> 
                                     City<font color="red">*</font>
                                    <input id="city" name="city" required="required" type="text" placeholder="" value="<%=rs.getString("city")%>"/> 
                                </p>
								<p> 
                                     Pin Code<font color="red">*</font>
                                    <input id="pincode" name="pincode" required="required" type="text" placeholder="" pattern="^\d{6}$" value="<%=rs.getString("pincode")%>"/> 
                                </p>
								<p> 
                                     State<font color="red">*</font>
                                    <input id="state" name="state" required="required" type="text" placeholder="" value="<%=rs.getString("state")%>"/> 
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Save" id="submitregistration"/>
									<a href="MyProfile.jsp"><input type="button" value="Cancel" id="Cancel" /></a>
								</p>
                            </form>
                            
                            <%
                            
								}
								}
								catch(Exception e)
								{
									out.println("unable to connect");
									e.printStackTrace();
								}
								
							%>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
        
</body>
</html>