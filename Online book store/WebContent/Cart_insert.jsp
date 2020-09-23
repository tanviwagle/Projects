<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String session_email = (String)session.getAttribute("login_session");
int id=Integer.parseInt(request.getParameter("book_id"));
int price=Integer.parseInt(request.getParameter("price"));
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
Statement st = con.createStatement();
int a = st.executeUpdate("insert into cart values('"+session_email+"',"+id+","+price+")");
response.sendRedirect("cart.jsp");
}
catch(Exception ex)
{
	ex.printStackTrace();
	}
%>
</body>
</html>