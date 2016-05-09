<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>  
	<body>
		<!--Header Start-->
			<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		
		<div id="innerContainer" style="min-height: 85%;">
		
			<div id = "employee_details" class="HT88PX">
					<div class="dashboard">
						<article>
							<div>
								<h1>User</h1>
								<span>
									<aside><i class="fa fa-users"></i></aside>
									<p><span><a href="">5k</a></span></p>
								</span>
							</div>
							<div>
								<h1>Employee</h1>
								<span>
									<aside><i class="fa fa-user"></i></aside>
									<p><span><a href="">12k</a></span></p>
								</span>
							</div>
							<div>
								<h1>Payroll</h1>
								<span>
									<aside><i class="fa fa-inr"></i></aside>
									<p><span><a href="">222k</a></span></p>
								</span>
							</div>
							<div>
								<h1>Project</h1>
								<span>
									<aside><i class="fa fa-folder"></i></aside>
									<p><span><a href="">25k</a></span></p>
								</span>
							</div>
							<div>
								<h1>Payments</h1>
								<span>
									<aside><img src="resources/icons/payment.png"></aside>
									<p><span><a href="">2220k</a></span></p>
								</span>
							</div>
						</article>
					</div>
			</div>
				<%@include file="footer.jsp"%>
			</div>
	</body>
	<script>
	 $(document).ready(function(){
		$('#pageTitle').html("Dashboard");
		$("#menu_Dashboard").addClass("active");
	
	 });
	</script>
</html>