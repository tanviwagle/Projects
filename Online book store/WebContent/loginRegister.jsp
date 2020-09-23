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
  
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="home.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<title>Login and Registration</title>
		<script type="text/javascript">  
				function validatePassword()
				{
					var password = document.getElementById("password");
					var confirm_password = document.getElementById("confirm_password");
					if(password.value != confirm_password.value) 
					{
						confirm_password.setCustomValidity("Passwords Don't Match");
						return  false;
			    	}
					
				}
				password.onchange = validatePassword;
				confirm_password.onkeyup = validatePassword;
				
				
				/*var password = document.getElementById("password");
				var confirm_password = document.getElementById("confirm_password");

				function validatePassword(){
				  if(password.value != confirm_password.value) {
					confirm_password.setCustomValidity("Passwords Don't Match");
				  } else {
					confirm_password.setCustomValidity('');
				  }
				}

				password.onchange = validatePassword;
				confirm_password.onkeyup = validatePassword;*/

				
			
		</script>
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
        <a href="home.jsp" class="brand-logo center ">Tech Hybrid</a>
        <ul id="nav-mobile" class="center hide-on-med-and-down">
          <li><a href="home.jsp">Home</a></li>
         
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
          
          
        </ul>
      </div>
    </nav>
  </div>
	<div id="top"/ class="hiddenanchor">
			<br><br><br><br><br><br><br><br>
    
            <section>			
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="connect_login.jsp" autocomplete="on" method="post"> 
                                <h1>Log in</h1> 
                                <p> 
                                    Email Address
                                    <input id="logemail" name="logemail" required="required" type="email" placeholder="" action=""/>
                                </p>
                                <p> 
                                     Password 
                                    <input id="pagcfssword" name="pagcfssword" required="required" type="password" placeholder="" /> 
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="connect_registration.jsp" autocomplete="on" id="form1" name="form1" onsubmit="return validatePassword()" method="post"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    First Name<font color="red">*</font>
                                    <input id="firstnamesignup" name="firstnamesignup" required="required" type="text" placeholder="" />
                                </p>
								<p> 
                                    Last Name
                                    <input id="lastnamesignup" name="lastnamesignup" type="text" placeholder="" />
                                </p>
                                <p> 
                                     Email Address<font color="red">*</font>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder=""/> 
                                </p>
                                <p> 
                                    Password<font color="red">*</font>
                                    <input id="password" name="password" required="required" type="password" placeholder="" 
									title="Password must contain Minimum 8 characters" pattern=".{8,}$"/>
                                </p>
                                <p> 
                                    Confirm Password<font color="red">*</font> 
                                    <input id="confirm_password" name="confirm_password" required="required" type="password" placeholder=""
									title="Must match with your Password" />
                                </p>
								<p> 
                                     Mobile<font color="red">*</font>
                                    <input id="mobilesignup" name="mobilesignup" required="required" type="tel" placeholder="" pattern="^\d{10}$"/> 
                                </p>
								<p> 
                                     Address Line 1<font color="red">*</font>
                                    <input id="addressline1" name="addressline1" required="required" type="text" placeholder=""/> 
                                </p>
								<p> 
                                     Address Line 2<font color="red">*</font>
                                    <input id="addressline2" name="addressline2" required="required" type="text" placeholder=""/> 
                                </p>
								<p> 
                                     City<font color="red">*</font>
                                    <input id="city" name="city" required="required" type="text" placeholder=""/> 
                                </p>
								<p> 
                                     Pin Code<font color="red">*</font>
                                    <input id="pincode" name="pincode" required="required" type="text" placeholder="" pattern="^\d{6}$"/> 
                                </p>
								<p> 
                                     State<font color="red">*</font>
                                    <input id="state" name="state" required="required" type="text" placeholder=""/> 
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up" id="submitregistration"/>
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#top" class="to_register"> Go and log in </a>
								</p>
                            </form>
							
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
	</html>
	
