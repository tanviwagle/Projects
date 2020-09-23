<%@ page language="java" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript">  
				function validatePassword()
				{
					var password = document.getElementById("pass");
					var confirm_password = document.getElementById("cnfpass");
					if(password.value != confirm_password.value) 
					{
						confirm_password.setCustomValidity("Passwords Don't Match");
			    	}
					else
					{
						confirm_password.setCustomValidity("");
					}
				}
				password.onchange = validatePassword;
				confirm_password.onkeyup = validatePassword;
				</script>
				</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('img/multicar.jpg');">
			<div class="wrap-login100 p-t-80 p-b-30">
				<form class="login100-form validate-form" method="POST" onsubmit="return validatePassword()" action="SignUpJSP.jsp">
					<span class="login100-form-title p-t-20 p-b-45">
						<b>Welcome to <i>CARZANIA</i></b>
					</span>
					<div class="wrap-input100 validate-input m-b-10" data-validate = "First name is required">
						<input class="input100" type="text" name="fname" placeholder="First Name" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user-o"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-10" data-validate = "Last name is required">
						<input class="input100" type="text" name="lname" placeholder="Last Name" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user-o"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input m-b-10" data-validate = "Email is required">
						<input class="input100" type="email" name="email" placeholder="Email" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-10" data-validate = "Username is required">
						<input class="input100" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user-circle-o"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
						<input class="input100" id="pass" name="pass" required="required" type="password" placeholder="Password" 
									title="Password must contain Minimum 8 characters" pattern=".{8,}$"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
						<input class="input100" id="cnfpass" name="cnfpass" required="required" type="password" placeholder="Confirm Password"
									title="Must match with your Password" />
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>

					<div class="container-login100-form-btn p-t-10">
						<input class="login100-form-btn" type="submit" value="Sign Up">
					</div>

				</form>
			</div>
		</div>
	</div>

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>