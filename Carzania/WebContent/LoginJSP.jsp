<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function login()
{
	alert("Login Successful");
	window.location.replace("homepage.jsp");
}
function log()
{
	alert("Wrong username or password. Please try again!");
	window.location.replace("login.jsp");
}
</script>
<body>	
	<%! String user, pwd, first; %>
	<%
		user=request.getParameter("username");
		pwd=request.getParameter("pass");
		
		try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
			PreparedStatement ps=con.prepareStatement("Select id, fname, email from user where uname= ? and pwd=?");
			ps.setString(1,user);
			ps.setString(2,pwd);
			ResultSet rs=ps.executeQuery();
			if(user.equals("admin") && pwd.equals("admin123"))
			{
				response.sendRedirect("adminHome.jsp");
			}
			else
			{
				if(rs.next())
				{
					first=rs.getString("fname");
					session.setAttribute("email",rs.getString("email"));
					session.setAttribute("name",first);%>
					<script>login();</script>
					
					<%	
				}
				else
				{%>
					<script>log();</script>
				<%}
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	%>
</body>
</html>