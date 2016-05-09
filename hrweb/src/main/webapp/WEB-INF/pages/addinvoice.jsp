<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style type="text/css">
			.ui-datepicker-trigger {
				position: initial;
			  /*   margin-left: 11px; */
			    margin-top: 13px;
			}
	
			option:focus {outline:none;}
			option::-moz-focus-inner {border:0;}
	
		</style>
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>	
		<!--Header End-->
		<div id="innerContainer">
		
		<!--Content Area START-->
			<div id="contentArea">
				<div id="vendor">
					<div id = "customerselect" class="">
					<div  id = "empselect" style="width:100%">
						<table class="optionTable" align ="center">
							<tr>
								<td align="right" style="float:none;" class="invoicetd"><sup class="saptaColor">*</sup>Choose&nbsp;Customer&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="custselect">
										<option value="" style="text-align: center;">--- Select Customer ---</option> 
										<c:forEach items="${customerList}" var="customerlist">
											<option value="${customerlist.id}" style="text-align: left;">${customerlist.id} - ${customerlist.name} </option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr id = "projselect" class="hidden MRGL10PX">
								<td align="right" style="float:none"><sup class="saptaColor">*</sup>Choose&nbsp;Project&nbsp;:</td>
								<td align="left" style="float:none">	
									<select id="selectproject">
									</select>
								</td>
							</tr>
							
							<tr id = "typeofinvoicediv" class="hidden ">
								<td align="right" style="float:none"><sup class="saptaColor">*</sup>Choose&nbsp;Invoice&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="typeofinvoiceselect" >
										<option value="" style="text-align: center;">--- Select Invoice Type ---</option>
										<option value="h" style="text-align: left;">Hourly</option>
										<option value="d" style="text-align: left;">Daily</option>
										<option value="w" style="text-align: left;">Weekly</option>
										<option value="m" style="text-align: left;">Monthly</option>
										<option value="f" style="text-align: left;">Fixed</option> 
									</select>
								</td>
							</tr>
							
							
							<tr id = "amounttypediv" class="hidden">
								<td align="right" style="float:none" ><sup class="saptaColor">*</sup>Choose&nbsp;Amount&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="amounttypeselect" >
										<option value="" style="text-align: center;">--- Select Amount Type ---</option>
										<option value="i" style="text-align: left;">INR</option>
										<option value="u" style="text-align: left;">USD</option>
										<option value="e" style="text-align: left;">EUR</option>
										<option value="g" style="text-align: left;">GBP</option> 
									</select>
								</td>
							</tr>
							
							<tr id = "invoicenodiv" class="hidden">
								<td align="right" style="margin: 0px;float:none"><sup class="saptaColor" >*</sup>Invoice Number&nbsp;:</td>
								<td align="left" style="float:none">						
									<input id="invoiceno" disabled="disabled" class="inputdisabletxtbold font9px MRGL10PX"  style="padding:5px 0; width:98%"/>
								</td>
							</tr>
						</table>
					</div>
					<div id="invoiceterms" class="hidden" style="padding: 2px;">
					<div class="responsive">
					   <table class="data">
							   <tr>
								   <th class="first"><sup class="saptaColor">*</sup>Invoice&nbsp;Date</th>
								   <th class="" style="width:50%">Terms</th>
								   <th class="last"><sup class="saptaColor">*</sup>Due&nbsp;Date</th>
							   </tr>                                        
							   <tr class="invoice_due_datepic">
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="invoicedate" id="invoicedate" readonly="readonly" type="text" class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
								    <td><div style="text-align: center;">Due on date specified</div></td>
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="duedate" id="duedate" readonly="readonly" type="text"  class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
							   </tr>		   
					   </table>
					   </div>
					</div>
					
					<div id="invoiceitemcontent" class="hidden" style="padding: 2px;">
					<div class="responsive">
					   <table id="invoicetablecontent" class="data">
							   <tr>
								   <th class="first"><sup class="saptaColor">*</sup>Reference</th>
								   <th class=""><sup class="saptaColor">*</sup>From</th>
								   <th class=""><sup class="saptaColor">*</sup>To</th>
								   <th id="totalhours" class=""><sup class="saptaColor">*</sup>Total&nbsp;<span id="typeofperiod"></th>
								   <th id="rate_header" class=""><sup class="saptaColor">*</sup>Rate<span id="slashspan">/</span><span id="fixedtypeofperiodrate"></span><span id="typeofperiodrate"></th>
								   <th class=""><sup class="saptaColor">*</sup>Total&nbsp;(<span class="headamounttype"></span>)</th>
								   <th class="last"><sup class="saptaColor">*</sup>Net&nbsp;Amount&nbsp;(<span class="headamounttype"></span>)</th>
								   <th style="background-color: white; border:0; padding:0;"><div id="addinvoice" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX hidden"><img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/></div></th>
							   </tr>                                        
							   <tr id="invoicecontenttablerow_1">
							   	   <td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_1" id="refnumbername_1" type="text" /></div></td>
							   	   <td><div  style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_1" id="servicefrom_1" readonly="readonly" type="text" class="datePcK datePicMob" style="float:left"/></b></div></td>
							   	   <td><div  style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_1" id="serviceto_1" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td>
							   	   <td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_1"  class="perrateperiod" id="totalhrss_1" type="text" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_1" id="rateperhr_1" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td id="rate_value"><div style="width: 95%; margin: 0 auto;"><input name="total_1" id="total_1" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td><div style="width: 100%; margin: 0 auto;"><input name="netamt_1" id="netamt_1" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td class="noborder">
										<div id="invoice_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											&nbsp;<%-- <img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/> --%>
										</div>
									</td>
							   </tr>		   
					   </table>
					   </div>
					</div>
					<div class="clearWidth hidden" id="sub_total" style="margin: 10px 0;">
						<div class="clearTable rightElement MRGRINVDIV sub_tot_div">
							<div class="leftElement BLDTEXT12PX ">Sub Total</div>
							<div id="subtotalamountdivision" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>
					<div class="clearWidth hidden" id="service_tax" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGRINVDIV div_Width">
							<div class="leftElement BLDTEXT12PX ">Service Tax(14.5%)</div>
							<div id="servicetax" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>
					
					<div id="totalamountunderline" class="clearWidth hidden" id="">
						<div class="clearTable rightElement WDTH25PER underlinediv">
						</div>
					</div>
					<div class="clearWidth hidden" id="total_amount" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGRINVDIV tot_div">
							<div class="leftElement BLDTEXT12PX ">Total	</div>
							<div id="totalamountdivision" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>					
					<div class="clearWidth hidden" id="buttons">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addInvoice"/>
							</div>
						 </div>
					</div>
					<div id="confirmMsg" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContent"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px"></a>
					</div>
					<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
						</div>
					</div>
				</div>
			</div>
	<!--Content Area END-->
			<div style="text-align: center;" id="mandatory" class="hidden"><b class="saptaColor">*</b>mandatory fields</div>
		</div>   
	</div>
	<%@include file="footer.jsp"%>
	</body>
	  <script type="text/javascript">
	  $(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_payments").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Invoice");
			$(function() {
				 $( "#invoicedate, #duedate, #servicefrom_1, #serviceto_1" ).datepicker({
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
			
			
			$('#selectproject').on('change', function (e){
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	if($("#selectproject").val() != "null"){
			 		if(!$("#buttons").hasClass("hidden") && !$("#mandatory").hasClass("hidden")){
			 			$("#buttons").removeClass("hidden");
			 			$("#mandatory").removeClass("hidden");
			 			$("#invoicenodiv").removeClass("hidden");
			 		}else{
			 			$("#buttons").addClass("hidden");
			 			$("#mandatory").addClass("hidden");
			 			$("#invoicenodiv").addClass("hidden");
			 		}
			 		$("#typeofinvoicediv").removeClass("hidden");
				 	var projectcode = null;
				 	var customercode = null;
				 	var invoicenum = 0;
				 	var id = null;
				 	
				 	var resourceURL = $("#contextpath").val()+"/customer/retrivebyid/"+$("#custselect").val();
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
				        			customercode = result.customercode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	var URL = $("#contextpath").val()+"/project/retrivebyid/"+$("#selectproject").val();
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
				        			projectcode = result.projectcode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	var url = $("#contextpath").val()+"/invoice/retrivebycustandproject/"+$("#selectproject").val()+"/"+$("#custselect").val();
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
				        		if(results.length > 0){
				        			for(var i=0;i<results.length;i++){
					        			invoicenum = results[0].invoiceno;
					        		}	
				        		}else{
				        			invoicenum = 0;
				        		}
				        		
				        	}else{
				        		invoicenum = 0;
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	if(invoicenum != 0){
				 		invoicenum = invoicenum.split("-");
					 	var increment = 0;
					 	var invoicearray = invoicenum[4]; 
					 	increment = parseInt(invoicearray)+1;
				 	}else{
				 		increment = invoicenum+1;
				 	}
				 	$("#invoiceno").val("SL-INV-"+customercode+"-"+projectcode+"-"+((increment <=9) ? ("0"+ increment) : increment));
			 	}else{
			 		$("#buttons").addClass("hidden");
		 			$("#mandatory").addClass("hidden");
			 		$("#typeofinvoiceselect").val("");
			 		$("#typeofinvoicediv").addClass("hidden");
			 		$("#amounttypeselect").val("");
			 		$("#amounttypediv").addClass("hidden");
			 		$("#invoicenodiv").addClass("hidden");
			 		$("#invoiceterms").addClass("hidden");
			 		$("#invoicedate").val("");
			 		$("#duedate").val("");
			 		$("#invoiceitemcontent").addClass("hidden");
			 		$("#addinvoice").addClass("hidden");
			 		$("#sub_total").addClass("hidden");
			 		$("#service_tax").addClass("hidden");
			 		$("#totalamountunderline").addClass("hidden");
			 		$("#total_amount").addClass("hidden");
			 		$("#servicetax").html("0.00");
			 		$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#refnumbername_"+i).val(" ");
						$("#servicefrom_"+i).val("");
						$("#serviceto_"+i).val(" ");
						$("#totalhrss_"+i).val(" ");
						$("#rateperhr_"+i).val(" ");
						$("#total_"+i).val(" "); 
						$("#netamt_"+i).val(" ");
					});
					$("#invoicedate").val("");
					$("#duedate").val("");
			 	}
			 	
			});
			var counter = 2;
			var removeCount = 2;
			$("#addinvoice").click(function () {
				var newemp_dynamic = $(document.createElement('tr')).attr("id", 'invoicecontenttablerow_' + counter);
				if($("#typeofinvoiceselect").val() != "f"){
					newemp_dynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_' + counter +'" id="refnumbername_' + counter +'" type="text"/></div></td><td style="width: 161px;"><div style=" margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_' + counter +'" id="servicefrom_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_' + counter +'" id="serviceto_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_' + counter +'" id="totalhrss_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_' + counter +'" id="rateperhr_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="total_' + counter +'" id="total_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="netamt_' + counter +'" id="netamt_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)""/></div></td><td class="noborder"><div id="invoice_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
				}
				if($("#typeofinvoiceselect").val() == "f"){
					newemp_dynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_' + counter +'" id="refnumbername_' + counter +'" type="text"/></div></td><td  style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_' + counter +'" id="servicefrom_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td  style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_' + counter +'" id="serviceto_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totalhrsrow hidden"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_' + counter +'" id="totalhrss_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_' + counter +'" id="rateperhr_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="netamt_' + counter +'" id="netamt_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="noborder"><div id="invoice_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
				}
				newemp_dynamic.appendTo("#invoicetablecontent");
				$(function() {
					 $( "#servicefrom_"+counter+",#serviceto_"+counter).datepicker({
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
				counter++;
				removeCount++;
			});
			$(document).on('click','[id^="invoice_remove_"]', function(e) {
				var id = $(this).attr("id");
				var i = id.substring(15, id.length);
				if(removeCount==2){
					$("#errorMsgContent").html("Atleast one detail sholud be required...");
					$.fancybox.open('#errorMsg');
			    }else{
			    	removeCount--;
			    	var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount == ""){
			    		netamount = 0;
			    	}
			    	if($("#amounttypeselect").val() == "i"){
			    		totalamount = $("#subtotalamountdivision").html();
			    	}else{
			    		totalamount = $("#totalamountdivision").html();
			    	}
			    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					var completeLastTotal1 = lasttotal.toFixed(2);
					if($("#amounttypeselect").val() == "i"){
						var servicetax = (parseFloat(completeLastTotal1) * 14.5) / 100;
						$("#servicetax").html(servicetax.toFixed(2));
						$("#subtotalamountdivision").html(completeLastTotal1);
						var completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax);
						$("#totalamountdivision").html(parseFloat(completeLastTotal).toFixed(2));
					}else{
						$("#totalamountdivision").html(parseFloat(completeLastTotal1).toFixed(2));
					}
					$("#subtotalamountdivision").html(parseFloat(completeLastTotal1).toFixed(2));
					
			        $("#invoicecontenttablerow_" + i).remove();
			    }   
			 });
			$('#custselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#projselect").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	if($("#custselect").val() != ""){
			 		var resourceURL = $("#contextpath").val()+"/project/retrivebycustid/"+$("#custselect").val();
					 $.ajax({
					        url : resourceURL,
					        type : 'GET',
					        dataType : 'json',
					        success: function(data) {
					        	var successflag = data.response.successflag;
					        	var errors = data.response.errors;
					        	var results = data.response.result;
					        	
					        	if(successflag == "true"){
					        		$('#selectproject').find('option').remove();
					        		var optionTag = "<option value='null' style='text-align: center;'>--- Select Project ---</option>";
					        		$('#selectproject').append(optionTag);
					        		 for(var i = 0; i < results.length; i++){
					        			$('#selectproject').append($('<option>', { 
								            value: results[i].id,
								            text : results[i].dispname,
								            style: "text-align: left;"
								        }));
					        		}
					        		$("#projselect").removeClass("hidden");
					        	}else{
					        		$("#projselect").addClass("hidden");
					        	} 
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					        	$("#errorMsgContent").html(thrownError);
					    		$.fancybox.open('#errorMsg');
					   		}
					   });
					   $("#typeofinvoiceselect").val("");
				 		$("#typeofinvoicediv").addClass("hidden");
				 		$("#amounttypeselect").val("");
				 		$("#amounttypediv").addClass("hidden");
				 		$("#invoicenodiv").addClass("hidden");
				 		$("#invoiceterms").addClass("hidden");
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		$("#invoiceitemcontent").addClass("hidden");
				 		$("#addinvoice").addClass("hidden");
				 		$("#sub_total").addClass("hidden");
				 		$("#service_tax").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#total_amount").addClass("hidden");
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
						});
						$("#invoicedate").val("");
						$("#duedate").val("");
				 	} else{
				 		$("#selectproject").val("");
				 		$("#projselect").addClass("hidden");
				 		$("#typeofinvoiceselect").val("");
				 		$("#typeofinvoicediv").addClass("hidden");
				 		$("#amounttypeselect").val("");
				 		$("#amounttypediv").addClass("hidden");
				 		$("#invoicenodiv").addClass("hidden");
				 		$("#invoiceterms").addClass("hidden");
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		$("#invoiceitemcontent").addClass("hidden");
				 		$("#addinvoice").addClass("hidden");
				 		$("#sub_total").addClass("hidden");
				 		$("#service_tax").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#total_amount").addClass("hidden");
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
						});
						$("#invoicedate").val("");
						$("#duedate").val("");
				 	}
				});
			
			$('#typeofinvoiceselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	if($("#typeofinvoiceselect").val() != ""){
						$("#amounttypediv").removeClass("hidden");
						if($("#amounttypeselect").val() != ""){
							$("#mandatory").removeClass("hidden");
						 	$("#buttons").removeClass("hidden");
						 	$("#invoice").removeClass("hidden");
						 	$("#invoicenodiv").removeClass("hidden");
						}
						if($("#typeofinvoiceselect").val() == "h"){
							$("#typeofperiod").html("Hours");
							$("#slashspan").removeClass("hidden");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#typeofperiodrate").html("Hour");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "d"){
							$("#typeofperiod").html("Days");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Day");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "w"){
							$("#typeofperiod").html("Weeks");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Week");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "m"){
							$("#typeofperiod").html("Months");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Month");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "f"){
							$("#typeofperiodrate").html("");
							$("#rate_header").addClass("hidden");
							$("#rate_value").addClass("hidden");
							$("#slashspan").addClass("hidden");
							$(".totalhrsrow").addClass("hidden");
							$("#fixedtypeofperiodrate").html("Fixed");
							$("#totalhours").addClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
				 	}else{
				 		$("#mandatory").addClass("hidden");
					 	$("#buttons").addClass("hidden");
					 	$("#total_amount").addClass("hidden");
					 	$("#invoice").addClass("hidden");
					 	$("#invoicenodiv").addClass("hidden");
					 	$("#invoiceterms").addClass("hidden");
					 	$("#addinvoice").addClass("hidden");
					 	$("#invoiceitemcontent").addClass("hidden");
					 	$("#sub_total").addClass("hidden");
					 	$("#service_tax").addClass("hidden");
					 	$("#amounttypediv").addClass("hidden");
					 	$("#amounttypeselect").val("");
					 	$("#rate_header").removeClass("hidden");
						$("#rate_value").removeClass("hidden");
				 	}
				});
			$('#amounttypeselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	$("#invoiceterms").addClass("hidden");
			 	$("#addinvoice").addClass("hidden");
			 	$("#invoiceitemcontent").addClass("hidden");
			 	if($("#amounttypeselect").val() != ""){
				 		$("#mandatory").removeClass("hidden");
					 	$("#buttons").removeClass("hidden");
					 	$("#total_amount").removeClass("hidden");
					 	$("#invoice").removeClass("hidden");
					 	$("#invoicenodiv").removeClass("hidden");
					 	$("#invoiceterms").removeClass("hidden");
					 	$("#addinvoice").removeClass("hidden");
					 	$("#invoiceitemcontent").removeClass("hidden");
					 	if($("#amounttypeselect").val() == "i"){
					 		var totalamount = $("#totalamountdivision").html();
					 		var servicetax = parseFloat(totalamount * 14.5 ) / 100;
							var completetotalamount = parseFloat(totalamount) + parseFloat(servicetax);
							$("#servicetax").html(servicetax.toFixed(2));
							$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
							$("#totalamountdivision").html(completetotalamount.toFixed(2));
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").removeClass("hidden");
						 	$("#totalamountunderline").removeClass("hidden");
					 		$(".headamounttype").html("&#x20B9;");
					 		$(".headamounttype").addClass("WebRupee");
					 		$(".headamounttype").addClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "u"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#servicetax").html(0.00);
					 		$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
						 	$("#totalamountunderline").addClass("hidden");
					 		$(".headamounttype").html("&#36;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "e"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#servicetax").html(0.00);
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
						 	$("#totalamountunderline").addClass("hidden");
					 		$(".headamounttype").html("&#8364;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "g"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	$("#totalamountunderline").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#servicetax").html(0.00);
						 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
					 		$(".headamounttype").html("&#163;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	$("#buttons").removeClass("hidden");
				 	}else{
				 		$("#mandatory").addClass("hidden");
					 	$("#buttons").addClass("hidden");
					 	$("#total_amount").addClass("hidden");
					 	$("#invoice").addClass("hidden");
					 	$("#invoicenodiv").addClass("hidden");
					 	$("#invoiceterms").addClass("hidden");
					 	$("#addinvoice").addClass("hidden");
					 	$("#sub_total").addClass("hidden");
					 	$("#service_tax").addClass("hidden");
					 	
					 	$("#invoiceitemcontent").addClass("hidden");
					 	$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
					 	$("#servicetax").html("0.00");
					 	$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
					 });
				 	}
				});
			
			 $('#addInvoice').click(function(){
				 		var validation = true;
						var invoicenumber = $("#invoiceno").val();
						var invoicedate = $("#invoicedate").datepicker().val();
						var duedate = $("#duedate").datepicker().val();
						var customerid = $("#custselect").val();
						var projectid = $("#selectproject").val();
						var invoicetype = $("#typeofinvoiceselect").val();
						var amounttype = $("#amounttypeselect").val();
						
						if(invoicenumber == "" || invoicenumber.length == 0) validation = false;
						if(invoicedate == "" || invoicedate.length == 0) validation = false;
						if(duedate == "" || duedate.length == 0) validation = false;
						if(customerid == "" || customerid.length == 0) validation = false;
						if(projectid == "" || projectid.length == 0) validation = false;
						if(invoicetype == "" || invoicetype.length == 0) validation = false;
						if(amounttype == "" || amounttype.length == 0) validation = false;
						
						var invoicedatevalidation = $.datepicker.parseDate('dd-mm-yy',invoicedate);
						var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
						if ((invoicedatevalidation) > (duedatevalidation))  validation = false; 
						
				 $('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						
						var reference = $("#refnumbername_"+i).val();
						var servicefrom = $("#servicefrom_"+i).val();
						var serviceto = $("#serviceto_"+i).val();
						var totalhrs = $("#totalhrss_"+i).val();
						var rateperhr = $("#rateperhr_"+i).val();
						var dueamount = $("#total_"+i).val();
						
						if(reference == "" || reference.length == 0) validation = false;
						if(servicefrom == "" || servicefrom.length == 0) validation = false;
						if(serviceto == "" || serviceto.length == 0) validation = false;
						if($("#typeofinvoiceselect").val() != "f"){
							if(totalhrs == "" || totalhrs.length == 0) validation = false;
						}
						if(rateperhr == "" || rateperhr.length == 0) validation = false;
						if(dueamount == "" || dueamount.length == 0) validation = false;
						
						var servicefromvalidation = $.datepicker.parseDate('dd-mm-yy',servicefrom);
						var servicetovalidation = $.datepicker.parseDate('dd-mm-yy',serviceto);
						if ((servicefromvalidation) > (servicetovalidation))  validation = false; 
				 });
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var invoicenumber = $("#invoiceno").val();
					var invoicedate = $("#invoicedate").datepicker().val();
					var duedate = $("#duedate").datepicker().val();
					var customerid = $("#custselect").val();
					var projectid = $("#selectproject").val();
					var invoicetype = $("#typeofinvoiceselect").val();
					var amounttype = $("#amounttypeselect").val();
					
					var servicetax = 0;
					var totalamount = 0;
					if(amounttype == "i"){
						totalamount = $("#subtotalamountdivision").html();
						servicetax = $("#servicetax").html();
					}else{
						totalamount = $("#totalamountdivision").html();
					}
						
					var resourceURL = $("#contextpath").val()+"/invoice/add/"+invoicenumber+"/"+invoicedate+"/"+duedate+"/"+customerid+"/"+projectid+"/"+totalamount+"/"+servicetax+"/"+invoicetype+"/"+amounttype;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						async: false,
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								addInvoiceDetails();
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
			});
			function addInvoiceDetails(){
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					var invoicenumber = $("#invoiceno").val();
					var reference = $("#refnumbername_"+i).val();
					var servicefrom = $("#servicefrom_"+i).val();
					var serviceto = $("#serviceto_"+i).val();
					var dueamount = $("#netamt_"+i).val();
					if($("#typeofinvoiceselect").val() != "f"){
						var totalhrs = $("#totalhrss_"+i).val();
					} else{
						var totalhrs = 0;
					}
					var rateperhr = $("#rateperhr_"+i).val();
					var dueamount = $("#total_"+i).val();
					var resourceURL = $("#contextpath").val()+"/invoice/addinvoicedetails/"+invoicenumber+"/"+reference+"/"+servicefrom+"/"+serviceto+"/"+totalhrs+"/"+rateperhr+"/"+dueamount;
					$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async: false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$("#refnumbername_"+i).val("");
									$("#servicefrom_"+i).val("");
									$("#serviceto_"+i).val("");
									$("#totalhrss_"+i).val("");
									$("#rateperhr_"+i).val("");
									$("#total_"+i).val("");
									$("#netamt_"+i).val("");
									//clear Variables As Null
									reference = null;
									servicefrom = null;
									serviceto = null;
									totalhrs = null;
									rateperhr = null;
									dueamount = null;
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
					$("#userMsgContent").html("Invoice generated ...");
					$.fancybox.open('#userMsg');
			});
			}
			
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
			$("body").css("cursor", "default");
		}).on('focusout', '.perrateperiod', function() {
			var id = $(this).attr("id");
			var i = id.substring(10, id.length);
			if($("#typeofinvoiceselect").val() != "f"){
				var totalperiod = $("#totalhrss_"+i).val();
				var periodperrate = $("#rateperhr_"+i).val();
				if(totalperiod != "" && periodperrate != ""){
					totalamount = parseFloat(totalperiod) * parseFloat(periodperrate);
					var completetotalamount = totalamount.toFixed(2);
					$("#total_"+i).val(completetotalamount);
					$("#netamt_"+i).val(completetotalamount);
					var lastTotal = 0;
					var netamount = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat($("#netamt_"+i).val());
							var completeLastTotal1 = lastTotal.toFixed(2);
							if($("#amounttypeselect").val() == "i"){
								var servicetax = (parseFloat(completeLastTotal1) * 14.5 ) / 100;
								$("#servicetax").html(servicetax.toFixed(2));
								completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax);
								completeLastTotal = completeLastTotal.toFixed(2);
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal);
							}else{
							//$("#subtotalamountdivision").html(completeLastTotal);
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal1);
							}
						}
						
					});
				}else{
					var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	var completeLastTotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount != "" && netamount != 0 && netamount != null){
			    		if($("#amounttypeselect").val() == "i"){
			    			totalamount = $("#subtotalamountdivision").html();
			    			var servicetax = 0;
					    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					    	servicetax = (lasttotal * 14.5) / 100;
					    	var totalamount = lasttotal + servicetax;
							$("#subtotalamountdivision").html(lasttotal.toFixed(2));
							$("#totalamountdivision").html(totalamount.toFixed(2));
							$("#servicetax").html(servicetax.toFixed(2));
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
			    		}else{
			    			var netamount = 0;
			    			var totalamount = 0;
			    			netamount = $("#netamt_"+i).val();
			    			totalamount = $("#totalamountdivision").html();
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#subtotalamountdivision").html(lasttotal.toFixed(2));
			    			$("#totalamountdivision").html(lasttotal.toFixed(2));
			    			$("#total_"+i).val("");
							$("#netamt_"+i).val("");
			    		}
			    		
			    	}
				}
			}
			if($("#typeofinvoiceselect").val() == "f"){
				var periodperrate = $("#rateperhr_"+i).val();
				if(periodperrate != ""){
					totalamount = parseFloat(periodperrate);
					var completetotalamount = totalamount.toFixed(2);
					$("#total_"+i).val(completetotalamount);
					$("#netamt_"+i).val(completetotalamount);
					var lastTotal = 0;
					var netamount = 0;
					var completeLastTotal = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat(netamount);
							completeLastTotal1 = lastTotal.toFixed(2);
							if($("#amounttypeselect").val() == "i"){
								var servicetax = (parseFloat(completeLastTotal1) * 14.5) / 100;
								$("#servicetax").html(servicetax.toFixed(2));
								$("#subtotalamountdivision").html(completeLastTotal1);
								completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax.toFixed(2));
								$("#totalamountdivision").html(completeLastTotal.toFixed(2));
							}else{
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal1);
							}
						}
						
					});
				} else{
					var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	var completeLastTotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount != "" && netamount != 0 && netamount != null){
			    		if($("#amounttypeselect").val() == "i"){
			    			totalamount = $("#subtotalamountdivision").html();
			    			var servicetax = 0;
					    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					    	servicetax = (lasttotal * 14.5) / 100;
					    	var totalamount = lasttotal + servicetax;
							$("#subtotalamountdivision").html(lasttotal.toFixed(2));
							$("#totalamountdivision").html(totalamount.toFixed(2));
							$("#servicetax").html(servicetax.toFixed(2));
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
			    		}else{
			    			var totalamount = 0;
			    			totalamount = $("#totalamountdivision").html();
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#totalamountdivision").html(lasttotal.toFixed(2));
			    			$("#subtotalamountdivision").html(lasttotal.toFixed(2));
			    			$("#total_"+i).val("");
							$("#netamt_"+i).val("");
			    		}
			    		
			    	}
				}
			}
	    });
	</script>
</html>