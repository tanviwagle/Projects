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
    
    
  <script>
	function selPrice(str) 
	{
	  var xhttp=new XMLHttpRequest();
	  if (str == "") 
	  {
	    document.getElementById("selectCar").innerHTML = "";
	    return;
	  }
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) 
	    {
	    document.getElementById("selectCar").innerHTML = this.responseText;
	    }
	 };
	 xhttp.open("GET", "searchPrice.jsp?str="+str, true);
	 xhttp.send();
	}
	
	function selType(str) 
	{
	  var xhttp=new XMLHttpRequest();
	  var br=document.getElementById("brand").value;
	  if (str == "") 
	  {
	    document.getElementById("carsresult").innerHTML = "";
	    return;
	  }
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) 
	    {
	    document.getElementById("carsresult").innerHTML = this.responseText;
	    }
	 };
	 xhttp.open("GET", "searchCar.jsp?str="+str+"&br="+br, true);
	 xhttp.send();
	}
	
	
	</script> 
  
</head>
<%! String br; %>
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
    <!-- header-end -->

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Mercedes</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>BMW</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Jaguar</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- slider_area_end -->
	
	<div class="booking-area">
            <div class="container">
               <div class="row ">
               
               	<div class="col-xl-12">
               	
					<div class="booking-wrap d-flex justify-content-between align-items-center">
                            <h3>Search Car</h3>
						<!-- Single Select Box -->
							<div class="single-select-box mb-30">
								<div class="boking-tittle">
									<span>Brand:</span>
								</div>
								<div class="select-this">
										<div class="select-itms">
											<select name="brand" id="brand" onchange="selPrice(this.value)">
												<option value=-1>Select car brand</option>
												<%
												try
												{
													Class.forName("com.mysql.jdbc.Driver");
													Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
													PreparedStatement ps=con.prepareStatement("select distinct brand from car_info");
													ResultSet rs=ps.executeQuery();
													while(rs.next())
													{
														br=rs.getString("brand");
													%>
														<option value="<%= br %>"><%= br %></option>
													<%}													
												}
												catch(Exception e)
												{
													e.printStackTrace();
												}%>
											</select>
										</div>
								</div>
						   </div>
						   <div class="single-select-box mb-30">
								<div class="boking-tittle">
									<span>Budget:</span>
								</div>
								<div class="select-this">
										<div id="selectCar" class="select-itms">
											<select name="selCar" id="selCar"  onchange="selType(this.value)">
												<option value="-1">Select price range</option>
											</select>
										</div>
								</div>
						   </div>
				
					</div>
               </div>
               </div>
            </div>
        </div>
        <!-- Booking Room End-->
	
    
    
    <div class="popular_destination_area">
        <div class="container">
            <div class="row" id="carsresult">
                
            </div>  
        </div>
    </div>

    <div class="popular_places_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <h3>Popular Cars</h3>                        
                    </div>
                </div>
            </div>
            <div class="row">
            	<%
            	try
            	{
            		Class.forName("com.mysql.jdbc.Driver");
            	 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
            	 	Statement st = con.createStatement();
            	 	ResultSet rs = st.executeQuery("select * from car_info order by rand() limit 6"); 
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

    <footer class="footer" id="contact">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-lg-4 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/footer_logo.png" alt="">
                                </a>
                            </div>
                            <p>5th flora, 700/D kings road, green <br> lane New York-1782 <br>
                                <a href="#">+10 367 826 2567</a> <br>
                                <a href="#">dummy@gmail.com</a>
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-twitter-alt"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Feedback
                            </h3>
                            <form method="POST" action="feedback.jsp">
                            <textarea name="feed" id="feed" rows="10" cols="40" placeholder="Enter feedback here..."></textarea>
                            <br>
                            <div class="days d-flex justify-content-right">
	                                    <input type="Submit" class="btn select-btn" value="Submit" >
	                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
       
    </footer>


  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
    <!-- link that opens popup -->
<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>
    <script src="js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script>
</body>

</html>