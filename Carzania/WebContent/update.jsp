<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*, java.io.FileInputStream, java.io.File, java.io.InputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function success()
{
	alert("Record successfully updated");
	window.location.replace("adminHome.jsp");
	}
</script>
<body>

<%! String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers,usb, radio, bluetooth, gps,rear_ac, ac, range, location;  %>
<%
int id=Integer.parseInt(request.getParameter("id"));
FileInputStream fs=null;
	name=request.getParameter("name");
	brand=request.getParameter("brand"); 
	type=request.getParameter("ctype");
	price=request.getParameter("price"); 
	mileage=request.getParameter("mileage");
	doors=request.getParameter("doors");
	seat_cap=request.getParameter("cap"); 
	wheel_type=request.getParameter("whType"); 
	steering=request.getParameter("swtype");
	airbags=request.getParameter("airbags");
	pass_air=request.getParameter("passAir");
	speakers=request.getParameter("speaker");
	usb=request.getParameter("usb");
	radio=request.getParameter("radio"); 
	bluetooth=request.getParameter("btooth"); 
	gps=request.getParameter("gps");
	rear_ac=request.getParameter("rearac"); 
	ac=request.getParameter("ac");
	range=request.getParameter("p_range");
	location=request.getParameter("image");
try
{
	Class.forName("com.mysql.jdbc.Driver");
 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
 	PreparedStatement ps=con.prepareStatement("update car_info set name=?, brand=?, type=?, price=?, mileage=?, no_of_door=?, seat_cap=?, wheel_type=?, steering_type=?, airbags=?, passenger_abags=?, speakers=?, usb_support=?, radio_support=?, bluetooth_sup=?, gps_navigation=?, rear_ac=?, ac=?, price_range=?, image=? where id=?");
 	
 	File img=new File("C:\\Users\\Wagle\\Desktop\\Images\\"+location);
	ps.setString(1,name);
	ps.setString(2,brand);
	ps.setString(3,type);
	ps.setString(4,price);
	ps.setString(5,mileage);
	ps.setString(6,doors);
	ps.setString(7,seat_cap);
	ps.setString(8,wheel_type);
	ps.setString(9,steering);
	ps.setString(10,airbags);
	ps.setString(11,pass_air);
	ps.setString(12,speakers);
	ps.setString(13,usb);
	ps.setString(14,radio);
	ps.setString(15,bluetooth);
	ps.setString(16,gps);
	ps.setString(17,rear_ac);
	ps.setString(18,ac);
	ps.setString(19,range);
	fs=new FileInputStream(img);
	ps.setBinaryStream(20,(InputStream) fs,(int)(img.length()));
	ps.setInt(21,id);
	ps.executeUpdate();%>
	<script>success();</script>
	<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>