
<%@page import="model.bean.Majors"%>
<%@page import="model.bean.Courses"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>
<style>
	#add-post .required:after {
	  content:"*";color:red;
	}
</style>

<%
Courses course = new Courses(0, 0, "", 0, 0, "", 0);
ArrayList<Majors> majors = new ArrayList<>();

if( request.getAttribute("course") != null){
	course = (Courses) request.getAttribute("course");
}

if (request.getAttribute("majors") != null) {
	majors = (ArrayList<Majors>)request.getAttribute("majors");
}
%>


<div class="content-wrapper py-3">
  <div class="container-fluid">
        <div class="card mb-3">
             <div class="alert alert-success">
			    <strong>Edit course: &nbsp;<%= course.getName()%> </strong>
			  </div>
			  
			  <div>
			  	<%
				if(request.getAttribute("error") != null){
				%>
				<div class="alert alert-danger">
				  <strong>Error!</strong><%= request.getAttribute("error")%>
				</div>
				<%
				}
			  	%>
			  </div>
  
             <form id="add-post" action="<%= request.getContextPath()%>/course/edit?id=<%= course.getCourseId()%>" method="POST" >
              	<div style="height: 5%"></div>
              	<div class="col-sm-1" style="float: left"></div>
              	
              	<div class="col-sm-10"  style="float: left">
              		<div class="form-group">
	              	<label class="required" >Major</label>
	              	<select name="major">
	              	<%
	              		for (Majors major : majors) {
	              		%> 
	              		<option value="<%= major.getMajorId()%>"><%= major.getName()%></option>
	              		<%
	              		}
	              	%>
	              	</select>
	              	</div>
	              	
	              	<div class="form-group">
		              	<label class="required" >Name</label>&nbsp;<span id="spnNameStatus"></span>
		              	<input class="form-control" id="txtName" pattern="^[A-Za-z_-][A-Za-z0-9_-]*$" type="text" name="name" value="<%= course.getName()%>" placeholder="Coursesname" required/>
	              		<input type="text" name="id" value="<%= course.getCourseId()%>" placeholder="Coursesname" style="display: none"/>
	              	</div>
	              	
	              	<div class="form-group">
		              	<label class="required" >Duration</label>&nbsp;<span id="spnDurationStatus"></span>
		              	<input class="form-control" type="text" id="txtDuration" name="duration" value="<%= course.getDuration()%>" placeholder="duration" required/>
	              	</div>
	              	
	              	<div class="form-group">
		              	  <label class="required">Is this course the default? &nbsp;</label> <br>
						  <input type="radio" name="kindOfCourse" value="1" > Yes <br>
						  <input type="radio" name="kindOfCourse" value="0" checked>  No <br>
	              	</div>
	              
	              <div class="error" ></div>
	               
	              <div>
		               <div class="col-sm-4" style="float: left"></div>
		               
		             	<div class="col-sm-4" style="float: left">
		             		<div class="col-sm-2" style="float: left"><input id="btnSubmit" class="btn btn-primary" type="submit" name="submit" value="Update" /></div>
		             		<div class="col-sm-2" style="float: left"><input class="btn btn-secondary" type="reset" name="reset" value="Reset" /></div>
		             		<div style="clear: both"></div>	
		             	</div> 
		             	
		               <div class="col-sm-4" style="float: right"></div>
		               <div style="clear: both"></div>
	              </div>
	              
	              <div style="margin-bottom: 5%"></div>
              	</div>
              	
              	<div class="col-sm-1"  style="float: left"></div>
              	<div  style="clear: both"></div>
              </form> 

           <script type="text/javascript">
      				$(document).ready(function() {
      					$("#add-post").validate({
      						rules: {
      							name:"required",
                                kindOfCourse:"required",
      						},
      						messages: {
      							name:"This feild is required",
                                kindOfCourse:"This feild is required",
      						}
      					});
      				});
      				
      				$(document).ready(function() {
      					$('#txtDuration').blur(function(e) {
          					if (checkDuration()) {
      							$('#spnDurationStatus').html('');
      							 $('#spnDurationStatus').css('color', 'green');
      						}
      						else {
      							$('#spnDurationStatus').html('Duration number must be digits.');
      							$('#spnDurationStatus').css('color', 'red');
      						}
       					});
      				});
      				
      				function checkDuration() {
      					var intRegex = /^\d+$/;

      					var str = $('#txtDuration').val();
      					if(intRegex.test(str)) {
      					   return true;
      					} else{
      						return false;
      					}
      				}   
      				
      				$(document).ready(function() {
      					$('#txtName').blur(function(e) {
      						var name = $('#txtName').val();
          					if (validateStrings(name)) {
      							$('#spnNameStatus').html('');
      							$('#spnNameStatus').css('color', 'green');
      						}
      						else {
      							$('#spnNameStatus').html('Name of course must be character.');
      							$('#spnNameStatus').css('color', 'red');
      							document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				});
      				
      				function validateStrings(string) {
      					var pattern = /^[a-zA-Z0-9]+|[\b]+$/;

      					return $.trim(string).match(pattern) ? true : false;
      				}
      			</script>
          </div>
        </div>
      </div>
<%@include file="/templates/inc/footer.jsp" %> 