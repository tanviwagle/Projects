<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
<%
String cname;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
	Statement st = con.createStatement();
	String un = request.getParameter("logemail");
	String pw = request.getParameter("pagcfssword");
	
	ResultSet rs = st.executeQuery("select id from admin where email_id='"+un+"' and password='"+pw+"'");
	if(rs.next())
	{
		response.sendRedirect("adminHome.jsp");
	}
	else{
		
		rs = st.executeQuery("select id,first_name from customer where email='"+un+"' and password='"+pw+"'"); 
		 if(rs.next()) 
			{
			 cname=rs.getString("first_name");
			 session.setAttribute("login_session",un);	//session contains username.
			 
			%>
			<script>
			alert1();
			function alert1()
			{
				alert("Login succesful!");
			}
			</script>
			    
	<%  	  session.setAttribute("userName", cname);
	   		  response.sendRedirect("home.jsp");       
			}
		
		 else
		 {
			response.sendRedirect("loginRegister.jsp"); 
		 }
	}
	
	
 } 
catch(Exception e)
 {
	e.printStackTrace(); 
 }
%>
</body>
</html>