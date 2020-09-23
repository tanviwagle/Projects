<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	Statement st = con.createStatement();
	String fname = request.getParameter("firstnamesignup");
	String lname = request.getParameter("lastnamesignup");
	String email = request.getParameter("emailsignup");
	String pw = request.getParameter("password");
	String mob = request.getParameter("mobilesignup");
	String add1 = request.getParameter("addressline1");
	String add2 = request.getParameter("addressline2");
	String city = request.getParameter("city");
	String zip = request.getParameter("pincode");
	String state = request.getParameter("state");
	
	st.executeUpdate("insert into customer(first_name,last_name, mobile, email, password, address1, address2, city,state,pincode) values('"+fname+"','"+lname+"',"+mob+",'"+email+"','"+pw+"','"+add1+"','"+add2+"','"+city+"','"+state+"',"+zip+")");
	out.println("Registration successfull");
	response.sendRedirect("loginRegister.jsp");
 } 
catch(Exception e)
 {
	e.printStackTrace(); 
 }
%>
</body>
</html>