<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<body>
		<div id="innerContainer">
		<!--Header Start-->
			<header>
				<div class="clearBlock">
					<div class="leftElement">
						<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Sapta Labs" /></a>
					</div>
					<div class="rightElement MRGR10PX">
						<a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a>
					</div>		
					<div class="rightElement MRGR10PX">welcome <b><c:out value="${session.username}"></c:out></b></div>
				</div>
				<nav>
					<ul class="dropdown">
						<li><a href="<%=request.getContextPath() %>/employee" id="menu_employee">Employee</a></li>
						<li><a href="#" id="menu_project">Project</a>
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/project/addproject">Add Project</a></li>
								<li><a href="<%=request.getContextPath() %>/project/viewproject">View Project</a></li>
								<li><a href="<%=request.getContextPath() %>/customer" id="menu_customer">Customer</a></li>
								<li><a href="<%=request.getContextPath() %>/assignment" id="menu_assignment">Assignment</a> </li>
							</ul>
						</li>
						<li><a href="#" id="menu_asset">Payroll</a> 
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/empctc">Emp CTC</a></li>
								<li><a href="<%=request.getContextPath() %>/payroll">Emp Payroll</a></li>
								<li><a href="<%=request.getContextPath() %>/professionaltax">Emp PT</a></li>
								<li><a href="#" >TDS</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/tds/paytds">Pay TDS</a></li>
										<li><a href="<%=request.getContextPath() %>/tds/viewtds">View TDS</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="#" >Payments</a> 
							<ul class="sub_menu">
							    <li><a href="#" >Invoice</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/invoice/addinvoice">Add Invoice</a></li>
										<li><a href="<%=request.getContextPath() %>/invoice/viewinvoice">View Invoice</a></li>
									</ul>
								</li>
								<li><a href="#">Bills</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/bills/addbill">Add Bill</a></li>
										<li><a href="<%=request.getContextPath() %>/bills/viewbills">View Bills</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="active"><a href="#" >Miscellaneous</a>
							<ul class="sub_menu">
								<li><a href="#">Expenses</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/expense/addexpense">Add Expense</a></li>
										<li><a href="<%=request.getContextPath() %>/expense/viewexpense">View Expense</a></li>
										<li><a href="<%=request.getContextPath() %>/expensetype">Expense Type</a></li>
									</ul>
								</li>
								<li><a href="#">Asset</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/asset/addasset">Add Asset</a></li>
										<li><a href="<%=request.getContextPath() %>/asset/viewasset">View Asset</a></li>
										<li><a href="<%=request.getContextPath() %>/assettype">Asset Type</a></li>
									</ul>	
								</li>
								<li><a href="<%=request.getContextPath() %>/vendordetails">Vendor Detail</a></li>
							</ul>
						</li>				
					</ul> 
				</nav> 
			</header>
		<!--Header End-->
		<!--Content Area START-->
			<div id="contentArea">
				<div id="project">
					<h1>
						<b class="saptaColor">Add</b> Expense Type
					</h1>
					<table id="exp_details">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name :</td>
							<td><input name="name" id="name" type="text" style="width: 215px;"/></td>
							<td align="right"><sup class="saptaColor">*</sup>DispName :</td>
							<td><input name="dispname" id="dispname" type="text" style="width: 215px;" /></td>
						</tr>
					</table>
					
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="<%=request.getContextPath() %>/expensetype" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addExp_Type"/>
							</div>
						</div>
					</div>
					 <%--  <div id="userMsg" class="hidden">
							<h1><b class="saptaColor">Notification</b></h1>
							<div id="userMsgContent"></div>
							<div class="clearWidth MRGT10PX">
								<a href="<%=request.getContextPath() %>/project" ><input type="button" value="Ok" id="user" /></a>
							</div>
					  </div> --%>
				</div>	
			</div>
			<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
		<!--Content Area END-->
		</div>   
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$('#addProject').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var name = $("#name").val();
				var dispname = $("#dispname").val();
				if(dispname == "" || dispname.length == 0) validation = false;
				if(validation == false){
		    		$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
		    		$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/expensetype/add/"+name+"/"+dispname;
					$.ajax({
				        url : resourceURL,
				        type : 'GET',
				        dataType : 'json',
				        success: function(data) {
				        	// Clearing Project
				        	$("#name").val("");
							$("#dispname").val("");
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	if(successflag == "true"){
							    $("#alertMsgContent").html("Project added successfully ...");
					    		$.fancybox.open('#alertMsg');
				        	}else{
				        		$("#errorMsgContent").html(errors);
					    		$.fancybox.open('#errorMsg');
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				}
				$("body").css("cursor", "default");
			});
			
			$('#decline').click(function() {
				$("body").css("cursor", "progress");
			});
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>