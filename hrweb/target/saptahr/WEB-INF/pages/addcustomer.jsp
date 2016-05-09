<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
	</head>
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
						<li class="active"><a href="#" id="menu_project">Project</a>
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
										<li><a href="<%=request.getContextPath() %>/invoice/addviewinvoice">View Invoice</a></li>
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
						<li><a href="#" >Miscellaneous</a>
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
				<div id="customer">
					<h1>
					   <b class="saptaColor">Add</b> Customer
					</h1>
					<table id="customer">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name :</td>
							<td><input name="names" id="names" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Customer Code :</td>
							<td><input name="custcode" id="custcode" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
						</tr>
						<tr>
							<td align="right">Mobile No :</td>
							<td><input name="mob" id="mob" type="text" style="width: 215px;" maxlength="10" minlength="10" onkeypress="return validateNumeric(event)"/></td>
							<td align="right">Phone No :</td>
							<td><input name="phon" id="phon" type="text" style="width: 215px;" onkeypress="return validateNumeric(event)"/></td>
							
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Email  :</td>
							<td><input name="emailid" id="emailid" type="text" style="width: 215px;"/></td>
							<td align="right"> <sup class="saptaColor">*</sup>Pincode :</td>
							<td><input name="pin" id="pin" type="text" style="width: 215px;"  /></td>
							
						</tr>
						<tr>
							<td align="right">Fax  :</td>
							<td><input name="faxs" id="faxs" type="text" style="width: 215px;" onkeypress="return validateNumeric(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Address :</td>
							<td><textarea style="width: 215px; height: 100px; resize:none;" id="addr" name="addr"></textarea></td>
						</tr>
					</table>
					
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addCustomer"/>
							</div>
							<div class="leftElement">
								<input id="decline" type="button" value="Decline" class="graybtn" />
							</div>
							
						 </div>
					</div>
					<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
					<%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/customer" ><input type="button" value="Ok" id="user" /></a>
						</div>
					</div> --%>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/customer" style="text-decoration: none">
						<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
					</a>	
				</div>	
			</div>
	<!--Content Area END-->
		</div>   
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$('#addCustomer').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				//customer
				var name = $("#names").val();
				var address = $("#addr").val();
				var phoneno = $("#phon").val();
				var mobileno = $("#mob").val();
				var custcode = $("#custcode").val();
				var email = $("#emailid").val();
				var pincode = $("#pin").val();
				var fax = $("#faxs").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(custcode == "" || custcode.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				if(email == "" || email.length == 0) validation = false;
				if(pincode == "" || pincode.length == 0) validation = false;
				if(!validateEmail(email)) validation = false;
				 
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(fax == "" || fax.length == 0) fax = "null";
					if(phoneno == "" || phoneno.length == 0) phoneno = "null";
					if(mobileno == "" || mobileno.length == 0) mobileno = "null";
					var resourceURL = $("#contextpath").val()+"/customer/add/"+name+"/"+address+"/"+phoneno+"/"+mobileno+"/"+email+"/"+pincode+"/"+fax+"/"+custcode;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#names").val("");
							$("#addr").val("");
							$("#phon").val("");
							$("#mob").val("");
							$("#custcode").val("");
							$("#emailid").val("");
							$("#pin").val("");
							$("#faxs").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#alertMsgContent").html("Customer added successfully ...");
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
		
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			/*  $('#decline_yes').click(function() {
				$("body").css("cursor", "progress");
			}); 
			  */
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "progress");
		});
	</script>
</html>