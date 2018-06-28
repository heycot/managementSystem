<%@page import="model.bean.Roles"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/templates/inc/dashboard1.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/css/styleRegisterClass.css">
<style>
	#add-post .required:after {
	content:"*";color:red;
	}
</style>

<div class="content-wrapper py-3">
  <div class="container-fluid">
        <div class="card mb-3 divForm">
       		<div class="alert alert-success">
				<strong>Register Class</strong>
			</div>
			  
		  	<div class="form">
		  		<table>
				  <tr>
				    <th>No.</th>
				    <th>Name</th>
				    <th>Time</th>
				    <th>Date</th>
				    <th>Duration</th>
				    <th>Trainer</th>
				    <th></th>
				  </tr>
				  <tr>
				    <td class="no">1</td>
				    <td class="name">English session</td>
				    <td class="time">1:30-2h30</td>
				    <td class="date">Mon, Wed, Fri</td>
				    <td class="duration">30</td>
				    <td class="trainer">Huong (Hetty) T. Mai</td>
				    <td class="btnRegister">
				    	<input type="button" class="btn" value="Register">
				    	<input type="button" class="btn btn1" value="Cancel">
				    </td>
				  </tr>
				  <tr>
				    <td class="no">2</td>
				    <td class="name">English session</td>
				    <td class="time">1:30-2h30</td>
				    <td class="date">Mon, Wed, Fri</td>
				    <td class="duration">30</td>
				    <td class="trainer">Huong (Hetty) T. Mai</td>
				    <td class="btnRegister">
				    	<input type="button" class="btn" value="Register">
				    	<input type="button" class="btn btn1" value="Cancel">
				    </td>
				  </tr>
				  <tr>
				    <td class="no">3</td>
				    <td class="name">English session </td>
				    <td class="time">1:30-2h30</td>
				    <td class="date">Mon, Wed, Fri</td>
				    <td class="duration">30</td>
				    <td class="trainer">Huong (Hetty) T. Mai</td>
				    <td class="btnRegister">
				    	<input type="button" class="btn" value="Register">
				    	<input type="button" class="btn btn1" value="Cancel">
				    </td>
				  </tr>
				  <tr>
				    <td class="no">4</td>
				    <td class="name">English session</td>
				    <td class="time">1:30-2h30</td>
				    <td class="date">Mon, Wed, Fri</td>
				    <td class="duration">30</td>
				    <td class="trainer">Huong (Hetty) T. Mai</td>
				    <td class="btnRegister">
				    	<input type="button" class="btn" value="Register">
				    	<input type="button" class="btn btn1" value="Cancel">
				    </td>
				  </tr>
				  <tr>
				    <td class="no">5</td>
				    <td class="name">English session</td>
				    <td class="time">1:30-2h30</td>
				    <td class="date">Mon, Wed, Fri</td>
				    <td class="duration">30</td>
				    <td class="trainer">Huong (Hetty) T. Mai</td>
				    <td class="btnRegister">
				    	<input type="button" class="btn" value="Register">
				    	<input type="button" class="btn btn1" value="Cancel">
				    </td>
				  </tr>
				</table>
		  	</div>
   		</div> 
     
              
        <div style="clear: both"></div>
        <div class="error" ></div>
        <div style="margin-bottom: 10%"></div>
	</div>
</div>
<%@include file="/templates/inc/footer.jsp" %> 