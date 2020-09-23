<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleting Cart</title>
</head>
<body>
<%
String session_email = (String)session.getAttribute("login_session");
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
Statement st = con.createStatement();
st.executeUpdate("delete from cart where user_email='"+session_email+"'");
response.sendRedirect("home.jsp");
%>

</body>
</html>