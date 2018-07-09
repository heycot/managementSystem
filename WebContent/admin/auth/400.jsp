<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bootcamp management system</title>

<style type="text/css">
	body{
		background-image: url("/templates/images/enclave.jpg"), no-repeat 100% 0px 0px;
    	background-color: #cccccc;
	}
</style>
</head>
<body style="background-image: ">
<div>
	<div  style="margin: auto; width: 60%; float: left;">
		<h1 style="text-algin: center;">Bad request.</h1>
		<h2 style="display: inline-block">You can't visit that page. Please return to home page: </h2>
		<%
		User user = (User) session.getAttribute("user");
		if (user.getRoleId() == 1) {
		%>
		<a href="<%= request.getContextPath()%>/trainer/edit?id=<%= user.getUserId()%>">Home Page</a>
		<%
		} else {
		%>
		<a href="<%= request.getContextPath()%>/trainee/edit?id=<%= user.getUserId()%>">Home Page</a>
		<%
		}
		%>
	</div>
</div>
</body>
</html>