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
				<strong>Notification</strong>
			</div>
			  
		  	<div class="box-noti">
		  		<div class="labelNoti row">
		  			<div class="divDate">
		  				<label class="date">Mon, 15-June-2018</label>
		  			</div>
		  			<div class="divTime">
		  				<label class="time">09:52</label>
		  			</div>
		  		</div>
		  		<div class="space"></div>
		  		<div class="divContentNoti">
		  			<label class="contentNoti">
		  				A flower is a special kind of plant part. 
			  			Flowers are also called the bloom or blossom of a plant. 
			  			The flower grows on a stalk – a thin node – which supports it. 
			  			Flowers have petals. Inside the part of the flower that has petals are the parts which produce pollen and seeds.
			  			Flowers are the reproductive structure of flowering plants, which are plants of the division Magnoliophyta, also called the Angiosperms.
					</label>
		  		</div>
		  	</div>
   		</div> 
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 