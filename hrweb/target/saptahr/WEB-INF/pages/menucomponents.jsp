<!--Header Start-->
	<header>
		<div class="clearBlock">
			<div class="leftElement">
				<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Saptalabs" /></a>
			</div>
			<div class="rightElement MRGR10PX">
				<a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a>
			</div>		
			<div class="rightElement MRGR10PX">welcome <b><c:out value="${session.username}"></c:out></b></div>
		</div>
		<nav>
			<ul class="dropdown">
				<li id="menu_empl"><a href="<%=request.getContextPath() %>/employee">Employee</a></li>
				<li id="menu_proj"><a href="#">Project</a>
					<ul class="sub_menu">
						<li id="menu_project_addproject"><a href="<%=request.getContextPath() %>/project/addproject">Add Project</a></li>
						<li id="menu_project_viewproject"><a href="<%=request.getContextPath() %>/project/viewproject">View Project</a></li>
						<li id="menu_project_customer"><a href="<%=request.getContextPath() %>/customer">Customer</a></li>
						<li id="menu_project_assignment"><a href="<%=request.getContextPath() %>/assignment">Assignment</a> </li>
					</ul>
				</li>
				<li id="menu_payr"><a href="#">Payroll</a> 
					<ul class="sub_menu">
						<li id="menu_payroll_empctc"><a href="<%=request.getContextPath() %>/empctc">Emp CTC</a></li>
						<li id="menu_payroll_payroll"><a href="<%=request.getContextPath() %>/payroll">Emp Payroll</a></li>
						<li id="menu_payroll_professionaltax"><a href="<%=request.getContextPath() %>/professionaltax">Emp PT</a></li>
						<li id="menu_payroll_tds"><a href="<%=request.getContextPath() %>/tds">TDS</a></li>
					</ul>
				</li>
				<li id="menu_paym"><a href="#">Payments</a> 
					<ul class="sub_menu">
						<li id="menu_payments_invoice"><a href="<%=request.getContextPath() %>/invoice">Invoice</a></li>
						<li id="menu_payments_bills"><a href="<%=request.getContextPath() %>/bills">Bills</a></li>
					</ul>
				</li>
				<li id="menu_misc"><a href="#" >Miscellaneous</a>
					<ul class="sub_menu">
						<li id="menu_misc_exp"><a href="#">Expenses</a>
							<ul>
								<li id="menu_misc_exp_addexpense"><a href="<%=request.getContextPath() %>/expense/addexpense">Add Expense</a></li>
								<li id="menu_misc_exp_viewexpense"><a href="<%=request.getContextPath() %>/expense/viewexpense">View Expense</a></li>
								<li id="menu_misc_exp_expensetype"><a href="<%=request.getContextPath() %>/expensetype">Expense Type</a></li>
							</ul>
						</li>
						<li id="menu_misc_asset" ><a href="#">Asset</a>
							<ul>
								<li id="menu_misc_asset_addasset"><a href="<%=request.getContextPath() %>/asset/addasset">Add Asset</a></li>
								<li id="menu_misc_asset_viewasset"><a href="<%=request.getContextPath() %>/asset/viewasset">View Asset</a></li>
								<li id="menu_misc_asset_assettype"><a href="<%=request.getContextPath() %>/assettype">Asset Type</a></li>
							</ul>	
						</li>
						<li id="menu_misc_vendordetails"><a href="<%=request.getContextPath() %>/vendordetails">Vendor Detail</a></li>
					</ul>
				</li>				
			</ul> 
		</nav> 
	</header>
<!--Header End-->
			
<script>
	$(document).ready(function(){
		$('[id^="menu_"]').click(function() {
			clearActive();
			
			var id = $(this).attr("id");
			alert("id :"+id+", sub"+id.substring(0, 9));
			$("#"+id.substring(0, 9)).addClass("active");
		});
		
		function clearActive(){
			$('[id^="menu_"]').each(function(i, item) {
				var tempid = $(this).attr("id");
				$("#"+tempid).removeClass("active");
			});			
		}
	});
</script>

