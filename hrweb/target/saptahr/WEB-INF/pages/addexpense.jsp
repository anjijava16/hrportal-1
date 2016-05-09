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
				<div id="expense">
					<h1><b class="saptaColor">Add</b> Expense</h1>
					
					<div id = "optiondiv" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Category</td>
								<td>:</td>
								<td align="left">						
									<select id="category" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0;">
										<option value="I" >Internal</option>
										<option value="E" >External</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
					<table id="expenseTable">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Date :</td>
							<td><input name="date" id="date" type="text" style="width: 215px;" class="datePcK"/></td>
							<td align="right"> <sup class="saptaColor">*</sup>Expense Type :</td>
							<td>
								<select id="expensetype" class="selectBox" style="width: 215px; text-align: center;">
										<option value="" style="text-align: center;">--- Select Expense Type ---</option> 
										<c:forEach items="${expenseTypeList}" var="expType">
											<option value="${expType.id}" style="text-align: left;">${expType.dispname} </option>
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Amount :</td>
							<td><input name="amount" id="amount" type="text" style="width: 215px;" onkeypress="return validateNumeric(event)"/></td>
							<td align="right">Bill No :</td>
							<td><input name="billno" id="billno" type="text" style="width: 215px;"/></td>
						</tr>
						<tr id = "payDetails" class="hidden MRGT10PX">
							<td align="right" style="padding-left:43px;"><sup class="saptaColor">*</sup>Bank Name :</td>
							<td><input name="bankname" id="bankname" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Card/Cheque No :</td>
							<td><input class ="card" name="cardno" id="cardno" type="text" style="width: 196px; padding-right:22px;" onkeypress="return validateNumeric(event)"/></td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Mode Of Payment :</td>
							<td>
								<select id="paymode" name = "paymode">
									<option value="c" >Cash</option>
									<option value="a" >Card</option>
									<option value="q" >Cheque</option>
									<option value="o" >Online Payment</option>
								</select>
							</td>
							<td align="right"><sup class="saptaColor">*</sup>Description :</td>
							<td><textarea style="width: 215px; height: 100px; resize:none;" id="desc" name="desc"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="clearWidth">
					<div class="clearTable rightElement">
						<div class="leftElement MRGL10PX">
							<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
						</div>
						<div class="rightElement MRGL10PX">
							<input type="button" value="Submit" id="addExpense"/>
						</div>
					</div>
				</div>
				<%-- <div id="userMsg" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id="userMsgContent"></div>
					<div class="clearWidth MRGT10PX">
						<a href="<%=request.getContextPath() %>/expense" ><input type="button" value="Ok" id="user" /></a>
					</div>
				</div> --%>
				<div id="confirmMsg" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/expense" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
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
	            $( "#date" ).datepicker({
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
			$('#paymode').on('change', function (e){
				var optionval = $("option:selected", this);
				if(optionval.val() != "c"){
					$("#payDetails").removeClass("hidden");
				}
				else{
					$("#payDetails").addClass("hidden");
				}
			});
			$('#addExpense').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				var date = $("#date").datepicker().val();
				date = date.split('/').join('-');
				var category = $("#category").val();
				var exptypeid = $("#expensetype").val();
				var desc = $("#desc").val();
				var billno = $("#billno").val();
				var amount = $("#amount").val();
				var mode = $("#paymode").val();
				var cardno = $("#cardno").val();
				var bankname = $("#bankname").val();
				if(date == "" || date.length == 0) validation = false;
				if(exptypeid == "" || exptypeid.length == 0) validation = false;
				if(desc == "" || desc.length == 0) validation = false;
				if(mode == "" || mode.length == 0) validation = false;
				if(amount == "" || amount.length == 0) validation = false;
				if (mode != "c"){
					if(cardno == "" || cardno.length == 0) validation = false;
					if(bankname == "" || bankname.length == 0) validation = false;
				}
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(billno == "" || billno.length == 0) billno = "null";
					if (mode == "c"){
						if(cardno == "" || cardno.length == 0) cardno = "null";
						if(bankname == "" || bankname.length == 0) bankname = "null";
					} 
					var resourceURL = $("#contextpath").val()+"/expense/add/"+category+"/"+date+"/"+exptypeid+"/"+desc+"/"+billno+"/"+mode+"/"+cardno+"/"+bankname+"/"+amount;
					//alert("resourceURL : "+resourceURL);
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							$("#date").val("");
							$("#expensetype").val("");
							$("#desc").val("");
							$("#billno").val("");
							$("#paymode").val("");
							$("#cardno").val("");
							$("#bankname").val("");
							$("#amount").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#alertMsgContent").html("Expense added successfully ...");
								$.fancybox.open('#alertMsg');
							}else{
								$("#errorMsgContent").html(errors);
								$.fancybox.open('#errorMsg');
							} 
						},
						error: function (xhr, ajaxOptions, thrownError){
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
			$("body").css("cursor", "default");
		});
	</script>
</html>
		