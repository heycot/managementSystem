
<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
<%@page import="model.bean.Ability"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp"%>
<div class="content-wrapper py-3">
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header" style="background-color: rgb(212, 237, 218);">
				<h2 style="text-align: center; color: green;">Edit trainer's
					account</h2>
			
			</div>
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
				  <strong>Error!</strong><%= request.getAttribute("error")%>
				</div>
				<%} %>
			<form action="<%= request.getContextPath() %>/trainer/edit" method="post"  enctype="multipart/form-data">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-5">
								<input
									type="hidden" class="form-control" id="usr"
									value="<%=trainer.getUserId() %>" name="user_id"/>
							<div class="form-group">
								<br> <label for="usr"><strong>Email:</strong></label> <input
									type="email" class="form-control" id="usr"
									value="<%=trainer.getEmail()%>" name="email" disabled/>
							</div>

							<div class="form-group">
								<label for="usr"><strong>User name:</strong></label> <input
									type="text" class="form-control" id="usr"
									value="<%=trainer.getUsername() %>" name="username" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Full Name:</strong><span
									style="color: red"> *</span></label> <input type="text"
									class="form-control" id="usr" name="fullname"
									value="<%=trainer.getFullname() %>" required />
							</div>
							
							<div class="form-group">
			              	  <label class="required" >Gender</label> <br>
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
							  <input type="radio" name="gender" value="0" <%= male%>> Male <br>
							  <input type="radio" name="gender" value="1" <%= female%>> Female <br>
							  <input type="radio" name="gender" value="2" <%= other%> > Other <br>
			              	
				              	
		              	</div>
							
							<div class="form-group">
								<label for="usr"><strong>Date Of Birth:</strong><span
									style="color: red"> *</span></label> <input type="date"
									class="form-control" id="usr" name="dateOfBirth" required
									value="<%=trainer.getDateOfBirth() %>" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Created Date:</strong><span
									style="color: red"> *</span></label> <input type="date"
									class="form-control" id="usr" name="created_date" disabled
									value="<%=trainer.getCreatedDate()%>" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Abilities:</strong></label>
								<table class="table table-bordered">
									<thead>
										<tr>
											<td>Skill</td>
											<td>Experience</td>
											<td>Add/Edit Ability: <select class="form-group" name="skillId" id="ability" style="width: 8em;">
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
												placeholder="Experience Year" id="exp" style="width: 10em;" /></td>
										</tr>
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
						<div class="col-md-1"></div> 
						<div class="col-md-5">

							<div class="form-group">
							<br>
								<label for="usr"><strong>Address:</strong><span
									style="color: red"> *</span></label> <input type="text"
									class="form-control" id="usr" name="address" required
									value="<%=trainer.getAddress() %>" />
							</div>
							<div class="form-group">
								<label for="usr"><strong>Phone Number:</strong><span
									style="color: red"> *</span></label> <input type="text"
									class="form-control" id="usr" name="phone" required
									value="<%=trainer.getPhone() %>" />
							</div>


							<div class="form-group">

								<label for="usr"><strong>Password:</strong><span style="color: red;"> *</span></label> 
								<input type="button" value="Click here to change" onclick="changePass();"> <br>
								<input style="display: none;" type="password" class="form-control" id="oldpass" name="oldpass" placeholder="Current password" value="" />
								<input style="display: none;" type="password" class="form-control" id="newpass" name="newpass" onkeyup='checkPass();' placeholder="New password" value=""/>
								<input style="display: none;" type="password" class="form-control"
									id="confirmpass" name="confirmpass" onkeyup='checkPass();'
									placeholder="Confirm new password" value=""/><span id='message'></span>
							</div>

							<script type="text/javascript">
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
								function checkPass(){
									if (document.getElementById('newpass').value ==
								          document.getElementById('confirmpass').value) {
								          document.getElementById('message').style.color = 'green';
								          document.getElementById('message').innerHTML = 'Matching';
								      } else {
								      		document.getElementById('message').style.color = 'red';
								          document.getElementById('message').innerHTML = 'Not matching';
								      }
								}
							</script>

							<div class="form-group">
								<label class="required"><strong>Avatar</strong><em
									style="color: red">(jpg, png, gif)</em> </label> <input
									class="form-control" id="txtname" type="file" name="avatar"
									value="" placeholder="Email" onchange="readURL(this);" /> <img
									id="blah"
									src="<%= request.getContextPath()%>/files/<%= trainer.getAvatar()%>"
									alt="your image" height=200 />
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
						</div>

					</div>
					<br>
					<br>
					<div class="row">
						<div class="col-md-5"></div>
							<input type="submit"  name="submit"  value="Update" />
							<input type="reset" value="reset" />
					</div>
					</div>
			</form>
		</div>

		<script type="text/javascript">
      				/* $(document).ready(function() {
      					$("#add-post").validate({
      						rules: {
      							name:"required",
                                maxlength: 50
      						},
      						messages: {
      							name:"This field not null",
                                maxlength: "maxlength is 50 character"
      						}
      					});
      				});
      				 */
      				
      				
                    
      			</script>

	</div>
</div>

<%@include file="/templates/inc/footer.jsp"%>
