<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<c:url value='/static/dist/css/login.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/static/dist/css/slideshow.css'/>">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.css'>
<!-- favion -->
<link rel="shortcut icon" href="https://d35xd5ovpwtfyi.cloudfront.net/48c2db939dbcfd789cde3105cc824d57cc2b65a1/www/img/favicon/favicon-194x194.png" type="image/x-icon" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.min.js'></script>
<script type="text/javascript" src="<c:url value='/static/dist/js/login.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#login").click(function(){
			$.ajax({
				url:'login-by-ajax',
				type:'POST',
				contentType: 'application/json',
				
				data: JSON.stringify({
					username:$("input[name='username']").val(),
					password:$("input[name='password']").val(),
				}),
				success: function(result){
					debugger;
				}
			})
		});
	});
</script>
<title>Đăng nhập hệ thống</title>
</head>
<body>
			<ul class="cb-slideshow">
	        	<li><span></span><div></div></li>
	        	<li><span></span><div></div></li>
	        	<li><span></span><div></div></li>
	       		 <li><span></span><div></div></li>
	       		 <li><span></span><div></div></li>
	        	<li><span></span><div></div></li>
	    	</ul>
			<div class="row" id="pwd-container">
			<div class="col-md-4">
			
			</div>
			<%-- <div class="col-md-4" id="form-div">
				<section class="login-form">
				<form:form modelAttribute="user" method="post" action="login" role="login" name="frm-login" id="frm-login">
				<img style="width: 140px;height: 100px;" src="http://www.aksharachits.com/home/assets/images/login_img.png" class="img-responsive" alt="" />
					<h3 id="titleLogin">ĐĂNG NHẬP HỆ THỐNG</h3>
					<form:input path="username" type="text" placeholder="Username" class="form-control input-lg" value="" />
					<form:input path="password" type="password" class="form-control input-lg" id="password" name="password" placeholder="Password" />
					<p id="messeage" style="color:red;"><c:out value="${err}"></c:out> </p>
					<!-- <div class="pwstrength_viewport_progress"></div> -->
					<form:button class="btn btn-lg btn-block" id="login" type="submit">Đăng nhập</form:button>
					<div>
					<a href="<%=request.getContextPath() %>/forgotpassword" style="text-decoration: none;">Quên mật khẩu ?</a>
					</div>
				</form:form>
				
				</section>
			</div> --%>
				<div class="col-md-4" id="form-div">
				<section class="login-form">
				
				<img style="width: 140px;height: 100px;" src="http://www.aksharachits.com/home/assets/images/login_img.png" class="img-responsive" alt="" />
					<h3 id="titleLogin">ĐĂNG NHẬP HỆ THỐNG</h3>
					<input name="username" type="text" placeholder="Username" class="form-control input-lg" value="" />
					<input name="password" type="password" class="form-control input-lg" id="password" placeholder="Password" />
					<p id="messeage" style="color:red;"><c:out value="${err}"></c:out> </p>
					<!-- <div class="pwstrength_viewport_progress"></div> -->
					<button class="btn btn-lg btn-block" id="login">Đăng nhập</button>
					<div>
					<a href="<%=request.getContextPath() %>/forgotpassword" style="text-decoration: none;">Quên mật khẩu ?</a>
					</div>
				
				
				</section>
			</div>
			<div class="col-md-12" id="license">
					<p>Copyright © 2018. Design by <a href="https://minhduckma.blogspot.com/">Tran Minh Duc</a>. All Rights Reserved.</p>
			</div>
		</div>
		<script type="text/javascript">
			
			
		</script>
</body>
</html>