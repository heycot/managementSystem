

<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="author" content="">
    <title>BOOTCAMP MANAGEMENT SYSTEM</title>
    
    <link href="<%= request.getContextPath()%>/templates/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/templates/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/templates/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="<%= request.getContextPath()%>/templates/css/sb-admin.css" rel="stylesheet">
	<link rel="shortcut icon" href="<%= request.getContextPath()%>/templates/public/images/logo.png" type="image/x-icon" />


  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleDashboard1.css">
  	<link rel="stylesheet prefetch" href="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleCommon.css">	
	<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
		 
    <style type="text/css">

  	<link rel="stylesheet prefetch" href="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">	
	<script src="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleDashboard1.css">
  	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js" ></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script type="text/javascript" src="jquery.twbsPagination.min.js"></script>
	<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<style type="text/css">

      .hiden{display:none}
      .error{color:red}
    .label-info {background-color: #5bc0de;}
    .col-15 {
    float: left;
    width: 15%;
    margin-top: 6px;
    margin-left: 15px
	}

	.col-50 {
    float: left;
    width: 50%;
    margin-top: 6px;
	}
    </style>
    
 </head>

<body class="fixed-nav" id="page-top">

    <%
    String styleTogglerBar = "";
    User user = (User)session.getAttribute("user");
    if (user.getRoleId() == 3) {
    	%>
    	<!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav" style="box-shadow: 2px 2px #c8c5c5;border-bottom: 1px solid #D9DEE4;background: rgb(237, 237, 237); height:74px;">
          <a class="navbar-brand" href="<%= request.getContextPath()%>/" style="margin-top:0px;margin-left:17px;">
          	<img src="<%=request.getContextPath()%>/templates/images/enclave_logo.png" class="imglogo"/>
          </a>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul id="slide_item" class="navbar-nav navbar-sidenav" style="min-height: 100%; max-width:250px;box-shadow: 2px 2px #c8c5c5;margin-top: 76px;background:white; padding:20px 20px;">
          
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
<<<<<<< HEAD
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/trainee/index" style="font-size:  17px;">
                  <i class="fa fa-fw fa-users" style="margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text">
                    Trainee</span>
                </a>
              </li>

              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed"  href="<%= request.getContextPath()%>/trainer/index" style="font-size:  17px; ">
                  <i class="fa fa-fw fa-users" style="margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text">
                    Trainer</span>
                </a>
              </li>
              
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="major">
                <a class="nav-link nav-link-collapse collapsed"  href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-briefcase" style="margin-left:3px; margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text" style="margin-left: 2px;">

                    Major</span>
              	</a>
            </li>
              
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">

                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/classes/index" style="font-size:  larger;">
                  <i class="fa fa-fw fa-object-group"></i>&nbsp;
                  <span class="nav-link-text">
                    Class</span>
                </a>
            </li>
            
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">

                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/course/index" style="font-size:  larger;">
                  <i class="fa fa-fw fa-book"></i>&nbsp;
                  <span class="nav-link-text">
                    Course</span>
                </a>
                
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/room" style="font-size:  larger;">
                  <i class="fa fa-home" ></i>&nbsp;
                  <span class="nav-link-text">
                    Room</span>
              </a>
              
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/Skills" style="font-size:  larger;">
                  <i class="fa fa-fw fa-graduation-cap" ></i>&nbsp;
                  <span class="nav-link-text">
                    Skill</span>
              </a>
           
            </li>
             <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/admin/requestTakeDateOff" style="font-size:  larger;">
                  <i class="fa fa-paper-plane" ></i>&nbsp;
                  <span class="nav-link-text">
                    Request</span>
              </a>
              
		</li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="#statistical" style="font-size:  larger;">
                  <i class="fa fa-calculator" ></i>&nbsp;
                  <span class="nav-link-text">
                    Statistic</span>
              </a>

            </li>
            </ul>
     <%
    } else {
    	styleTogglerBar = "style='display: none'";
    %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav" style="background:white;height:74px;box-shadow:2px 2px #c8c5c5">
      <a href="<%= request.getContextPath()%>/"><img alt="Enlave" src="<%= request.getContextPath()%>/templates/images/enclave_logo.png" width="150px" height="50px" style="margin-left: 24px; margin-bottom: -13px; margin-top: -12px;"></a>
    <!--  <a style="display: inline-block; margin-left: 10px;" class="navbar-brand" href=""></a> -->
       <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>  
      
      <nav class="navbar navbar-default" style="font-size:16px;">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav">
		    <%
				    if(user.getRoleId() == 1) {
				    %>
				      <li ><a style="color: #555;" href="<%= request.getContextPath()%>/trainer/schedule?user_id=<%= user.getUserId()%>">Schedule</a></li>
				    <%
				    } else if (user.getRoleId() == 2) {
			    	%>
				        <li style="display: block;"><a style="color: #555;" href="<%= request.getContextPath()%>/trainee/schedule?user_id=<%= user.getUserId()%>">Schedule</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: #555;" href="<%= request.getContextPath()%>/trainee/list/classcanregister?user_id=<%= user.getUserId()%>">Register Class</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: #555;" href="<%= request.getContextPath()%>/trainee/list/classwaitstart">Waiting Start</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: #555;" href="<%= request.getContextPath()%>/trainee/results?user_id=<%= user.getUserId()%>">Result</a></li>
					 <%
				    } 
				    %>
		    </ul>
		  </div>
		</nav>
	
    <%
    }
    %>
    
        <script type="text/javascript">
      jQuery(document).ready(function($){
        var url = window.location.href;
          $(".nav-item a").each(function() {
              if(url == (this.href)) {
                  $(this).closest("li").addClass("active");
              }
          });
      });
     </script>
     <script type="text/javascript">
	   $(document).ready(function()
	   { 
	      //khi nút submit được click
	    $('#btt').click(function(){
	    	
	        //Sử dụng phương thức Ajax.
	        $.ajax({
	              type : 'POST', //Sử dụng kiểu gửi dữ liệu POST
	              url : '/managementSystem/ListNotificationAjax', //gửi dữ liệu sang trang data.php
	              success : function(result)  // Hàm thực thi khi nhận dữ liệu được từ server
	                        { 
	            				$('#result1').html(result);
	                        }
	              });
	        });
	    });
	</script>
     

        <script type="text/javascript">
        $(document).ready(function() { 
	        $( "#sidenavToggler" ).click(function() {
	        	  $( "#slide_item" ).toggle( "slow", function() {
	        	  });
	        	  
	        });

        });
        </script>
        
        <ul class="navbar-nav ml-auto">
		
		  <li role="presentation" class="dropdown">
		  	<a class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
              <i id="btt" class="iconMail fa fa-envelope-o" style=" width: 25px;"></i>
              <span class="badge bg-green">?</span>
            </a>
             <ul id="result1" class="dropdown-menu msg_list pull-right" role="menu"></ul>
           </li>
                
          <li class="nav-item nav-item1">
          	<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="margin-right: 10px; width: 25px;">
                <img src="<%=request.getContextPath()%>/files/<%= user.getAvatar()%>" ><%= user.getUsername()%>
            </a>
            <ul class="dropdown-menu menu_user pull-right" style="margin-top:0;">
				    <%
				    if(user.getRoleId() == 1) {
				    %>
				      <li><a href="<%= request.getContextPath()%>/trainer/edit?id=<%= user.getUserId()%>">My Profile</a></li>
				    <%
				    }  else{
			    	%>
				      <li><a href="<%= request.getContextPath()%>/trainee/edit?id=<%= user.getUserId()%>">My Profile</a></li>
				    <%
				    }
				    %>
                    <li><a  href="<%= request.getContextPath()%>/logout"><i style="margin-top:10px;" class="fa fa-sign-out pull-right"></i> Log Out</a></li>

            </ul>
          </li>
          <div id="maincontent">
  			
		 </div>
        </ul>
       </div>
       </nav>

     

     <script type="text/javascript">
   $(document).ready(function(){ 
      //khi nút submit được click
    $('#btt').click(function(){
    	
        //Sử dụng phương thức Ajax.
        $.ajax({
              type : 'POST', //Sử dụng kiểu gửi dữ liệu POST
              url : '/managementSystem/ListNotificationAjax', //gửi dữ liệu sang trang data.php
              success : function(result)  // Hàm thực thi khi nhận dữ liệu được từ server
                        { 
            				$('#result1').html(result);
                        }
              });
        });
	   $(document).on('click','.view',function(){
			 var post_id = $(this).attr("id");
			 fetch_post_data(post_id);
		});
	   $(document).on('click','.aprove',function(){
		   			 var request_id= $("#request_id").text();
		   					$.ajax({
		   						type : 'POST',
		   						url : '/managementSystem/ApproveRequestOffTrainerAjax?request_id=' + request_id,
		   						success : function(data) {
		   
		   				        	   if(data == 1){
		   									alert('You have just approved this request!');
		   									$('#post_modal').modal('hide');
		   								}
		   								else if(data == 0){
		   									alert('Some error. Please approve it again!');
		   								}
		   							
		   						}
		   					});
		   		});
		function fetch_post_data(post_id)
		{	
			
			$.ajax({
				url: '/managementSystem/ShowDetailNotiAjax?post_id=' + post_id,
				type : 'POST',
				//data:{post_id:post_id},
				success:function(data)
				{
					$('#post_modal').modal('show');
					$('#post_detail').html(data);					 
				}
			});
		}
		function approveRequest() {
						alert("Yes");
						var request_id= $("#request_id").text();
						alert(request_id);
							$.ajax({
								type : 'POST',
								url : '/managementSystem/forgotpassword?emailForgot=' + request_id,
								success : function(data) {
									alert(data);
								}
							});
						
					}
		
		
	});
</script>
<%
	if(user.getRoleId() == 3){
		
%> 
		<div id="post_modal" class ="modal fade">
			<div class = "modal-dialog">
				<div style="margin:auto;margin-top:60%;" class="modal-content"  id = "post_detail">
				<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnForgot" onclick="sendEmail();">Send</button>
				
				<button type="button" style=" background:#2e9ade; color: white; " class="btn btn-infor" data-dismiss="modal">Close</button> \
				</div>	
				</div>	
					
			</div>
				</div> 
				
<%
	} else{
%>	
	<div id="post_modal" class ="modal fade">
 		<div class = "modal-dialog">
 		<div style="margin:auto;margin-top:60%;" class="modal-content"  id = "post_detail">
 		</div>
 		
 	</div>
</div>
	</div>
<%
	}
%>		


</html>
