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
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

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
					<form id="add-post1" class="formLogin form-group"
						name="Login_Form" > 
						<div class="divForm">
							<label id="nameForm" class="nameForm">MANAGEMENT SYSTEM</label>
						</div>
						<div class="divEmail">
							<input type="text" name="email" class="inputEmail" id="txtemail"
								placeholder="Email" required="required"><br><span id="spnEmailStatus"></span>
						</div>
						<div class="divPassword">
							<input type="password" name="password" class="inputPassword" id="txtpassword"
								placeholder="Password" ><br><span id="spnPasswordStatus"></span>
						</div>
						<div class="button">
							<button type="button" class="btnLogIn" id="btnLogin" onclick="login();">LOG IN</button>
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
										<div class="modal-header alert-success">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h3 class="modal-title"><strong>Forgot password?</strong></h3>
										</div>
									<div class="modal-body">
											<div class="form-group">
												<label><h4><strong>Please enter email to send a code via email.</strong></h4></label> <input type="email" class="form-control"
													id="emailForgot" name="emailForgot" placeholder="Email" /><span id="spnEmailForgotStatus"></span>
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
				rules : {
					email :{
						required: true,
					},
					password :{
						required: true,
					}
				},
				messages : {
					email : {
						required : "Please enter email address!",
					},
					password : {
						required : "Please enter password!",
					}
				}
			});
		});
		
	        
	        $(document).ready(function(e) {
				    $('#txtemail').blur(function() {
				        var sEmail = $('#txtemail').val();
				        if ($.trim(sEmail).length == 0) {
							$('#spnEmailStatus').html('<h4><strong>Please enter email address!</strong></h4>');
							$('#spnEmailStatus').css('color', 'white');
							$('#txtemail').css('border-color', 'red');
							$('#txtemail').css('border-width', '1px');
						document.getElementById("btnLogin").disabled = true; 
				        }
				        if (validateEmail(sEmail)) {
							$('#spnEmailStatus').html('');
							$('#txtemail').css('border-color', 'transparent');
						 	$('#spnEmailStatus').css('color', 'green');
 						document.getElementById("btnLogin").disabled = false; 
				        }
				        else {
							$('#spnEmailStatus').html('<h4><strong>Please enter valid email address!</strong></h4>');
						 	$('#spnEmailStatus').css('color', 'white');
						 	$('#txtemail').css('border-color', 'red');
							$('#txtemail').css('border-width', '1px');
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
						$('#txtpassword').css('border-color', 'transparent');
						document.getElementById("btnLogin").disabled = false; 
					}
					else {
						$('#spnPasswordStatus').html('<h4><strong>Password have minimum eight characters, at least one letter, one number and one special character!</h4></strong>');
						$('#spnPasswordStatus').css('color', 'white');
						$('#txtpassword').css('border-color', 'red');
						$('#txtpassword').css('border-width', '1px');
						document.getElementById("btnLogin").disabled = true; 
						}
					});
				});
	        
	        $(document).ready(function(e) {
			    $('#emailForgot').blur(function() {
			        var sEmail = $('#emailForgot').val();
			        if ($.trim(sEmail).length == 0) {
						$('#spnEmailForgotStatus').html('Please enter email address!');
						$('#spnEmailForgotStatus').css('font-size', '24');
						$('#spnEmailForgotStatus').css('font-weight', '600');
						 $('#spnEmailForgotStatus').css('color', 'red');
						 $('#emailForgot').css('border-color', 'red');
					document.getElementById("btnForgot").disabled = true; 
			        }
			        if (validateEmail(sEmail)) {
						$('#spnEmailForgotStatus').html('');
					 $('#spnEmailForgotStatus').css('color', 'green');
					 $('#emailForgot').css('border-color', 'transparent');
						document.getElementById("btnForgot").disabled = false; 
			        }
			        else {
						$('#spnEmailForgotStatus').html('Please enter valid email address!');
						$('#spnEmailForgotStatus').css('font-size', '24');
						$('#spnEmailForgotStatus').css('font-weight', '600');
					 $('#spnEmailForgotStatus').css('color', 'red');
					 $('#emailForgot').css('border-color', 'red');
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
			
			function login() {
				var email= $("#txtemail").val();
				var pass= document.getElementById("txtpassword").value;
				$.ajax({
					type : 'POST',
					url : '/managementSystem/login?email=' + email + '&password=' + pass,
					success : function(data) {
						if(data == 1){
							alert('Email is incorrect!');
						}
						else if(data == 2){
							alert('Your account is disabled!');
						}
						else if(data == 3){
							alert('Password is incorrect!');
						}
						else{
							window.location.href = data;
						}
						
					}
				});
			}
		</script>
	</div>
	</body>
</html>

