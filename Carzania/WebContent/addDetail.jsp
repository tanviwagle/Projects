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
<div class="limiter">
				<form class="" action="insert.jsp" method="POST">
				<table border="2" cellpadding="5" cellspacing="5" style="width:60%; margin-left: auto; margin-right: auto;">
					
						<tr>
							<td colspan="2"><h2 align="center" style="margin:30px;">NEW DETAILS</h2></td>
						</tr>
						<tr>
							<th>Car Name: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car name is required" >
									<input class="input100" id="name" type="text" name="name" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Car Brand: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car brand is required">
									<input class="input100" id="brand" type="text" name="brand" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Car Type: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Car type is required">
									<input class="input100" id="ctype" type="text" name="ctype" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Price: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Price is required">
									<input class="input100" id="price" type="text" name="price" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Mileage: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Mileage is required">
									<input class="input100" id="mileage" type="text" name="mileage" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>No of doors: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "No of doors is required">
									<input class="input100" id="doors" type="text" name="doors" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Seating Capacity: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Capacity is required">
									<input class="input100" id="cap" type="text" name="cap" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Wheel Type: </th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Wheel type is required">
									<input class="input100" id="whType" type="text" name="whType" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Steering Wheel Type:</th>
							<td>
								<div class="wrap-input100 validate-input m-b-10" data-validate = "Steering type is required">
									<input class="input100" id="swtype" type="text" name="swtype" required>
									
								</div>	
							</td>
						</tr>
						<tr>
							<th>Airbags available: </th>
							<td>
								<div class="select-this">
								<div id="selectCar" class="select-itms">
									<select class="nice-select" name="airbags" required>
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Yes'>Yes</option>
										<option value='No'>No</option>
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
										<option value=''>Select option</option> 
										<option value='Above 1 Cr'>Above 1 Cr</option>
										<option value='50 Lakhs- 1Cr'>50 Lakhs- 1Cr</option>
										<option value='10 Lakhs- 50 Lakhs'>10 Lakhs- 50 Lakhs</option>
										<option value='5 Lakhs- 10 Lakhs'>5 Lakhs- 10 Lakhs</option>
										<option value='Below 5 Lakhs'>Below 5 Lakhs</option>
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