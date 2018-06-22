
<%@page import="model.bean.Schedule"%>
<%@page import="java.util.ArrayList"%>
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>  
<div class="content-wrapper py-3">
  <div class="container-fluid">
    <div class="card mb-3">
        <div class="alert alert-success" role="alert">
		  <h3 align="center">Trainer's Schedule</h3>
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
                     
                      <th>Class</th>
                       <th>Room</th>
                      <th>Course</th>
                      <th>Time Of Date</th>
                      <th>Date Of Week</th>
                      <th>Hours Learned</th>
                      <th>Action</th>
                      
                     
                      
                      
                    </tr>
                  </thead>
                  <tbody>
                  <%
                
                  	ArrayList<Schedule> schedule = (ArrayList<Schedule>) request.getAttribute("schedule");
                  	
                  	for (Schedule list : schedule){
                  		String s="";
                  	 	String str=list.getDateOfWeek();
                  	 	String arr[]=str.split(",");
	                  	 for(int i=0; i<arr.length;i++){
	                  		 switch(arr[i]){
	                  		 case "2":
	                  		 {
	                  			 s+="Mon";
	                  			 break;
	                  		 }
	                  		 case "3":
	                  		 {
	                  			 s+="Tue";
	                  			break;
	                  		 }
	                  		 case "4":
	                  		 {
	                  			 s+="Wed";
	                  			break;
	                  		 }
	                  		case "5":
	                  		 {
	                  			 s+="Thu";
	                  			break;
	                  		 }
	                  		case "6":
	                  		 {
	                  			 s+="Fri";
	                  			break;
	                  		 }
	                  		case "7":
	                  		 {
	                  			 s+="Sat";
	                  			break;
	                  		 }
	                  		case "8":
	                  		 {
	                  			 s+="Sun";
	                  			break;
	                  		 }
	                  	    default:
	                  	    {
	                  	        
	                  	    }
	                  		 }
	                  		if (i< (arr.length-1)) {
	                 			 s+=", ";
	                 		 }
	                 		 else {
	                 			 s+=".";
	                 		 }
                  	 	}
                  		
                  %>
                  
                  <tr>
            		                 
                 
                  <td><%= list.getNameclass()%></td>
                   <td><%= list.getNameroom()%></td>
                   <td><%= list.getCourse()%></td>
                   <td><%= list.getTimeOfDate()%></td>
                   <td><%= s%></td>
                   <td><%= list.getCountLession()%></td>
                    <td> <a href="/managementSystem/trainer/list?class_id=<%= list.getClassid() %>">list trainer of class </a>
                  
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