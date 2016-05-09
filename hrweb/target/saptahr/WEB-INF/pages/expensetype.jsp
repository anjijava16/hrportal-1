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
		<!--Expense Type List-->
			<div id="expenseTypeList">
				<h1 align="center" id="noexpenseTypeAvailable" class="hidden">Details <b class="saptaColor">Not Available</b> </h1>
				<div id="expenseType" class="hidden">
					<h1><b class="saptaColor">Expense Type</b> List</h1>
					<table class="data">
						<tr>
							<th class="first">Name</th>
							<th class="">Display Name</th>
							<th class="">Operation</th>
						</tr>					
						<c:forEach items="${expenseTypeList}" var="expenseType">
							<tr>
								<td id="name_${expenseType.id}">${expenseType.name}</td>
								<td id="number_${expenseType.id}">${expenseType.dispname}</td>
								<td style="text-align:center"><a href='#' id="edit_${expenseType.id}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href='#' id="delete_${expenseType.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="expenseTypeDetails">
				<h1><b class="saptaColor">Add</b> New</h1>
				<table id="expenseTypeTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Name :</td>
						<td><input name="name" id="name" type="text" style="width: 200px;" onkeypress="return ValidateAlpha(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>Display Name :</td>
						<td><input name="dispname" id="dispname" type="text" style="width: 200px;" onkeypress="return ValidateAlpha(event)"/></td>								
					</tr>	
					<tr>
						<td colspan=6 align ="left">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement MRGL10PX">
										<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
										<%-- <a href ="<%=request.getContextPath() %>/miscellaneous" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="greyBtn" />&nbsp;</a> --%>
									</div>
									<div class="rightElement MRGL10PX">
										<input type="button" value="Submit" id="addExpenseTypeDetails"/>
									</div>
								</div>
							</div>
						</td>
					</tr>			
				</table>
				<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">Expense Details</b></h1>
				<b class="saptaColor"><div id="notify_error"></div></b>
					<table>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name :</td>
							<td><input name="editname" id="editname" type="text" style="width: 200px;" onkeypress="return ValidateAlpha(event)"/></td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Display Name :</td>
							<td><input name="editdispname" id="editdispname" type="text" style="width: 200px;" onkeypress="return ValidateAlpha(event)"/></td>
						</tr>
						<tr class="hidden">
							<td colspan="2" align ="left"><input name="editid" id="editid" type="text" style="width: 200px;"/></td>
						</tr>
						<tr>
							<td colspan="2" align ="left">
								<div class="clearWidth">
									<div class="clearTable rightElement">
										<div class="leftElement">
											<input type="button"  class="MRGT10PX" value="Update" id="updateDetails"/>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
			</div>
			<div id="expenseMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="expenseMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/expensetype" id="menu_miscellaneous" ><input type="button" value="Done" id="expense" /></a></div>
			</div>
			<%-- <div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/expensetype" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div> --%>
			 <div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="confirmation" ><input type="button" value="Ok" id="user" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="<%=request.getContextPath() %>/expensetype" style="text-decoration: none"><input type="button" value="Cancel" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/expensetype" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){		
			$("body").css("cursor", "default");
			var expenseTypeListSize = "${expenseTypeListSize}";			
			if(expenseTypeListSize > 0){
				$("#expenseType").removeClass("hidden");
			}else{ 
				$("#noexpenseTypeAvailable").removeClass("hidden");
			}
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${expenseTypeList}" var="expense">
					if("${expense.id}"==recordid){
						$("#editname").val("${expense.name}");
						$("#editdispname").val("${expense.dispname}");
						$("#editid").val("${expense.id}");
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			$('#updateDetails').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var name = $("#editname").val();
				var dispname =$("#editdispname").val();
				var id =$("#editid").val();
				if(name == "" || name.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(id == "none" || id.length == 0) validation = false;
				if(validation == false){
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/expensetype/update/"+id+"/"+name+"/"+dispname;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#editname").val('');
								$("#editdispname").val('');
								$("#editid").val('');
								$("#userMsgContent").html("Details updated successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
								
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
			$("a[id^='delete_']").click(function() {
				$("body").css("cursor", "progress");
				$("#confirmMsgContent").html("Are you sure want to delete ?");
				$.fancybox.open('#confirmMsg', {hideOnOverlayClick : false});
				var id = $(this).attr('id');
				var recordid = id.substring(7);
				$("#confirmation").click(function() {
					var resourceURL = $("#contextpath").val()+"/expensetype/delete/"+recordid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#userMsgContent").html("Deleted successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
								
							}else{
								$("#errorMsgContent").html("Parent row cant be deleted.....");
								$.fancybox.open('#errorMsg');
							}
							
						},
						
						error: function (xhr, ajaxOptions, thrownError) {
						}
					});
				});
				$("body").css("cursor", "default");	
			});
			$('#addExpenseTypeDetails').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var name = $("#name").val();
				var dispname =$("#dispname").val();
				if(name == "" || name.length == 0) validation = false;
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
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#name").val('');
								$("#dispname").val('');
								$("#expenseMsgContent").html("Expense Type added successfully...");
								$.fancybox.open('#expenseMsg', {closeBtn: false});
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
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>