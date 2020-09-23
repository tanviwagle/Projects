<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<%!
String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers, usb, radio, bluetooth, gps, rear_ac, ac; 
String name1, brand1, type1, price1, mileage1, doors1, seat_cap1, wheel_type1, steering1, airbags1, pass_air1, speakers1, usb1, radio1, bluetooth1, gps1, rear_ac1, ac1;
%>
<%
String car1=request.getParameter("car1");
String car2=request.getParameter("car2");%>
      
		<%
					try
					{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
						PreparedStatement ps=con.prepareStatement("select * from car_info where name='"+car1+"'");
						PreparedStatement ps1=con.prepareStatement("select * from car_info where name='"+car2+"'");
						ResultSet rs=ps.executeQuery();
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
						ResultSet rs1=ps1.executeQuery();
						while(rs1.next())
						{
							name1=rs1.getString("name");
					 		brand1=rs1.getString("brand"); 
					 		type1=rs1.getString("type");
					 		price1=rs1.getString("price"); 
					 		mileage1=rs1.getString("mileage");
					 		doors1=rs1.getString("no_of_door");
					 		seat_cap1=rs1.getString("seat_cap"); 
					 		wheel_type1=rs1.getString("wheel_type"); 
					 		steering1=rs1.getString("steering_type");
					 		airbags1=rs1.getString("airbags");
					 		pass_air1=rs1.getString("passenger_abags");
					 		speakers1=rs1.getString("speakers");
					 		usb1=rs1.getString("usb_support");
					 		radio1=rs1.getString("radio_support"); 
					 		bluetooth1=rs1.getString("bluetooth_sup"); 
					 		gps1=rs1.getString("gps_navigation");
					 		rear_ac1=rs1.getString("rear_ac"); 
					 		ac1=rs1.getString("ac");
						}	
						
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}%>
					
					<table border="3" cellspacing="5" cellpadding="5" style="width:*;">
                            <tr>
	                            <th></th>
	                            <th style="font-size:20px"><%= name %></th>
	                            <th style="font-size:20px"><%= name1 %></th>
                            </tr>
                            <tr>
	                            <th>Mileage : </th>
	                            <td><%= mileage %></td>
	                            <td><%= mileage1 %></td>
                            </tr>
                            <tr>
	                            <th>Brand : </th>
	                            <td><%= brand %></td>
	                            <td><%= brand1 %></td>
                            </tr>
                            <tr>
	                            <th>Price : </th>
	                            <td><%= price %></td>
	                            <td><%= price1 %></td>
                            </tr>
                            <tr>
	                            <th>Type : </th>
	                            <td><%= type %></td>
	                            <td><%= type1 %></td>
                            </tr>
                            <tr>
                            	<th>No of Doors : </th>
                            	<td><%= doors %></td>
                            	<td><%= doors1 %></td>
                            </tr>
                            <tr>
	                            <th>Seating Capacity :</th>
	                            <td> <%= seat_cap %></td>
	                            <td> <%= seat_cap1 %></td>
                            </tr>
                            <tr>
                            	<th>Wheel Type: </th>
                            	<td><%= wheel_type %></td>
                            	<td><%= wheel_type1 %></td>
                            </tr>
                            <tr>
                            	<th>Steering Wheel type :</th>
                            	<td><%= steering %></td>
                            	<td><%= steering1 %></td>
                            </tr>
                            <tr>
	                            <th>Airbags available : </th>
	                            <td><%= airbags %></td>
	                            <td><%= airbags1 %></td>
                            </tr>
                            <tr>
                            	<th>Passenger airbags available : </th>
                            	<td><%= pass_air %></td>
                            	<td><%= pass_air1 %></td>
                            </tr>
                            <tr>
                            	<th>Speakers:</th>
                            	<td> <%= speakers %></td>
                            	<td> <%= speakers1 %></td>
                            </tr>
                            <tr>
                            	<th>USB : </th>
                            	<td><%= usb %></td>
                            	<td><%= usb1 %></td>
                            </tr>
                            <tr>
	                            <th>Radio : </th>
	                            <td><%= radio %></td>
	                            <td><%= radio1 %></td>
                            </tr>
                            <tr>
                            	<th>Bluetooth : </th>
                            	<td><%= bluetooth %></td>
                            	<td><%= bluetooth1 %></td>
                            </tr>
	                        <tr>                            
	                            <th>GPS : </th>
	                            <td><%= gps %></td>
	                            <td><%= gps1 %></td>
                            </tr>
                            <tr>
	                            <th>Rear A/C : </th>
	                            <td><%= rear_ac %></td>
	                            <td><%= rear_ac1 %></td>
                            </tr>
                            <tr>
	                            <th>A/C : </th>
	                            <td><%= ac %></td>
	                            <td><%= ac1 %></td>
                            </tr>
                      </table>
			<div class="days d-flex justify-content-right" style="margin-top:20px">
				<a class="btn select-btn" onClick="email()">Get Information via Email</a>
			</div>


</body>
</html>