<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/templates/images/login_icon.png" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleLogin1.css">
		<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body id="loginPage">
	    <div class="wrapper" id="home">
		<div class="container">
			<div class="logoSite">
				<img
					src="<%= request.getContextPath()%>/templates/images/enclave_logo.png"
					class="logo" height="120px" width="370px">
			</div>
			<div class="formSite">
				<div>
					<form class="formLogin form-group"
						action="<%= request.getContextPath()%>/login" method="post"
						name="Login_Form" id="add-post1">
						<div class="divForm">
							<label id="nameForm" class="nameForm">MANAGEMENT SYSTEM</label>
						</div>
						<div class="divEmail">
							<input type="text" name="email" class="inputEmail" id="txtemail"
								placeholder="Email" ><br><span id="spnEmailStatus"></span>
						</div>
						<div class="divPassword">
							<input type="password" name="password" class="inputPassword" id="txtpassword"
								placeholder="Password" ><br><span id="spnPasswordStatus"></span>
						</div>
						<div class="button">
							<input type="submit" class="btnLogIn" id="btnLogin" value="LOG IN">
						</div>
					</form>
					<div class="divForgot">
							<button type="button" class="btn btn-link btn-lg" id="forgotPass"
								data-toggle="modal" data-target="#forgotModal">Forgot Password?</button>
								<a href="http://localhost:8080/managementSystem/forgotpassword?id=||"></a>

							<!-- Modal -->
							<div id="forgotModal" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Forgot password?</h4>
										</div>
									<div class="modal-body">
											<div class="form-group">
												<label>Please enter email to send a code via email.</label> <input type="email" class="form-control"
													id="emailForgot" name="emailForgot" placehoder="Email" /><br><span id="spnEmailForgotStatus"></span>
											</div>
											<button type="button" class="btn btn-primary" id="btnForgot" onclick="sendEmail();">Send</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
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
	        
	        $(document).ready(function(e) {
				    $('#txtemail').blur(function() {
				        var sEmail = $('#txtemail').val();
				        if ($.trim(sEmail).length == 0) {
							$('#spnEmailStatus').html('Please enter valid email address!');
							 $('#spnEmailStatus').css('color', 'red');
						document.getElementById("btnLogin").disabled = true; 
				        }
				        if (validateEmail(sEmail)) {
							$('#spnEmailStatus').html('');
						 $('#spnEmailStatus').css('color', 'green');
 						document.getElementById("btnLogin").disabled = false; 
				        }
				        else {
							$('#spnEmailStatus').html('Please enter valid email address!');
						 $('#spnEmailStatus').css('color', 'red');
						document.getElementById("btnLogin").disabled = true; 
				        }
				    });
				});
	        
	        $(document).ready(function() {
					$('#txtpassword').blur(function(e) {
						var pass= $('#txtpassword').val();
  					if (validatePassword(pass)) {
  						$('#spnPasswordStatus').html('');
							$('#spnPasswordStatus').css('color', 'green');
						document.getElementById("btnLogin").disabled = false; 
						}
						else {
							$('#spnPasswordStatus').html('Password have minimum eight characters, at least one letter, one number and one special character!');
							$('#spnPasswordStatus').css('color', 'red');
						document.getElementById("btnLogin").disabled = true; 
						}
					});
				});
	        
	        $(document).ready(function(e) {
			    $('#emailForgot').blur(function() {
			        var sEmail = $('#emailForgot').val();
			        if ($.trim(sEmail).length == 0) {
						$('#spnEmailForgotStatus').html('Please enter valid email address!');
						 $('#spnEmailForgotStatus').css('color', 'red');
					document.getElementById("btnForgot").disabled = true; 
			        }
			        if (validateEmail(sEmail)) {
						$('#spnEmailForgotStatus').html('');
					 $('#spnEmailForgotStatus').css('color', 'green');
						document.getElementById("btnForgot").disabled = false; 
			        }
			        else {
						$('#spnEmailForgotStatus').html('Please enter valid email address!');
					 $('#spnEmailForgotStatus').css('color', 'red');
					document.getElementById("btnForgot").disabled = true; 
			        }
			    });
			});

			
			function validateEmail(sEmail) {
				var filter = /^([A-Za-z]+.[A-Za-z0-9]*)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if (filter.test(sEmail)) {
					return true;
				} else {
					return false;
				}
			}
			function validatePassword(password) {
				var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				return $.trim(password).match(pattern) ? true : false;
			}

			function sendEmail() {
				var email= $("#emailForgot").val();
				$.ajax({
					type : 'POST',
					url : '/managementSystem/forgotpassword?emailForgot=' + email,
					success : function(data) {
						alert(data);
					}
				});
			}
		</script>
	</div>
	</body>
</html>

