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

    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath()%>/templates/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<%= request.getContextPath()%>/templates/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <!-- Plugin CSS -->
    <link href="<%= request.getContextPath()%>/templates/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%= request.getContextPath()%>/templates/css/sb-admin.css" rel="stylesheet">
	<link rel="shortcut icon" href="<%= request.getContextPath()%>/templates/public/images/logo.png" type="image/x-icon" />

  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  	<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleDashboard1.css">
  	<link rel="stylesheet prefetch" href="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>

		 
    <style type="text/css">
      .hiden{display:none}
      .error{color:red}

    .label-info {background-color: #5bc0de;}
    </style>

  </head>

<body class="fixed-nav" id="page-top">

    <%
    String styleTogglerBar = "";
    User user = (User)session.getAttribute("user");
    if (user.getRoleId() == 3) {
    	%>
    	<!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" id="mainNav" style="border-bottom: 1px solid #D9DEE4;background: rgb(237, 237, 237); height:74px;box-shadow:1px 1px rgb(229,229,229);">
          <a class="navbar-brand" href="<%= request.getContextPath()%>/" style="margin-top:0px;margin-left:17px;">
          	<img src="<%=request.getContextPath()%>/templates/images/enclave_logo.png" class="imglogo"/>
          </a>
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul id="slide_item" class="navbar-nav navbar-sidenav" style="margin-top: 74px; min-width:250px; max-width:250px; background:white; padding:20px 20px;">
          
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-fw fa-users" style="margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text">
                    Trainee</span>
                </a>
              </li>

              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed"  href="<%= request.getContextPath()%>/major" style="font-size:  17px; ">
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
                <a class="nav-link nav-link-collapse collapsed"  href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-fw fa-object-group" style="margin-left:2px; font-size:15px;margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text">
                    Class</span>
                </a>
            </li>
            
              <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-fw fa-book" style="margin-left:0px;margin-right: 11px; "></i>&nbsp;
                  <span class="nav-link-text">
                    Course</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-home" style="margin-left:1px; font-size:21px;margin-right: 11px;"></i>&nbsp;
                  <span class="nav-link-text">
                    Room</span>
              </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size:  17px;">
                  <i class="fa fa-fw fa-graduation-cap" style="margin-left:0px;margin-right: 11px; "></i>&nbsp;
                  <span class="nav-link-text">
                    Skill</span>
              </a>
            </li>
             <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size: 17px; font-family: Poppins;">
                  <i class="fa fa-paper-plane" style="margin-left:2px;margin-right: 11px; "></i>&nbsp;
                  <span class="nav-link-text" style="margin-left:4px;">
                    Request</span>
              </a>
		</li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="contact">
                <a class="nav-link nav-link-collapse collapsed" href="<%= request.getContextPath()%>/major" style="font-size:  17px; font-family: 'Poppins';">
                  <i class="fa fa-calculator" style="margin-left:4px; font-size:14px;margin-right: 11px;" ></i>&nbsp;
                  <span class="nav-link-text" style="margin-left:4px; ">
                    Statistic</span>
              </a>
            </li>
            </ul>
     <%
    } else {
    	styleTogglerBar = "style='display: none'";
    %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a href="<%= request.getContextPath()%>/"><img alt="Enlave" src="<%= request.getContextPath()%>/templates/images/enclave.jpg" width="95px" style="margin-left: -16px; margin-bottom: -13px; margin-top: -8px;"></a>
    <!--  <a style="display: inline-block; margin-left: 10px;" class="navbar-brand" href=""></a> -->
       <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>  
      
      <nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <ul class="nav navbar-nav">
		    <%
				    if(user.getRoleId() == 1) {
				    %>
				      <li ><a style="color: white;" href="<%= request.getContextPath()%>/trainer/schedule?user_id=<%= user.getUserId()%>">Schedule</a></li>
				    <%
				    } else if (user.getRoleId() == 2) {
			    	%>
				        <li style="display: block;"><a style="color: white;" href="<%= request.getContextPath()%>/trainee/schedule?user_id=<%= user.getUserId()%>">Schedule</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: white;" href="<%= request.getContextPath()%>/trainee/list/classcanregister?user_id=<%= user.getUserId()%>">Register Class</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: white;" href="<%= request.getContextPath()%>/trainee/list/classwaitstart">Waiting Start</a></li>
				      <li style="display: block; margin-left: 20px;"><a style="color: white;" href="<%= request.getContextPath()%>/trainee/results?user_id=<%= user.getUserId()%>">Result</a></li>
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
     
        <ul class="navbar-nav sidenav-toggler" <%= styleTogglerBar%> >
          <li class="nav-item" style="background:white; border:1px solid rgb(241, 241, 241);">
            <a class="nav-link text-center" id="sidenavToggler">
              <i class="fa fa-fw fa-angle-left"></i>
            </a>
          </li>
        </ul>
        <script type="text/javascript">
        $(document).ready(function() { 
	        $( "#sidenavToggler" ).click(function() {
	        	  $( "#slide_item" ).toggle( "slow", function() {
	        	  });
	        	  /* if(document.getElementById("body-content").style.display = "none") {
	        		  changeFont();
	        	  } */
	        	  
	        });
	        
	       /*  function changeFont() {
      		  document.getElementById("toggler_contentId").classList.remove('content-wrapper py-3');
      		  document.getElementById("toggler_contentId").style = 'margin-top:  5px;';
      		  document.getElementById("toggler_containerId").classList.remove('container-fluid');
	        } */
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
</body>
     

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
		
	});
</script>
</html>
<div id="post_modal" class ="modal fade">
		<div class = "modal-dialog">
		<div style="margin:auto;margin-top:60%;" class="modal-content"  id = "post_detail">
		</div>
		
	</div>
</div>
