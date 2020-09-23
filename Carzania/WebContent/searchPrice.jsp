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
<%
String pr;
String s=request.getParameter("str");%>
<div class="select-this">
<div id="selectCar" class="select-itms">
	<select class="nice-select" name="selCar" onchange="selType(this.value)">
	<option value='-1'>Select price range</option> 
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
		PreparedStatement ps=con.prepareStatement("select distinct price_range from car_info where brand='"+s+"'");
		ResultSet rs=ps.executeQuery();
		
			while(rs.next())
			{
				pr=rs.getString("price_range");
				%>
				<option value="<%= pr %>"><%= pr %></option> 
			<%
			}	%>
		
	<%}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>
	</select>
</div>
</div>
</body>
</html>