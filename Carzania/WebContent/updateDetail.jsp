<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
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
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<%! String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers,usb, radio, bluetooth, gps,rear_ac, ac, range, image; %>
<%
int id=Integer.parseInt(request.getParameter("id"));
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
	PreparedStatement ps=con.prepareStatement("select * from car_info where id="+id);
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
 		range=rs.getString("price_range");
 		image=rs.getString("image");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<div class="limiter">
				<form class="" action="update.jsp?id=<%=id %>" method="POST">
				<table border="2" cellpadding="5" cellspacing="5" style="width:60%; margin-left: auto; margin-right: auto;">
					
						<tr>
							<td colspan="2"><h2 align="center" style="margin:30px;">UPDATE DETAILS</h2></td>
						</tr>
						<tr>
							<th>Car Name: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car name is required" >
									<input class="input100" id="name" type="text" name="name" value="<%=name %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Car Brand: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car brand is required">
									<input class="input100" id="brand" type="text" name="brand" value="<%=brand %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Car Type: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car type is required">
									<input class="input100" id="ctype" type="text" name="ctype" value="<%=type %>"required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Price: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Price is required">
									<input class="input100" id="price" type="text" name="price" value="<%=price %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Mileage: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Mileage is required">
									<input class="input100" id="mileage" type="text" name="mileage" value="<%=mileage %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>No of doors: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "No of doors is required">
									<input class="input100" id="doors" type="text" name="doors" value="<%=doors %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Seating Capacity: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Capacity is required">
									<input class="input100" id="cap" type="text" name="cap" value="<%=seat_cap %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Wheel Type: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Wheel type is required">
									<input class="input100" id="whType" type="text" name="whType" value="<%=wheel_type %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Steering Wheel Type:</th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Steering type is required">
									<input class="input100" id="swtype" type="text" name="swtype" value="<%=steering %>" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Airbags available: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="airbags" required>
										<% if(airbags.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>Passenger airbags available: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="passAir" required>
										<% if(pass_air.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>Speakers: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="speaker" required>
										<% if(speakers.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>USB Support: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms" >
									<select class="nice-select" name="usb" required>
										<% if(usb.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>Radio Support: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms" >
									<select class="nice-select" name="radio" required>
										<% if(radio.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>Bluetooth Support: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="btooth" required>
										<% if(bluetooth.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>GPS Navigation: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="gps" required>
										<% if(gps.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th>Rear A/C: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="rearac" required>
										<% if(rear_ac.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>A/C: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="ac" required>
										<% if(ac.equals("Yes"))
											{%>
												<option value=''>Select option</option> 
												<option value='Yes' selected>Yes</option>
												<option value='No'>No</option>
												<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Yes'>Yes</option>
											<option value='No' selected>No</option>
										<%}
										%>
									</select>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>Price Range: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="p_range" required>
										<% if(range.equals("Above 1 Cr"))
											{%>
												<option value=''>Select option</option> 
												<option value='Above 1 Cr' selected>Above 1 Cr</option>
												<option value='50 Lakhs- 1Cr'>50 Lakhs- 1Cr</option>
												<option value='10 Lakhs- 50 Lakhs'>10 Lakhs- 50 Lakhs</option>
												<option value='5 Lakhs- 10 Lakhs'>5 Lakhs- 10 Lakhs</option>
												<option value='Below 5 Lakhs'>Below 5 Lakhs</option>
												<%}
										else if(range.equals("50 Lakhs- 1Cr"))
										{%>
											<option value=''>Select option</option> 
											<option value='Above 1 Cr'>Above 1 Cr</option>
											<option value='50 Lakhs- 1Cr' selected>50 Lakhs- 1Cr</option>
											<option value='10 Lakhs- 50 Lakhs'>10 Lakhs- 50 Lakhs</option>
											<option value='5 Lakhs- 10 Lakhs'>5 Lakhs- 10 Lakhs</option>
											<option value='Below 5 Lakhs'>Below 5 Lakhs</option>
										<%}
										else if(range.equals("10 Lakhs- 50 Lakhs"))
										{%>
											<option value=''>Select option</option> 
											<option value='Above 1 Cr'>Above 1 Cr</option>
											<option value='50 Lakhs- 1Cr'>50 Lakhs- 1Cr</option>
											<option value='10 Lakhs- 50 Lakhs' selected>10 Lakhs- 50 Lakhs</option>
											<option value='5 Lakhs- 10 Lakhs'>5 Lakhs- 10 Lakhs</option>
											<option value='Below 5 Lakhs'>Below 5 Lakhs</option>
											<%}
										else if(range.equals("5 Lakhs- 10 Lakhs"))
										{%>
											<option value=''>Select option</option> 
											<option value='Above 1 Cr'>Above 1 Cr</option>
											<option value='50 Lakhs- 1Cr'>50 Lakhs- 1Cr</option>
											<option value='10 Lakhs- 50 Lakhs'>10 Lakhs- 50 Lakhs</option>
											<option value='5 Lakhs- 10 Lakhs' selected>5 Lakhs- 10 Lakhs</option>
											<option value='Below 5 Lakhs'>Below 5 Lakhs</option>
										<%}
										else
										{%>
											<option value=''>Select option</option> 
											<option value='Above 1 Cr'>Above 1 Cr</option>
											<option value='50 Lakhs- 1Cr'>50 Lakhs- 1Cr</option>
											<option value='10 Lakhs- 50 Lakhs'>10 Lakhs- 50 Lakhs</option>
											<option value='5 Lakhs- 10 Lakhs'>5 Lakhs- 10 Lakhs</option>
											<option value='Below 5 Lakhs' selected>Below 5 Lakhs</option>
										<%}
										%>
									</select>
								</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>Car Image: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Steering type is required">
									<input class="input100" id="image" type="file" name="image" required>
									
								</div>	
							</td>
						</tr>
						<tr style="font-size:20px">
							<td colspan="2" style="background-color:black;">
								<div class="container-login100-form-btn p-t-10">
									<input type="Submit" class="login100-form-btn" value="SUBMIT">
								</div>
							</td>
						</tr>
					
				</table>
				</form>
			</div>
		
	
</body>
</html>