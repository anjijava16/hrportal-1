<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<%@ include file="head.jsp"%>
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
				<div id="contentArea">
					<div align = "left" id="headlist"><h1>Customer<b class="saptaColor"> List</b></h1></div>
					<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Customer<b class="saptaColor"> Detail</b></h1></div>
					<div id = "optiondiv" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px">Choose Option</td>
								<td>:</td>
								<td align="left">						
									<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; height:25px; margin:0; text-align:center">
										<option value="all" style="text-align:center" >--- All ---</option>
										<option value="findbyid" style="text-align:left">Find By Customer Id</option>
									</select>
								</td>
							</tr>
							<tr id="customersearch" class = "hidden">
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Enter Customer Id</td>
								<td>:</td>
								<td align="left" colspan = "2" style=" padding-left: 0px;" >
									<input name="customerid" id="customerid" type="text" style="width: 195px; padding: 0px; margin-left: 7px; height: 22px;"/>
									<input type="button" value="Find" id="findByCustomerId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
								</td>										
							</tr>
						</table>
						<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
					</div>
					<div id="customerList" class="MRGT10PX">
						<table id="customergridtable"></table>
						<div id="customergridpager"></div>
					</div>
					<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
					<div id="customerDetail" class="hidden MRGT10PX">
						<div align="left" id="back_assignlist" class="">
							<a href="#" id="show_customer">Customer List </a>/ Customer Details
						</div><br/>
							<c:choose>
								<c:when test="${ session.groupname == 'ad'}">
									<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
									<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
								</c:when>
							</c:choose>	
							<div id="updatebutton" class="hidden" align="left">
								<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
								<input  id="decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
							</div>
							<!-- Customer -->
						<table class="tableContent">
							<tr class="">
								<td class="lableContent"> Id</td>
								<td class="value"><input id="id" disabled="disabled" class="inputdisable"/></td>
							</tr>
							<tr class="">
								<td class="lableContent">Name</td>
								<td class="value"><input id="name" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"/></td>
							</tr>
							<tr class="">
								<td class="lableContent">Customer Code</td>
								<td class="value"><input id="customercode" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"/></td>
							</tr>
							<tr>
								<td class="lableContent">Address</td>
								<td class="value"><input id="addr" disabled="disabled" class="inputdisable"></td>
							</tr>
							<tr>
								<td class="lableContent">Pincode</td>
								<td class="value"><input id="pincode" disabled="disabled" style="background: #fff none repeat scroll 0 0; border: 0 none;"/></td>
							</tr>
							<tr>
								<td class="lableContent">Phone</td>
								<td class="value"><input id="phoneno" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"/></td>
							</tr>
							<tr>
								<td class="lableContent">Fax</td>
								<td class="value"><input id="fax" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"/></td>
							</tr>
							<tr>
								<td class="lableContent">Mobile</td>
								<td class="value"><input id="mobileno" disabled="disabled" class="inputdisable" maxlength="10" minlength="10" onkeypress="return validateNumeric(event)"/></td>
							</tr>
							<tr>
								<td class="lableContent">Email</td>
								<td class="value"><input id="emailid" disabled="disabled" class="inputdisable"/></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id ="deletedsuccessful_fancybox" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id = "successful_msg_content"></div>
					<a href="<%=request.getContextPath() %>/customer/viewcustomer" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
				<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style="margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			</div>
			<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
		</body>
		<script>
			$(document).ready(function(){	
				$("body").css("cursor", "default");
				var customerSize = "${customerListSize}";
				if(customerSize != null && customerSize != 0){
					$("#customerList").removeClass("hidden");
					$("#norecords").addClass("hidden");
				}else{
					$("#norecords").removeClass("hidden");
					$("#customerList").addClass("hidden");
					$("#headlist").addClass("hidden");
					$("#optiondiv").addClass("hidden");
				} 
				var id = "${id}";
				var url = "";
				if(id == undefined || id == null || id.length <= 0 || id == ""){
					url = $("#contextpath").val()+"/customer/get";
				}else{
					url = $("#contextpath").val()+"/customer/get/"+id;
				}
				jQuery("#customergridtable").jqGrid({
					url: url,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json", 
					colNames:['Customer Code','Customer Name', 'Address', 'Email'], 
					colModel:[{name:'customercode',index:'customercode', width:145, resizable :false},
							  {name:'name',index:'name', width:240, resizable :true},
							  {name:'address',index:'address', width:280, resizable :true},
							  {name:'email',index:'email', width:253, resizable :true},],
							
					pagination:true,
					loadonce:true,
					height:'312px',
					rowNum:10, 
					rowList:[10,50,100],
					pager: '#customergridpager', 
					viewrecords: true, 
					hidegrid: false,
					width: null,
					shrinkToFit:false, 
					onSelectRow: function(custid){
						customerDetails(custid);
					}
				});
				jQuery("#customergridtable").jqGrid('navGrid','#customergridpager',{edit:false, add:false, del:false, search:false});
				function customerDetails(custid){
					$("#customerList").addClass("hidden");
					$("#customerDetail").removeClass("hidden");
					$("#headlist").addClass("hidden");
					$("#headdetail").removeClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					var resourceURL = $("#contextpath").val()+"/customer/retrivebyid/"+custid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$.each(results, function (i, result) {
									$("#id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
									$("#name").val((result.customername == undefined || result.customername == null || result.customername.length <= 0) ? "-" : result.customername);
									$("#addr").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
									$("#customercode").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.customercode);
									$("#pincode").val((result.pincode == undefined || result.pincode == null || result.pincode.length <= 0) ? "-" : result.pincode);
									$("#phoneno").val((result.phoneno == undefined || result.phoneno == null || result.phoneno.length <= 0) ? "-" : result.phoneno);
									$("#fax").val((result.fax == undefined || result.fax == null || result.fax.length <= 0) ? "-" : result.fax);
									$("#mobileno").val((result.mobileno == undefined || result.mobileno == null || result.mobileno.length <= 0) ? "-" : result.mobileno);
									$("#emailid").val((result.email == undefined || result.email == null || result.email.length <= 0) ? "-" : result.email);
									}); 
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
				$('#findoption').on('change', function (e) {
					$("#customerid").val("");
					var optionval = $("option:selected", this);
					if(optionval.val() == "all"){
						var resourceURL = $("#contextpath").val()+"/customer/get";
						$("#customergridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#customergridtable").trigger("reloadGrid");
						$("#customerList").removeClass("hidden");
						$("#customersearch").addClass("hidden");
						$("#mandatorycheck").addClass("hidden");
						$("#customerDetail").addClass("hidden");
					}else if(optionval.val() == "findbyid"){
						$("#customerList").addClass("hidden");
						$("#customerDetail").addClass("hidden");
						$("#customersearch").removeClass("hidden");
						$("#mandatorycheck").removeClass("hidden");
						$('#customerid').on('change', function (e) {
							if($("#customerid").val() != ""){
								var id =	$("#customerid").val();
								/* var resourceURL = $("#contextpath").val()+"/customer/get/"+id;
								$("#customergridtable").setGridParam({
									url:resourceURL,
									mtype: 'GET',
									ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
									datatype: "json"
								});
								$("#customergridtable").trigger("reloadGrid");
								$("#customerList").removeClass("hidden"); */
								$("#customerDetail").addClass("hidden");
								$("#mandatorycheck").addClass("hidden");
							}else{
								$("#customerList").addClass("hidden");
								$("#customerDetail").addClass("hidden");
							}
						});
					}
				});
				$("#edit").click(function() {
					$("body").css("cursor", "progress");
						$("#updatebutton").removeClass("hidden");
						$("#findoption").prop( 'disabled', true );
						$("#edit").addClass("hidden");
						$("#delete").addClass("hidden");
						
						//Clearing " - " values if the value was null
						
						if($("#name").val() == "-"){
							$("#name").val("");
						}
						if($("#addr").val() == "-"){
							$("#addr").val("");
						}
						
						if($("#customercode").val() == "-"){
							$("#customercode").val("");
						}
						if($("#pincode").val() == "-"){
							$("#pincode").val("");
						}
						if($("#phoneno").val() == "-"){
							$("#phoneno").val("");
						}
						if($("#fax").val() == "-"){
							$("#fax").val("");
						}
						if($("#mobileno").val() == "-"){
							$("#mobileno").val("");
						}
						if($("#emailid").val() == "-"){
							$("#emailid").val("");
						}
						$("#id").prop( "disabled", true );
						$("#name").prop( "disabled", false );
						$("#addr").prop( "disabled", false );
						$("#customercode").prop( "disabled", false );
						$("#pincode").prop( "disabled", false );
						$("#phoneno").prop( "disabled", false );
						$("#fax").prop( "disabled", false );
						$("#mobileno").prop( "disabled", false );
						$("#emailid").prop( "disabled", false );
						
						$("#id").removeClass("inputdisable");
						$("#name").removeClass("inputdisable");
						$("#addr").removeClass("inputdisable");
						$("#customercode").removeClass("inputdisable");
						$("#pincode").removeClass("inputdisable");
						$("#phoneno").removeClass("inputdisable");
						$("#fax").removeClass("inputdisable");
						$("#mobileno").removeClass("inputdisable");
						$("#emailid").removeClass("inputdisable");
						
						$("#id").addClass("inputBorder"); 
						
						$("#name").addClass("inputBorder");
						$("#addr").addClass("inputBorder");
						$("#customercode").addClass("inputBorder");
						$("#pincode").addClass("inputBorder");
						$("#phoneno").addClass("inputBorder");
						$("#fax").addClass("inputBorder");
						$("#mobileno").addClass("inputBorder");
						$("#emailid").addClass("inputBorder");
					$("body").css("cursor", "default");
				});
				$("#decline").click(function(){
					$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
					$.fancybox.open('#confirmMsgDecline');
				});
				$("#decline_no").click(function(){
					 $.fancybox.close();
				 });
				 $("#decline_yes").click(function() {
					$("#edit").removeClass("hidden");
					$("#delete").removeClass("hidden");
					$("#updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#id").prop( 'disabled', false );
					declineCustomerDetails();
					$("#id").prop( "disabled", true );
					$("#name").prop( "disabled", true );
					$("#addr").prop( "disabled", true );
					$("#customercode").prop( "disabled", true );
					$("#pincode").prop( "disabled", true );
					$("#phoneno").prop( "disabled", true );
					$("#fax").prop( "disabled", true );
					$("#mobileno").prop( "disabled", true );
					$("#emailid").prop( "disabled", true );
					
					$("#id").removeClass("inputBorder");
					$("#name").removeClass("inputBorder");
					$("#addr").removeClass("inputBorder");
					$("#customercode").removeClass("inputBorder");
					$("#pincode").removeClass("inputBorder");
					$("#phoneno").removeClass("inputBorder");
					$("#fax").removeClass("inputBorder");
					$("#mobileno").removeClass("inputBorder");
					$("#emailid").removeClass("inputBorder");
					
					$("#id").addClass("inputdisable");
					$("#name").addClass("inputdisable");
					$("#addr").addClass("inputdisable");
					$("#customercode").addClass("inputdisable");
					$("#pincode").addClass("inputdisable");
					$("#phoneno").addClass("inputdisable");
					$("#fax").addClass("inputdisable");
					$("#mobileno").addClass("inputdisable");
					$("#emailid").addClass("inputdisable");
					 $.fancybox.close();
				});
				function declineCustomerDetails(){
					var id = $("#id").val();
					var resourceURL = $("#contextpath").val()+"/customer/retrivebyid/"+id;
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
									$("#id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
									$("#name").val((result.customername == undefined || result.customername == null || result.customername.length <= 0) ? "-" : result.customername);
									$("#addr").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
									$("#customercode").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
									$("#pincode").val((result.pincode == undefined || result.pincode == null || result.pincode.length <= 0) ? "-" : result.pincode);
									$("#phoneno").val((result.phoneno == undefined || result.phoneno == null || result.phoneno.length <= 0) ? "-" : result.phoneno);
									$("#fax").val((result.fax == undefined || result.fax == null || result.fax.length <= 0) ? "-" : result.fax);
									$("#mobileno").val((result.mobileno == undefined || result.mobileno == null || result.mobileno.length <= 0) ? "-" : result.mobileno);
									$("#emailid").val((result.email == undefined || result.email == null || result.email.length <= 0) ? "-" : result.email);
								}); 
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
				$("#update").click(function(){
					$("body").css("cursor", "progress");
						var validation = true;
						var id = $("#id").val();
						var name = $("#name").val();
						var address = $("#addr").val();
						var customercode = $("#customercode").val();
						var pincode = $("#pincode").val();
						var phone = $("#phoneno").val();
						var fax = $("#fax").val();
						var mobile = $("#mobileno").val();
						var emailid = $("#emailid").val();
						if(name == "" || name.length == 0) validation = false;
						if(address == "" || address.length == 0) validation = false;
						if(pincode == "" || pincode.length == 0) validation = false;
						if(emailid == "" || emailid.length == 0) validation = false;
						if(customercode == "" || customercode.length == 0) validation = false;
						if(!validateEmail(emailid)) validation = false;
						if(validation == false){
							$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
							$.fancybox.open('#errorMsg');
						}else{
							if(phone == "" || phone == "-" || phone.length == 0) phone = "null";
							if(fax == "" || fax == "-" || fax.length == 0) fax = "null";
							if(mobile == "" || mobile == "-" || mobile.length == 0) mobile = "null";
							var resourceURL = $("#contextpath").val()+"/customer/update/"+id+"/"+name+"/"+address+"/"+pincode+"/"+phone+"/"+fax+"/"+emailid+"/"+mobile+"/"+customercode;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								dataType : 'json',
								success: function(data){
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									if(successflag == "true"){
										$("#edit").removeClass("hidden");
										$("#delete").removeClass("hidden");
										$("#updatebutton").addClass("hidden");
										$("#findoption").prop( 'disabled', false );
										$("#id").prop( 'disabled', false );
										
										// add element value as " - " if value is emply or null after updation
										
										if($("#name").val() == "" || $("#name").val() == "-"){
											$("#name").val("-");
										}
										if($("#addr").val() == "" || $("#addr").val() == "-"){
											$("#addr").val("-");
										}
										
										if($("#customercode").val() == "" || $("#customercode").val() == "-"){
											$("#customercode").val("-");
										}
										if($("#pincode").val() == "" || $("#pincode").val() == "-"){
											$("#pincode").val("-");
										}
										if($("#fax").val() == "" || $("#fax").val() == "-"){
											$("#fax").val("-");
										}
										if($("#phoneno").val() == "" || $("#phoneno").val() == "-"){
											$("#phoneno").val("-");
										}
										if($("#mobileno").val() == "" || $("#mobileno").val() == "-"){
											$("#mobileno").val("-");
										}
										if($("#emailid").val() == "" || $("#emailid").val() == "-"){
											$("#emailid").val("-");
										}
										
										$("#id").prop( "disabled", true );
										$("#name").prop( "disabled", true );
										$("#addr").prop( "disabled", true );
										$("#customercode").prop( "disabled", true );
										$("#pincode").prop( "disabled", true );
										$("#phoneno").prop( "disabled", true );
										$("#fax").prop( "disabled", true );
										$("#mobileno").prop( "disabled", true );
										$("#emailid").prop( "disabled", true );
										
										$("#id").removeClass("inputBorder");
										$("#name").removeClass("inputBorder");
										$("#addr").removeClass("inputBorder");
										$("#customercode").removeClass("inputBorder");
										$("#pincode").removeClass("inputBorder");
										$("#phoneno").removeClass("inputBorder");
										$("#fax").removeClass("inputBorder");
										$("#mobileno").removeClass("inputBorder");
										$("#emailid").removeClass("inputBorder");
										
										$("#id").addClass("inputdisable");
										$("#name").addClass("inputdisable");
										$("#addr").addClass("inputdisable");
										$("#customercode").addClass("inputdisable");
										$("#pincode").addClass("inputdisable");
										$("#phoneno").addClass("inputdisable");
										$("#fax").addClass("inputdisable");
										$("#mobileno").addClass("inputdisable");
										$("#emailid").addClass("inputdisable"); 
										$("#alertMsgContent").html("Customer details updated successfully ...");
										$.fancybox.open('#alertMsg');
									}else{
										$("#edit").addClass("hidden");
										$("#delete").addClass("hidden");
										$("#updatebutton").removeClass("hidden");
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
				$("#delete").click(function(){
					$("#confirmationMsgContent").html("Are you sure want to delete...?");
					$.fancybox.open('#confirmMsg');
				});
				$("#delete_yes").click(function(){
					$("body").css("cursor", "progress");
						var id = $("#id").val();
						var resourceURL = $("#contextpath").val()+"/customer/delete/"+id;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#successful_msg_content").html("Customer deleted successfully ...");
									$.fancybox.open('#deletedsuccessful_fancybox');
									//customerDeleteReloader();
								}else{
									$("#errorMsgContent").html("Parent row cannt be deleted....");
									$.fancybox.open('#errorMsg');
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					$("body").css("cursor", "default");
					$.fancybox.close();
				});
				$("#delete_no").click(function(){
					 $.fancybox.close();
				 });
				$("#customerid").click(function() {
					$("body").css("cursor", "progress");
						var resourceURL = $("#contextpath").val()+"/customer/viewcustomer/"+$("#customerid").html();
						$(this).attr("href", resourceURL);
					$("body").css("cursor", "default");
				});
					
				$('#customerid').keypress(function(event){
					if(event.which == 13) {
						$("#customerList").addClass("hidden");
						$("#mandatorycheck").addClass("hidden");
						findbycustomerid();
					}
				});
				function customerDeleteReloader(){
					var resourceURL = $("#contextpath").val()+"/customer/get";
					$("#customergridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#customergridtable").trigger("reloadGrid");
					$("#customerList").removeClass("hidden");
					$("#customersearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#customerDetail").addClass("hidden");
				}
				$("#findByCustomerId").click(function() {
					$("body").css("cursor", "progress");
					$("#customerList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbycustomerid();
					$("body").css("cursor", "default");
				});
				 
				function findbycustomerid(){
					$("body").css("cursor", "progress");
						var count = 0;
						var customerid = $("#customerid").val().split(" ").join("");
						<c:forEach items="${customerList}" var="customer">
							if("${customer.id}" == customerid){
								var resourceURL = $("#contextpath").val()+"/customer/get/"+customerid;
								$("#customergridtable").setGridParam({
									url:resourceURL,
									mtype: 'GET',
									ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
									datatype: "json"
								});
								$("#customergridtable").trigger("reloadGrid");
								count++;
								$("#customerList").removeClass("hidden");
							}
						</c:forEach>
						if(count == 0){
							document.getElementById("alertMsgContent").innerHTML = "Customer Details not found for the given id " + customerid.bold();
							$.fancybox.open('#alertMsg');
							 var resourceURL = $("#contextpath").val()+"/customer/get/";
							$("#customergridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#customergridtable").trigger("reloadGrid"); 
						}
					$("body").css("cursor", "default");
				}
				$("#show_customer").click(function(){
					$("body").css("cursor", "progress");
					
					var resourceURL = $("#contextpath").val()+"/customer/get";
					if($("#findoption").val() != "all"){
						var id =	$("#customerid").val();
						resourceURL = $("#contextpath").val()+"/customer/get/"+id;
					}
					
					$("#customergridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#customergridtable").trigger("reloadGrid");
					
					$("#customerDetail").addClass("hidden");
					$("#customerList").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#headlist").removeClass("hidden");
					
					$("#edit").removeClass("hidden");
					$("#delete").removeClass("hidden");
					$("#updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#id").prop( 'disabled', false );
					$("#id").prop( "disabled", true );
					$("#name").prop( "disabled", true );
					$("#addr").prop( "disabled", true );
					$("#customercode").prop( "disabled", true );
					$("#pincode").prop( "disabled", true );
					$("#phoneno").prop( "disabled", true );
					$("#fax").prop( "disabled", true );
					$("#mobileno").prop( "disabled", true );
					$("#emailid").prop( "disabled", true );
					
					$("#id").removeClass("inputBorder");
					$("#name").removeClass("inputBorder");
					$("#addr").removeClass("inputBorder");
					$("#customercode").removeClass("inputBorder");
					$("#pincode").removeClass("inputBorder");
					$("#phoneno").removeClass("inputBorder");
					$("#fax").removeClass("inputBorder");
					$("#mobileno").removeClass("inputBorder");
					$("#emailid").removeClass("inputBorder");
					
					$("#id").addClass("inputdisable");
					$("#name").addClass("inputdisable");
					$("#addr").addClass("inputdisable");
					$("#customercode").addClass("inputdisable");
					$("#pincode").addClass("inputdisable");
					$("#phoneno").addClass("inputdisable");
					$("#fax").addClass("inputdisable");
					$("#mobileno").addClass("inputdisable");
					$("#emailid").addClass("inputdisable");
					$("body").css("cursor", "default");
				});
			});
		</script>
	</html>
