<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
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
		<!--Expense List Starts-->
			<div id="contentArea">
				<div align = "left" id="headlist" class="MRGT10PX"><h1>Expense<b class="saptaColor"> List</b></h1></div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Expense<b class="saptaColor"> Detail</b></h1></div>
				
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Category</td>
							<td>:</td>
							<td align="left">						
								<select id="expensetype" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center">
									<option value="" style="text-align: center;">--- All ---</option>									
									<option value="internal" style="text-align: left;">Internal</option>
									<option value="external" style="text-align: left;">External</option>
								</select>
							</td>
						</tr>
					</table>
				</div>

				<div id="expenseList" class="hidden MRGT10PX">
					<table id="expensegridtable"></table>
					<div id="expensegridpager"></div>
				</div>
			
				<div id="norecords" class="hidden MRGT10PX">
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
			
		<!-- Expense Details Lable Content Starts -->
				<div id="expenseDetail" class="hidden MRGT10PX"><div align = "left"  id="back_expenselist" class = ""><a href="#" id="show_showexpenselist">Expense List </a>/ Expense Details</div><br/>
					<c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
							<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
						</c:when>
					</c:choose>	
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="decline" class="rightElement graybtn" type="button" value="Decline" style="background-color:grey"  align="left"/>
					</div>
					<table class="tableContent">
						<tr>
							<td class="lableContent">Expense Id</td>
							<td class="value"><input id="expid" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Date</td>
							<td id="date_tabledata" class="value hidden">
								<input id="date" disabled="disabled" class="inputdisable">
							</td>
							<td  id="date_tablediv" class="value">
								<div id="optional_date"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Category</td>
							<td class="value">	
								<select id="category" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<option value="" style="text-align:center">---Select---</option>
									<option value="internal">Internal</option>
									<option value="external">External</option>
								</select>
								<div id="optional_category" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Expense Type</td>
							<td class="value">
								<select id="exptypeid" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<c:forEach items="${expenseTypeList}" var="expenseType">
										<option value="${expenseType.id}">${expenseType.dispname}</option>
									</c:forEach>
								</select>
								<div id="optional_exptypeid" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Description</td>
							<td class="value"><input id="desc" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Bill No</td>
							<td class="value"><input id="billno" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContentSelect">Mode Of Payment</td>
							<td class="valueContent">	
								<select id="modepay" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<option value="c" >Cash</option>
									<option value="a" >Card</option>
									<option value="q" >Cheque</option>
									<option value="o" >Online Payment</option>
								</select>
								<div id="optional_modepay" class="valueContent"></div>
							</td>
						</tr>
						<tr id="carddetails">
							<td class="lableContent">Card No</td>
							<td class="value"><input id="cardno" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr id="bankdetails">
							<td class="lableContent">Bank Name</td>
							<td class="value"><input id="bankname" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Amount</td>
							<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
					</table>
				</div>
		<!-- Expense Details Lable Content Starts -->					
			</div>
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<%-- <div id="confirmMsg1" class="hidden" >
				<!-- <h1><b class="saptaColor">Confirmation</b></h1> -->
				<div id="confirmationMsgContent1"></div>
				<!-- <input type="button" id="delete_no" class="rightElement" value="Cancel" style="background-color:grey; margin-top: 10px; "> -->
				<a href="<%=request.getContextPath() %>/expense/viewexpense"><input type="button" id="OK" class="leftElement  MRGR10PX" value="OK" style="margin-top: 10px"></a>
			</div> --%>
			<div id ="deletedsuccessful_fancybox" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id = "successful_msg_content"></div>
				<a href="<%=request.getContextPath() %>/expense/viewexpense" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
		<!--Expense List End-->
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script>
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
				 $( "#date" ).datepicker({
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
			var size = "${expenseListSize}";
			if(size > 0){
				$("#expenseList").removeClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#optiondiv").addClass("hidden");
			}

			url = $("#contextpath").val()+"/expense/get";
			jQuery("#expensegridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Date','Category', 'Expense Type', 'Description', 'Amount'], 
				colModel:[{name:'date',index:'date', width:155, resizable :false},
						  {name:'category',index:'category', width:200, resizable :false},
						  {name:'exptypeid',index:'exptypeid', width:155, resizable :true},
						  {name:'descrip',index:'descrip', width:250, resizable :true},
						  {name:'amount',index:'amount', width:153, resizable :false},],
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#expensegridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					expenseDetails(id)
				}
			});
			jQuery("#expensegridtable").jqGrid('navGrid','#expensegridpager',{edit:false, add:false, del:false, search:false});

			function expenseDetails(id){
				$("body").css("cursor", "progress");
				$("#expenseList").addClass("hidden");
				$("#expenseDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				
				var resourceURL = $("#contextpath").val()+"/expense/retrivebyid/"+id
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						var sdat = data.response.result.enddate;
						
						if(successflag == "true"){
							$.each(results, function (i, result) {
								$("#expid").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#date").val((result.date == undefined || result.date == null || result.date.length <= 0) ? "-" : result.date);
								$("#optional_date").html((result.date == undefined || result.date == null || result.date.length <= 0) ? "-" : result.date);
								$("#category").val((result.category == undefined || result.category == null || result.category.length <= 0) ? "-" : result.category);
								if(result.category == "internal"){
									$("#optional_category").html("Internal");
								}else if(result.category == "external"){
									$("#optional_category").html("External");
								}else if(result.category == undefined || result.category == null || result.category.length <= 0){
									$("#optional_category").html("-");
								}
								$("#exptypeid").val((result.expenseType == undefined || result.expenseType == null || result.expenseType.length <= 0) ? "" : result.expenseType);
								<c:forEach items="${expenseTypeList}" var="expenseType">
									if("${expenseType.id}" == result.expenseType){
										$("#optional_exptypeid").html("${expenseType.dispname}");
									}
								</c:forEach>
								
								$("#desc").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#billno").val((result.billno == undefined || result.billno == null || result.billno.length <= 0) ? "-" : result.billno);
								$("#modepay").val((result.modepay == undefined || result.modepay == null || result.modepay.length <= 0) ? "-" : result.modepay);
								if(result.modepay == "c"){
									$("#optional_modepay").html("Cash");
								}else if(result.modepay == "a"){
									$("#optional_modepay").html("Card");
								}else if(result.modepay == "o"){
									$("#optional_modepay").html("Online Payment");
								}else if(result.modepay == "q"){
									$("#optional_modepay").html("Cheque");
								}else if(result.modepay == undefined || result.modepay == null || result.modepay.length <= 0){
									$("#optional_modepay").html("-");
								}
								
								$("#cardno").val((result.cardOrchequeNo == undefined || result.cardOrchequeNo == null || result.cardOrchequeNo.length <= 0) ? "-" : result.cardOrchequeNo);
								$("#bankname").val((result.bankname == undefined || result.bankname == null || result.bankname.length <= 0) ? "-" : result.bankname);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								
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
				$("body").css("cursor", "default");
			}

			$('#expensetype').on('change', function (e) {
				var count=0;
				var optionval = $("option:selected", this);
				if(optionval.val() == ""){
					var resourceURL = $("#contextpath").val()+"/expense/get";
					$("#expensegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#expensegridtable").trigger("reloadGrid");
					$("#expenseList").removeClass("hidden");
					$("#expenseDetail").addClass("hidden");
					
				}else if(optionval.val() != "" || optionval.val() != null){
					<c:forEach items="${expenseList}" var="expense">
						if("${expense.category}" == optionval.val()){
							var resourceURL = $("#contextpath").val()+"/expense/get/"+optionval.val();
							$("#expensegridtable").setGridParam({
								url: resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#expensegridtable").trigger("reloadGrid");
							$("#expenseList").removeClass("hidden");
							$("#expenseDetail").addClass("hidden");
							count++;
						}
					</c:forEach>
					if(count == 0){
							$("#expenseList").addClass("hidden");
							$("#expenseDetail").addClass("hidden");
							document.getElementById("alertMsgContent").innerHTML =  optionval.val().substr(0,1).toUpperCase().bold()+ optionval.val().substr(1).bold() + " expense details not found" ;
							$.fancybox.open('#alertMsg');
					}
				}
			});
			
			
			$('.selectBox').on('change', function (e) { 
				if($(this).val()=="c"){
					$("#carddetails").addClass("hidden");
					$("#bankdetails").addClass("hidden");
				}else{
					$("#carddetails").removeClass("hidden");
					$("#bankdetails").removeClass("hidden");
				}
			});
			
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#date_tabledata").removeClass("hidden");
				$("#date_tablediv").addClass("hidden");
					//Select box Properties
				$("#category").removeClass("hidden");
				$("#optional_category").addClass("hidden");
				$("#exptypeid").removeClass("hidden");
				$("#optional_exptypeid").addClass("hidden");
				
				//Select box Properties
				$("#modepay").removeClass("hidden");
				$("#optional_modepay").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				//Clearing " - " values if the value was null
				
				if($("#date").val() == "-"){
					$("#date").val("");
				}
				if($("#desc").val() == "-"){
					$("#desc").val("");
				}
				if($("#billno").val() == "-"){
					$("#billno").val("");
				}
				if($("#cardno").val() == "-"){
					$("#cardno").val("");
				}
				if($("#bankname").val() == "-"){
					$("#bankname").val("");
				}
				if($("#amount").val() == "-"){
					$("#amount").val("");
				}
				
				$("#expid").prop( "disabled", true );
				$("#date").prop( "disabled", false );
				$("#exptypeid").prop( "disabled", false );
				$("#desc").prop( "disabled", false );
				$("#billno").prop( "disabled", false );
				$("#modepay").prop( "disabled", false );
				$("#cardno").prop( "disabled", false );
				$("#bankname").prop( "disabled", false );
				$("#amount").prop( "disabled", false );
				
				$("#expid").removeClass("inputdisable");
				$("#date").removeClass("inputdisable");
				$("#exptypeid").removeClass("inputdisable");
				$("#desc").removeClass("inputdisable");
				$("#billno").removeClass("inputdisable");
				$("#modepay").removeClass("inputdisable");
				$("#cardno").removeClass("inputdisable");
				$("#bankname").removeClass("inputdisable");
				$("#amount").removeClass("inputdisable");
				
				$("#expid").addClass("inputBorder");
				$("#date").addClass("inputBorder");
				$("#exptypeid").addClass("inputBorder");
				$("#desc").addClass("inputBorder");
				$("#billno").addClass("inputBorder");
				$("#modepay").addClass("inputBorder");
				$("#cardno").addClass("inputBorder");
				$("#bankname").addClass("inputBorder");
				$("#amount").addClass("inputBorder");
				if($("#modepay").val()=="c"){
					$("#carddetails").addClass("hidden");
					$("#bankdetails").addClass("hidden");
				}else{
					$("#carddetails").removeClass("hidden");
					$("#bankdetails").removeClass("hidden");
				}
				
				$("body").css("cursor", "default");
			});
		 	$("#decline_yes").click(function() {
				
				//Select box Properties
				$("#modepay").removeClass("hidden");
				$("#optional_modepay").addClass("hidden");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#expid").prop( 'disabled', false );
				
				//Function Call For Decline Assignment About Details
				declineExpenseDeatils();
				
				$("#expid").prop( "disabled", true );
				$("#date").prop( "disabled", true );
				$("#exptypeid").prop( "disabled", true );
				$("#desc").prop( "disabled", true );
				$("#billno").prop( "disabled", true );
				$("#modepay").prop( "disabled", true );
				$("#cardno").prop( "disabled", true );
				$("#bankname").prop( "disabled", true );
				$("#amount").prop( "disabled", true );
				
				$("#expid").removeClass("inputBorder");
				$("#date").removeClass("inputBorder");
				$("#exptypeid").removeClass("inputBorder");
				$("#desc").removeClass("inputBorder");
				$("#billno").removeClass("inputBorder");
				$("#modepay").removeClass("inputBorder");
				$("#cardno").removeClass("inputBorder");
				$("#bankname").removeClass("inputBorder");
				$("#amount").removeClass("inputBorder");
				
				$("#expid").addClass("inputdisable");
				$("#date").addClass("inputdisable");
				$("#exptypeid").addClass("inputdisable");
				$("#desc").addClass("inputdisable");
				$("#billno").addClass("inputdisable");
				$("#modepay").addClass("inputdisable");
				$("#cardno").addClass("inputdisable");
				$("#bankname").addClass("inputdisable");
				$("#amount").addClass("inputdisable");
				$.fancybox.close();
			}); 
			function declineExpenseDeatils(){
				var id = $("#expid").val();
				var resourceURL = $("#contextpath").val()+"/expense/retrivebyid/"+id;
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
								$("#expid").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#date").val((result.date == undefined || result.date == null || result.date.length <= 0) ? "-" : result.date);
								$("#optional_date").html((result.date == undefined || result.date == null || result.date.length <= 0) ? "-" : result.date);
								$("#category").val((result.category == undefined || result.category == null || result.category.length <= 0) ? "-" : result.category);
								if(result.category == "internal"){
									$("#optional_category").html("Internal");
								}else if(result.category == "external"){
									$("#optional_category").html("External");
								}else if(result.category == undefined || result.category == null || result.category.length <= 0){
									$("#optional_category").html("-");
								}
								$("#category").addClass("hidden");
								$("#optional_category").removeClass("hidden");
								$("#date_tabledata").addClass("hidden");
								$("#date_tablediv").removeClass("hidden");
								$("#exptypeid").val((result.expenseType == undefined || result.expenseType == null || result.expenseType.length <= 0) ? "" : result.expenseType);
								<c:forEach items="${expenseTypeList}" var="expenseType">
									if("${expenseType.id}" == result.expenseType){
										$("#optional_exptypeid").html("${expenseType.dispname}");
									}
								</c:forEach>
								$("#exptypeid").addClass("hidden");
								$("#optional_exptypeid").removeClass("hidden");
								
								$("#desc").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#billno").val((result.billno == undefined || result.billno == null || result.billno.length <= 0) ? "-" : result.billno);
								$("#modepay").val((result.modepay == undefined || result.modepay == null || result.modepay.length <= 0) ? "-" : result.modepay);
								if(result.modepay == "c"){
									$("#optional_modepay").html("Cash");
								}else if(result.modepay == "a"){
									$("#optional_modepay").html("Card");
								}else if(result.modepay == "o"){
									$("#optional_modepay").html("Online Payment");
								}else if(result.modepay == "q"){
									$("#optional_modepay").html("Cheque");
								}else if(result.modepay == undefined || result.modepay == null || result.modepay.length <= 0){
									$("#optional_modepay").html("-");
								}
								$("#modepay").addClass("hidden");
								$("#optional_modepay").removeClass("hidden");
								$("#cardno").val((result.cardOrchequeNo == undefined || result.cardOrchequeNo == null || result.cardOrchequeNo.length <= 0) ? "-" : result.cardOrchequeNo);
								$("#bankname").val((result.bankname == undefined || result.bankname == null || result.bankname.length <= 0) ? "-" : result.bankname);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
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
				var id = $("#expid").val();
				var date = $("#date").datepicker().val();
				date = date.split('/').join('-');
				var category = $("#category").val();
				var exptypeid = $("#exptypeid").val();
				var desc = $("#desc").val();
				var billno = $("#billno").val();
				var amount = $("#amount").val();
				var mode = $("#modepay").val();
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
						if(cardno != "" || cardno.length != 0 || cardno == "" || cardno.length == 0) cardno = "null";
						if(bankname != "" || bankname.length != 0 || bankname == "" || bankname.length == 0) bankname = "null";
				}
				var resourceURL = $("#contextpath").val()+"/expense/update/"+id+"/"+category+"/"+date+"/"+exptypeid+"/"+desc+"/"+billno+"/"+mode+"/"+cardno+"/"+bankname+"/"+amount;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								
								//Category Selectbox Properties
								if(category == "internal"){
									$("#optional_category").html("Internal");
								}else if(category == "external"){
									$("#optional_category").html("External");
								}else if(category == undefined || category == null || category.length <= 0){
									$("#optional_category").html("-");
								}
								$("#category").addClass("hidden");
								$("#optional_category").removeClass("hidden");
								
								//Expense Type Selectbox Properties
								<c:forEach items="${expenseTypeList}" var="expenseType">
									if("${expenseType.id}" == exptypeid){
										$("#optional_exptypeid").html("${expenseType.dispname}");
									}
								</c:forEach>
								$("#exptypeid").addClass("hidden");
								$("#optional_exptypeid").removeClass("hidden");
								//Modepay Selectbox Properties
								if(mode == "c"){
									$("#optional_modepay").html("Cash");
								}else if(mode == "a"){
									$("#optional_modepay").html("Card");
								}else if(mode == "o"){
									$("#optional_modepay").html("Online Payment");
								}else if(mode == "q"){
									$("#optional_modepay").html("Cheque");
								}else if(mode == undefined || mode == null || mode.length <= 0){
									$("#optional_modepay").html("-");
								}
								$("#modepay").addClass("hidden");
								$("#optional_modepay").removeClass("hidden");
								$("#date_tabledata").addClass("hidden");
								$("#date_tablediv").removeClass("hidden");
								$("#edit").removeClass("hidden");
								$("#delete").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#expid").prop( 'disabled', false );
								
								// add element value as " - " if value is emply or null after updation
								
								if($("#date").val() == "" || $("#date").val() == "-"){
									$("#date").val("-");
									$("#optional_date").html("-");
								} else {
									$("#optional_date").html(date);
								}
								if($("#desc").val() == "" || $("#desc").val() == "-"){
									$("#desc").val("-");
								}
								if($("#billno").val() == "" || $("#billno").val() == "-"){
									$("#billno").val("-");
								}
								if($("#modepay").val() == "" || $("#modepay").val() == "-"){
									$("#modepay").val("-");
								}
								if($("#cardno").val() == "" || $("#cardno").val() == "-"){
									$("#cardno").val("-");
								}
								if($("#bankname").val() == "" || $("#bankname").val() == "-"){
									$("#bankname").val("-");
								}
								if($("#amount").val() == "" || $("#amount").val() == "-"){
									$("#amount").val("-");
								}
								
								$("#expid").prop( "disabled", true );
								$("#date").prop( "disabled", true );
								$("#exptypeid").prop( "disabled", true );
								$("#desc").prop( "disabled", true );
								$("#billno").prop( "disabled", true );
								$("#modepay").prop( "disabled", true );
								$("#cardno").prop( "disabled", true );
								$("#bankname").prop( "disabled", true );
								$("#amount").prop( "disabled", true );
								
								$("#expid").removeClass("inputBorder");
								$("#date").removeClass("inputBorder");
								$("#exptypeid").removeClass("inputBorder");
								$("#desc").removeClass("inputBorder");
								$("#billno").removeClass("inputBorder");
								$("#modepay").removeClass("inputBorder");
								$("#cardno").removeClass("inputBorder");
								$("#bankname").removeClass("inputBorder");
								$("#amount").removeClass("inputBorder");
								
								$("#expid").addClass("inputdisable");
								$("#date").addClass("inputdisable");
								$("#exptypeid").addClass("inputdisable");
								$("#desc").addClass("inputdisable");
								$("#billno").addClass("inputdisable");
								$("#modepay").addClass("inputdisable");
								$("#cardno").addClass("inputdisable");
								$("#bankname").addClass("inputdisable");
								$("#amount").addClass("inputdisable");
								
								$("#alertMsgContent").html("Expense details updated successfully...");
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
				var id = $("#expid").val();
				var resourceURL = $("#contextpath").val()+"/expense/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
							$("#successful_msg_content").html("Deleted successfully...");
							$.fancybox.open('#deletedsuccessful_fancybox');
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

			$("#show_showexpenselist").click(function() {
				
				var resourceURL = $("#contextpath").val()+"/expense/get";
				
				if($("#expensetype").val() != ""){
					resourceURL = $("#contextpath").val()+"/expense/get/"+$("#expensetype").val();
				}
				
				 $("#expensegridtable").setGridParam({
					url: resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#expensegridtable").trigger("reloadGrid");
				
				
				$("body").css("cursor", "progress");
				$("#expenseDetail").addClass("hidden");
				$("#expenseList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				
				
				$("#modepay").removeClass("hidden");
				$("#optional_modepay").addClass("hidden");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#expid").prop( 'disabled', false );
				$("#expid").prop( "disabled", true );
				$("#date").prop( "disabled", true );
				$("#exptypeid").prop( "disabled", true );
				$("#desc").prop( "disabled", true );
				$("#billno").prop( "disabled", true );
				$("#modepay").prop( "disabled", true );
				$("#cardno").prop( "disabled", true );
				$("#bankname").prop( "disabled", true );
				$("#amount").prop( "disabled", true );
				
				$("#expid").removeClass("inputBorder");
				$("#date").removeClass("inputBorder");
				$("#exptypeid").removeClass("inputBorder");
				$("#desc").removeClass("inputBorder");
				$("#billno").removeClass("inputBorder");
				$("#modepay").removeClass("inputBorder");
				$("#cardno").removeClass("inputBorder");
				$("#bankname").removeClass("inputBorder");
				$("#amount").removeClass("inputBorder");
				
				$("#expid").addClass("inputdisable");
				$("#date").addClass("inputdisable");
				$("#exptypeid").addClass("inputdisable");
				$("#desc").addClass("inputdisable");
				$("#billno").addClass("inputdisable");
				$("#modepay").addClass("inputdisable");
				$("#cardno").addClass("inputdisable");
				$("#bankname").addClass("inputdisable");
				$("#amount").addClass("inputdisable");
				$("#category").addClass("hidden");
				$("#optional_category").removeClass("hidden");
				$("body").css("cursor", "default");
				$("#exptypeid").addClass("hidden");
				$("#optional_exptypeid").removeClass("hidden");
				$("#modepay").addClass("hidden");
				$("#optional_modepay").removeClass("hidden");
				$("#date_tabledata").addClass("hidden");
				$("#date_tablediv").removeClass("hidden");
			});	
			$("body").css("cursor", "default");
		});	
		$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
	</script>
</html>
