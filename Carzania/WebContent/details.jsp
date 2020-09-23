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
    <link rel="stylesheet" href="css/desc.css">
</head>
<body>
<%! String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers,usb, radio, bluetooth, gps,rear_ac, ac; %>
<%
int id=Integer.parseInt(request.getParameter("id"));
try
{
	Class.forName("com.mysql.jdbc.Driver");
 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
 	Statement st = con.createStatement();
 	ResultSet rs = st.executeQuery("select * from car_info where id="+id); 
 	while(rs.next())
 	{
 		name=rs.getString("name");
 		brand=rs.getString("brand"); 
 		type=rs.getString("type");
 		price=rs.getString("price"); 
 		mileage=rs.getString("mileage");
 		doors=rs.getString("no_of_door");
 		seat_cap=rs.getString("seat_cap"); 
 		wheel_type=rs.getString("wheel_type"); 
 		steering=rs.getString("steering_type");
 		airbags=rs.getString("airbags");
 		pass_air=rs.getString("passenger_abags");
 		speakers=rs.getString("speakers");
 		usb=rs.getString("usb_support");
 		radio=rs.getString("radio_support"); 
 		bluetooth=rs.getString("bluetooth_sup"); 
 		gps=rs.getString("gps_navigation");
 		rear_ac=rs.getString("rear_ac"); 
 		ac=rs.getString("ac");
 	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href=homepage.jsp>
                                        <img src="img/Untitled.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-7 col-lg-7" align="center">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="homepage.jsp">Home</a></li>
                                            <li><a href="compareCar.jsp">Compare Cars</a></li>
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
<section id="book_desc">
        <div class="container">
            <div class="row">
                <div class="col m7" style="width:30%; align: right; padding:20px">
                    <h2><%= name %></h2>
                    <hr>
                    <h4>Brand : <%=brand%></h4>
                    <h4>Type : <%= type %></h4>
                    <h4>Price : &#8377;<%= price %></h4>

                </div>
                <div class="col m4" style="max-width:70%; align: right; padding:20px;">
                    <div class="carousel">
                        <% 
						      try
							 {
							 	Class.forName("com.mysql.jdbc.Driver");
							 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
							 	Statement st = con.createStatement();
								ResultSet rs=st.executeQuery("select * from car_info where id="+id); 
								  while(rs.next())
								  {
								  	%>
								  	<img src="viewSearchCar.jsp?id=<%= rs.getInt("id") %>">
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
            </div>
            
            <hr>

            <div class="row">
                <div class="col m12" style="width: 75%; align: center;">
                    <h3>Information:</h3>
                       	<table border="3" cellspacing="5" cellpadding="5" style="width: 50%;">
                            <tr>
	                            <th>Mileage : </th>
	                            <td><%= mileage %></td>
                            </tr>
                            <tr>
                            	<th>No of Doors : </th>
                            	<td><%= doors %></td>
                            </tr>
                            <tr>
	                            <th>Seating Capacity :</th>
	                            <td> <%= seat_cap %></td>
                            </tr>
                            <tr>
                            	<th>Wheel Type: </th>
                            	<td><%= wheel_type %></td>
                            </tr>
                            <tr>
                            	<th>Steering Wheel type :</th>
                            	<td><%= steering %></td>
                            </tr>
                            <tr>
	                            <th>Airbags available : </th>
	                            <td><%= airbags %></td>
                            </tr>
                            <tr>
                            	<th>Passenger airbags available : </th>
                            	<td><%= pass_air %></td>
                            </tr>
                            <tr>
                            	<th>Speakers:</th>
                            	<td> <%= speakers %></td>
                            </tr>
                            <tr>
                            	<th>USB : </th>
                            	<td><%= usb %></td>
                            </tr>
                            <tr>
	                            <th>Radio : </th>
	                            <td><%= radio %></td>
                            </tr>
                            <tr>
                            	<th>Bluetooth : </th>
                            	<td><%= bluetooth %></td>
                            </tr>
                            <tr>                            
                            <th>GPS : </th>
                            <td><%= gps %></td>
                            </tr>
                            <tr>
                            <th>Rear A/C : </th>
                            <td><%= rear_ac %></td>
                            </tr>
                            <tr>
                            <th>A/C : </th>
                            <td><%= ac %></td>
                            </tr>
                      </table>
                </div>
            </div>
            <hr>
        </div>
    </section>

</body>
</html>