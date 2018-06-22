
<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="model.bean.Classes"%>;
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<div class="content-wrapper py-3">
  <div class="container-fluid">
    <div class="card mb-3">
        <div class="alert alert-success" role="alert">
		  <h3 align="center">List Trainee Of Class</h3>
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
        <div class="card-body">
          <div class="table-responsive">
            <form action=""  method="post">
                <input style="display: none; margin-left: 10px; margin-bottom: 10px; color: red" id="deleteall" type="submit" value="Delete">
                <table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
                  <thead>
                    <tr>
                       <th>No.</th>
                       <th width="20%">Username </th>
                      <th width="20%">Full name  </th>
                      <th width="20%">Email</th>
                      <th width="20%">Phone  </th>
                      <th width="20%">Assessment  </th>
                      
                      
                    </tr>
                  </thead>
                  <tbody>
                  <%
                
                  	ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
                  	int i=0;
                  	for (User user : listUser){
                  		i+=1;
                  %>
                  
                  <tr>
                  <td><%= i %></td>
                  <td><%= user.getUsername() %></td>
                  <td><%= user.getFullname() %></td>
            	  <td><%= user.getEmail() %></td>
                  <td><%= user.getPhone() %></td>
                  <td><form action="">
					  <input type="radio" name="assessment" value="pass"> Pass
					  <input type="radio" name="assessment" value="female"> Fail
					</form>
				  </td>
                 </tr>
                  <%
                  	}
                  		
                  
                  %>
                  </tbody>
                  
                </table>
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
