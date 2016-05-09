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
				<div id="asset">
					<h1>
					   <b class="saptaColor">Add</b> Asset
					</h1>
					<table id="asset">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name :</td>
							<td><input name="names" id="names" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Asset Type :</td>
							<td align="left">						
								<select id="sassettypeid" class="selectBox" style="width: 215px; text-align: center;">
									<option value="" style="text-align: center;">--- Select Asset Type ---</option> 
									<c:forEach items="${assetTypeList}" var="assetType">
										<option value="${assetType.id}" style="text-align: left;">${assetType.dispname}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Date of Purchased :</td>
							<td><input name="date" id="date" type="text" style="width: 215px;" class="datePcK"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Vendors :</td>
							<td align="left">						
								<select id="svendorid" class="selectBox" style="width: 215px; text-align: center;">
									<option value="" style="text-align: center;">--- Select Vendors ---</option> 
									<c:forEach items="${vendorList}" var="vendor">
										<option value="${vendor.id}" style="text-align: left;">${vendor.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"> <sup class="saptaColor">*</sup>Warranty Expired  :</td>
							<td><input name="wdate" id="wdate" type="text" style="width: 215px;"  class="datePcK"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Guarantee Expired :</td>
							<td><input name="gdate" id="gdate" type="text" style="width: 215px;"  class="datePcK"/></td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Price :</td>
							<td><input name="price" id="price" type="text" style="width: 215px;" onkeypress="return validateNumeric(event)"/></td>
						</tr>
					</table>
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addAsset"/>
							</div>
						 </div>
					</div>
					 <%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/asset" ><input type="button" value="Ok" id="user" /></a>
						</div>
					</div>  --%>
					<div id="confirmMsg" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel"  margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/asset" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
					</div>
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
			$(function() {
	            $( "#date, #wdate, #gdate" ).datepicker({
	               yearRange: '1950:2100',
				   defaultDate: new Date(),
	               changeMonth:true,
	               changeYear:true,
	               showOn: "button",
	               buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	               buttonImageOnly: true,
	               dateFormat :"dd-mm-yy"
	            });
	         });
			$('#addAsset').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				
				var name = $("#names").val();
				var assettypeid = $("#sassettypeid").val();
				var dateofpurchased = $("#date").datepicker().val();
				dateofpurchased = dateofpurchased.split('/').join('-');
				var vendorid = $("#svendorid").val();
				var warrantyofexpired = $("#wdate").datepicker().val();
				warrantyofexpired = warrantyofexpired.split('/').join('-');
				var guranteeofexpired = $("#gdate").datepicker().val();
				guranteeofexpired = guranteeofexpired.split('/').join('-');
				var price = $("#price").val();
				
				
				if(name == "" || name.length == 0) validation = false;
				if(assettypeid == "" || assettypeid.length == 0) validation = false;
				if(dateofpurchased == "" || dateofpurchased.length == 0) validation = false; 
				if(vendorid == "" || vendorid.length == 0) validation = false; 
				if(warrantyofexpired == "" || warrantyofexpired.length == 0) validation = false; 
				if(guranteeofexpired == "" || guranteeofexpired.length == 0) validation = false; 
				if(price == "" || price.length == 0) validation = false;
				var dateofpurchasedvalidation = $.datepicker.parseDate('dd-mm-yy',dateofpurchased);
				var warrantyofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',warrantyofexpired);
				if ((dateofpurchasedvalidation) >= (warrantyofexpiredvalidation))  validation = false; 		
				var guranteeofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',guranteeofexpired);
				if ((warrantyofexpiredvalidation) > (guranteeofexpiredvalidation))  validation = false; 		
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/asset/add/"+name+"/"+assettypeid+"/"+dateofpurchased+"/"+vendorid+"/"+warrantyofexpired+"/"+guranteeofexpired+"/"+price;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#names").val("");
							$("#sassettypeid").val("");
							$("#date").val("");
							$("#svendorid").val("");
							$("#wdate").val("");
							$("#gdate").val("");
							$("#price").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#alertMsgContent").html("Asset added successfully ...");
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
				$.fancybox.open('#confirmMsg');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "progress");
		});
	</script>
</html>