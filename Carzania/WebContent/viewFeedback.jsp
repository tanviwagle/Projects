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
<%! String content;%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
	PreparedStatement ps=con.prepareStatement("select * from feedback");
	ResultSet rs=ps.executeQuery();%>
	<h2>Feedback</h2>
	<table border="2" cellspacing="5" cellpadding="5" style="width:*;">
		<tr>
			<th>Sr No.</th>
			<th>User</th>
			<th>Email</th>
			<th>Feedback Content</th>
		</tr>
			<%
			int count=0;
			while(rs.next())
			{
		 		content=rs.getString("content");%>
		 		
		 		<tr>
		 			<td><%=++count%></td>
		 			<td><%= rs.getString("user") %></td>
		 			<td><%= rs.getString("email") %></td>
		 			<td><%=content %></td>
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