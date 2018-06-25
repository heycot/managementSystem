
<%@page import="model.bean.Results"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="model.bean.ScheduleOfTrainee"%>;
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<div class="content-wrapper py-3">
  <div class="container-fluid">
    <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>
          Result of Trainee
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
                      <th >Class Name  </th>
                      <th >Result </th>
                   
                      
                    </tr>
                  </thead>
                  <tbody>
                  <%
                
                  	ArrayList<Results> listResults = (ArrayList<Results>) request.getAttribute("listResults");
                  	int i=0;
                  	for (Results results : listResults){
                  		i+=1;
                  		String res= "";
                  		if (results.getStatus()==0){
                  			 res = "Pass";
                  		}
                  		else {
                  			res = "Fail";
                  		}
                  %>
                  
                  <tr>
                  <td><%= i %></td>
                  <td><%= results.getClassName()%></td>
                  
                  <td><%= res%></td>
                  
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
