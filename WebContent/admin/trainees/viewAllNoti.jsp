<%@page import="model.bean.MyMessages"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libralies.FormatDateLibrary"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard1.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleAllNoti.css">
<style>
	#add-post .required:after {
	content:"*";color:red;
	}
</style>

<div class="content-wrapper py-3">
  <div class="container-fluid">
        <div class="card mb-3 divNoti">
       		<div class="alert alert-success">
				<strong>Notification</strong>
			</div>
			<div class="box-all-noti">
				<ul class="list-noti">
					<%
					 ArrayList<MyMessages> list = (ArrayList<MyMessages>)request.getAttribute("list");
					%>
					<li>Notification (<%= list.size()%>)</li>
					
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
						<a href='/managementSystem/trainee/detailnoti?msg_id=<%= msg.getMsgId() %>'>
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
			  			</a>
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
<%@include file="/templates/inc/footer.jsp" %> 