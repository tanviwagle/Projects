<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html class="no-js" lang="zxx">

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
    </head>
<body>
<%String br=request.getParameter("brand"); %>
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
                                            <li><a href="#contact">Contact Us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            
                            <div class="col-xl-2 col-lg-2" align="right">
                            <% String username=(String)session.getAttribute("name");
                            String email=(String)session.getAttribute("email");
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
<div class="popular_places_area">
        <div class="container">
            <div class="row">
            	<%
            	try
            	{
            		Class.forName("com.mysql.jdbc.Driver");
            	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
            	 	Statement st = con.createStatement();
            	 	ResultSet rs = st.executeQuery("select * from car_info where brand='"+br+"'"); 
            	 	while(rs.next())
            	 	{%>
            	 		<div class="col-lg-4 col-md-6">
	                        <div class="single_place">
	                            <div class="thumb">
	                                <img src="viewSearchCar.jsp?id=<%=rs.getInt("id")%>" alt="">
	                                <a href="#" class="prise"><%= rs.getString("price") %></a>
	                            </div>
	                            <div class="place_info">
	                                <a href="destination_details.html"><h3><%= rs.getString("name") %></h3></a>
	                                
	                                <div class="days d-flex justify-content-right">
	                                    <a class="btn select-btn" href="details.jsp?id=<%=rs.getInt("id")%>">View Details</a>
	                                </div>
	                            </div>
	                        </div>
                    	</div>
            	 	<%}
            	}
            	catch(Exception e)
            	{
            		e.printStackTrace();
            	}
            	%>
             </div>
        </div>
    </div>
</body>
</html>