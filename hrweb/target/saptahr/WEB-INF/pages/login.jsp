<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
	</head>
	<body>
		<div id="container">
			<!--Article Start-->
			<article>
				<div class="logo">
					<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Sapta Labs" /></a>
				</div><br/>
				<div class="loginBg">
					<form:form action="" commandName="user">
						<h1 class="login">Login</h1>					
						<div class="clearTable">
							<label>User Id:</label>
							<form:input path="username" />
						</div>
						<div class="clearTable">
							<label>Password:</label>
							<form:input path="password" type="password" />
						</div>
						<div class="clearTable MRGL218PX MRGB15PX">
							<input id="bsubmit" type="submit" value="Submit" />						
						</div>
					</form:form>
				</div>
			</article>
		<!--Article End-->
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup></footer>
	</body>
	<script>
		$(document).ready(function(){
			if("${errorMsg}" != "" && "${errorMsg}".length >= 0){
				document.getElementById("errorMsgContent").innerHTML = "${errorMsg}";
				$.fancybox.open('#errorMsg');
			}
			$('#bsubmit').click(function() {
				$("body").css("cursor", "progress");
			});
		});
	</script>
</html>