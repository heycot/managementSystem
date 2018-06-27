
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>
<div class="content-wrapper py-3">
  <div class="container-fluid">
       <div class="card mb-3">
         <div class="card-header" style="background-color:rgb(212, 237, 218)";>
            <h2 style="text-align:center;color:green;">Edit trainer's account</h2>
         </div>
      <form>
         <div class="container-fluid">
            <div class="row">
            
                <div class="col-md-5">
                    <div class="form-group">
                    <br>
                            <label for="usr"><strong>User ID:</strong></label>
                            <input type="text" class="form-control" id="usr" value="" name="userId" disabled/>
                          </div>
                    <div class="form-group">
                            <label for="usr"><strong>User name:</strong></label>
                            <input type="text" class="form-control" id="usr" value="" name="userName" disabled/>
                        </div>
                    <div class="form-group">
                            <label for="usr"><strong>Full Name:</strong><span style="color: red"> *</span></label>
                            <input type="text" class="form-control" id="usr"  name="fullname" required="true"/>
                        </div>
                    <div class="form-group">
                            <label for="usr"><strong>Date Of Birth:</strong><span style="color: red"> *</span></label>
                            <input type="date" class="form-control" id="usr"  name="dateOfBirth" required/>
                        </div>
                    <div class="form-group">
                            <label for="usr"><strong>Created Date:</strong><span style="color: red"> *</span></label>
                            <input type="date" class="form-control" id="usr"  name="created_date" required/>
                        </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="form-group">
                    <br>
                            <label for="usr"><strong>Email:</strong></label>
                            <input type="email" class="form-control" id="usr" value="" name="email" disabled/>
                          </div>
                    <div class="form-group">
                            <label for="usr"><strong>Address:</strong><span style="color: red"> *</span></label>
                            <input type="text" class="form-control" id="usr"  name="address" required/>
                        </div>
                    <div class="form-group">
                            <label for="usr"><strong>Phone Number:</strong><span style="color: red"> *</span></label>
                            <input type="text" class="form-control" id="usr" name="phone" required/>
                            </div>
                    
                            
                    <div class="form-group">
                    		
                            <label for="usr"><strong>Password:</strong><span style="color: red"> *</span></label>
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
                            
                    <div class="form-group">
                            <label class="required" ><strong>Avatar</strong><em style="color: red">(jpg, png, gif)</em> </label>
                            <input class="form-control" id="txtname" type="file" name="avatar" value="" placeholder="Email" onchange="readURL(this);" required/>
                            <img id="blah" src="#" alt="your image" />
                            <script type="text/javascript">
                                function readURL(input) {
                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();
                
                                        reader.onload = function (e) {
                                            $('#blah')
                                                  .attr('src', e.target.result)
                                                .width(200);
                                          };
                
                                        reader.readAsDataURL(input.files[0]);
                                    }
                                 }
                                    </script> 
                    </div>
                </div>
                    
        </div>
        <br><br>
        <div class="row">
        <div class="col-md-5"></div>
                    <div class="btn-group">
                            <button type="submit" class="btn btn-success"><strong>Update</strong></button>
                            <button type="reset" class="btn btn-default"><strong>Reset</strong></button>
                            </div> 
                        </div>
                    </div>
                </form>
    </div>    
				
              	

            <script type="text/javascript">
      				$(document).ready(function() {
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
                    
      			</script>
          
        </div>
      </div>
  
<%@include file="/templates/inc/footer.jsp" %> 
