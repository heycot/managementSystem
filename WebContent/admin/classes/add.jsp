
<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.TimeClass"%>
<%@page import="model.bean.Classes"%>
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
	Classes classAdd =  new Classes();
	classAdd.setName("");
	ArrayList<Majors> majors = new ArrayList<>();
	ArrayList<Courses> courses = new ArrayList<>();
	ArrayList<User> trainers = new ArrayList<>();
	ArrayList<TimeClass> times = new ArrayList<>();
	ArrayList<Rooms> rooms = new ArrayList<>();
	
	
	if( request.getAttribute("courses") != null){
		courses = (ArrayList<Courses>) request.getAttribute("courses");
	}
	
	if (request.getAttribute("majors") != null) {
		majors = (ArrayList<Majors>)request.getAttribute("majors");
	}
	if ( request.getAttribute("times") != null) {
		times = (ArrayList<TimeClass>) request.getAttribute("times");
	}
	if ( request.getAttribute("rooms") != null) {
		rooms = (ArrayList<Rooms>) request.getAttribute("rooms");
	}
%>
<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style='margin-top:  5px;'";
if( user.getRoleId() == 3) {
	classNameContent = "content-wrapper py-3";
	classNameContainer = "container-fluid";
	styleContent = "";
}

%>
<div class="<%= classNameContent%>" <%= styleContent%>>
  <div class="<%= classNameContainer%>">
        <div class="card mb-3">
             <div class="alert alert-primary" style="font-size: larger;margin-bottom: 0px;"> 
             <i class="fa fa-fw fa-book" ></i>
			    <strong>Add new class</strong>
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
  
             <form id="add-post" action="<%= request.getContextPath()%>/classes/add" method="POST" >
              	<div style="height: 5%"></div>
              	
              	 <div class="col-sm-5"  style="float: left"> 
	              	
	              	<div class="form-group">
		              	<label class="required" >Name&nbsp;</label><span id="spnNameStatus"></span>
		              	<input class="form-control" id="txtName" pattern="^[A-Za-z_-][A-Za-z0-9_-]*$" type="text" name="name" value="<%= classAdd.getName()%>" placeholder="Course name" />
	              	</div>
	              	
	              	<div class="form-group">
		              	<label class="required" >Major&nbsp;</label>
		              	<br>
		              	<div class="button dropdown"> 
						  <select id="colorselector"  style="width: 100%"> 
						  
						  <%
		              		for (Majors major : majors) {
		              		%> 
		              		<option value="<%= major.getMajorId()%>"><%= major.getName()%></option>
		              		<%
		              		}
		              	%>
						  </select>
						  <script>
						   $(document).ready(function() {
							  $('.colors').hide();
							  var id  = <%= majors.get(0).getMajorId()%>;
							  $('#' + id + $(this).val()).show();
							}); 
						  
						  $(function() {
							  $('#colorselector').change(function(){
							    $('.colors').hide();
							    $('#' + $(this).val()).show();
							  });
							});
						  </script>
						</div>
						<br>
		              	<label class="required" >Course&nbsp;</label>
		              	<br>
						<div class="output">
		              	<%
		              		for (Majors major : majors) {
		              		%> 
		              		<div id="<%= major.getMajorId()%>" class="colors red" class="active"> 
		              		 <%
			              		for (Courses course : courses) {
			              			if (course.getMajorId() == major.getMajorId()) {
			              		%> 
	  							<input type="radio" name="course" value="<%= course.getCourseId()%>"> <%= course.getName()%><br>
			              		<%
			              		}}
			              	%>
							</div>
		              		<%
		              		}
		              	%>
		              	</div>
	              	</div>
	              	
	              	</div>
	              	
	              	<div class="col-sm-1"  style="float: left"></div>
	              	<div class="col-sm-5"  style="float: left"> 
	              	
              		<div class="form-group">
		              	<label class="required" >Duration in one day (hours)&nbsp;</label><span id="spnDurationStatus"></span> <br>
		              	<div  class="button dropdown">
			              	<select id="timeselector" style="width: 100%">
							  <option value="duration1">1 hour</option>
							  <option value="duration2">2 hours</option>
							  <option value="duration3">3 hours</option>
							  <option value="duration4">4 hours</option>
							</select>
							<script>
						   $(document).ready(function() {
							  $('.time').hide();
							  $('#duration1' + $(this).val()).show();
							}); 
						  
						  $(function() {
							  $('#timeselector').change(function(){
							    $('.time').hide();
							    $('#' + $(this).val()).show();
							  });
							});
						  </script>
		              	</div>
	              	</div>
		              	
		              	<div class="form-group">
			              	<label class="required" >Date in week&nbsp;</label><span id="spnDurationStatus"></span> <br>
			              	<input type="checkbox" name="monday" id="monday" onclick="getFreeTime();" value="2">&nbsp;Monday <br>
			              	<input type="checkbox" name="tuesday" id="tuesday" onclick="getFreeTime();" value="3">&nbsp;Tuesday <br>
			              	<input type="checkbox" name="wednesday" id="wednesday" onclick="getFreeTime();" value="4">&nbsp;Wednesday <br>
			              	<input type="checkbox" name="thursday" id="thursday" onclick="getFreeTime();" value="5">&nbsp;Thursday <br>
			              	<input type="checkbox" name="friday" id="friday" onclick="getFreeTime();" value="6">&nbsp;Friday <br>
		              	</div>
		              	
		              	
	              		<div class="form-group">
		              	<label class="required" >Room&nbsp;</label>
		              	<br>
		              	<select name="room" id="room" onchange="getFreeTime();">
		              	<%
		              		for (Rooms room : rooms) {
		              		%> 
		              		<option value="<%= room.getRoomId()%>"><%= room.getName()%></option>
		              		<%
		              		}
		              	%>
		              	</select>
		              	</div>
		              	
		              	
					  	<label class="required" >Time&nbsp;</label>
		              	<br>
						<div class="output" id="timeClass">
		              	<%
		              		for ( int duration = 1; duration < 5; duration ++) {
		              		%> 
		              		<div id="duration<%= duration%>"  class="time red" class="active"> 
		              		 <%
		              			for (TimeClass time : times) {
			              		if (time.getDuration() == duration) {
			              		%> 
		 							<input type="radio" name="course" value="<%= time.getDuration()%>"> <%= time.getTimeOfDate()%><br/>
			              		<%
			              		}}
			              	%>
							</div>
		              		<%
		              		}
			            %>
		              	</div>
		              	
	              	</div>
	              
	              <div class="error" ></div>
	              <div style="clear: both"></div>
	               
	              <div>
		               <div class="col-sm-4" style="float: left"></div>
		               
		             	<div class="col-sm-4" style="float: left">
		             		<div style="float: left"><input style="width:auto; font-size:20px; height:auto; margin-bottom:10px;" id="btnSubmit"  class="btn btn-primary" type="submit" name="submit" value="Add" /></div>
		             		<div style="float: left; margin-left: 20px;"><input style="width:auto; font-size:18px; height:auto; margin-bottom:10px;" class="btn btn-secondary" type="reset" name="reset" value="Reset" /></div>
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
                function getFreeTime(){
                	var days = ["monday", "tuesday", "wednesday", "thursday", "friday"];
                	var daySend = "";
                	var duration = document.getElementById("timeselector").value;
                	for( var i = 0; i < 5; i++) {
                		if ( $('#'+days[i]).is(':checked')) {
                			daySend += "," + $('#'+days[i]).val();
                		}
                	}
                	var roomId = document.getElementById("room").value;
                	
            		$.ajax({
            			url: '<%=request.getContextPath()%>/freetime',
            			type: 'GET',
            			cache: false,
            			data: {
            				daySend : daySend,
            				duration : duration,
            				roomId : roomId
            			},
            			success: function(data){
            				// Xử lý thành công
            				$('#timeClass').html(data);
            			},
            			error: function (){
            			// Xử lý nếu có lỗi
            				alert('fail');
            			}
            		});
            	}
                </script>

            <script type="text/javascript">
            
      				$(document).ready(function() {
      					$("#add-post").validate({
      						rules: {
      							name:{
      								required: true,
      							},
                                kindOfCourse:{
                                	required: true,
                                },
                                duration:{
                                	required: true,
                                },
                                
      						},
      						messages: {
      							name:{
      								required: "Name of course is required",
      							},
                                kindOfCourse:{
                                	required: "Kind of course is required",
                                },
                                duration:{
                                	required: "Duration of course is required",
                                }
      						}
      					});
      				});
      				
      				$(document).ready(function() {
      					$('#txtDuration').blur(function(e) {
          					if (checkDuration()) {
      							$('#spnDurationStatus').html('');
      							 $('#spnDurationStatus').css('color', 'green');
       							document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnDurationStatus').html('The duration must be a positive number.');
      							$('#spnDurationStatus').css('color', 'red');
      							document.getElementById("btnSubmit").disabled = true; 
      						}
       					});
      				}); 
      				
      				
      				$(document).ready(function() {
      					$('#txtName').blur(function(e) {
      						var name = $('#txtName').val();
          					if (validateName(name)) {
      							$('#spnNameStatus').html('');
      							$('#spnNameStatus').css('color', 'green');
      							document.getElementById("btnSubmit").disabled = false; 
      						}
      						else {
      							$('#spnNameStatus').html('Name of course must be character.');
      							$('#spnNameStatus').css('color', 'red');
      							document.getElementById("btnSubmit").disabled = true; 
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
      				
      				function validateName(string) {
      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;

      					return $.trim(string).match(pattern) ? true : false;
      				}
      			</script>
        <div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
          </div>
        </div>
      </div>
<%@include file="/templates/inc/footer.jsp" %> 