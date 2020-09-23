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
    
    <style>
    table {border-collapse:collapse; table-layout:fixed;}
   table td {border:solid 1px #fab; word-wrap:break-word;}
    </style>
</head>
<body>
<%! String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers,usb, radio, bluetooth, gps,rear_ac, ac, range; %>
<%! String content;%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
	PreparedStatement ps=con.prepareStatement("select * from car_info");
	ResultSet rs=ps.executeQuery();
	%>
	<h2>View/Delete/Update</h2>
	<table border="2" cellspacing="5" cellpadding="5" style="width:*">
		<tr>
			<th>Sr No.</th>
			<th>Car Name</th>
			<th>Car Brand</th>
			<th>Car Type</th>
			<th>Price</th>
			<th>Mileage</th>
			<th>No of doors</th>
			<th>Seating Capacity</th>
			<th>Wheel Type</th>
			<th>Steering Wheel type</th>
			<th>Airbags</th>
			<th>Passenger airbags</th>
			<th>Speakers</th>
			<th>USB Support</th>
			<th>Radio Support</th>
			<th>Bluetooth Support</th>
			<th>GPS</th>
			<th>Rear A/C</th>
			<th>A/C</th>
			<th>Price Range</th>
			<th></th>
			
		</tr>
			<%
			int count=0;
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
		 		range=rs.getString("price_range");%>
		 		<tr>
		 			<td><%= ++count %></td>
		 			<td><%= name %></td>
		 			<td><%= brand %></td>
		 			<td> <%= type %></td>
		 			<td> <%= price %></td>
		 			<td><%= mileage %></td>
		 			<td><%= doors %></td>
		 			<td> <%= seat_cap %></td>
		 			<td><%= wheel_type %></td>
		 			<td><%= steering %></td>
		 			<td><%= airbags %></td>
		 			<td><%= pass_air %></td>
		 			<td> <%= speakers %></td>
		 			<td><%= usb %></td>
		 			<td><%= radio %></td>
		 			<td><%= bluetooth %></td>
		 			<td><%= gps %></td>
		 			<td><%= rear_ac %></td>
		 			<td><%= ac %></td>
		 			<td><%= range %></td>
		 			<td>
			 			<input type="button" name="delete" value="Delete" style="font-weight:bold;color:red; margin:5px" onClick="deleteRecord(<%=rs.getInt("id")%>);" >
			 			<input type="button" name="update" value="Update" style="font-weight:bold;color:green; margin:5px" onClick="updateRecord(<%=rs.getInt("id")%>);" >
		 			</td>
		 		</tr>
		 		
		 	
		 		
			<%}%> 
	</table>
	<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>