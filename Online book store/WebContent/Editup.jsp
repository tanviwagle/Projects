
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
                            <form id="form" action="Update1.jsp"  autocomplete="on">
                           
							    <%@ page import="java.sql.*" %>
							    <%@page import="java.io.InputStream"%>
								<%@page import="java.io.FileInputStream"%>
								<%@page import="java.io.File"%>
								<%@page import="java.sql.DriverManager"%>
								<%@page import="java.sql.ResultSet"%>
								<%@page import="java.sql.PreparedStatement"%>
								<%@page import="java.sql.Connection"%>
								<%@page import="java.text.SimpleDateFormat" %>  
								<%@page import="java.util.Date" %>
							
							
							
							 <%
							
							   //int id=Integer.parseInt(request.getParameter("id"));
							   String name=request.getParameter("bname");
							   
							   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							   java.util.Date pub=format.parse(request.getParameter("pub_date"));
							   java.sql.Date result = new java.sql.Date( pub.getTime() );
							   
							   int edition=Integer.parseInt(request.getParameter("book_edition"));
							   
							   float mrp=Float.parseFloat(request.getParameter("book_cost"));
							   
							   String lang=request.getParameter("language");
							   
							   String message=request.getParameter("message");
							   
							   String bind=request.getParameter("bind");
							   
							   float dis_cost=Float.parseFloat(request.getParameter("dis"));
							   
							   String auth1=request.getParameter("book_auth1");
							  
							   String auth2=request.getParameter("book_auth2");
							   
							   String auth3=request.getParameter("book_auth3");
							  
							   int cat1=Integer.parseInt(request.getParameter("Select Category1"));
							   
							   int cat2=Integer.parseInt(request.getParameter("Select Category2"));
							   
							   int cat3=Integer.parseInt(request.getParameter("Select Category3"));
							   
							   
							   String publish=request.getParameter("book_publisher");
							  
							   
							   
							   
							  
							   
							   
							   
							   
							 %>
							 
							<%
							String isbn1=request.getParameter("isbn");
							
							try
							{
								Class.forName("com.mysql.jdbc.Driver");
								Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/obs","root","root");
								
								String query="update books set name=?,publish_year=?,edition=?,mrp=?,language=?,description=?,binding=?,discount=?,Author1=?,Author2=?,Author3=?,Category1=?,Category2=?,Category3=?,publisher=? where isbn_no="+isbn1;
								PreparedStatement pstmt = con.prepareStatement(query);
								
									//pstmt.setInt(1,12);
									pstmt.setString(1,name);
									pstmt.setDate(2,result);
									pstmt.setInt(3,edition);
									
									
									pstmt.setFloat(4,mrp);
									pstmt.setString(5,lang);
									pstmt.setString(6,message);
									pstmt.setString(7,bind);
									//pstmt.setString(11,pdf);
									
									pstmt.setFloat(8,dis_cost);
									pstmt.setString(9,auth1);
									pstmt.setString(10,auth2);
									pstmt.setString(11,auth3);
									pstmt.setInt(12,cat1);
									pstmt.setInt(13,cat2);
									pstmt.setInt(14,cat3);
									pstmt.setString(15,publish);
									
								
									
									int i=pstmt.executeUpdate();
									if(i > 0)
									{
									out.print("Record Updated Successfully");
									}
									else
									{
									out.print("There is a problem in updating Record.");
									}
								
								
								%> 
								
								<% } catch(Exception e)
							                         {
									                   out.print(e); 
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
