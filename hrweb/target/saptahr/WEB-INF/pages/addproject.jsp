\<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
				<div id="project">
					<h1>
						<b class="saptaColor">Add</b> Project
					</h1>
					
					<div id = "projectselect" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Customer</td>
								<td>:</td>
								<td align="left">						
									<select id="customerid" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align:center">
									   	<option value="" style="text-align:center">--- Select  Customer ---</option> 
									  	<c:forEach items="${customerList}" var="customer">
											<option value="${customer.id}" style="text-align:left">${customer.id} - ${customer.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
					</div>	
					<div id ="addprojectdetail" class="hidden">	
					<table id="project">
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Name :</td>
								<td><input name="name" id="name" type="text" style="width: 215px;  height: 25px" onkeypress="return ValidateAlpha(event)"/></td>
								<td align="right"><sup class="saptaColor">*</sup>Display Name :</td>
								<td><input name="dispname" id="dispname" type="text" style="width: 215px;  height: 25px" onkeypress="return ValidateAlpha(event)"/></td>
							</tr>
						    <tr>
								<td align="right"><sup class="saptaColor">*</sup>Project Code :</td>
								<td><input name="prjctcode" id="prjctcode" type="text" style="width: 215px;  height: 25px" onkeypress="return ValidateAlpha(event)"/></td>
								<td align="right"><sup class="saptaColor">*</sup>Type :</td>
								<td><input name="type" id="type" type="text" style="width: 215px;  height: 25px" onkeypress="return ValidateAlpha(event)"/></td>
							</tr>
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Start Date :</td>
								<td><input name="startdate" id="startdate" type="text" style="width: 215px;  height: 25px" class="datePcK"/></td>
								<td align="right"><sup class="saptaColor">*</sup>End Date :</td>
								<td><input name="enddate" id="enddate" type="text" style="width: 215px;  height: 25px" class="datePcK"/></td>
							</tr>
							<tr>
								<td align="right"> <sup class="saptaColor">*</sup>Status :</td>
								<td>
									<select name="status" id="status" style="width: 215px;  height: 25px; text-align:center;">
										<option value="" style="text-align:center"> --- Select --- </option>
										<option value="a" style="text-align:left">active</option>
										<option value="i" style="text-align:left">inactive</option>
								    </select>
							    </td>
								<td align="right">Description :</td>
								<td><textarea style="width: 215px; height: 100px; resize:none;" id="description" name="description"></textarea></td>
							</tr>	
						</table>
						
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Submit" id="addProject"/>	
								</div>
								<div class="leftElement">
									<input id="decline" type="button" value="Decline" class="graybtn" />
								</div>
								
							</div>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
					  </div>
				  	<%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
							<div class="clearWidth MRGT10PX">
								<a href="<%=request.getContextPath() %>/project" ><input type="button" value="Ok" id="user" /></a>
							</div>
					</div> --%>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style="margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/project" style="text-decoration: none">
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
			$(function() {
				 $( "#startdate, #enddate" ).datepicker({
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
			
			$('#customerid').on('change', function (e){
				if($("#customerid").val() != "")
					 $("#addprojectdetail").removeClass("hidden");
				 else
					 $("#addprojectdetail").addClass("hidden");
		    });
			
			$('#addProject').click(function() {
				$("body").css("cursor", "progress");
				
				var validation = true;
			
				//project
				var customerid = $("#customerid").val();
				var prjctcode = $("#prjctcode").val(); 
				var name = $("#name").val();
				var dispname = $("#dispname").val();
				var type = $("#type").val();
				var status = $("#status").val();
				var description = $("#description").val();
				var startdate = $("#startdate").datepicker().val();
				startdate = startdate.split('/').join('-');
				var enddate = $("#enddate").datepicker().val();
				enddate = enddate.split('/').join('-');
				
				if(customerid == "" || customerid.length == 0) validation = false;
				if(name == "" || name.length == 0) validation = false;
				if(prjctcode == "" || prjctcode.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				if(type == "" || type.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0) validation = false;
				if(enddate == "" || enddate.length == 0) validation = false;				
				var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
				var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
				if ((startdatevalidation) >= (enddatevalidation))  validation = false; 								
				if(validation == false){
		    		$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
		    		$.fancybox.open('#errorMsg');
				}else{
					if( description == "" ||  description.length == 0)  description = "null";
					
					 var resourceURL = $("#contextpath").val()+"/project/add/"+customerid+"/"+name+"/"+dispname+"/"+type+"/"+status+"/"+description+"/"+startdate+"/"+enddate+"/"+prjctcode;
						$.ajax({
				        url : resourceURL,
				        type : 'GET',
				        dataType : 'json',
				        success: function(data) {
				        	$("#customerid").val("");
				        	$("#name").val("");
							$("#dispname").val("");
							$("#type").val("");
							$("#status").val("");
							$("#description").val("");
							$("#startdate").val("");
							$("#enddate").val("");
							$("#prjctcode").val("");
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
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $('#decline_yes').click(function() {
				$("body").css("cursor", "progress");
			}); 
			 
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
		});
	</script>
</html>