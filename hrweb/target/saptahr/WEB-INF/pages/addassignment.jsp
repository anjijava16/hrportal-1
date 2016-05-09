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
				<div id="assignment">
					<h1><b class="saptaColor">Add</b> Assignment</h1>
					<div id = "empselect" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Employee</td>
								<td>:</td>
								<td align="left">						
									<select id="sempid" class="selectBox" style="width: 200px; margin:0; text-align:center">
										<option value=""style="text-align:center">--- Select  Employee ---</option> 
										<c:forEach items="${employeeList}" var="employee">
											<option value="${employee.id}" style="text-align:left">${employee.id} - ${employee.fname} </option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</div>	
					<div id = "projselect" class="cmnTable hidden">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Project</td>
								<td>:</td>
								<td align="left">						
									<select id="sprojid" class="selectBox" style="padding: 0px; width: 200px; margin: 0px; text-align:center">
										<option value="" style="text-align:center">--- Select  Project ---</option> 
										<c:forEach items="${projectList}" var="project">
											<option value="${project.id}" style="text-align:left">${project.id} - ${project.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr> <td> <br> <br> </td> </tr>
						</table>
					</div>
		<!--Assignment Detals Adding Starts-->
					<div id ="addassignmentdetail" class="hidden">	
						<table id="employeeTable">
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Start Date :</td>
								<td><input name="sdate" id="sdate" type="text" style="width: 215px;" class="datePcK"/></td>
								<td align="right"><sup class="saptaColor">*</sup>End Date :</td>
								<td><input name="edate" id="edate" type="text" style="width: 215px;" class="datePcK"/></td>
							</tr>
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Status :</td>
								<td>
									<select name="status" id="status" style="text-align:center">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="a" style="text-align:left">Active</option>
										<option value="i" style="text-align:left">Inactive</option>
									</select>
								</td>
								<td align="right">Comments :</td>
								<td><textarea style="width: 215px; height: 100px; resize:none;" id="comment" name="comment"></textarea></td>
							</tr>
						</table>
						
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Submit" id="addassignment" />
								</div>
								<div class="leftElement"><input id="decline"  type="button" value="Decline" class="graybtn" /></div>
								
							</div>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
					</div>
		<!--Assignment Detals Adding End-->
					<%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/assignment" ><input type="button" value="Ok" id="user" /></a></div>
					</div> --%>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/assignment" style="text-decoration: none">
						<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
					</a>	
				</div>	
		<!--Content Area END-->
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b> <sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
				 $( "#sdate, #edate" ).datepicker({
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
			$('#sprojid').on('change', function (e){
				if($("#sprojid").val() != ""){
					$("#addassignmentdetail").removeClass("hidden");
				}else{
					$("#addassignmentdetail").addClass("hidden");
				}
			});
			$('#sempid').on('change', function (e){
				if($("#sempid").val() != "")
					 $("#projselect").removeClass("hidden");
				else{
					 $("#projselect").addClass("hidden");
					  $("#addassignmentdetail").addClass("hidden");
				}
			});
			$('#addassignment').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				var sdate = $("#sdate").datepicker().val();
				sdate = sdate.split("/").join("-");
				var edate = $("#edate").datepicker().val();
				edate = edate.split("/").join("-");
				var comment = $("#comment").val();
				var status = $("#status").val();
				var eid = $("#sempid").val();
				var projid = $("#sprojid").val();
				
				if(sdate == "" || sdate.length == 0) validation = false;
				if(edate == "" || edate.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				var sdatevalidation = $.datepicker.parseDate('dd-mm-yy', sdate);
				var edatevalidation = $.datepicker.parseDate('dd-mm-yy', edate);
				if ((sdatevalidation) >= (edatevalidation))  validation = false; 		
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(comment == "" || comment.length == 0) comment = "null";
					var resourceURL = $("#contextpath").val()+"/assignment/add/"+sdate+"/"+edate+"/"+comment+"/"+status+"/"+eid+"/"+projid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							// Clearing Employee
							$("#sdate").val("");
							$("#edate").val("");
							$("#comment").val("");
							$("#status").val("");
							$("#sempid").val("");
							$("#sprojid").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							
							if(successflag == "true"){
								$("#alertMsgContent").html("Assignment added successfully ...");
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
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "progress");
		});
	</script>
</html>