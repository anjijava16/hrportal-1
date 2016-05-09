<!--Header Start-->
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="appstyle.css" type="text/css" charset="utf-8" />
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
		<script src="jquery-1.10.2.js"></script> 
	</head>
	<body>
	<header>
		<div class="clearBlock" style="display: inline-block; width: 100%; padding: 10px 0;">
			<button class="dash_board_navbar_toggle" type="button"  onclick="showOrHideMenu()">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="leftElement">
				<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" class="logo_mob" alt="Saptalabs" /></a>
			</div>
			<div class="dash_board_title">
				<h1 id="pageTitle"></h1>
			</div>
			<button class="dash_board_navbar_toggle_mob" type="button"  onclick="showOrHideMobMenu()" style="display: none; ">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<div class="rightElement MRGR10PX">
				<a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a>
			</div>		
			<div class="rightElement MRGR10PX">welcome <b class="saptaColor"><c:out value="${session.username}"></c:out></b></div>
		</div>
		<nav class="dash_board_menu" id="dash_board_menu">
			<ul class="dropdown">
				<li id="menu_Dashboard"><a href="<%=request.getContextPath() %>/home" id="menu_Dashboard"><i class="fa fa-home"></i>&nbsp;<span>Dashboard</span></a></li><c:choose>
					<c:when test="${ session.groupname == 'ad' || session.groupname == 'hr'}">
						<li id="menu_employee"><a href="#" id="menu_employee"><i class="fa fa-users"></i>&nbsp;<span>Employee</span></a>
							<ul class="sub_menu">																	
								<li><a href="<%=request.getContextPath() %>/employee/addemployee"><i class="fa fa-user-plus"></i>&nbsp;<span>Add&nbsp;Employee</span></a></li>
								<li><a href="<%=request.getContextPath() %>/employee/viewemployee"><i class="fa fa-users"></i>&nbsp;<span>View&nbsp;Employee</span></a></li>											
							</ul>
						</li>
						<li id="menu_project"><a href="#" id="menu_project"><i class="fa fa-list"></i>&nbsp;<span>Project</span></a>
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/project/addproject"><i class="fa fa-folder"></i>&nbsp;<span>Add&nbsp;Project</span></a></li>
								<li><a href="<%=request.getContextPath() %>/project/viewproject"><i class="fa fa-folder-open"></i>&nbsp;<span>View&nbsp;Projects</span></a></li>												
								<li><a href="<%=request.getContextPath() %>/assignment/addassignment"><aside><img src="<%=request.getContextPath() %>/resources/icons/asset_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Assignment</span></a></li>
								<li><a href="<%=request.getContextPath() %>/assignment/viewassignment"><aside><img src="<%=request.getContextPath() %>/resources/icons/assignment_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Assignments</span></a></li>	
							</ul>
						</li>
					</c:when>
				</c:choose>	
				<c:choose>
					<c:when test="${ session.groupname == 'ad' || session.groupname == 'fi'}">
						<li id="menu_payroll"><a href="#" id="menu_payroll"><i class="fa fa-usd"></i>&nbsp;<span>Payroll</span></a> 
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/empctc"><aside><img src="<%=request.getContextPath() %>/resources/icons/employee_ctc.png"/></aside>&nbsp;&nbsp;<span>Emp&nbsp;CTC</span></a></li>
								<li><a href="<%=request.getContextPath() %>/payroll"><i class="fa fa-user"></i><sup><i class="fa fa-usd"></i></sup>&nbsp;<span>Emp&nbsp;Payroll</span></a></li>
								<li><a href="<%=request.getContextPath() %>/professionaltax"><aside><img src="<%=request.getContextPath() %>/resources/icons/prof_tax.png"/></aside>&nbsp;&nbsp;<span>Emp&nbsp;PT</span></a></li>								
								<li><a href="<%=request.getContextPath() %>/tds/paytds"><aside><img src="<%=request.getContextPath() %>/resources/icons/tds_pay.png"/></aside>&nbsp;&nbsp;<span>Pay&nbsp;TDS</span></a></li>
								<li><a href="<%=request.getContextPath() %>/tds/viewtds"><aside><img src="<%=request.getContextPath() %>/resources/icons/tds_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;TDS</span></a></li>
									
								<li><a href="<%=request.getContextPath() %>/emppf"><aside><img src="<%=request.getContextPath() %>/resources/icons/pf.png"/></aside>&nbsp;&nbsp;<span>PF</span></a></li>
								<li><a href="<%=request.getContextPath() %>/emplop"><aside><img src="<%=request.getContextPath() %>/resources/icons/lop.png"/></aside>&nbsp;&nbsp;<span>Emp&nbsp;LOP</span></a></li>
							</ul>
						</li>
						<li id="menu_payments"><a href="#" ><aside><img src="<%=request.getContextPath() %>/resources/icons/payment.png"/></aside> &nbsp;<span>Payments</span></a> 
							<ul class="sub_menu">
							   
									
								<li><a href="<%=request.getContextPath() %>/invoice/addinvoice"><aside><img src="<%=request.getContextPath() %>/resources/icons/invoice_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Invoice</span></a></li>
								<li><a href="<%=request.getContextPath() %>/invoice/viewinvoice"><aside><img src="<%=request.getContextPath() %>/resources/icons/invoice_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Invoices</span></a></li>						
								<li><a href="<%=request.getContextPath() %>/bills/addbill"><aside><img src="<%=request.getContextPath() %>/resources/icons/pay-bill.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Bill</span></a></li>
								<li><a href="<%=request.getContextPath() %>/bills/viewbills"><aside><img src="<%=request.getContextPath() %>/resources/icons/view_bill.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Bills</span></a></li>
									
							</ul>
						</li>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${ session.groupname == 'ad' || session.groupname == 'hr'}">
						<li id="menu_misc"><a href="#" ><aside><img src="<%=request.getContextPath() %>/resources/icons/miscellaneous.png"/></aside>&nbsp;&nbsp;<span>Miscellaneous</span></a>
							<ul class="sub_menu">
							
										<li><a href="<%=request.getContextPath() %>/expense/addexpense"><aside><img src="<%=request.getContextPath() %>/resources/icons/expenses_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Expense</span></a></li>
										<li><a href="<%=request.getContextPath() %>/expense/viewexpense"><aside><img src="<%=request.getContextPath() %>/resources/icons/expenses_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Expenses</span></a></li>
										<li><a href="<%=request.getContextPath() %>/expensetype"><aside><img src="<%=request.getContextPath() %>/resources/icons/expenses_type.png"/></aside>&nbsp;&nbsp;<span>Expense&nbsp;Types</span></a></li>
								
										<li><a href="<%=request.getContextPath() %>/asset/addasset"><aside><img src="<%=request.getContextPath() %>/resources/icons/asset_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Asset</span></a></li>
										<li><a href="<%=request.getContextPath() %>/asset/viewasset"><aside><img src="<%=request.getContextPath() %>/resources/icons/asset_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Assets</span></a></li>
										<li><a href="<%=request.getContextPath() %>/assettype"><aside><img src="<%=request.getContextPath() %>/resources/icons/asset_type.png"/></aside>&nbsp;&nbsp;<span>Asset&nbsp;Types</span></a></li>
								
										<li><a href="<%=request.getContextPath() %>/customer/addcustomer"><aside><img src="<%=request.getContextPath() %>/resources/icons/customer_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Customer</span></a></li>
										<li><a href="<%=request.getContextPath() %>/customer/viewcustomer"><aside><img src="<%=request.getContextPath() %>/resources/icons/customer_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Customers</span></a></li>
								
										<li><a href="<%=request.getContextPath() %>/vendordetails/addvendor"><aside><img src="<%=request.getContextPath() %>/resources/icons/customer_add.png"/></aside>&nbsp;&nbsp;<span>Add&nbsp;Vendor</span></a></li>
										<li><a href="<%=request.getContextPath() %>/vendordetails/viewvendor"><aside><img src="<%=request.getContextPath() %>/resources/icons/customer_view.png"/></aside>&nbsp;&nbsp;<span>View&nbsp;Vendors</span></a></li>
								
								<li><a href="<%=request.getContextPath() %>/saptaprofile/viewsaptaprofile"><aside><img src="<%=request.getContextPath() %>/resources/icons/favicon.png"/></aside>&nbsp;&nbsp;<span>Sapta&nbsp;Profile</span></a>
								</li>
							</ul>
						</li>
						<li id="menu_fyreports"><a href="#" ><aside><img src="<%=request.getContextPath() %>/resources/icons/fy_report.png"/></aside>&nbsp;&nbsp;<span>Reports</span></a>
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/fyreports/fybills"><aside><img src="<%=request.getContextPath() %>/resources/icons/view_bill.png"/></aside>&nbsp;&nbsp;<span>Bills</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fyinvoice"><aside><img src="<%=request.getContextPath() %>/resources/icons/invoice_add.png"/></aside>&nbsp;&nbsp;<span>Invoices</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fyexpense"><aside><img src="<%=request.getContextPath() %>/resources/icons/expenses_add.png"/></aside>&nbsp;&nbsp;<span>Expenses</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fyasset"><aside><img src="<%=request.getContextPath() %>/resources/icons/asset_view.png"/></aside>&nbsp;&nbsp;<span>Assets</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fytds"><aside><img src="<%=request.getContextPath() %>/resources/icons/tds_pay.png"/></aside>&nbsp;&nbsp;<span>TDS</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fyprofessionaltax"><aside><img src="<%=request.getContextPath() %>/resources/icons/prof_tax.png"/></aside>&nbsp;&nbsp;<span>PT</span></a></li>
								<li><a href="<%=request.getContextPath() %>/fyreports/fypayroll"><i class="fa fa-usd"></i>&nbsp;<span>Payroll</span></a></li>
							</ul>
						</li>
					</c:when>
				</c:choose>
			</ul> 
		</nav> 
	</header>
	</body>
<!--Header End-->
	<script>
		$(document).ready(function(){
			$('[id^="menu_"]').each(function(i, item) {
				var tempid = $(this).attr("id");
				$("#"+tempid).removeClass("active");
			});
		
		   $( 'ul.dropdown li' ).hover(
			   function(){
				   $(this).children('.sub_menu').show();
			   },
			   function(){
				   $(this).children('.sub_menu').hide();
			   }
		   );
		});
			function showOrHideMenu() {  
				var e = document.getElementById("dash_board_menu");
				if (e.style.left == '0px' || e.style.left==''){
				   e.style.left = '-25%';
				   $('#innerContainer').css( 'left','0' );
				}else {
				   e.style.left = '0px';
				 $('#innerContainer').css( 'left','171px' );
				}
			}
			function showOrHideMobMenu() {  
				var e = document.getElementById("dash_board_menu");
				if (e.style.display == 'none' || e.style.display==''){
				   e.style.display = 'block';
				}else{
				   e.style.display = 'none';
				}
			}
	</script>
</html>