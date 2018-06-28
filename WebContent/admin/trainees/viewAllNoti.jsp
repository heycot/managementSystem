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
					for (MyMessages msg : list)  {
						String ngay =  FormatDateLibrary.FormatDateUntilToString(msg.getCreatedDate());

					%>
					<li class="noti1 noti">
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
<%@include file="/templates/inc/footer.jsp" %> 