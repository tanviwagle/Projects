<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Carzania</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

    <!-- CSS here -->
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
    
       <style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  float: left;
  padding: 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin:10px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
}
</style>
    
    
<script>
function selType(str) 
{
  var xhttp=new XMLHttpRequest();
  if (str == "") 
  {
    document.getElementById("selCar1").innerHTML = "";
    return;
  }
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
    document.getElementById("selCar1").innerHTML = this.responseText;
    }
 };
 xhttp.open("GET", "searchBrand.jsp?str="+str, true);
 xhttp.send();
}

function car(str) 
{
  var xhttp=new XMLHttpRequest();
  var br=document.getElementById("selCar").value;
  if (str == "") 
  {
    document.getElementById("selCar2").innerHTML = "";
    return;
  }
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) 
    {
    document.getElementById("selCar2").innerHTML = this.responseText;
    }
 };
 xhttp.open("GET", "searchBrand1.jsp?str="+str+"&br="+br, true);
 xhttp.send();
}

function compare(str)
{
	var car1=document.getElementById("selCar1").value;
	var car2=document.getElementById("selCar2").value;
	document.getElementById("table").style.visibility="visible";
	var xhttp=new XMLHttpRequest();
	if (str == "") 
	  {
	    document.getElementById("table1").innerHTML = "";
	    return;
	  }
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) 
	    {
	    document.getElementById("table1").innerHTML = this.responseText;
	    }
	 };
	 xhttp.open("GET", "compare.jsp?car1="+car1+"&car2="+car2, true);
	 xhttp.send();
	}

function email()
{
	var session = '<%= (String)session.getAttribute("name") == null%>';
	console.log(session);
	if (session == 'true') {
	    window.location.replace("login.jsp");
	}
	else
	{
		var car1=document.getElementById("selCar1").value;
		var car2=document.getElementById("selCar2").value;
		window.location.replace("email.jsp?car1="+car1+"&car2="+car2);	
	}
}
</script>
    
    
</head>
<body>

    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="homepage.jsp">
                                        <img src="img/Untitled.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-7 col-lg-7" align="center">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="homepage.jsp">Home</a></li>
                                            <li><a href="#">Brands <i class="ti-angle-down"></i></a>
												<ul class="submenu">
														<%
														try
														{
															Class.forName("com.mysql.jdbc.Driver");
															Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
															PreparedStatement ps=con.prepareStatement("select distinct brand from car_info");
															ResultSet rs=ps.executeQuery();
															while(rs.next())
															{%>
																<li><a href="brand.jsp?brand=<%= rs.getString("brand") %>"><%= rs.getString("brand") %></a></li>
															<%}
														}
														catch(Exception e)
														{
															e.printStackTrace();
														}
														%>
														
													</ul>
											</li>
                                            <li><a href="compareCar.jsp">Compare Cars</a></li>
                                            <li><a href="https://www.policybazaar.com/motor-insurance/car-insurance/">Insurance</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            
                            <div class="col-xl-2 col-lg-2" align="right">
                            <% String username=(String)session.getAttribute("name");
                            if(username==null)
                            {%>
                            	<a href="login.jsp" class="btn select-btn">Login</a>
                            <%}
                            else
                            {%>
                            	<div class="main-menu d-none d-lg-block">
                                  <ul id="navigation">
                                      
                                     <li><a href="#">Welcome <%=username.toUpperCase()%><i class="ti-angle-down"></i></a>
										<ul class="submenu">
												<li><a href="logout.jsp">Logout</a></li>
										</ul>
									</li>
                                  </ul>
                                 </div> 
                            <%}
                            %>
                                
                            </div>
							
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
 

<div class="row">
  <div class="column" style="width:auto; height:auto">
    <div class="card" align="center" style="background-color: #f1f1f1;">
		<h4>Budget</h4>
		<div id="selectCar" class="select-itms">
			<select class="nice-select" name="selCar" id="selCar" onchange="selType(this.value)">
				<option value="-1">Select price range</option>
				<%
				String pr;
					try
					{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
						PreparedStatement ps=con.prepareStatement("select distinct price_range from car_info");
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							pr=rs.getString("price_range");
						%>
							<option value="<%= pr %>"><%= pr %></option>
						<%}													
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}%>
			</select>
		</div>
		<br><br>
		
		<h4>Choose Car 1:</h4>
		<div id="selectCar" class="select-itms">
			<select class="nice-select" name="selCar1" id="selCar1"  onchange="return car(this.value)">
				<option value="-1">Select car name</option>
				
			</select>
		</div>
		
		<br>
		<br>
		<h4>Choose Car 2: </h4>
		<div id="selectCar" class="select-itms">
			<select class="nice-select" name="selCar2" id="selCar2" onchange="return compare(this.value)">
				<option value="-1">Select car name</option>
				
			</select>
		</div>
		
    </div>
  </div>

  <div class="column" id="table" style="width:70%; height: auto; visibility:hidden">
    <div class="card" id="table1">
      
    </div>
  </div>
</div>
</div>
    
</body>
</html>