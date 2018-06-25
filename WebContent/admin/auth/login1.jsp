<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/templates/images/login_icon.png" />
		<link rel="stylesheet"  type="text/css" href="<%= request.getContextPath()%>/templates/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleLogin1.css">
	</head>
	
	<body id="loginPage">
	    <div class="wrapper" id="home">
	        <div class="container">
	            <div class="logoSite">
	                <img src="<%= request.getContextPath()%>/templates/images/enclave_logo.png" class="logo" height="120px" width="370px" >
	            </div>
	            <div class="formSite">
	                <div>
	                    <form class="formLogin form-group" action="<%= request.getContextPath()%>/login" method="post" name="Login_Form" id="add-post1">
	                        <div class="divForm">
	                             <label id="nameForm" class="nameForm">MANAGEMENT SYSTEM</label>
	                        </div>
	                        <div class="divEmail">
	                            <input type="text" name="email" class="inputEmail" placeholder="Email" required>
	                        </div>
	                        <div class="divPassword">
	                            <input type="password" name="password" class="inputPassword" placeholder="Password" required>
	                        </div>
	                        <div class="button">
	                            <input type="submit" class="btnLogIn" value="LOG IN">
	                        </div>
	                        <div class="divForgot">
	                            <a href="#" class="forgotPass"><u>Forgot Password?</u></a>
	                        </div>
	                    </form>	
	                </div>
		       </div>   
	        </div>
	        <script type="text/javascript">
	        $(document).ready(function() {
				$("#add-post1").validate({
					// ignore: [],
					// debug: false,
					rules: {
						email:"required",
						password:"required",
					},
					messages: {
						email:"Please enter email.",
						password:"Please enter password.",
					}
				});
			});
		</script>
	    </div>
	</body>
</html>

