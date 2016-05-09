<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>  
	<body>
		<!--Header Start-->
			<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		
		<div id="innerContainer">
		
			<div id = "employee_details" class="HT88PX">
				<div class="dashboard">
					<article>
						<c:choose>
							<c:when test="${ session.groupname == 'ad' || session.groupname == 'hr'}">
								<div>
									<h1>Employees</h1>
									<a href="<%=request.getContextPath() %>/employee/viewemployee" style="text-decoration: none">
										<span>
											<aside><i class="fa fa-users"></i></aside>
											<p><span>${empactiveListsize}</span></p>
										</span>
									</a>
								</div>
								<div>
									<h1>Projects</h1>
									<a href="<%=request.getContextPath() %>/project/viewproject" style="text-decoration: none">
										<span>
											<aside><i class="fa fa-list"></i></aside>
											<p><span>${projectactiveListsize}</span></p>
										</span>
									</a>
								</div>
								<div>
									<h1>Customers</h1>
									<a href="<%=request.getContextPath() %>/customer/viewcustomer" style="text-decoration: none">
										<span>
											<aside><img src="<%=request.getContextPath() %>/resources/images/menu_icons/customer_view_db.png"/></aside>
											<p><span>${customerListSize}</span></p>
										</span>
									</a>
								</div>
								<div>
									<h1>Vendors</h1>
									<a href="<%=request.getContextPath() %>/vendordetails/viewvendor" style="text-decoration: none">
										<span>
											<aside><img src="<%=request.getContextPath() %>/resources/images/menu_icons/customer_view_db.png"/></aside>
											<p><span>${vendorListSize}</span></p>
										</span>
									</a>
								</div>
								<div>
									<h1>Expenses</h1>
									<a href="<%=request.getContextPath() %>/expense/viewexpense" style="text-decoration: none">
										<span>
											<aside><i class="fa fa-inr"></i></aside>
											<p><span>${expensetotalamount}</span></p>
										</span>
									</a>
								</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ session.groupname == 'ad' || session.groupname == 'hr' || session.groupname == 'fi'}">
								<div>
									<h1>Bills<span id="warning_img" class="hidden"><img src="<%=request.getContextPath() %>/resources/icons/triangle-spin.gif"  style=" width: 25px; position: absolute; right: 0;"/></span></h1>
									<a href="<%=request.getContextPath() %>/bills/viewbills" style="text-decoration: none">
										<span>
											<aside><img src="<%=request.getContextPath() %>/resources/images/menu_icons/bills_db.png"/></aside>
											<p><span>${billsListSize}</span></p>
										</span>
									</a>
								</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ session.groupname == 'ad' || session.groupname == 'fi'}">
								<div>
									<h1>Invoices</h1>
									<a href="<%=request.getContextPath() %>/invoice/viewinvoice" style="text-decoration: none">
										<span>
											<aside><img src="<%=request.getContextPath() %>/resources/images/menu_icons/invoice_db.png"/></aside>
											<p><span>${invoiceListSize}</span></p>
										</span>
									</a>
								</div>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${ session.groupname == 'ad' || session.groupname == 'hr' || session.groupname == 'fi'}">
								<div>
									<h1>Payroll</h1>
									<a href="<%=request.getContextPath() %>/payroll" style="text-decoration: none">
										<span>
											<aside><i class="fa fa-inr"></i></aside>
											<p><span>${payrolltotalamount}</span></p>
										</span>
									</a>
								</div>
							</c:when>
						</c:choose>
					</article>
				</div>
			</div>
		</div>
		
		<%@include file="footer.jsp"%>
	</body>
	
	<script>
	 $(document).ready(function(){
		$('#pageTitle').html("Dashboard");
		$("#menu_Dashboard").addClass("active");
		
		var billslistsize = "${billsListSize}";
		if(billslistsize != null && billslistsize > 0){
			<c:forEach items="${billsList}" var="billslist">
				var date = "${billslist.duedate}";
				strDate = date.split(" ");
				var newStrDate = strDate[1]+'/'+strDate[2]+'/'+strDate[5];
				var newDate = new Date(newStrDate);
				var currdate = new Date();
				var diffDays = Math.floor(( Date.parse(newStrDate) - Date.parse(currdate) ) / 86400000);				
				if(diffDays < 3){
					$("#warning_img").show();
				}
			</c:forEach>
		}
	 });
	</script>
</html>