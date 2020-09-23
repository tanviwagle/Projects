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
	alert("Feedback successfully submitted");
	window.location.replace("homepage.jsp");
	}
</script>
</head>
<body>
	<%! String feed;
	%>
	<%
		String email=(String)session.getAttribute("email");
		String uname=(String)session.getAttribute("name");
		feed=request.getParameter("feed");
		try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
			PreparedStatement ps=con.prepareStatement("insert into feedback(content, email, user) values(?,?,?)");
			ps.setString(1,feed);
			ps.setString(2,email);
			ps.setString(3,uname);
			ps.executeUpdate();
			%>
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