<%@page import="libralies.FormatDateLibrary"%>
<%@page import="model.bean.MyMessages"%>
<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard1.jsp" %>  

<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleNoti.css">
<style>
	#add-post .required:after {
	content:"*";color:red;
	}
</style>

<div class="content-wrapper py-3">
  <div class="container-fluid">
        <div class="card mb-3 divNoti">
       		<div class="alert alert-success">
       		<%
       		MyMessages messages = (MyMessages) request.getAttribute("messages");
       		String ngay = FormatDateLibrary.FormatDateUntilToString(messages.getCreatedDate());
       		%>
				<strong>Notification</strong>
			</div>
			  
		  	<div class="box-noti">
		  		<div class="labelNoti">
		  			<div class="divTitle row">
		  				<label class="title"><%= messages.getTitle() %></label>
		  			</div>
		  		</div>
		  		
		  		<div class="space"></div>
		  		<div class="divContentNoti">
		  			<label class="contentNoti">
		  				<%= messages.getNotiContent() %>
		  			</label>
		  			<label class="date"> <%= ngay %></label>
		  				
		  		</div>
		  	</div>
   		</div> 
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 