<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="css/style.css">
    
    <script>
function success()
{
	alert("Email sent");
	window.location.replace("compareCar.jsp");
	}
</script>
</head>
<body>
<%!
String name, brand, type, price, mileage, doors, seat_cap, wheel_type, steering, airbags, pass_air, speakers, usb, radio, bluetooth, gps, rear_ac, ac; 
String name1, brand1, type1, price1, mileage1, doors1, seat_cap1, wheel_type1, steering1, airbags1, pass_air1, speakers1, usb1, radio1, bluetooth1, gps1, rear_ac1, ac1;
%>
<%
String car1=request.getParameter("car1");
String car2=request.getParameter("car2");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","root");
	PreparedStatement ps=con.prepareStatement("select * from car_info where name='"+car1+"'");
	PreparedStatement ps1=con.prepareStatement("select * from car_info where name='"+car2+"'");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		name=rs.getString("name");
		brand=rs.getString("brand"); 
 		type=rs.getString("type");
 		price=rs.getString("price"); 
 		mileage=rs.getString("mileage");
 		doors=rs.getString("no_of_door");
 		seat_cap=rs.getString("seat_cap"); 
 		wheel_type=rs.getString("wheel_type"); 
 		steering=rs.getString("steering_type");
 		airbags=rs.getString("airbags");
 		pass_air=rs.getString("passenger_abags");
 		speakers=rs.getString("speakers");
 		usb=rs.getString("usb_support");
 		radio=rs.getString("radio_support"); 
 		bluetooth=rs.getString("bluetooth_sup"); 
 		gps=rs.getString("gps_navigation");
 		rear_ac=rs.getString("rear_ac"); 
 		ac=rs.getString("ac");
	}	
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	{
		name1=rs1.getString("name");
 		brand1=rs1.getString("brand"); 
 		type1=rs1.getString("type");
 		price1=rs1.getString("price"); 
 		mileage1=rs1.getString("mileage");
 		doors1=rs1.getString("no_of_door");
 		seat_cap1=rs1.getString("seat_cap"); 
 		wheel_type1=rs1.getString("wheel_type"); 
 		steering1=rs1.getString("steering_type");
 		airbags1=rs1.getString("airbags");
 		pass_air1=rs1.getString("passenger_abags");
 		speakers1=rs1.getString("speakers");
 		usb1=rs1.getString("usb_support");
 		radio1=rs1.getString("radio_support"); 
 		bluetooth1=rs1.getString("bluetooth_sup"); 
 		gps1=rs1.getString("gps_navigation");
 		rear_ac1=rs1.getString("rear_ac"); 
 		ac1=rs1.getString("ac");
	}	
}
catch(Exception e)
{
	e.printStackTrace();
}


String result;

// Recipient's email ID needs to be mentioned.
String to = "tanviwagle176@gmail.com";

// Sender's email ID needs to be mentioned
final String from = "<Your email id>";
final String username = "<your username>";
final String password = "<your password>";
// Assuming you are sending email from localhost
String host = "mail.smtp.host";
String sub="Car comparison information";
String msg1=""+name+"\nBrand: "+brand+"\nType: "+type+"\nPrice:"+price+"\nMileage: "+mileage+"\nNo of doors: "+doors+"\nSeating capacity: "+seat_cap+"\nWheel type: "+wheel_type+"\nSteering wheel type: "+steering+"\nAirbags: "+airbags+"\nPassenger airbags: "+pass_air+"\nSpeakers: "+speakers+"\nUSB Support: "+usb+"\nRadio Support: "+radio+"\nBluetooth Support: "+bluetooth+"\nGPS Navigation: "+gps+"\nRear A/C: "+rear_ac+"\nA/C: "+ac;
String msg2="\n\n"+name1+"\nBrand: "+brand1+"\nType: "+type1+"\nPrice:"+price1+"\nMileage: "+mileage1+"\nNo of doors: "+doors1+"\nSeating capacity: "+seat_cap1+"\nWheel type: "+wheel_type1+"\nSteering wheel type: "+steering1+"\nAirbags: "+airbags1+"\nPassenger airbags: "+pass_air1+"\nSpeakers: "+speakers1+"\nUSB Support: "+usb1+"\nRadio Support: "+radio1+"\nBluetooth Support: "+bluetooth1+"\nGPS Navigation: "+gps1+"\nRear A/C: "+rear_ac1+"\nA/C: "+ac1;
String msg=msg1+msg2;


// Get system properties object
Properties properties = new Properties();
properties.setProperty("mail.smtp.starttls.enable", "true");
properties.put("mail.smtp.host", "smtp.gmail.com");
properties.put("mail.smtp.port", "587");
properties.put("mail.smtp.auth", "true");
properties.put("mail.smtp.starttls.enable", "true");

// creates a new session with an authenticator
Authenticator auth = new Authenticator() {
public PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(from, password);
}
};

Session s = Session.getInstance(properties, auth);    
   
   try {    
       MimeMessage message = new MimeMessage(s);    
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
       message.setSubject(sub);    
       message.setText(msg);    
       //send message  
       Transport.send(message);%>    
       <script>success();</script> 
      <%}
catch (MessagingException e) {throw new RuntimeException(e);}    
         


					
					
					%>
</body>
</html>