
<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
<%@page import="model.bean.Ability"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
		#oldpass, #newpass{
			margin-top:5px;
			margin-bottom: 5px;
		}
		#abilityTable{
			width: 80%;
			text-align: center;
		}
	</style>
<%@include file="/templates/inc/dashboard1.jsp"%>

<%
String classNameContent = "" ;
String classNameContainer = "";
if( user.getRoleId() == 3) {
	classNameContent = "content-wrapper py-3";
	classNameContainer = "container-fluid";
}

%>
<div class="<%= classNameContent%>">
  <div class="<%= classNameContainer%>">
    <div  class="card mb-3">
             <div class="alert alert-primary" > 
			    <strong>Edit trainer </strong>
			  </div>
        <div>
			<%
				User trainer = new User();
				List<Ability> abilities= new ArrayList<>();
				SkillBo skillBo = new SkillBo();
				if (request.getAttribute("trainer") != null) {
					trainer = (User) request.getAttribute("trainer");
				}
				if (request.getAttribute("abilities") != null) {
					abilities = (List<Ability>) request.getAttribute("abilities");
				}
				if(request.getAttribute("error") != null){
			%>
			<div class="alert alert-danger">
				  <strong>Error! </strong><%= request.getAttribute("error")%>
				</div>
				<%} %>
			<form action="<%= request.getContextPath() %>/trainer/edit" method="post" id="edit-trainer-post" enctype="multipart/form-data">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
								<input
									type="hidden" class="form-control" id="usr"
									value="<%=trainer.getUserId() %>" name="user_id"/><br>
							<div class="form-group">
								<div>
									<div class="form-group" class="col-sm-2" style="float: left">
										<img id="blah"
											src="<%=request.getContextPath()%>/files/<%=trainer.getAvatar()%>"
											alt="your image" height="200"/>
									</div>		
									<br><br><br>				
									<div class="form-group" class="col-sm-4" style="float: left">
										<label class="required"><strong>Avatar:</strong><em
											style="color: red">(jpg, png, gif)</em> </label>
											 <input
											class="form-control" id="image" type="file" name="avatar"
											value="" placeholder="Email" onchange="readURL(this);" />
									</div>
									<div style="clear: both"></div>
								</div>
								<script type="text/javascript">
									function readURL(input) {
										if (input.files && input.files[0]) {
											var reader = new FileReader();

											reader.onload = function(e) {
												$('#blah').attr('src',
														e.target.result).width(
														200);
											};

											reader
													.readAsDataURL(input.files[0]);
										}
									}
								</script>
							</div>
							<div class="form-group">
								<label for="usr"><strong>Email:</strong>&nbsp;<span id="spnEmailStatus"></span></label> <input
									type="email" class="form-control" id="txtemail"
									value="<%=trainer.getEmail()%>" name="email"/>
							</div>

							<div class="form-group">
								<label for="usr"><strong>User name:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnUserNameStatus"></span></label> <input
									type="text" class="form-control" id="txtusername"
									value="<%=trainer.getUsername() %>" name="username" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Full Name:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnFullNameStatus"></span></label> <input type="text"
									class="form-control" id="txtfullname" name="fullname"
									value="<%=trainer.getFullname() %>"/>
							</div>
							
							<div class="form-group">
			              	  <label class="required" ><strong>Gender:</strong><span
									style="color: red"> *</span></label> <br>
			              	  <%
			              	  String male = "", female = "", other = "";
			              	  
			              	  if ( trainer.getGender() == 0) { 
			              		  male = "checked";
			              	  } else if ( trainer.getGender() == 1) { 
			              		  female = "checked";
			              	  } else if ( trainer.getGender() == 2) {
			              		  other = "checked";
			              	  }
			              	 %>
							  <input type="radio" name="gender" value="0" <%= male%>> Male 
							  <input type="radio" name="gender" value="1" <%= female%>> Female 
							  <input type="radio" name="gender" value="2" <%= other%> > Other 
			              	
				              	
		              	</div>

						</div>
						<div class="col-md-6">
						<br>
						<div class="form-group">
								<label for="usr"><strong>Date Of Birth:</strong><span
									style="color: red"> *</span></label> <input type="date"
									class="form-control" id="usr" name="dateOfBirth"
									value="<%=trainer.getDateOfBirth() %>" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Created Date:</strong><span
									style="color: red"> *</span></label> <input type="date"
									class="form-control" id="usr" name="created_date"
									value="<%=trainer.getCreatedDate()%>" disabled/>
							</div>
							<div class="form-group">
								<label for="usr"><strong>Address:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnAddressStatus"></span></label> <input type="text"
									class="form-control" id="address" name="address"
									value="<%=trainer.getAddress() %>"  />
							</div>
							
							<div class="form-group">
								<label for="usr"><strong>Phone Number:</strong><span
									style="color: red"> *</span>&nbsp;<span id="spnPhoneStatus"></span></label> <input type="text"
									class="form-control" id="txtphone" name="phone"
									value="<%=trainer.getPhone() %>" />
							</div>


							<div class="form-group">

								<label for="usr"><strong>Password:</strong>&nbsp;<span
									id="spnPasswordStatus"></span></label> <input type="button"
									value="Click here to change" onclick="changePass();"> <br>
								<input style="display: none;" type="password"
									class="form-control" id="oldpass" name="oldpass"
									placeholder="Current password" value=""/> <input
									style="display: none;" type="password" class="form-control"
									id="newpass" name="newpass" placeholder="New password" value=""/>
								<input style="display: none;" type="password"
									class="form-control" id="confirmpass" name="confirmpass"
									placeholder="Confirm new password" value="" /><span
									id='message'></span>
							</div>

							<div class="form-group">
								<label for="usr"><strong>Abilities:</strong></label>
								<table class="table table-bordered" id="abilityTable">
									<thead>
										<tr>
											<td><strong>Skill:</strong><br>
											<select class="form-group" name="skillId" id="ability" style="width: 12em;margin-top: 5px;">
												<%
													List<Skills> skills = skillBo.getSkills();
													for (Skills skill : skills) {
												%>
												<option value="<%=skill.getSkillId()%>"><%=skill.getName()%></option>
												<%
													}
												%>
											</select>
											</td>
											<td><strong>Experience:</strong><br>
											<input type="number" name="experience" value="0"
												placeholder="Experience Year" id="exp" style="width: 12em; margin-top: 5px;" min="0" max="50" />
											</td>
											<%-- <td>Add/Edit Ability: <select class="form-group" name="skillId" id="ability" style="width: 8em;">
												<%
													List<Skills> skills = skillBo.getSkills();
													for (Skills skill : skills) {
												%>
												<option value="<%=skill.getSkillId()%>"><%=skill.getName()%></option>
												<%
													}
												%>
											</select>
											<input type="number" name="experience" value="0"
												placeholder="Experience Year" id="exp" style="width: 10em;" min="0" max="50" /></td>
										</tr> --%>
									</thead>
									<tbody>
										<%
											for (Ability ability : abilities) {
										%>
										<tr>
											<td><%=skillBo.getSkillById(ability.getSkillId())%></td>
											<td><%=ability.getExperience()%></td>
										<%
											}
										%>
										</tr>
									</tbody>
								</table>

							</div>

							
						</div>

					</div>
					<br>
					<br>
					<div class="row">
						<div class="col-md-5"></div>
							<input class="btn btn-success btn-lg" type="submit"  name="submit" id="btnSubmit"  value="Update" style="margin-right: 0.5em;"/>
							<input class="btn btn-default btn-lg" type="reset" value="Reset" />
					</div>
					</div>
			</form>
			<script type="text/javascript">
      				$(document).ready(function() {
      					$("#edit-trainer-post").validate({
      						rules: {
      							email:{
      								required: true,
      								email:true
      							},
      							username:"required",
                                oldpass:{
                                	required: true,
                                	minlength: 6,
                                },
                                newpass:{
                                	required: true,
                                	minlength: 6,
                                },
                                confirmpass:{
                                	required: true,
                                	minlength: 6,
                                	equalTo: "#newpass"
                                },
                                fullname:"required",
                                address:"required",
                                dateOfBirth:"required",
      						},
      						messages: {
      							username:"Username is required!",
                                oldpass:{
                                	required: "Password is required!",
                                	minlength: "Password must be at least 6 characters!",
                                },
                                newpass:{
                                	required: "Password is required!",
                                	minlength: "Password must be at least 6 characters!",
                                },
                                confirmpass:{
                                	required: "Password is required!",
                                	minlength: "Password must be at least 6 characters!",
                                	equalTo: "Password does not matching!"
                                },
                                fullname:"Fullname is required!",
                                address:"Address is required!",
                                dateOfBirth:"Day of Birth is required!",
      						}
      					});
      				});
      				
      				$(document).ready(function() {
      					$('#txtphone').blur(function(e) {
          					if (checkPhoneNumber()) {
      							$('#spnPhoneStatus').html('');
      							 $('#spnPhoneStatus').css('color', 'green');
         						document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnPhoneStatus').html('Phone number must be 10 digits.');
      							$('#spnPhoneStatus').css('color', 'red');
       							document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				function checkPhoneNumber() {
      				    var flag = false;
      				    var phone = $('#txtphone').val().trim(); // ID của trường Số điện thoại
      				    if (phone != '') {
      				        var firstNumber = phone.substring(0, 2);
      				        if ((firstNumber == '09' || firstNumber == '08') && phone.length == 10) {
      				            if (phone.match(/^\d{10}/)) {
      				                flag = true;
      				            }
      				        } else if (firstNumber == '01' && phone.length == 11) {
      				            if (phone.match(/^\d{11}/)) {
      				                flag = true;
      				            }
      				        }
      				    }
      				    return flag;
      				}
      				$(document).ready(function(e) {
      				    $('#txtemail').blur(function() {
      				        var sEmail = $('#txtemail').val();
      				        if ($.trim(sEmail).length == 0) {
      							$('#spnEmailStatus').html('Please enter valid email address!');
     							 $('#spnEmailStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      				        }
      				        if (validateEmail(sEmail)) {
      							$('#spnEmailStatus').html('');
    							 $('#spnEmailStatus').css('color', 'green');
         						document.getElementById("btnSubmit").disabled = false; 
      				        }
      				        else {
      							$('#spnEmailStatus').html('Please enter valid email address!');
    							 $('#spnEmailStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      				        }
      				    });
      				});

      				function validateEmail(sEmail) {
      				    var filter = /^([A-Za-z]+.[A-Za-z0-9]*)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      				    if (filter.test(sEmail)) {
      				        return true;
      				    }
      				    else {
      				        return false;
      				    }
      				}
      				
      				$(document).ready(function() {
      					$('#txtusername').blur(function(e) {
      						var userName= $('#txtusername').val();
          					if (validateStrings(userName)) {
          						$('#spnUserNameStatus').html('');
      							$('#spnUserNameStatus').css('color', 'green');
        						document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnUserNameStatus').html('Username is invalid!');
      							$('#spnUserNameStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				$(document).ready(function() {
      					$('#txtfullname').blur(function(e) {
      						var fullName= $('#txtfullname').val();
          					if (validateFullName(fullName)) {
          						$('#spnFullNameStatus').html('');
      							$('#spnFullNameStatus').css('color', 'green');
        						document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnFullNameStatus').html('Fullname is invalid!');
      							$('#spnFullNameStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				$(document).ready(function() {
      					$('#address').blur(function(e) {
      						var addr= $('#address').val();
          					if (validateAddress(addr)) {
          						$('#spnAddressStatus').html('');
      							$('#spnAddressStatus').css('color', 'green');
        						document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnAddressStatus').html('Address is invalid!');
      							$('#spnAddressStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				$(document).ready(function() {
      					$('#newpass').blur(function(e) {
      						var pass= $('#newpass').val();
          					if (validatePassword(pass)) {
          						$('#spnPasswordStatus').html('');
      							$('#spnPasswordStatus').css('color', 'green');
        						document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnPasswordStatus').html('Password have minimum eight characters, at least one letter, one number and one special character!');
      							$('#spnPasswordStatus').css('color', 'red');
        						document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				function validateStrings(string) {
      					//var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!0-9]+$/;
      					var pattern = /^[a-zA-Z]+$/;
      					return $.trim(string).match(pattern) ? true : false;
      				}
      				
      				function validateFullName(string) {
      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!0-9]+$/;
      					//var pattern = /^[a-zA-Z]+$/;
      					return $.trim(string).match(pattern) ? true : false;
      				}
      				
      				function validateAddress(string) {
      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;
      					return $.trim(string).match(pattern) ? true : false;
      				}
      				
      				function validatePassword(password){
      					var pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
      					return $.trim(password).match(pattern) ? true : false;
      				}

      				function changePass() {
						if(document.getElementById("oldpass").style.display == "none"){
							document.getElementById("oldpass").style.display = "block";
							document.getElementById("newpass").style.display = "block";
							document.getElementById("confirmpass").style.display = "block";
						}
						else{
							document.getElementById("oldpass").style.display = "none";
							document.getElementById("newpass").style.display = "none";
							document.getElementById("confirmpass").style.display = "none";
						}
					}
      			</script>
			
		</div>
	
	
</div>

<%@include file="/templates/inc/footer.jsp"%>