<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%! String fn, ln, email, user, pwd, cpwd; %>
	<%
		fn=request.getParameter("fname");
		ln=request.getParameter("lname");
		email=request.getParameter("email");
		user=request.getParameter("username");
		pwd=request.getParameter("pass");
		try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
			PreparedStatement ps=con.prepareStatement("insert into user(fname, lname, uname, email, pwd) values(?,?,?,?,?)");
			ps.setString(1,fn);
			ps.setString(2,ln);
			ps.setString(3,user);
			ps.setString(4,email);
			ps.setString(5,pwd);
			ps.executeUpdate();
			response.sendRedirect("login.jsp");	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	%>
</body>
</html>