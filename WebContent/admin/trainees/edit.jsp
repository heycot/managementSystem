
<%@page import="model.bean.User"%>
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
	User trainee = new User(0, "", "", "", null, "", null, 0, 0, "", "", "", "");
	if( request.getAttribute("trainee") != null){
		trainee = (User) request.getAttribute("trainee");
	}
%>


<div class="content-wrapper py-3">
  <div class="container-fluid">
        <div class="card mb-3">
             <div class="alert alert-success">
			    <strong>Edit Account of &nbsp;<%= trainee.getUsername()%> </strong>
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
  
             <form id="add-post" action="<%= request.getContextPath()%>/trainee/edit?id=<%= trainee.getUserId()%>" method="POST" enctype="multipart/form-data" >
              	<div style="height: 5%"></div>
              
              <div class="col-sm-6" style="float: left">
              	<div >
              		<div class="form-group" class="col-sm-3" style="float: left">
	              	<img alt="" src="<%= request.getContextPath()%>/files/<%= trainee.getAvatar()%>" width="350px">
	              	
	              	</div>
	              	
	              	<div class="form-group" class="col-sm-3" style="float: right">
		              	<label >Avatar <em style="color: red">(jpg, png, gif)</em> </label>
		              	<input class="form-control" id="txtname" type="file" name="avatar" value="" onchange="readURL(this);" />
	    				<img id="blah" src="#" alt="your image" />
	    				<script type="text/javascript">
	    				function readURL(input) {
	    			        if (input.files && input.files[0]) {
	    			            var reader = new FileReader();
	
	    			            reader.onload = function (e) {
	    			                $('#blah')
	    			                    .attr('src', e.target.result)
	    			                    .width(150)
	    			                    .height(100);
	    			            };
	
	    			            reader.readAsDataURL(input.files[0]);
	    			        }
	    			    }
	    				</script> 
	              	</div>
	              	<div style="clear: both"></div>
              	</div>
              
              	<div class="form-group">
	              	<label class="required" >UserName</label>
	              	<input class="form-control" id="txtname" type="text" name="username" value="<%= trainee.getUsername()%>" placeholder="Username" required />
              	</div>
              	
              	<div class="form-group">
	              	<label class="required" >Fullname</label>
	              	<input class="form-control" id="txtname" type="text" name="fullname" value="<%= trainee.getFullname()%>" placeholder="Fullname" required/>
              	</div>
              	
              	
              	<div class="form-group">
	              	<label class="required" >Address</label>
	              	<input class="form-control" id="txtname" type="text" name="address" value="<%= trainee.getAddress()%>" placeholder="Address" required/>
              	</div>
              	
              </div>
              
              <div class="col-sm-6" style="float: right">
              
              	
              	
              	<div class="form-group">
	              	  <label class="required" >Gender</label> <br>
	              	  <%
	              	  String male = "", female = "", other = "";
	              	  
	              	  if ( trainee.getGender() == 0) { 
	              		  male = "checked";
	              	  } else if ( trainee.getGender() == 1) { 
	              		  female = "checked";
	              	  } else if ( trainee.getGender() == 2) {
	              		  other = "checked";
	              	  }
	              	 %>
					  <input type="radio" name="gender" value="0" <%= male%>> Male <br>
					  <input type="radio" name="gender" value="1" <%= female%>> Female <br>
					  <input type="radio" name="gender" value="2" <%= other%> > Other <br>
	              	
		              	
              	</div>
              	
              	
              	<div class="form-group">
	              	<label class="required" >Phone</label>&nbsp;<span id="spnPhoneStatus"></span>
	              	<input class="form-control" id="txtphone" type="text" name="phone" value="<%= trainee.getPhone()%>" placeholder="Phone" required/>
              	</div>
              	
              	<div class="form-group">
	              	<label class="required" >Birthday</label>
	              	<input class="form-control" id="txtname" type="date" name="dateOfBirth" value="<%=  trainee.getDateOfBirth()%>" placeholder="Birthday" required/>
              	</div>
              	
              	<div class="form-group">
	              	<label class="required" >Email</label>&nbsp;<span id="spnEmailStatus"></span>
	              	<input class="form-control" id="txtemail" type="text" name="email" value="<%= trainee.getEmail()%>" placeholder="Email" required disabled="disabled"/>
              	</div>
              	
              	<div class="form-group">
                    		
                   <label for="usr"><strong>Password:</strong></label>
                  <input type="button" value="Click here to change" onclick="changePass();"> <br>
                   <input style="display: none" type="password" class="form-control" id ="oldpass"  name="oldpass" placeholder="Current password" required/>
                   <br>
                   <input style="display: none" type="password" class="form-control" id ="newpass"  name="newpass" placeholder="New password" required/>
                   <br>
                   <input style="display: none" type="password" class="form-control" id ="confirmpass"  name="confirmpass" placeholder="Confirm new password" required/>
                  </div>
                   
                   <script type="text/javascript">
                   	function changePass(){
                   		document.getElementById("oldpass").style.display= "block";
                   		document.getElementById("newpass").style.display= "block";
                   		document.getElementById("confirmpass").style.display= "block";
                   		
                   	}
                   </script>
              	
      			
              </div> 
              
              <div style="clear: both"></div>
              <div class="error" ></div>
               
              <div>
	               <div class="col-sm-4" style="float: left"></div>
	               
	             	<div class="col-sm-4" style="float: left">
	             		<div class="col-sm-2" style="float: left"><input class="btn btn-primary" type="submit" name="submit" value="Edit" /></div>
	             		<div class="col-sm-2" style="float: left"><input class="btn btn-secondary" type="reset" name="reset" value="Reset" /></div>
	             		<div style="clear: both"></div>	
	             	</div> 
	             	
	               <div class="col-sm-4" style="float: right"></div>
	               <div style="clear: both"></div>
              </div>
              
              <div style="margin-bottom: 5%"></div>
              </form> 

           <script type="text/javascript">
	           $(document).ready(function() {
						$("#add-post").validate({
							rules: {
							   username:"required",
		                       password:{
		                       	required: true,
		                       	minlength: 6,
		                       },
		                       fullname:"required",
		                       address:"required",
		                       dateOfBirth:"required",
								},
							messages: {
							   username:"This feild is required",
		                       password:{
		                       	required: "This feild is required",
		                       	minlength: "Passwords must be at least 6 characters",
		                       },
		                       fullname:"This feild is required",
		                       address:"This feild is required",
		                       dateOfBirth:"This feild is required",
							}
						});
					});
      				
      				$(document).ready(function() {
      					$('#txtphone').blur(function(e) {/* 
      						if (validatePhone('txtphone')) { */
          					if (checkPhoneNumber()) {
      							$('#spnPhoneStatus').html('');
      							 $('#spnPhoneStatus').css('color', 'green');
      						}
      						else {
      							$('#spnPhoneStatus').html('Phone number must be 10 digits.');
      							$('#spnPhoneStatus').css('color', 'red');
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
      							$('#spnEmailStatus').html('Please enter valid email address');
     							 $('#spnEmailStatus').css('color', 'red');
      				            e.preventDefault();
      				        }
      				        if (validateEmail(sEmail)) {
      							$('#spnEmailStatus').html('');
    							 $('#spnEmailStatus').css('color', 'green');
      				        }
      				        else {
      							$('#spnEmailStatus').html('Please enter valid email address');
    							 $('#spnEmailStatus').css('color', 'red');
      				            e.preventDefault();
      				        }
      				    });
      				});

      				function validateEmail(sEmail) {
      				    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      				    if (filter.test(sEmail)) {
      				        return true;
      				    }
      				    else {
      				        return false;
      				    }
      				}
      			</script>
          </div>
        </div>
      </div>
<%@include file="/templates/inc/footer.jsp" %> 