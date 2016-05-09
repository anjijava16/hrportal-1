<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">
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
						<li class="active"><a href="#" >Payments</a> 
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
				<div id="vendor">
					<h1>
					   <b class="saptaColor">Add</b> Bill
					</h1>
					<div id = "vendorselect" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Vendor</td>
								<td>:</td>
								<td align="left">						
									<select id="vendselect" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center;">
										<option value="" style="text-align: center;">--- Select Vendor ---</option> 
										<c:forEach items="${vendorList}" var="vendorlist">
											<option value="${vendorlist.id}" style="text-align: left;">${vendorlist.id} - ${vendorlist.name} </option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</div>
					<div id = "BillNo" class="cmnTable hidden">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "167px"> <sup class="saptaColor">*</sup>Bill Number</td>
								<td>:</td>
								<td align="left">						
										<input id="billno" disabled="disabled" class="inputdisabletxtbold" style="width: 215px;" />
								</td>
							</tr>
						</table>
					</div>
					<table id="bills" class="hidden">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Bill Date :</td>
							<td><input name="billdate" id="billdate" type="text" style="width: 215px;" class="datePcK"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Due Date :</td>
							<td><input name="duedates" id="duedates" type="text" style="width: 215px;" class="datePcK"/></td>
						</tr>
						<tr>
							
							<td align="right"><sup class="saptaColor">*</sup>Due Amount :</td>
							<td><input name="dueamounts" id="dueamounts" type="text" style="width: 215px;" onkeypress="return validateNumeric(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Amount Type :</td>
							<td>
								<select id="type" name = "type" style="text-align: center;">
								    <option value="" style="text-align: center;">--- Select ---</option>
									<option value="i" style="text-align: left;">INR</option>
									<option value="u" style="text-align: left;">USD</option>
									<option value="e" style="text-align: left;">EUR</option>
									<option value="g" style="text-align: left;">GBP</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right">Comments :</td>
							<td><textarea style="width: 215px; height: 100px; resize:none;" id="comments" name="comments"></textarea></td>
						</tr>
					</table>
					<div class="clearWidth hidden" id="buttons">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addBill"/>
							</div>
						 </div>
					</div>
					<div id="confirmMsg" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContent"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/bills" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px"></a>
					</div>
					<%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/bills" ><input type="button" value="Ok" id="user" /></a>
						</div>
					</div> --%>
				</div>
			</div>
	<!--Content Area END-->
			<div style="text-align: center;" id="mandatory" class="hidden"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
		</div>   
	<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	  <script type="text/javascript">
	  $(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
				 $( "#billdate, #duedates" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
				 });
			 });
			
			$('#vendselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#bills").removeClass("hidden");
			 	$("#BillNo").addClass("hidden");
			 	if($("#vendselect").val() != "null"){
			 		$("#mandatory").removeClass("hidden");
				 	$("#buttons").removeClass("hidden");
				 	$("#bills").removeClass("hidden");
				 	//var projectcode = null;
				 	var vendorcode = null;
				 	var billnum = 0;
				 	var id = null;
				 	
				 	var resourceURL = $("#contextpath").val()+"/vendordetails/retrivebyid/"+$("#vendselect").val();
				 	$.ajax({
				        url : resourceURL,
				        type : 'GET',
				        dataType : 'json',
				        async : false,
				        success: function(data) {
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	
				        	if(successflag == "true"){
				        		$.each(results, function (i, result) {
				        			vendorcode = result.vendorcode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	 var url = $("#contextpath").val()+"/bills/retrivebyVendor/"+$("#vendselect").val();
				 	$.ajax({
				        url : url,
				        type : 'GET',
				        dataType : 'json',
				        async : false,
				        success: function(data) {
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	
				        	if(successflag == "true"){
				        		for(var i=0;i<results.length;i++){
				        			
				        			billnum = results[0].billno;
				        		}
				        	}else{
				        		billnum = 0;
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	 billnum = billnum.split("-");
				 	var increment = 0;
				 	var billarray = billnum[3]; 
				 	increment = parseInt(billarray)+1;
				 	$("#billno").val("SL-BILL-"+vendorcode+"-"+increment);
				 	$("#BillNo").removeClass("hidden");  
			 	}
			});
				 	
				 	
			$('#addBill').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				//invoice
				var vendid = $("#vendselect").val();
				var billdate = $("#billdate").datepicker().val();
				var duedate = $("#duedates").datepicker().val();
				var dueamount = $("#dueamounts").val();
				var amounttype = $("#type").val();
				var comments = $("#comments").val();
				//var status = $("#stat").val();
				var billno = $("#billno").val();
				
				if(billno == "" || billno.length == 0) validation = false;
				if(billdate == "" || billdate.length == 0) validation = false;
				if(duedate == "" || duedate.length == 0) validation = false;
				if(dueamount == "" || dueamount.length == 0) validation = false;
				if(vendid == "" || vendid.length == 0) validation = false;
				//if(status == "" || status.length == 0) validation = false;
				if(amounttype == "" || amounttype.length == 0) validation = false;
				if(comments == "" || comments.length == 0) validation = false;
				var billdatevalidation = $.datepicker.parseDate('dd-mm-yy',billdate);
				var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
				if ((billdatevalidation) >= (duedatevalidation))  validation = false; 
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/bills/add/"+billdate+"/"+duedate+"/"+dueamount+"/"+amounttype+"/"+vendid+"/"+billno+"/"+comments;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#billdate").val("");
							$("#vendid").val("");
							$("#duedates").val("");
							$("#dueamounts").val("");
							$("#type").val("");
							$("#comments").val("");
							//$("#stat").val("");
							$("#vendselect").val("");
							$("#mandatory").addClass("hidden");
						 	$("#buttons").addClass("hidden");
						 	$("#bills").addClass("hidden");
						 	$("#BillNo").addClass("hidden");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#alertMsgContent").html("Bill added successfully ...");
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
				$("#confirmationMsgContent").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			$('#decline_no').click(function() {
				$.fancybox.close();
			});
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "progress");
		});
	</script>
</html>