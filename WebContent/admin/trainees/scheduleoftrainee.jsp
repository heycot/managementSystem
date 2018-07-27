<%@page import="java.util.ArrayList"%>
<%@page import ="model.bean.ScheduleOfTrainee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %> 
<style>
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
        </style>
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
    <div class="card1 card mb-3">
    	<div class="alert1 alert alert-primary" style=""> 
             <i class="fa1 fa fa-fw fa-users" ></i>
		    <strong class="lb_name">Your Schedule</strong>
		 </div>
		<div>
        <%
        ArrayList<ScheduleOfTrainee> listClass = (ArrayList<ScheduleOfTrainee>) request.getAttribute("listClass");
       	int i=0;
        int tong = listClass.size();
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
                var pageSize = 10; // Hiển thị 6 sản phẩm trên 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cần truyền giá trị vào đây **///
                var totalRows = <%= tong%>; // Tổng số sản phẩm hiển thị
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
         
        <div class="card-body">
          <div class="table-responsive">
            <form action=""  method="post">
                <table id="myTable" style="border-collapse: collapse;"  class="myTable table table-bordered table-hover table-compact" width="100%"  cellspacing="0">                
                  <thead>
                    <tr>
                       <th style="text-align: center; vertical-align: middle;" >No.</th>
                      <th style="text-align: center; vertical-align: middle;" >Class  </th>
                      <th style="text-align: center; vertical-align: middle;" >Room </th>
                      <th style="text-align: center; vertical-align: middle;" >Trainer </th>
                      <th style="text-align: center; vertical-align: middle; ">Time</th>
                      <th style="text-align: center; vertical-align: middle; " >Date Of Week </th>
                      <th style="text-align: center; vertical-align: middle;" >Learned (hours)</th>
                      <th style="text-align: center; vertical-align: middle;" >Duration (hours)</th>
                      <th style="text-align: center; vertical-align: middle;" >Default</th>
                      
                      <th style="text-align: center; vertical-align: middle;" >Action</th>
                      
                    </tr>
                  </thead>
                  <tbody id="trainer_body">
                 <%
                 
               	for (ScheduleOfTrainee sched : listClass){
               		i+=1;
                 %>
                  
                  <tr class="contentPage">
                  <td style="text-align: center;"  ><%= i %></td>
                  <td><%= sched.getNameClass()%></td>
                  <td style="text-align: center; vertical-align: middle;"  ><%= sched.getNameRoom()%></td>
                  <td ><%= sched.getNameTrainer()%></td>
                  <td style="text-align: center; vertical-align: middle;"  ><%= sched.getTimeofday()%></td>
                  
                  <td ><%= sched.getDateofweek()%></td> 
                  <td style="text-align: center;vertical-align: middle; "  ><%= sched.getCountLession() %>
                  <td style="text-align: center; vertical-align: middle;"  ><%= sched.getDuration() %>
                  <%
                  if (sched.getStatus()==1){
                	  %> 
                	<td style="text-align: center; vertical-align: middle;"  >Yes</td>
                 <%
                  } else {
                 %>
                	  <td style="text-align: center; vertical-align: middle;"  >No</td>
                 <% }
                  %>
            
                  <td style="text-align:center; vertical-align: middle;"> <a href="/managementSystem/trainee/list?class_id=<%= sched.getClassid() %>" class="fa fa-list" style="text-align: center; vertical-align: middle;font-size:20px; text-decoration: none;">  </a></td>
                  </tr>
                  <%
                  	}
                 %>
                  </tbody>
                </table>
                <div id="pager">
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