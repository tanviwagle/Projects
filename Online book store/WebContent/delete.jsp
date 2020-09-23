
<%@ page import="java.sql.*" %>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" href="home.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<title>Insert title here</title>
<link href="sabka.css" rel = "stylesheet" type = "text/css">

</head>
<!--dropdown Jquery Script-->
<script>
  $(document).ready(function () {
    $(".carousel").carousel(
      {
        indicators: true,
		fullWidth:true
      });
    $(".dropdown-trigger").dropdown();
  });

</script>

<%! String cat, name, img; %>
<body>
<div id="top"  class="animate form">
			<br><br><br><br><br><br><br><br>
    
            <section>			
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form id="form" action="bookDelete.jsp"  autocomplete="on">
                           <%@page import="java.sql.*,java.util.*"%>
							<%
							String isd=request.getParameter("isbn");
							try
							{
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/obs", "root", "root");
							
							PreparedStatement pst = conn.prepareStatement("delete from books where isbn_no = ?");
							pst.setString(1,isd);
							
							int i=pst.executeUpdate();
							if(i>0)
							{
							out.println("Data Deleted Successfully!");
							}
							else
							{
							out.println("Data NOT Deleted Successfully!");
								
							}
							
							}
							catch(Exception e)
							{
							System.out.print(e);
							e.printStackTrace();
							}
							%>
							    
                                <p class="signin button"> 
                                <br><br>
									<input type="submit" value="OK" id="editProfile" />
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>

</body>
</html>

