
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>
<div class="content-wrapper py-3">
  <div class="container-fluid">
       <div class="card mb-3">
        	<div class="card-header" style="background-color:rgb(212, 237, 218)";>
            <h2 style="text-align:center;color:green;">Add trainer's account</h2>
         </div>
                   <form id="add-post" action="" method="POST" >
                        <div style="height: 5%"></div>
                    
                    <div class="col-sm-6" style="float: left">
                        <div class="form-group">
                            <label class="required" ><strong>Username:</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="text" name="username" value="" placeholder="Username" required/>
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Password:</strong>:<span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="password" name="password" value="" placeholder="Password" required/>
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Full Name:</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="text" name="fullname" value="" placeholder="Fullname" required/>
                        </div>
                        
                        
                        
                        <div class="form-group">
                              <label class="required" ><strong>Gender:</strong><span style="color: red"> *</span></label> <br>
                            <input type="radio" name="gender" value="male"> Male<br>
                            <input type="radio" name="gender" value="female"> Female<br>
                            <input type="radio" name="gender" value="other"> Other
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Role:</strong><span style="color: red"> *</span></label><br>
                            
                            
                            <select >
                          
                                <option value=""></option>
                            
                                
                            </select>
                        </div> 
                        <div class="form-group">
                            <label class="required" ><strong>Address</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="text" name="address" value="" placeholder="Address" required/>
                        </div>
                        
                        
                        
                    </div>
                    
                    <div class="col-sm-6" style="float: right">
                        
                        
                        <div class="form-group">
                            <label class="required" ><strong>Phone Number:</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="text" name="phone" value="" placeholder="Phone" required/>
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Birthday:</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="date" name="dateOfBirth" value="" placeholder="Birthday" required/>
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Email:</strong><span style="color: red"> *</span></label>
                            <input class="form-control" id="txtname" type="text" name="email" value="" placeholder="Email" required/>
                        </div>
                        
                        <div class="form-group">
                            <label class="required" ><strong>Avatar:</strong> <span style="color: red"> *</span><em style="color: red">(jpg, png, gif)</em> </label>
                            <input class="form-control" id="txtname" type="file" name="avatar" value="" placeholder="Email" onchange="readURL(this);" required/>
                          <img id="blah" src="#" alt="your image" />
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
                    		
                            <label for="usr"><strong>Trainer's ability:</strong><span style="color: red"> *</span></label>
                           <input type="button" value="Add trainer's ability" onclick="changePass();"> <br>
                            <input style="display: none" type="password" class="form-control" id ="skillid"  name="skillid" placeholder="Skill ID" required/>
                            <br>
                            <input style="display: none" type="password" class="form-control" id ="Exp"  name="experience" placeholder="Experience" required/>
                            <br>
                            <input style="display: none" type="password" class="form-control" id ="courseid"  name="courseid" placeholder="Course Id" required/>
                           </div>
                            
                            <script type="text/javascript">
                            	function changePass(){
                            		document.getElementById("skillid").style.display= "block";
                            		document.getElementById("Exp").style.display= "block";
                            		document.getElementById("courseid").style.display= "block"; 		
                            	}
                            </script>
                    </div> 
                    
                    <div style="clear: both"></div>
                    <div class="error" ></div>
                    <br><br>
                    <div>
                         <div class="col-sm-5" style="float: left"></div>
                         
                           <div class="col-sm-4" style="float: left">
                               <div class="col-sm-2" style="float: left"><input class="btn btn-success" type="submit" name="submit" value="Create" /></div>
                               <div class="col-sm-2" style="float: left"><input class="btn btn-darkgrey" type="reset" name="reset" value="Reset" /></div>
                               <div style="clear: both"></div>	
                           </div> 
                           
                         <div class="col-sm-4" style="float: right"></div>
                         <div style="clear: both"></div>
                    </div>
                    
                    <div style="margin-bottom: 10%"></div>
                    </form> 
      
                    <script type="text/javascript">
                        $(document).ready(function() {
                            $("#add-post").validate({
                                rules: {
                                    username:"required",
                                  password:"required",
                                  fullname:"required",
                                  address:"required",
                                  phone:"required",
                                  dateOfBirth:"required",
                                  email:"required"
                                 
                                },
                                messages: {
                                    username:"this feild is required",
                                  password:"this feild is required",
                                  fullname:"this feild is required",
                                  address:"this feild is required",
                                  phone:"this feild is required",
                                  dateOfBirth:"this feild is required",
                                  email:"this feild is required"
                                }
                            });
                        });
                        
                    </script>

                </div>
              </div>
            </div>

</body>
</html>
<%@include file="/templates/inc/footer.jsp" %> 