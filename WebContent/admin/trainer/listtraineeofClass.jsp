
<%@page import="model.bean.Accessment"%>
<%@page import="model.bean.Results"%>
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="model.bean.Classes"%>;
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.twbsPagination.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
<script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script> 
  <script type="text/javascript">
  function abc(a) {
	  var val = $(a).val();
	  alert(val);
	    if (val === '1') {
	        $(a).prop("disabled", false);
	    }
	    else {
	        $(a).prop("disabled", true);
	    }
	}
 /*  $('td > input[type="radio"]').on('click', function() {
	  
	    var val = $(this).val(),
	    selectId = $(this).closest('tr').find('select').first();
  } */
  </script>
    	<%
    		String name= (String)request.getAttribute("name");
    		int id = Integer.parseInt((String)request.getAttribute("id"));
    	 	int  result = Integer.parseInt((String)request.getAttribute("assessment"));
    	 	int  check = Integer.parseInt((String)request.getAttribute("check"));
    	%>
    	<%
    		ArrayList<Accessment> listUser;
             if(check ==1){
            	 System.out.print("result");
            	  listUser = (ArrayList<Accessment>) request.getAttribute("listResult");
             } else {
            	 System.out.print("users");

            	  listUser = (ArrayList<Accessment>) request.getAttribute("listUser");
             }
    	int tong = listUser.size();
    		
    	%>
  <div class="content-wrapper py-3">
  <div class="container-fluid" >
    <div class="card mb-3">
         <div class="alert alert-primary" >
		  <strong><%=name %></strong>
		</div>

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
                var pageSize = 10; // Hiá»ƒn thá»‹ 6 sáº£n pháº©m trÃªn 1 trang
                showPage = function (page) {
                    $(".contentPage").hide();
                    $(".contentPage").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                ///** Cáº§n truyá»n giÃ¡ trá»‹ vÃ o Ä‘Ã¢y **///
                var totalRows = <%=tong%>; // Tá»•ng sá»‘ sáº£n pháº©m hiá»ƒn thá»‹
                var btnPage = 5; // Sá»‘ nÃºt báº¥m hiá»ƒn thá»‹ di chuyá»ƒn trang
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
            ///** CSS cÄƒn id pagination ra giá»¯a mÃ n hÃ¬nh **///
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
        <% 
                  if(result==1){
                	  if(check == 1){
                		  %>
                		  <h5 style="color: red">Finish trainee evaluation!</h5>
                		  <% 
                	
                  } 
                  }else{
                	  %>
                	  <h5 style="color: red">The class hasn't finished yet so you cannot evaluate!</h5>
                 <% 
                 
                  }
                  %>
          <div class="table-responsive">
            <form action="/managementSystem/trainer/list"  method="post">
                <input style="display: none; margin-left: 10px; margin-bottom: 10px; color: red" id="deleteall" type="submit" value="Delete">
               <input type="text" name="class_id" value="<%=id %>" style="display: none;" >
                <table id="myTable" class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                  <thead>
                    <tr>
                       <th style="text-align: center;">No.</th>
                       <th width="20%" style="text-align: center;">Username </th>
                      <th  width="20%" style="text-align: center;">Full name  </th>
                      <th width="20%" style="text-align: center;">Email</th>
                      <th width="20%" style="text-align: center;">Phone  </th>
                      <th width="20%" style="text-align: center;">Assessment  </th>
                      
                      
                    </tr>
                  </thead>
                  <tbody>
                  <%
                  	int i=0;
                  System.out.print(listUser.size());

                  	for (Accessment trainer : listUser){
                  		
                  		i+=1;
                  %>
                  
                  <tr class="contentPage">
                  <td><%= i %></td>
                  <td style="text-align: center;"><%= trainer.getUsername() %></td>
                  <td><%= trainer.getFullname() %></td>
            	  <td><%= trainer.getEmail() %></td>
                  <td style="text-align: center;"><%= trainer.getPhone() %></td>
                  <input type="text" name="user_id" value="<%=trainer.getUserid() %>" style="display: none;" >
                  <% 
                  if(result==1){
                	 if(check == 1){ 
                		  String nameradio = "trainee" + String.valueOf(trainer.getUserid());
                		  					if(trainer.getStatus()==1){
                		  						%>
                		  						<td style="text-align: center;">
                		  						<input type="radio" id="a-<%=trainer.getUserid() %>" name="<%= nameradio %>" checked="checked"  value="<%=trainer.getStatus() %>"  disabled="disabled"> Pass
          											  <input type="radio" id="b-<%=trainer.getUserid() %>" name="<%= nameradio %>"   value="<%=trainer.getStatus()%>"  disabled="disabled"> Fail 
											 </td>
											 <% 
											 } else {
												 %>
												 <td style="text-align: center;">
	                		  						<input type="radio" id="a-<%=trainer.getUserid() %>" name="<%= nameradio %>"   value="<%=trainer.getStatus() %>"  disabled="disabled"> Pass
	          											  <input type="radio" id="b-<%=trainer.getUserid() %>" name="<%= nameradio %>" checked="checked"  value="<%=trainer.getStatus()%>"  disabled="disabled"> Fail 
												  </td>
												 <% 
											 }
                                    		%>	
						                	 <%
                                    		
                                    	
                                    %>
                	 <%
                	    } else {
                		  String nameradio = "trainee" + String.valueOf(trainer.getUserid()); 
                          
                          %>
       				  <td style="text-align: center;">
					  <input type="radio" id="a-<%=trainer.getUserid() %>" name="<%= nameradio %>" value="1" > Pass
					  <input type="radio" id="b-<%=trainer.getUserid() %>" name="<%= nameradio %>" value="0" checked="checked" > Fail
      	 				</td> 
      	 			 	<%
                	  }  
                  } else{
                	  %>
                	  <td style="text-align: center;">
					  <input type="radio" name="" value="1" disabled="disabled"> Pass
					  <input type="radio" name="" value="0" disabled="disabled"> Fail
				  </td>
                 <% 
                  }%>
                  
                  </tr>
                  <%
                  
                  	}
                  %>
                  
                  </tbody>
                  
                </table>
                <%
                	if(result==1){
                		if(check==1){
                			%>
                			
                			<% 
                		} else {
                			%>
                			 <button type="submit" class="btn btn-primary" style="float: right;"><strong>Save</strong></button>
                			<%
                		}
                	} else {
                		%>
                		<button type="submit" class="btn btn-primary" style="float: right;" disabled="disabled"><strong>Save</strong></button>
                		<% 
                	}
                %>
                
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