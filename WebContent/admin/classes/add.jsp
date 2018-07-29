
<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.TimeClass"%>
<%@page import="model.bean.Classes"%>
<%@page import="model.bean.Majors"%>
<%@page import="model.bean.Courses"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	ArrayList<Rooms> rooms = new ArrayList<>();
	
	if( request.getAttribute("class") != null){
		classAdd = (Classes) request.getAttribute("class");
	}
	if( request.getAttribute("courses") != null){
		courses = (ArrayList<Courses>) request.getAttribute("courses");
	}
	
	if (request.getAttribute("majors") != null) {
		majors = (ArrayList<Majors>)request.getAttribute("majors");
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
<div class="<%= classNameContent%>" <%= styleContent%> style="overflow-x: inherit;">
  <div class="<%= classNameContainer%>">
  	<div class="alert1 alert alert-primary" style="margin-left: -14px;"> 
        <i class="fa1 fa fa-fw fa-university" style="margin-left: 10px; font-size: 23px;"></i>
		<strong class="lb_name" style="">Add new class </strong>
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
        <div class="card mb-3" style="padding-top: 10px; margin-top: 0px;padding-bottom: 44px;">
             <form id="add-post" action="<%= request.getContextPath()%>/classes/add" method="POST" >
              	<div style="height: 5%"></div>
              	
              	 <div class="col-sm-4"  style="float: left"> 
	              	
	              	<div class="form-group">
		              	<label class="required" ><strong>Name:</strong>&nbsp;</label>
		              	<input class="form-control" id="txtName"  type="text" name="name" value="<%= classAdd.getName()%>" placeholder="Class name" />
	              		<span id="spnNameStatus"></span>
					</div>
	              	
	              	<div class="form-group">
	              		<br>
		              	<label class="required" ><strong>Major:</strong>&nbsp;</label>
		              	<br>
		              	<div class="button dropdown"> 
						  <select id="colorselector" onchange="emptyTrainer();"  style="width: 100%"> 
						  
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
						<br><br>
		              	<label class="required" ><strong>Course:</strong>&nbsp;</label>
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
	  							<input onclick="getTrainer(<%= course.getCourseId()%>);" type="radio" name="course" value="<%= course.getCourseId()%>"> <%= course.getName()%><br>
			              		<%
			              		}}
			              	%>
							</div>
		              		<%
		              		}
		              	%>
		              	</div>
	              	</div>
	              	<div id="trainerContent" ></div>
	              		
	              	</div>
	              	
	              	<div class="col-sm-4"  style="float: left"> 
		              	<div class="form-group" id="roomDiv" style="display: none;">
			              	<label class="required" ><strong>Room:</strong>&nbsp;</label>
			              	<br>
			              	<select id="roomSelect"  name="room" onchange="showDuration();" style="width: 100%; margin-bottom: 7px;">
			              		<option value="0" onclick="showErrorRoom();">Select room</option>
			              	<%
			              		for (Rooms room : rooms) {
			              		%> 
			              		<option value="<%= room.getRoomId()%>"><%= room.getName()%></option>
			              		<%
			              		}
			              	%>
			              	</select>
			              	<span id="spnRoomStatus"></span>
			           </div>
		              	
	              		<div class="form-group" id="duration" style="display: none">
	              			<br>
			              	<label class="required" ><strong>Duration in one day (hours):</strong>&nbsp;</label>
			              	<select id="durationSelector" style="width: 100%" onchange="showDateOfWeek();">
							  <option value="0" >Select duration</option>
							  <option value="duration1">1 hour</option>
							  <option value="duration2">2 hours</option>
							  <option value="duration3">3 hours</option>
							  <option value="duration4">4 hours</option>
							</select>
			              	<span id="spnDurationStatus"></span>
		              	</div>
		              	
		              	<div class="form-group" id="dateOfWeek"  style="display: none">
		              		<br>
			              	<label class="required" ><strong>Date of week:</strong>&nbsp;</label> <br>
			              	<input type="checkbox" name="monday" id="monday" onclick="getFreeTime();" value="2" >&nbsp;Monday <br>
			              	<input type="checkbox" name="tuesday" id="tuesday" onclick="getFreeTime();" value="3">&nbsp;Tuesday <br>
			              	<input type="checkbox" name="wednesday" id="wednesday" onclick="getFreeTime();" value="4">&nbsp;Wednesday <br>
			              	<input type="checkbox" name="thursday" id="thursday" onclick="getFreeTime();" value="5">&nbsp;Thursday <br>
			              	<input type="checkbox" name="friday" id="friday" onclick="getFreeTime();" value="6">&nbsp;Friday <br>
			              	<span id="spnDateStatus"></span>
		              	</div>
	              	</div>
	              	
	             <div class="col-sm-4"  style="float: left">
	             	<div class="from-group" id="timeOfDate">
	             	</div>
	             </div>
	              
	              <div class="error" ></div>
	              <div style="clear: both"></div>
	              <div style="height: 5%"></div>
	               
	             	<div style="text-align:center;margin-top:15px;">
	           		<input id="btnSubmit" class="btn btn-primary" style="height: 40px; width:100px; font-size: 17px;" type="submit" name="submit" value="Add" />
	           		<input class="btn btn-secondary" style="height: 40px; width:100px; font-size: 17px; border:1px solid white;" type="reset" name="reset" value="Reset" />
	           		
	           	</div> 
	            <div style="clear: both"></div>
          
              
              <div style="margin-bottom: 5%"></div>
              </form>
              
              	</div>
              	
              	<script type="text/javascript">
              	
              	function emptyTrainer() {
              		$('#trainerContent').empty();
              	}
              	
              	
              	$( "#page-top" ).load(function() {
              		document.getElementById("btnSubmitAddClass").disabled = true;
              	});
              	 
              	 function getTrainer(courseId) {
                 	$.ajax({
             			url: '<%=request.getContextPath()%>/freetime',
             			type: 'GET',
             			cache: false,
             			data: {
             				courseId : courseId
             			},
             			success: function(data){
              				$('#trainerContent').empty();
             				$('#trainerContent').append(data);
             			},
             			error: function (){
             				alert('fail');
             			}
             		});
                 }
              	 
              	</script>
              	
                <script type="text/javascript">
                var countDuration = 0;
                var countRoom = 0;
                var countDateOfWeek = 0;
                function showRoom() {
                	var trainer = $('#trainerSelect').val();
                	if (trainer == 0) {
                		$('#spnTrainerStatus').html("Please choose trainer!");
                		$('#spnTrainerStatus').css("color", "red");
                		$('#timeOfDate').empty();
                	}else if (countRoom === 0) {
                		$('#spnTrainerStatus').empty();
                		$('#roomDiv').show();
                		countRoom++;
                	} else {
                		$('#spnTrainerStatus').empty();
                		getFreeTime();
                	}
                }
                
                function showDuration() {
                	var room = $('#roomSelect').val();
                	if (room == 0) {
                		$('#spnRoomStatus').html("Please choose room!");
                		$('#spnRoomStatus').css("color", "red");
                		$('#timeOfDate').empty();
                	}else if (countDuration === 0) {
                		$('#spnRoomStatus').empty();
                		$('#duration').show();
                		countDuration++;
                	} else {
                		$('#spnRoomStatus').empty();
                		getFreeTime();
                	}
                }
                function showDateOfWeek() {
                	var duration = $('#durationSelector').val();
                	if (duration == 0) {
                		$('#spnDurationStatus').html("Please choose duration!");
                		$('#spnDurationStatus').css("color", "red");
                		$('#timeOfDate').empty();
                	}else if (countDateOfWeek === 0) { 
                		$('#spnDurationStatus').empty();
                    	$('#dateOfWeek').show();
                    	countDateOfWeek++;
                    } else {
                		$('#spnDurationStatus').empty();
                    	getFreeTime();
                    }
                }
                
                var errorTime = true;
                function hideErrorTime() {
            		$('#spnTimeStatus').empty();
            		errorTime = false;
                }
                
                function getFreeTime(){
                	var days = ["monday", "tuesday", "wednesday", "thursday", "friday"];
                	var daySend = "";
                	var duration = document.getElementById("durationSelector").value;
                	var roomId = document.getElementById("roomSelect").value;
                	var trainer = document.getElementById("trainerSelect").value;
                	var check = false;
                	
                	for( var i = 0; i < 5; i++) {
                		if ( $('#'+days[i]).is(':checked')) {
                			check = true;
                			daySend += "," + $('#'+days[i]).val();
                		}
                	}
                	
                	if( check == false) {
                		$('#spnDateStatus').html("Please choose date of week!");
                		$('#spnDateStatus').css("color", "red");
                		$('#timeOfDate').empty();
                	} else {
                		$('#spnDateStatus').empty();
                		$.ajax({
                			url: '<%=request.getContextPath()%>/freetime',
                			type: 'POST',
                			cache: false,
                			data: {
                				daySend : daySend,
                				duration : duration,
                				roomId : roomId,
                				trainer : trainer
                			},
                			success: function(data){
          						document.getElementById("btnSubmitAddClass").disabled = false; 
                				$('#timeOfDate').empty();
                				$('#timeOfDate').html(data);
                			},
                			error: function (){
                				alert('fail');
                			}
                		});
                	}
            	}
                
                $('form').on('submit', function(event) {
                	if ( errorTime == true) {
                		$('#spnTimeStatus').html("Please choose time of date!");
                		$('#spnTimeStatus').css("color", "red");
                		/* $('#timeOfDate').empty(); */
                		return false;
                	} else {
                		$('#spnTimeStatus').empty();
                		$('#add-post').submit();
                	}
                })
                </script>

            <script type="text/javascript">
      				$(document).ready(function() { 
      					$("#add-post").validate({
      						rules: {
      							name:{
      								required: true,
      							}
      						},
      						messages: {
      							name:{
      								required: "Name of course is required",
      							}
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
      				
      				function validateName(string) {
      					var pattern = /^[^`~<>@#%&\*\$\{\}\[\]\(\)\+\=?\|\;_!]+$/;
      					return $.trim(string).match(pattern) ? true : false;
      				}
      			</script>
          </div>
<%@include file="/templates/inc/footer.jsp" %> 