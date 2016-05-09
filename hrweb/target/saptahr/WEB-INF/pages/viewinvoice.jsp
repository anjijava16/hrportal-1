<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
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
			<div id="contentArea">
				<div align = "left" id="headlist"><h1>Invoice<b class="saptaColor"> List</b></h1></div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Invoice<b class="saptaColor"> Detail</b></h1></div>
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align:center">
									<option value="all" style="text-align: center;">--- All ---</option>
									<option value="findbyid" style="text-align: left;">Find By Invoice No</option>
								</select>
							</td>
						</tr>
						<tr id="invoicesearch" class="hidden">
							<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Enter Invoice No</td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<input name="invocno" id="invocno" type="text" style="width: 195px; padding: 0px; margin-left: 7px;"/>
								<input type="button" value="Find" id="findByInvocNo" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>										
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				  <div id="invoiceList" class="MRGT10PX">
					<table id="invoicegridtable"></table>
					<div id="invoicegridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="invoicedetails" class="hidden MRGT10PX">
					<div align="left" id="back_invoiceList" class=""><a href="#" id="show_showinvoiceList">Invoice List </a>/ Invoice</div><br/>
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
						<!-- Vendor -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent"> Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Invoice No</td>
							<td class="value"><input id="invoiceno" disabled="disabled" class="inputdisabletxtbold" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Invoice Date</td>
							<td class="value"><input id="invoicedate" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Due Date</td>
							<td class="value"><input id="duedate" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Due Amount</td>
							<td class="value"><input id="dueamount" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr>
							<td class="lableContentSelect">Amount Type</td>
							<td class="valueContent">
							<select id="amounttype" class="selectBox hidden" style="margin:0px; width:217px; text-align: center;" class="inputdisable">
									<option value="" style="text-align: center;">--- Select ---</option>
									<option value="i" style="text-align: left;">INR</option>
									<option value="u" style="text-align: left;">USD</option>
									<option value="e" style="text-align: left;">EUR</option>
									<option value="g" style="text-align: left;">GBP</option>
							</select>
							<div id="optional_amounttype" class="value"></div>
						</tr>
						<tr class="">
							<td class="lableContentSelect">Status</td>
							<td class="valueContent">	
								<select id="status" class="selectBox hidden" style="margin:0px; width:217px; text-align: center;" class="inputdisable">
									<option value="" style="text-align: center;">--- Select ---</option>
									<option value="a" style="text-align: left;">Active</option>
									<option value="i" style="text-align: left;">In-Active</option>
								</select>
								<div id="optional_status" class="value"></div>
							</td>
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
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id ="deletedsuccessful_fancybox" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id = "successful_msg_content"></div>
				<a href="<%=request.getContextPath() %>/invoice/viewinvoice" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	  <script>
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
			 	$( "#invoicedate, #duedate" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 dateFormat :"dd-mm-yy"
				 });
			 });
			var invoiceSize = "${invoiceListSize}";
			if(invoiceSize != null && invoiceSize != 0){
				$("#invoiceList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#invoiceList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#optiondiv").addClass("hidden");
			} 
			
			$('#findoption').on('change', function (e) {
				$("#invocno").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/invoice/getlist";
					$("#invoicegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#invoicegridtable").trigger("reloadGrid");
					$("#invoiceList").removeClass("hidden");
					$("#invoicesearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#invoicedetails").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#invoicesearch").removeClass("hidden");
					$("#invoiceList").addClass("hidden");
					$("#invoicedetails").addClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
				}
			});
			
			$('#invocno').keypress(function(event){
				if(event.which == 13) {
					$("#invoiceList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyinvocno();
				}
			});

			$("#findByInvocNo").click(function() {
				$("#invoiceList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyinvocno();
			});
			
			function findbyinvocno(){
				var count = 0;
				var invocno = $("#invocno").val().split(" ").join("");
				<c:forEach items="${invoiceList}" var="invoice1">
					if("${invoice1.invoiceno}" == invocno){
						var resourceURL = $("#contextpath").val()+"/invoice/getbyinvoiceno/"+invocno;
						$("#invoicegridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#invoicegridtable").trigger("reloadGrid");
						count++;
						$("#invoiceList").removeClass("hidden");
						$("#mandatorycheck").addClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					var resourceURL = $("#contextpath").val()+"/invoice/getlist";
					$("#invoicegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#invoicegridtable").trigger("reloadGrid");
					$("#invoiceList").removeClass("hidden");
					$("#mandatorycheck").addClass("hidden");
				}
			}
			
			//var id = "${id}";
			var url = url = $("#contextpath").val()+"/invoice/getlist";
			
			jQuery("#invoicegridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Invoice No','Due Amount', 'Due Date','Status'], 
				colModel:[{name:'invoiceno',index:'invoiceno', width:280, resizable :false},
						  {name:'dueamount',index:'dueamount', width:250, resizable :true},
						  {name:'duedate',index:'duedate', width:290, resizable :true},
						  {name:'status',index:'status', width:98, resizable :true},],
						
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#invoicegridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					invoice(id);
				}
			});
			jQuery("#invoicegridtable").jqGrid('navGrid','#invoicegridpager',{edit:false, add:false, del:false, search:false});
			
			function invoice(id){
				$("#invoiceList").addClass("hidden");
				$("#invoicedetails").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				
				var resourceURL = $("#contextpath").val()+"/invoice/retrivebyid/"+id;
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
								$("#invoiceno").val((result.invoiceno == undefined || result.invoiceno == null || result.invoiceno.length <= 0) ? "-" : result.invoiceno);
								$("#invoicedate").val((result.invoicedate == undefined || result.invoicedate == null || result.invoicedate.length <= 0) ? "-" : result.invoicedate);
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : result.dueamount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("In-Active");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
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
			
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#status").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				if($("#duedate").val() == "-"){
					$("#duedate").val("");
				}
				if($("#dueamount").val() == "-"){
					$("#dueamount").val("");
				}
				
				$("#amounttype").prop( "disabled", false );
				$("#status").prop( "disabled", false );
				$("#duedate").prop( "disabled", false );
				$("#dueamount").prop( "disabled", false );
				
				$("#duedate").removeClass("inputdisable");
				$("#dueamount").removeClass("inputdisable");
				$("#status").removeClass("inputdisable");
				$("#amounttype").removeClass("inputdisable");
				
				$("#duedate").addClass("inputBorder");
				$("#dueamount").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			
			$("#decline_yes").click(function() {
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				
				declineInvoice();
				$("#invoicedate").prop( "disabled", true );
				$("#duedate").prop( "disabled", true );
				$("#dueamount").prop( "disabled", true );
				
				$("#invoicedate").removeClass("inputBorder");
				$("#duedate").removeClass("inputBorder");
				$("#dueamount").removeClass("inputBorder");
				
				$("#duedate").addClass("inputdisable");
				$("#dueamount").addClass("inputdisable");
				$.fancybox.close();
				
			});
			
			function declineInvoice(){
				var id = $("#id").val();
				//var splitedinvoice = invoiceno.split('-');
				var resourceURL = $("#contextpath").val()+"/invoice/retrivebyid/"+id;
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
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : result.dueamount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								
								
								
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("In-Active");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								$("#status").addClass("hidden");
								$("#optional_status").removeClass("hidden");
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
				var invoiceno = $("#invoiceno").val();
				var invoicedate = $("#invoicedate").datepicker().val();
				var duedate = $("#duedate").datepicker().val();
				var dueamount = $("#dueamount").val();
				var amounttype = $("#amounttype").val();
				var status = $("#status").val();
				//var splitedinvoice = invoiceno.split('-');
				if(invoiceno == "" || invoiceno.length == 0) validation = false;
				if(invoicedate == "" || invoicedate.length == 0) validation = false;
				if(duedate == "" || duedate.length == 0) validation = false;
				if(dueamount == "" || dueamount.length == 0) validation = false;
				if(amounttype == "" || amounttype.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				var invoicedatevalidation = $.datepicker.parseDate('dd-mm-yy',invoicedate);
				var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
				if ((invoicedatevalidation) >= (duedatevalidation))  validation = false; 
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(amounttype == "" || amounttype.length == 0) fax = "null";
					var resourceURL = $("#contextpath").val()+"/invoice/update/"+id+"/"+invoiceno+"/"+invoicedate+"/"+duedate+"/"+dueamount+"/"+amounttype+"/"+status;	
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								if(status == "a"){
									$("#optional_status").html("Active");
								}else if(status == "i"){
									$("#optional_status").html("In-Active");
								}
								
								if(result.amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}		
								  if($("#invoiceno").val() == "" || $("#invoiceno").val() == "-"){
									$("#invoiceno").val("-");
								} 
								 if($("#invoicedate").val() == "" || $("#invoicedate").val() == "-"){
									$("#invoicedate").val("-");
								}  
								if($("#duedate").val() == "" || $("#duedate").val() == "-"){
									$("#duedate").val("-");
								}
								if($("#dueamount").val() == "" || $("#dueamount").val() == "-"){
									$("#dueamount").val("-");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								$("#status").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								
								$("#edit").removeClass("hidden");
								$("#delete").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								$("#id").prop( "disabled", true );
								$("#invoiceno").prop( "disabled", true );
								$("#invoicedate").prop( "disabled", true );
								$("#duedate").prop( "disabled", true );
								$("#dueamount").prop( "disabled", true );
								$("#amounttype").prop( "disabled", true );
								$("#status").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#invoiceno").removeClass("inputBorder");
								$("#invoicedate").removeClass("inputBorder");
								$("#duedate").removeClass("inputBorder");
								$("#dueamount").removeClass("inputBorder");
								$("#amounttype").removeClass("inputBorder");
								$("#status").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#invoiceno").addClass("inputdisable");
								$("#invoicedate").addClass("inputdisable");
								$("#duedate").addClass("inputdisable");
								$("#dueamount").addClass("inputdisable");
								$("#amounttype").addClass("inputdisable");
								$("#status").addClass("inputdisable");
								$("#alertMsgContent").html("Invoice details updated successfully ...");
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
			
			$('#decline').click(function() {
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$('#decline_no').click(function() {
				$.fancybox.close();
			});
			
			$("#delete").click(function(){
				$("#confirmationMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#confirmMsg');
			});
			
			$("#delete_yes").click(function(){
				$("body").css("cursor", "progress");
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/invoice/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
								$("#successful_msg_content").html("Invoice deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
								//invoiceDeleteReloader();
						}else{
							$("#errorMsgContent").html("Parent row cant be deleted.....");
							$.fancybox.open('#errorMsg');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
				$("body").css("cursor", "default");
			});
			
			$("#delete_no").click(function(){
				 $.fancybox.close();
			 });
			
			$("#invocno").click(function() {
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/invoice/viewinvoice/"+$("#invocno").val();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
				
			function invoiceDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/invoice/getlist";
				$("#invoicegridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#invoicegridtable").trigger("reloadGrid");
				$("#invoiceList").removeClass("hidden");
				$("#invoicesearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#invoice").addClass("hidden");
			}
			$("#findByInvocNo").click(function() {
				$("body").css("cursor", "progress");
				
				$("#invoiceList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyinvocno();
				
				$("body").css("cursor", "default");
			});
			
			$('#invocno').keypress(function(event){
				$("body").css("cursor", "progress");
				if(event.keyCode == 13) {
					$("#invoiceList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyinvocno();
				} 
				$("body").css("cursor", "default");
			});
			
			
			
			function findbyinvocno(){
				$("body").css("cursor", "progress");
				var count = 0;
				var invocno = $("#invocno").val().split(" ").join("");
				<c:forEach items="${invoiceList}" var="invoice">
					if("${invoice.invoiceno}" == invocno){
						var resourceURL = $("#contextpath").val()+"/invoice/getbyinvoiceno/"+invocno;
						$("#invoicegridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#invoicegridtable").trigger("reloadGrid");
						count++;
						$("#invoiceList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Invoice Details not found for the given id " + invocno.bold();
					$.fancybox.open('#alertMsg');
				}
				$("body").css("cursor", "default");
			}
			
			$("#show_showinvoiceList").click(function(){
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/invoice/getlist";
				
				if($("#findoption").val()!= "all"){
					var invocno = $("#invocno").val();
					resourceURL = $("#contextpath").val()+"/invoice/getbyinvoiceno/"+invocno;
				}
				$("#invoicegridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#invoicegridtable").trigger("reloadGrid");
				
				
				$("#invoicedetails").addClass("hidden");
				$("#invoicegridtable").removeClass("hidden");
				$("#invoiceList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				
				$("#invoicedate").prop( "disabled", true );
				$("#duedate").prop( "disabled", true );
				$("#dueamount").prop( "disabled", true );
				
				$("#invoicedate").removeClass("inputBorder");
				$("#duedate").removeClass("inputBorder");
				$("#dueamount").removeClass("inputBorder");
				
				$("#duedate").addClass("inputdisable");
				$("#dueamount").addClass("inputdisable");
				
				$("#amounttype").addClass("hidden");
				$("#optional_amounttype").removeClass("hidden");
				
				$("#status").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				
				$("body").css("cursor", "default");
			});
		});
	</script>
</html>
