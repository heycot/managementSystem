<%@page import="model.bean.Majors"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleMajor.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
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

<div class="<%= classNameContent%>" <%= styleContent%> id="toggler_contentId" style="background: rgb(229, 229, 229);padding:20px 20px;max-height:900px;">
  <div class="<%= classNameContainer%>" id="toggler_containerId">
    <div  class="card mb-3" style="background: transparent;border: none;">
<!-- Nav -->
       	<div class="alert alert-primary" style="margin-top:20px;font-size: larger;margin-bottom: 0px;background:none; border:none; color: #333333 !important;margin-left:-23px;"> 
        	<i class="fa fa-fw fa-briefcase" ></i>
			<strong style="font-weight: 400;font-size: 21px;">Majors </strong>
		</div>
		
<!-- Div Page Content -->
        <div>
			  <%
				  String msg = "";
				  if(request.getParameter("msg") != null){
					  boolean check = false;
					  int msgInt = Integer.parseInt((String)request.getParameter("msg"));
					  switch(msgInt) {
						  case 1: {
							  check = true;
							  msg = "You added the major successfully!"; break;
						  }
						  case 2:{
							  check = true;
							  msg = "You edited the major successfully!"; break;
						  }
						  case 3:{
							  check = true;
							  msg = "You deleted the major successfully!"; break;
						  }
						  case 4:{
							  check = true;
							  msg  = "You deleted majors successfully!"; break;
						  }
						  case 5:{
							  check = false;
							  msg  = "This major has existed in the system."; break;
						  }
						  case 6:{
							  check = false;
							  msg  = "No changes!"; break;
						  }
						  case 0:{
							  check = false;
							  msg  = "Error! System have some problems. Please try again."; break;
						  }
				  	  }
					  
					  if( check == false){
						  %>
				        	<div class="alert alert-danger" style="margin-right: 20px;">
						    	<strong> <%= msg%> </strong>
						  	</div>
						  <%
					  } else {
						  %>
				        	<div class="alert alert-success" style="margin-right: 20px;">
						    	<strong> <%= msg%> </strong>
						  	</div>
						  <%
					  }
				  }
			%>
	  
			<%
				ArrayList<Majors> majors = new ArrayList<Majors>();
				int total = 0;
				if (request.getAttribute("major") != null) {
					majors = (ArrayList<Majors>) request.getAttribute("major");
					total = majors.size();		 
				}
			%>
<!-- Checkbox -->		
	        <script type="text/javascript">
	            $(document).ready(function(){
	                $(document).on('change', '.checkall, .checkitem', function(){
	                    var $_this = $(this);
	                    document.getElementById("deleteall").style.display = "block";
	                    if($_this.hasClass('checkall')){
	                        $('.checkitem').prop('checked', $_this.prop('checked'));
	                    } else {
	                        var $_checkedall = true;
	                        $('.checkitem').each(function(){
	                            if(!$(this).is(':checked')){
	                                $_checkedall = false;
	                            }
	                            $('.checkall').prop('checked', $_checkedall);
	                        });
	                    }
	                    
	                    var $_uncheckedall = true;
	                    $('.checkitem').each(function(){
	                        if($(this).is(':checked')){
	                            $_uncheckedall = false;
	                        }
	                        if($_uncheckedall){
	                            document.getElementById("deleteall").style.display = "none";
	                        }else{
	                            document.getElementById("deleteall").style.display = "block";
	                        }
	                    });
	                });
	            });
	        </script>
	        
<!-- Pagination -->
	        <script type="text/javascript">
	            $(function () {
	                var pageSize = 5; 
	                showPage = function (page) {
	                    $(".contentPage").hide();
	                    $(".contentPage").each(function (n) {
	                        if (n >= pageSize * (page - 1) && n < pageSize * page)
	                            $(this).show();
	                    });
	                }
	                showPage(1);
	                ///** Cần truyền giá trị vào đây **///
	                var totalRows = <%= total%>; // Tổng số sản phẩm hiển thị
	                var btnPage = 5; // Số nút bấm hiển thị di chuyển trang
	                var iTotalPages = Math.ceil(totalRows / pageSize);
	
	                var obj = $('#pagination').twbsPagination({
	                    totalPages: iTotalPages,
	                    visiblePages: btnPage,
	                    onPageClick: function (event, page) {
	                        console.info(page);
	                        showPage(page);
	                    }
	                });
	                console.info(obj.data());
	            });
	        </script>
	        
<!-- Style Pagination -->
	        <style>
	           ///** CSS căn id pagination ra giữa màn hình **///
	           #pagination {
	               display: flex;
	               display: -webkit-flex; /* Safari 8 */
	               flex-wrap: wrap;
	               -webkit-flex-wrap: wrap; /* Safari 8 */
	               justify-content: center;
	               -webkit-justify-content: center;
	           }
	       </style>
	       
