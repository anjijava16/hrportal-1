<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="head.jsp"%>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style type="text/css">
			.ui-datepicker-trigger {
				position: initial;
			   margin-left: 11px; 
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
							<tr id = "projselect" class=" MRGL10PX hidden">
								<td align="right" style="float:none"><sup class="saptaColor">*</sup>Choose&nbsp;Project&nbsp;:</td>
								<td align="left" style="float:none">	
									<select id="selectproject">
									</select>
								</td>
							</tr>
							
							<tr id ="invoicenodiv" class="hidden">
								<td align="right" style="margin: 0px;float:none"><sup class="saptaColor" >*</sup>Invoice Number&nbsp;:</td>
								<td align="left" style="float:none">						
									<input id="invoiceno" type="text"/>
								</td>
							</tr>
							<tr id="invoicedatediv" class="hidden">
								<td align="right"><sup class="saptaColor">*</sup>Invoice&nbsp;Date&nbsp;:</td>
								<td><b style="float:left"><input name="invoicedate" id="invoicedate" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
							</tr>
							
							<tr id="invoiceduedatediv" class="hidden">
								<td align="right"><sup class="saptaColor">*</sup>Due&nbsp;Date&nbsp;:</td>
								<td><b style="float:left"><input name="duedate" id="duedate" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
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
							
							<tr id = "invoiceamountdiv" class="hidden">
								<td align="right"><sup class="saptaColor">*</sup>Invoice&nbsp;Amount&nbsp;:</td>
								<td><input name="invoiceamount" id="invoiceamount" onkeypress="return validateNumeric(event)" type="text" /></td>
							</tr>
							
							<tr id = "statusdiv" class="hidden">
								<td align="right">Status&nbsp;:</td>
								<td align="left" style="float:none" >	
									<select id="status" class="selectBox"  class="inputdisable" style="margin-left:10px" >
										<option value="a" style="text-align:left">Active</option>
										<option value="i" style="text-align:left">Closed</option>
									</select>
									<div id="optional_status"></div>
								</td>
							</tr>
						</table>
					</div>
					<div id="assetMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="ctcMsgContent"></div>
						<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/externalinvoice/addexternalinvoice" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
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
			 	$("#invoiceamountdiv").addClass("hidden");
			 	$("#statusdiv").addClass("hidden");
			 	$("#invoicedatediv").addClass("hidden");
			 	$("#invoiceduedatediv").addClass("hidden");
			 	var valu = $("#selectproject").val();
			 	if($("#selectproject").val() != "null"){
			 			
			 		$("#invoicenodiv").removeClass("hidden");
			 		$("#invoicedatediv").removeClass("hidden");
			 		$("#invoiceduedatediv").removeClass("hidden");
			 		$("#amounttypediv").removeClass("hidden");
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
				 	/* $("#invoiceno").val("SL-INV-"+customercode+"-"+projectcode+"-"+((increment <=9) ? ("0"+ increment) : increment)); */
			 	}else{
			 		$("#buttons").addClass("hidden");
		 			$("#mandatory").addClass("hidden");
			 		$("#amounttypeselect").val("");
			 		$("#amounttypediv").addClass("hidden");
			 		$("#invoicenodiv").addClass("hidden");
			 		$("#invoicedate").val("");
			 		$("#duedate").val("");
			 		$("#addinvoice").addClass("hidden");
			 		$("#totalamountunderline").addClass("hidden");
			 		$("#servicetax").html("0.00");
			 		$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
					
					$("#invoicedate").val("");
					$("#duedate").val("");
			 	}
			 	
			});
			/* var counter = 2;
			var removeCount = 2;
			$("#addinvoice").click(function () {
				var newemp_dynamic = $(document.createElement('tr')).attr("id", 'invoicecontenttablerow_' + counter);
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
			}); */
		
			$('#custselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#projselect").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	
			 	$("#invoicedatediv").addClass("hidden");
			 	$("#invoiceduedatediv").addClass("hidden");
			 	$("#invoiceamountdiv").addClass("hidden");
			 	$("#statusdiv").addClass("hidden");
			 	$("#invoiceamount").val("");
			 	$("#invoiceno").val("");
			 	
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
				 		$("#amounttypeselect").val("");
				 		$("#amounttypediv").addClass("hidden");
				 		$("#invoicenodiv").addClass("hidden");
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		$("#addinvoice").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						
						$("#invoicedate").val("");
						$("#duedate").val("");
				 	} else{
				 		$("#selectproject").val("");
				 		$("#projselect").addClass("hidden");
				 		$("#amounttypeselect").val("");
				 		$("#amounttypediv").addClass("hidden");
				 		$("#invoicenodiv").addClass("hidden");
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		$("#addinvoice").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						
						$("#invoicedate").val("");
						$("#duedate").val("");
				 	}
				});
			/* 
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
				 	}else{
				 		$("#mandatory").addClass("hidden");
					 	$("#buttons").addClass("hidden");
					 	$("#invoice").addClass("hidden");
					 	$("#invoicenodiv").addClass("hidden");
					 	$("#addinvoice").addClass("hidden");
					 	$("#amounttypediv").addClass("hidden");
					 	$("#amounttypeselect").val("");
					 	$("#rate_header").removeClass("hidden");
						$("#rate_value").removeClass("hidden");
				 	}
				}); */
			$('#amounttypeselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#addinvoice").addClass("hidden");
			 	$("#invoiceamountdiv").addClass("hidden");
			 	$("#statusdiv").addClass("hidden");
			 	if($("#amounttypeselect").val() != ""){
				 		$("#mandatory").removeClass("hidden");
					 	$("#buttons").removeClass("hidden");
					 	$("#invoice").removeClass("hidden");
					 	$("#invoicenodiv").removeClass("hidden");
					 	$("#addinvoice").removeClass("hidden");
					 	$("#invoiceamountdiv").removeClass("hidden");
					 	$("#statusdiv").removeClass("hidden");
					 	if($("#amounttypeselect").val() == "i"){
					 		var totalamount = $("#totalamountdivision").html();
					 		var servicetax = parseFloat(totalamount * 15 ) / 100;
							var completetotalamount = parseFloat(totalamount) + parseFloat(servicetax);
							$("#servicetax").html(servicetax.toFixed(2));
							$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
							$("#totalamountdivision").html(completetotalamount.toFixed(2));
						 	$("#totalamountunderline").removeClass("hidden");
					 		$(".headamounttype").html("&#x20B9;");
					 		$(".headamounttype").addClass("WebRupee");
					 		$(".headamounttype").addClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "u"){
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
					 	$("#addinvoice").addClass("hidden");
					 	
					 	$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
					 	$("#servicetax").html("0.00");
					 	
				 	}
				});
			
			 $('#addInvoice').click(function(){
				 		var validation = true;
				 		var customerid = $("#custselect").val();
				 		var projectid = $("#selectproject").val();
						var invoicenumber = $("#invoiceno").val();
						var invoicedate = $("#invoicedate").datepicker().val();
						var duedate = $("#duedate").datepicker().val();
						var amounttype = $("#amounttypeselect").val();
						var invoiceamount = $("#invoiceamount").val();
						var status = $("#status").val();
						
						if(customerid == "" || customerid.length == 0) validation = false;
						if(projectid == "" || projectid.length == 0) validation = false;
						if(invoicenumber == "" || invoicenumber.length == 0) validation = false;
						if(invoicedate == "" || invoicedate.length == 0) validation = false;
						if(duedate == "" || duedate.length == 0) validation = false;
						if(amounttype == "" || amounttype.length == 0) validation = false;
						if(invoiceamount == "" || invoiceamount.length == 0) validation = false;
						
						
						var invoicedatevalidation = $.datepicker.parseDate('dd-mm-yy',invoicedate);
						var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
						if ((invoicedatevalidation) > (duedatevalidation))  validation = false; 
						
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/externalinvoice/add/"+invoicenumber+"/"+invoicedate+"/"+duedate+"/"+customerid+"/"+projectid+"/"+amounttype+"/"+invoiceamount+"/"+status;
					alert(resourceURL);
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
								$("#custselect").val("null");
								$("#invoiceno").val("");
								$("#invoiceamount").val("");
								
						 		$("#projselect").addClass("hidden");
								$("#invoicenodiv").addClass("hidden");
								$("#invoicedatediv").addClass("hidden");
								$("#invoiceduedatediv").addClass("hidden");
								$("#amounttypediv").addClass("hidden");
								$("#invoiceamountdiv").addClass("hidden");
								$("#statusdiv").addClass("hidden");
								
								$("#mandatory").addClass("hidden");
								$("#buttons").addClass("hidden");
								
								$("#ctcMsgContent").html("Invoice  added successfully...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
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
		
		
	    });
	</script>
</html>