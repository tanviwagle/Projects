<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
 <%@ page trimDirectiveWhitespaces="true" %>
<%
  int id =  Integer.parseInt(request.getParameter("id"));
  try{      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");      
    Statement st=con.createStatement();
    String strQuery = "select image from car_info where id="+id;
    ResultSet rs = st.executeQuery(strQuery);

    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString(1);
       }  
    rs = st.executeQuery(strQuery);
    if(rs.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      InputStream readImg = rs.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();  
      response.getOutputStream().close();
    }
  }
  catch (Exception e){
  }
%>