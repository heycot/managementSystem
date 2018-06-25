
<%@page import="model.bean.Skills"%>
<%@page import="model.bo.SkillBo"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.List"%>
<%@page import="model.bo.RoleBo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp"%>
<div class="content-wrapper py-3">
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header" style="background-color: rgb(212, 237, 218)";>
				<h2 style="text-align: center; color: green;">Add trainer's
					account</h2>
			</div>
			<form id="add-post" action="/trainer/add" method="POST">
				<div style="height: 5%"></div>

				<div class="col-sm-6" style="float: left">
					<div class="form-group">
						<label class="required"><strong>Email:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="email"
							placeholder="Email" required />
					</div>
					<div class="form-group">
						<label class="required"><strong>Username:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="username"
							placeholder="Username" required />
					</div>

					<div class="form-group">
						<label class="required"><strong>Password:</strong>:<span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="password" name="password"
							placeholder="Password" required />
					</div>

					<div class="form-group">
						<label class="required"><strong>Full Name:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="fullname"
							placeholder="Fullname" required />
					</div>



					<div class="form-group">
						<label class="required"><strong>Gender:</strong><span
							style="color: red"> *</span></label> <br>
							 <input type="radio"
							name="gender" value="male"> Male
							<input type="radio"
							name="gender" value="female">Female
							<input type="radio"
							name="gender" value="other">Other
					</div>
					<div class="form-group">
						<label class="required"><strong>Address</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="address" value=""
							placeholder="Address" required />
					</div>
					
				</div>

				<div class="col-sm-6" style="float: right">
					
					<div class="form-group">
						<label class="required"><strong>Phone Number:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="text" name="phone"
							placeholder="Phone" required />
					</div>

					<div class="form-group">
						<label class="required"><strong>Birthday:</strong><span
							style="color: red"> *</span></label> <input class="form-control"
							id="txtname" type="date" name="dateOfBirth"
							placeholder="Birthday" required />
					</div>

					<div class="form-group">
						<label class="required"><strong>Avatar:</strong> <span
							style="color: red"> *</span><em style="color: red">(jpg,
								png, gif)</em> </label> <input class="form-control" id="txtname" type="file"
							name="avatar"
							onchange="readURL(this);" required /> <img id="blah" src="#"
							alt="your image" />
						<script type="text/javascript">
                          function readURL(input) {
                              if (input.files && input.files[0]) {
                                  var reader = new FileReader();
      
                                  reader.onload = function (e) {
                                      $('#blah')
                                          .attr('src', e.target.result)
                                          .width(300);
                                  };
      
                                  reader.readAsDataURL(input.files[0]);
                              }
                          }
                          </script>
					</div>
					<div class="form-group">
						<label class="required"><strong>Ability:</strong><span
							style="color: red"> *</span></label><br> <select class="form-inline">
							<%
							SkillBo skillBo= new SkillBo();
							List<Skills> skills= skillBo.getSkills();
							for(Skills skill: skills){
							%>
							<option  name="skillId" value="<%=skill.getSkillId()%>"><%=skill.getName()%></option>
							<%}%>
						</select> <input class="form-inline" id="txtname" type="number"
							name="experience" placeholder="Experience Year" required />
					</div>
					
					<div style="clear: both"></div>
					<div class="error"></div>
					<br>
					<br>
					<div>
							<div class="col-sm-3" style="float: left">
								<input class="btn btn-success btn-lg" type="submit" name="submit"
									value="Create" style="margin-left: 15em;"/>
							</div>
							<div class="col-sm-3" style="float: left">
								<input class="btn btn-darkgrey btn-lg" type="reset" name="reset"
									value="Reset"  style="margin-left: 10em;" />
							</div>
					</div>

					<div style="margin-bottom: 10%"></div>
			</form>

		</div>
	</div>
</div>

</body>
</html>
<%@include file="/templates/inc/footer.jsp"%>
