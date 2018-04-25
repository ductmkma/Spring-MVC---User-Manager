<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Thêm tag lib jstl và tabg của Spring  -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


<%-- <link href="<%= request.getContextPath()%>/css/main.css"> --%>
<link href='<c:url value="/css/main.css"></c:url>'>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<div class = "container">
	<div style="width: 50%; margin: 0 auto;">
		<div class="wrapper">
			<form:form action="login" method="post" name="Login_Form" class="form-signin"  modelAttribute="user">       
			    <h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
				  <hr class="colorgraph"><br>
				  
				  
				  
				  <form:input type="text" class="form-control" path="username" placeholder="Username" required="" autofocus="" />
				  <form:input type="password" class="form-control" path="password" placeholder="Password" required=""/>     		  
				 
				  <form:button class="btn btn-lg btn-primary btn-block"  name="submit" value="Login" type="submit">Login</form:button>
				  <div  style="color: red;">${err}</div>		
			</form:form>			
		</div>
	</div>
</div>
</body>
</html>