<!-- Content -->
		   <div class="card-body" style="margin-left: -20px;">
		         <div class="table-responsive">
           			<form action="<%= request.getContextPath()%>/major/del"  method="post">
          				<div style="margin-left: -10px; margin-bottom: 5px;">
            				<div style="float: left" >
			            		<button style="width:auto; font-size:15px; height:auto; margin-bottom:10px; margin-left: 10px;"
			            				type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal" role="button">Add new major
	            				</button>
			        		</div>
			            	<div style="float: left; margin-left: 15px;">
			            		<input class="btn btn-danger" style="display: none; margin-left: 10px; margin-bottom: 5px;" 
			            			   onclick="return confirm('Do you want to delete these majors?')" id="deleteall" type="submit" value="Delete majors">
			               	</div>
		              		<div style="clear: both">
		              		</div>
	       				</div>
		                <table  id="myTable" class="table table-bordered" width="100%" id="dataTable" cellspacing="0" style="background:white;box-shadow: 2px 2px rgb(189, 189, 189);">
							<thead>
		                    	<tr>
									<th style="text-align: center; font-size: medium;max-width: 100px;">Delete All
			                      		<input 	style="display: inline-block; margin-left: 15px;vertical-align: middle; margin-top: -3px;" 
			                      				type="checkbox" class="checkall">
			                      	</th>
									<th style="text-align: center; font-size: medium;">Name</th>
									<th style="text-align: center; font-size: medium;">Action</th>
			                    </tr>
		                  	</thead>
                  			<tbody>
				                  <%
				                  	for (Majors list: majors){
				                  %>
							   <tr class="contentPage" style="vertical-align: middle;">
								   <td   style="text-align: center; vertical-align: middle;"> 
								   		<input 	style="vertical-align: middle;" type="checkbox" name="major<%= list.getMajorId()%>" 
								   				value="<%= list.getMajorId()%>" class="checkitem" id="chkitem"> 
							   	   </td>
				                   <td style="text-align: center; vertical-align: middle;width=20%"><%=list.getName()%></td>
								   <td style="text-align: center; vertical-align: middle;">
								   <div class="row">
								   			
										<button type="button" class="btn btn-link" name="editMajor"  data-toggle="modal"
				                    			data-target="#editModal<%=list.getMajorId()%>" style="margin-left:auto; margin-right:0;padding:0;border-radius:100%;background:#e5e5e5; border:none;height:30px;width:30px;">
                                            <i class="zmdi zmdi-edit" style="vertical-align:middle; color:#808080;font-size:20px; display:inline-block; font: normal normal normal 14px/1 'Material-Design-Iconic-Font';"></i>
                                        </button>
								   		<a 	href="<%= request.getContextPath()%>/major/del?id=<%= list.getMajorId()%>" 
				                    		onclick="return confirm('Do you want to delete major : <%= list.getName()%>?')" name="deleteMajor" 
				                    		style="margin-left:15px;margin-right:auto;text-align: center;padding:0;border-radius:100%;background:#e5e5e5; border:none;height:30px;width:30px;">
					                    	<i class="zmdi zmdi-delete" style="vertical-align:middle; color:#808080;font-size:20px; display:inline-block; font: normal normal normal 14px/1 'Material-Design-Iconic-Font';"></i>
					                    	
				                    	</a>
								   </div>
<%-- 				                   		<button type="button" class="btn btn-link" name="editMajor" style="" data-toggle="modal"
				                    			data-target="#editModal<%=list.getMajorId()%>">
				                    	<i class="fa fa-edit" style="font-size:20px;  vertical-align:middle;"></i>
			                    		</button> --%>
				                    	<%-- <a 	href="<%= request.getContextPath()%>/major/del?id=<%= list.getMajorId()%>" 
				                    		onclick="return confirm('Do you want to delete major : <%= list.getName()%>?')" name="deleteMajor" >
					                    	<i class="fa fa-trash" style="color:rgb(220, 53, 69) ;font-size:20px; vertical-align:middle;"></i>
				                    	</a> --%>
				                   </td>          
			                   </tr>
<!-- Edit list -->
			                  <div class="modal fade" id="editModal<%=list.getMajorId()%>" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header alert alert-primary">
												<h5 class="modal-title " align="center">
													<i class="fa fa-fw fa-edit"></i>
													<strong>Edit Major</strong>
												</h5>
											</div>
											<div class="modal-body">
												<form id="add-post2" action="/managementSystem/major/edit?id=<%=list.getMajorId()%>" method="POST">
													<div class="form-group">
														<label class="required"><strong>Major Name:</strong>
															<span style="color: red"> *</span>&nbsp;<span id="spnNameStatus"></span>
														</label>
														<input 	class="form-control" id="majorname" type="text" name="name" value="<%=list.getName()%>"
																placeholder="Major Name" required />
													</div>
													<div style="text-align:center;">
														<button type="submit" class="btn btn-primary" style="width:80px; height:40px; font-size:15px;" id="btnSubmit">Save 
														</button>
														<button style="width:80px; height:40px;" type="button" class="btn btn-default" data-dismiss="modal">Close
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
						 
<!-- Add Modal -->
								<div class="modal fade" id="addModal" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<form id="add-post1" action="/managementSystem/major/add" method="POST">
												<div class="modal-header alert alert-primary">
													<h5 class="modal-title" align="center">
														<i style="size: 20px;" class="fa fa-fw fa-plus-square"></i>
														<strong>Add new major</strong>
													</h5>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label class="required">
															<strong>Major Name:</strong>
															<span style="color: red"> *</span>&nbsp;
															<span id="spnNameStatus1"></span>
														</label>
														<input 	class="form-control" id="majorname1" type="text"
																name="name" placeholder="Major Name" required />
													</div>
													<div style="text-align: center;" >
														<button type="submit" class="btn btn-primary" id="btnSubmit"
														 		style="width:80px;height:40px; font-size:15px;" >Add 
												 		</button>
														<button style="width:80px;height:40px;" type="button" class="btn btn-default" data-dismiss="modal">Close
														</button>
													
														
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
									<%
				                  	}
				                  	%>
                  
               			</tbody>
	                </table>
	                <div id="pager" style="float: left; margin-top:10px;">
						<ul id="pagination" class="pagination-sm"></ul>
					</div>
				</form>
	      </div>
    </div>

  </div>
</div>
</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 








