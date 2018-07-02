
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" /> -->
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
        <!-- JS tạo nút bấm di chuyển trang start -->
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>

<div class="content-wrapper py-3">
  <div class="container-fluid">
    <div class="card mb-3">
        <div class="alert alert-primary">
	    	<strong>LIST TRAINEE IN SYSTEM </strong>
	  	</div>
	  <%
	  String msg = "";
	  if(request.getParameter("msg") != null){
		  boolean check = false;
		  int msgInt = Integer.parseInt((String)request.getParameter("msg"));
		  switch(msgInt) {
		  case 1: {
			  check = true;
			  msg = "You added the trainee successfully"; break;
		  }
		  case 2:{
			  check = true;
			  msg = "You edit the trainee successfully"; break;
		  }
		  case 3:{
			  check = true;
			  msg = "You deleted the trainee successfully"; break;
		  }
		  case 4:{
			  check = true;
			  msg  = "You deleted trainees successfully"; break;
		  }
		  case 0:{
			  check = false;
			  msg  = "Error! System have some problems. Please try again"; break;
		  }
		  }
		   if( check == false){
		  %>
        	<div class="alert alert-danger">
		    	<strong> <%= msg%> </strong>
		  	</div>
		  <%
		  } else {
			  %>
	        	<div class="alert alert-success">
			    	<strong> <%= msg%> </strong>
			  	</div>
			  <%
		  }
	  }
	  %>
	  
		<%
		ArrayList<User> trainees = new ArrayList<User>();
		int total = 0;
		if (request.getAttribute("trainees") != null) {
		 trainees = (ArrayList<User>) request.getAttribute("trainees");
		 total = trainees.size();
				 
		}
		%>
        <script type="text/javascript">
            $(document).ready(function(){
                $(document).on('change', '.checkall, .checkitem', function(){
                    var $_this = $(this);
                    document.getElementById("deleteall").style.display = "block";
                    if($_this.hasClass('checkall')){
                        $('.checkitem').prop('checked', $_this.prop('checked'));
                    }else{
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
        
        <script type="text/javascript">
            $(function () {
                var pageSize = 5; // Hiển thị 10 sản phẩm trên 1 trang
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
        <div class="card-body">
          <div class="table-responsive">
            <form action="<%= request.getContextPath()%>/trainee/del"  method="post">
                <input style="display: none; margin-left: 10px; margin-bottom: 5px; color: red" id="deleteall" type="submit" value="Delete">
                <table  id="myTable" class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Delete All<input style="display: inline-block; margin-left: 15px;" type="checkbox" class="checkall"></th>
                      <th>Avatar</th>
                      <th>UserName</th>
                      <th>FullName</th>
                      <th>Email</th>
                      <th>Phone</th>
                      <th>Address</th>
                      <th>Status</th>
                      <th>Service</th>
                    </tr>
                  </thead>
                  <tbody >
                  <%
                  	for(User trainee : trainees){
                  %>	
                  	<tr class="contentPage">
                      	<td> <input type="checkbox" name="trainee<%= trainee.getUserId()%>" value="<%= trainee.getUserId()%>" class="checkitem" id="chkitem"> </td>
                      	<td><img alt="<%= trainee.getUsername()%>" src="<%=  request.getContextPath()%>/files/<%= trainee.getAvatar()%>" width="250px"></td>
                     	<td> <a href="<%= request.getContextPath()%>/trainee/edit?id=<%= trainee.getUserId()%>"><%= trainee.getUsername()%></a> </td>
	                    <td><%= trainee.getFullname() %></td>
	                    <td><%= trainee.getEmail()%></td>
	                    <td><%= trainee.getPhone()%></td>
	                    <td><%= trainee.getAddress() %></td>
	                    <%
	                    if (trainee.getStatus() == 1){
	                    	%>	
		                    <td id="status<%= trainee.getUserId()%>"><a href="javascript:void(0)" onclick="changeStatus(<%= trainee.getUserId()%>, 1);"><img alt="" src="<%= request.getContextPath()%>/templates/images/active.gif"></a></td>
		                    <%
	                    } else {
	                    	%>	
		                    <td  id="status<%= trainee.getUserId()%>"><a href="javascript:void(0)" onclick="changeStatus(<%= trainee.getUserId()%>, 0);"><img alt="" src="<%= request.getContextPath()%>/templates/images/deactive.gif"></a></td>
		                    <%
	                    }
	                    %>
                    	<td>
                        <a href="<%= request.getContextPath()%>/trainee/edit?id=<%= trainee.getUserId()%>"><i class="fa fa-edit"></i></a>
                        <a  style="margin-left: 20px" href="<%= request.getContextPath()%>/trainee/del?id=<%= trainee.getUserId()%>" onclick="return confirm('Do you want to delete trainee : <%= trainee.getUsername()%>?')"><i class="fa fa-trash"></i></a>
                     	</td>
                    </tr>
                  <%	
                  	}
                  %>
                  </tbody>
                </table>
                
                <script type="text/javascript">
                function changeStatus(id, status){
            		$.ajax({
            			url: '<%=request.getContextPath()%>/trainee/index',
            			type: 'POST',
            			cache: false,
            			data: {
            				//Dữ liệu gửi đi
            				traineeId: id,
            				status : status
            			},
            			success: function(data){
            				// Xử lý thành công
            				$('#status' + id).html(data);
            			},
            			error: function (){
            			// Xử lý nếu có lỗi
            				alert('fail');
            			}
            		});
            	}
                </script>
                
                <div id="pager">
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
            </form>
          </div>
        </div>
        <div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
      </div>
    </div>
  </div>
<%@include file="/templates/inc/footer.jsp" %> 
