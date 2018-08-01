<%@page import="model.bean.MyMessages"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libralies.FormatDateLibrary"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleAllNoti.css">
<style>
	#add-post .required:after {
	content:"*";color:red;
	}
</style>
<%
String classNameContent = "" ;
String classNameContainer = "";
String styleContent = "style=''";
if( user.getRoleId() == 3) {
	classNameContent = "content-wrapper py-3";
	classNameContainer = "container-fluid";
	styleContent = "";
}
%>
<div class="<%= classNameContent%>" <%= styleContent%>>
  <div class="<%= classNameContainer%>">
        <div class="card1 card mb-3 divNoti">
        <div class="alert1 alert alert-primary" style=""> 
             <i class="fa1 fa fa-fw fa-bell" ></i>
		    <strong class="lb_name">Notification</strong>
		 </div>
       		
		<div style="background-color: white ">
			<div class="box-all-noti" style="margin-left:auto; margin-right:auto;">
				<ul class="list-noti" style="width:50%; ">
				
			
					<%
					 ArrayList<MyMessages> list = (ArrayList<MyMessages>)request.getAttribute("list");
					%>
					
					<%
					for (MyMessages msg : list)  {
						String ngay =  FormatDateLibrary.FormatDateUntilToString(msg.getCreatedDate());
						if (msg.getStatus()==0){
						%>
						<li class="noti1 noti" style='background-color: rgb(212, 237, 218)' >
						<% 
						}
						else {
							%>
						<li class="noti1 noti" >
						
					<%		
						
							
						}
					%>
						
						<div class="r1 row">
				  			<div class="divTitle">
				  				<label class="title"><%= msg.getTitle() %></label>
				  			</div>
				  			<div class="divDate">
				  				<label class="date"><%= ngay %></label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					<%= msg.getNotiContent() %>
			  				</label>
		  				</div>
		
					</li>
					<%
					}
					%>
					
				</ul>
			
   		</div> </div>
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 