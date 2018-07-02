<%@page import="model.bean.Rooms"%>
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard1.jsp" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
<div class="content-wrapper py-3">
  <div class="">
    <div class="">
        <div class="card-header" style="background-color:rgb(212, 237, 218)";>
            <h2 style="text-align:center;color:green;">Room List</h2>
         </div>
         <%
                  ArrayList<Rooms> roomlist = (ArrayList<Rooms>) request.getAttribute("roomList");
         			int k=0;
         			int tong = roomlist.size();
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
                var pageSize = 10; // HiÃ¡Â»Æ’n thÃ¡Â»â€¹ 6 sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m trÃƒÂªn 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** CÃ¡ÂºÂ§n truyÃ¡Â»Ân giÃƒÂ¡ trÃ¡Â»â€¹ vÃƒ o Ã„â€˜ÃƒÂ¢y **///
                var totalRows = <%= tong%>; // TÃ¡Â»â€¢ng sÃ¡Â»â€˜ sÃ¡ÂºÂ£n phÃ¡ÂºÂ©m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ 
                var btnPage = 5; // SÃ¡Â»â€˜ nÃƒÂºt bÃ¡ÂºÂ¥m hiÃ¡Â»Æ’n thÃ¡Â»â€¹ di chuyÃ¡Â»Æ’n trang
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
            ///** CSS cÃ„Æ’n id pagination ra giÃ¡Â»Â¯a mÃƒ n hÃƒÂ¬nh **///
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
            <form action=""  method="post">
                <input style="display: none; margin-left: 10px; margin-bottom: 10px; color: red" id="deleteall" type="submit" value="Delete">
                <table id="myTable" class="table table-bordered" width="100%"  cellspacing="0">
                  <thead>
                    <tr>
                      <th>No.</th>
                      <th>Name</th>
                       <th>Capacity</th>
                      <th>Status</th>
                   
                    </tr>
                  </thead>
                  <tbody>
                  
                  	<%
                  	for (Rooms rooms: roomlist){
                  		k++;
                  %>
				   <tr class="contentPage">
				   <td><%=k %></td>
                  <td><%= rooms.getName() %></td>
                  <td><%= rooms.getCapacity()%></td>
                  <%if(rooms.getStatus()==0){
                	  %>
                	  <td>Occupied</td>
                	  <%
                  } else {
                	  %>
                	  <td>Available</td>
                	  <%
                  }
                   %>
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
        <div class="card-footer small text-muted">
          Updated yesterday at 11:59 PM
        </div>
      </div>
    </div>
  </div>
<%@include file="/templates/inc/footer.jsp" %> 