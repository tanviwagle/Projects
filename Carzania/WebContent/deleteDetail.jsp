<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
function success()
{
	alert("1 row deleted");
	window.location.replace("adminHome.jsp");
}
</script>

</head>
<body>
<%
String id=request.getParameter("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
 	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
 	PreparedStatement ps=con.prepareStatement("delete from car_info where id="+id);
 	ps.executeUpdate();%>
 	<script>success();</script>
 	
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>