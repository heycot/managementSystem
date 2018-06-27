<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
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
					<li class="noti1 noti">
						<div class="r1 row">
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
					
					<li class="noti2 noti">
						<div class="r1 row">
							
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
					
					<li class="noti3 noti">
						<div class="r1 row">
							
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
					
					<li class="noti4 noti">
						<div class="r1 row">
						
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
					
					<li class="noti5 noti">
						<div class="r1 row">
							
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
					
					<li class="noti6 noti">
						<div class="r1 row">
							
				  			<div class="divDate">
				  				<label class="date">Mon, 15-June-2018</label>
				  			</div>
				  			<div class="divTime">
				  				<label class="time">09:52</label>
				  			</div>
			  			</div>

			  			<div class="r2">
			  				<label class="content">
			  					A flower is a special kind of plant part. 
			  					Flowers are also called the bloom or blossom of a plant. 
			  					The flower grows on a stalk – a thin node – which supports it. 
			  					Flowers have petals. 
			  					Inside the part of the flower that has petals are the parts 
			  					which produce pollen and seeds.
			  					Flowers are the reproductive structure of flowering plants, 
			  					which are plants of the division Magnoliophyta, also called the Angiosperms.
			  					In many plants, a flower is its most colourful part. 
			  				</label>
		  				</div>
			  			
					</li>
				</ul>
			
   		</div> </div>
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 