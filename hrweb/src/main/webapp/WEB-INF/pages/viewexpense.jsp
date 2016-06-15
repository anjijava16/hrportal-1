<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">
		.ui-datepicker-trigger{
			margin-top: 3px;
		}
	</style> 
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
		<!--Expense List Starts-->
			<div id="contentArea">
				<div id="totaldiv1" align ="center" style="width:100%;">
					<table  class="optionTable">
						<tr>
							<td align="right" style="margin-left:auto; margin-top:0;">Amount&nbsp;Paid&nbsp;:</td>
						<!-- 	<td class="WebRupee PADDRGT1PX BLD rupyaINR" width="2px !important" style="padding-top: 9px;" style="margin-left:0px;margin-top: 6px !important;">&#x20B9;</td> -->
						<!-- 	<td id="currenttotalamttd" class="PADDLFT1PX BLD" width="auto"style="margin-left:0px;margin-top: 6px !important;"></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px; font-weight: bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white; width: 109px; font-weight: bold;" /></td>
						</tr>
					</table>
				</div>
				<div class="responsive">
				 <table class="data display" id="viewExpenseTbl" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="first">Expense&nbsp;Id</th>
							<th class="">Date</th>
							<th class="">Category</th>
							<th class="">Expense&nbsp;Type</th>
							<th class="">Description</th>
							<th class="">Amount&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
						</tr>
					</thead>
					<tbody>
					</tbody>					
				</table>
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
								<b style="float:left; height: 20px;"><input id="date" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>

							</td>
							<td  id="date_tablediv" class="value">
								<div id="optional_date"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Category</td>
							<td class="value">	
								<select id="category" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
									<option value="" style="text-align:center">--- Select ---</option>
									<option value="internal" style="text-align:left">Internal</option>
									<option value="external" style="text-align:left">External</option>
								</select>
								<div id="optional_category" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Expense Type</td>
							<td class="value">
								<select id="exptypeid" class="selectBox hidden" style="margin:0px;  text-align:center" class="inputdisable">
									<c:forEach items="${expenseTypeList}" var="expenseType">
										<option  style="text-align:left" value="${expenseType.id}">${expenseType.dispname}</option>
									</c:forEach>
								</select>
								<div id="optional_exptypeid" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Description</td>
							<td class="value">
								<input id="desc" disabled="disabled" class="inputdisable hidden">
								<div id="optional_desc" class="value"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Bill No</td>
							<td class="value"><input id="billno" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContentSelect">Mode Of Payment</td>
							<td class="valueContent">	
								<select id="modepay" class="selectBox hidden" style="margin:0px; text-align:center; " class="inputdisable">
									<option value="c"  style="text-align:left" >Cash</option>
									<option value="a" style="text-align:left" >Card</option>
									<option value="q" style="text-align:left">Cheque</option>
									<option value="o" style="text-align:left">Online Payment</option>
								</select>
								<div id="optional_modepay" class="valueContent"></div>
							</td>
						</tr>
						<tr id="carddetails">
							<td class="lableContent">Card No/Cheque No</td>
							<td class="value"><input id="cardno" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr id="bankdetails">
							<td class="lableContent">Bank Name</td>
							<td class="value"><input id="bankname" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Amount</td>
							<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return validateNumericWithPrecision(event)"></td>
						</tr>
					</table>
				</div>
		<!-- Expense Details Lable Content Starts -->					
			</div>
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id ="deletedsuccessful_fancybox" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id = "successful_msg_content"></div>
				<a href="<%=request.getContextPath() %>/expense/viewexpense" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
		<!--Expense List End-->
		</div>
		<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Expense<b class='saptaColor'> List</b>");
			$("body").css("cursor", "progress");
			$('#viewExpenseTbl tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	expenseDetails(id);
		        }
		    });
			
			$("#menu_misc").addClass("active");
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
				$("#norecords").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").addClass("hidden");
			}
			var amount = 0;
			var url = ""; 
			var resourceurl = "";
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
				fymonthYear = monthConversion(fymonthYear);
				fymonthYear = fymonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/expense/getbymonth/"+fymonthYear;
				resourceurl = $("#contextpath").val()+"/expense/getbydatetotalamount/"+fymonthYear;
			} else{
				url = $("#contextpath").val()+"/expense/get";
				resourceurl = $("#contextpath").val()+"/expense/gettotalamount";
			}
			$("#viewExpenseTbl").dataTable({
				"ajax": url,
				 "aaSorting" : [],
				"footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over all pages
		            total = api
		                .column( 5 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                },0 );
		 
		            // Total over this page
		            pageTotal = api
		                .column( 5, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 1).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            		
		            );
		            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
		        },
		        "aoColumns": [ 
                   {sClass: "alignleft"}, 
                   {sClass: "center"}, 
                   {sClass: "alignleft"}, 
                   {sClass: "alignleft"},
                   {sClass: "alignleft"},
                   {sClass: "alignright"}
                 ]
			});
			
			if(resourceurl != null && resourceurl != ""){
				$("#block_overlay").removeClass("hidden");
				$.ajax({
			        url : resourceurl,
			        type : 'GET',
			        dataType : 'json',
			        async : false,
			        success: function(data) {
			        	var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							$.each(results, function (i, result) {
								amount = parseFloat(amount) + parseFloat(result.amount);	
							});
							$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			        	$("#block_overlay").addClass("hidden");
			   		}
			   });
				
			}
			function expenseDetails(id){
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				$("#expenseList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#carddetails").removeClass("hidden");
				$("#bankdetails").removeClass("hidden");
				$("#viewExpenseTbl_wrapper").addClass("hidden");
				$("#expenseDetail").removeClass("hidden");
				$("#totaldiv1").addClass("hidden");
				var resourceURL = $("#contextpath").val()+"/expense/retrivebyid/"+id;
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
								 $("#exptypeid").val((result.expenseTypeId == undefined || result.expenseTypeId == null || result.expenseTypeId.length <= 0) ? "" : result.expenseTypeId);
									<c:forEach items="${expenseTypeList}" var="expenseType">
										if("${expenseType.id}" == result.expenseTypeId){
											$("#optional_exptypeid").html("${expenseType.dispname}");
										}
									</c:forEach> 
								$("#desc").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#optional_desc").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#billno").val((result.billno == undefined || result.billno == null || result.billno.length <= 0) ? "-" : result.billno);
								$("#modepay").val((result.modepay == undefined || result.modepay == null || result.modepay.length <= 0) ? "-" : result.modepay);
								if(result.modepay == "c"){
									$("#optional_modepay").html("Cash");
									$("#carddetails").addClass("hidden");
									$("#bankdetails").addClass("hidden");
								}else if(result.modepay == "a"){
									$("#optional_modepay").html("Card");
								}else if(result.modepay == "o"){
									$("#optional_modepay").html("Online Payment");
									$("#carddetails").addClass("hidden");
									$("#bankdetails").addClass("hidden");
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
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
						$("#block_overlay").addClass("hidden");
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
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
					$("#block_overlay").removeClass("hidden");
					var URL = $("#contextpath").val()+"/expense/getforajax/"+optionval.val();	
					$.ajax({
						url : URL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
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
							}else{
								$("#expenseList").addClass("hidden");
								$("#expenseDetail").addClass("hidden");
								$("#block_overlay").addClass("hidden");
								document.getElementById("alertMsgContent").innerHTML =  optionval.val().substr(0,1).toUpperCase().bold()+ optionval.val().substr(1).bold() + " expense details not found" ;
								$.fancybox.open('#alertMsg');
							}
							$("#block_overlay").addClass("hidden");
						},
						error: function (xhr, ajaxOptions, thrownError) {
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(thrownError);
							$.fancybox.open('#errorMsg');
						}
					});
				}
			});
			
			$('#modepay').on('change', function (e) {
				
				if($('#modepay').val() == "c" || $('#modepay').val() == "o"){
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
				
				$("#optional_desc").addClass("hidden");
				$("#desc").removeClass("hidden");
				
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
				$("#desc").addClass("inputBorder");
				$("#billno").addClass("inputBorder");
				$("#cardno").addClass("inputBorder");
				$("#bankname").addClass("inputBorder");
				$("#amount").addClass("inputBorder");
				
				if($("#modepay").val()=="o" || $("#modepay").val()=="c"){
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
				$("#block_overlay").removeClass("hidden");
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
								 $("#exptypeid").val((result.expenseTypeId == undefined || result.expenseTypeId == null || result.expenseTypeId.length <= 0) ? "" : result.expenseTypeId);
									<c:forEach items="${expenseTypeList}" var="expenseType">
										if("${expenseType.id}" == result.expenseTypeId){
											$("#optional_exptypeid").html("${expenseType.dispname}");
										}
									</c:forEach> 
								$("#exptypeid").addClass("hidden");
								$("#optional_exptypeid").removeClass("hidden");
								$("#desc").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#optional_desc").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#optional_desc").removeClass("hidden");
								$("#desc").addClass("hidden");
								
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
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
						$("#block_overlay").addClass("hidden");
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
			}
			$("#update").click(function(){
				$("#block_overlay").removeClass("hidden");
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
				if (mode != "c" && mode != "o"){
					if(cardno == "" || cardno.length == 0) validation = false;
					if(bankname == "" || bankname.length == 0) validation = false;
				}
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(billno == "" || billno.length == 0) billno = "null";
					if (mode == "c" || mode == "o"){
						if(cardno != "" || cardno.length != 0 || cardno == "" || cardno.length == 0) cardno = "null";
						if(bankname != "" || bankname.length != 0 || bankname == "" || bankname.length == 0) bankname = "null";
					}
				var resourceURL = $("#contextpath").val()+"/expense/update/"+id+"/"+category+"/"+date+"/"+exptypeid+"/"+desc+"/"+billno+"/"+mode+"/"+cardno+"/"+amount+"/"+bankname;
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
								
								if($("#desc").val() == "" || $("#desc").val() == "-"){
									$("#desc").val("-");
									$("#optional_desc").html("-");
								} else {
									$("#optional_desc").html(desc);
								}
								
								$("#optional_desc").removeClass("hidden");
								$("#desc").addClass("hidden");
								
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
								$("#block_overlay").addClass("hidden");
								$("#errorMsgContent").html(errors);
								$.fancybox.open('#errorMsg');
							} 
							$("#block_overlay").addClass("hidden");
						},
						error: function (xhr, ajaxOptions, thrownError) {
							$("#block_overlay").addClass("hidden");
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
				$("#block_overlay").removeClass("hidden");
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
						$("#block_overlay").addClass("hidden");
						if(successflag == "true"){
							$("#successful_msg_content").html("Deleted successfully...");
							$.fancybox.open('#deletedsuccessful_fancybox');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
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
				var table = $("#viewExpenseTbl").DataTable().destroy();
				var resourceURL = $("#contextpath").val()+"/expense/get";
				
				$("#viewExpenseTbl").dataTable({
						"ajax": resourceURL,
						"aaSorting" : [],
						"footerCallback": function ( row, data, start, end, display ) {
				            var api = this.api(), data;
				 
				            // Remove the formatting to get integer data for summation
				            var intVal = function ( i ) {
				                return typeof i === 'string' ?
				                    i.replace(/[\$,]/g, '')*1 :
				                    typeof i === 'number' ?
				                        i : 0;
				            };
				 
				            // Total over all pages
				            total = api
				                .column( 5 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                },0 );
				 
				            // Total over this page
				            pageTotal = api
				                .column( 5, { "filter" : "applied"} )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				            // Update footer
				            $( api.column( 1).footer() ).html(
				            	 '$'+pageTotal +' ( $'+ total +' total)' 
				            		
				            );
				            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
				        },
				        "aoColumns": [ 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"},
	                      {sClass: "alignleft"},
	                      {sClass: "alignright"}
	                    ]
				});
				
				var totalamount = 0;
				var URL = $("#contextpath").val()+"/expense/gettotalamount";
				$("#block_overlay").removeClass("hidden");
				$.ajax({
					url : URL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							$.each(results, function (i, result) {
								totalamount = parseFloat(totalamount) + parseFloat(result.amount);
							}); 
						}else{
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
						$("#block_overlay").addClass("hidden");
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				}); 	
				
				$("#currenttotalamttd").val(numberWithCommas(totalamount.toFixed(2)));
				$("#expenseDetail").addClass("hidden");
				$("#expenseList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#totaldiv1").removeClass("hidden");
				
				$("#modepay").removeClass("hidden");
				$("#optional_modepay").addClass("hidden");
				$("#expensetype").val("");
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
