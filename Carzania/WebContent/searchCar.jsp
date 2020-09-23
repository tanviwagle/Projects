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
String ty;
String s=request.getParameter("str");
String b=request.getParameter("br");%>
<div class="container">
<div class="row" id="carsresult">
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
		PreparedStatement ps=con.prepareStatement("select * from car_info where brand='"+b+"' and price_range='"+s+"'");
		ResultSet rs=ps.executeQuery();
		
			while(rs.next())
			{
				%>
				
				<div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="viewSearchCar.jsp?id=<%=rs.getInt("id")%>">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center"><%= rs.getString("name") %><a href="details.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("price") %></a> </p>
                            
                        </div>
                    </div>
                </div>
			<%
			}	%>
		
	<%}
	catch(Exception e)
	{
		e.printStackTrace();
	}%>
	
</div>
</div>
</body>
</html>