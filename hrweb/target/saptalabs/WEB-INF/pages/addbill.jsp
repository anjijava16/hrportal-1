<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style type="text/css">
			.ui-datepicker-trigger {
			    margin-left: 11px;
			    margin-top: 13px;
			}
			
		</style>
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		<!--Header Start-->
		
		<!--Header End-->
		<!--Content Area START-->
			<div id="contentArea">
				<div id="vendor">
					<div id = "vendorselect" align="center" style="width:100%">
						<table  align ="center" class="optionTable">
							<tr>
								<td align="right" style="width:45%;" ><sup class="saptaColor">*</sup>Choose&nbsp;Vendor&nbsp;:</td>
								<td align="left">						
									<select id="vendselect" class="MARTOP13PX leftElement" tabindex="2" style="  text-align: center;">
										<option value="null" style="text-align: center;">--- Select Vendor ---</option> 
										<c:forEach items="${vendorList}" var="vendorlist">
											<option value="${vendorlist.id}" style="text-align: left;">${vendorlist.id} - ${vendorlist.name} </option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr id = "BillNo" class ="hidden">
								<td align="right" >Bill&nbsp;Number&nbsp;:</sup></td>
								<td align="left">						
										<input id="billno" disabled="disabled" class="MRGL10PX MARTOP13PX inputdisabletxtbold"  />
								</td>
							</tr>
						</table>
					</div>
					<!-- <div id = "BillNo" class="cmnTable hidden">
						<table width = "443px" align ="center">
							<tr id = "BillNo" >
								<td align="right" >Bill&nbsp;Number&nbsp;&nbsp;:</sup></td>
								<td align="left">						
										<input id="billno" disabled="disabled" class="WIDT143PX  FONT11PX MARTOP13PX inputdisabletxtbold"  />
								</td>
							</tr>
						</table>
					</div> -->
					<div class="responsive" style="margin-top:10px">
						<table id="bills" class="hidden">
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Bill Date&nbsp;:</td>
								<td><b style="float:left"><input name="billdate" id="billdate" readonly="readonly" type="text"  class="datePcK"/></b></td>
								<td align="right"><sup class="saptaColor">*</sup>Due Date&nbsp;:</td>
								<td><b style="float:left"><input name="duedates" id="duedates" readonly="readonly" type="text"  class="datePcK"/></b></td>
							</tr>
							<tr>
								
								<td align="right"><sup class="saptaColor">*</sup>Due Amount&nbsp;:</td>
								<td><input name="dueamounts" id="dueamounts" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>
								<td align="right"><sup class="saptaColor">*</sup>Amount Type&nbsp;:</td>
								<td>
									<select id="type" name = "type" style="text-align: center;">
									    <option value="" style="text-align: center;">--- Select ---</option>
										<option value="i" style="text-align: left;">INR</option>
										<option value="u" style="text-align: left;">USD</option>
										<option value="e" style="text-align: left;">EUR</option>
										<option value="g" style="text-align: left;">GBP</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Comments&nbsp;:</td>
								<td><textarea style="height: 100px; resize:none;" id="comments" name="comments"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="clearWidth hidden" id="buttons">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addBill"/>
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
			<div style="text-align: center;" id="mandatory" class=" mandContent hidden"><b class="saptaColor">*</b>mandatory fields</div>
		<%@include file="footer.jsp"%>
	</div>   
	</body>
	  <script type="text/javascript">
	  $(document).ready(function(){
		  $("option").css("border-right", "");
			$("body").css("cursor", "progress");
			$("#menu_payments").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>Add</b> Bill");
			$(function() {
				 $( "#billdate, #duedates" ).datepicker({
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
			
			$('#vendselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#bills").removeClass("hidden");
			 	$("#BillNo").addClass("hidden");
			 	if($("#vendselect").val() != "null"){
			 		$("#mandatory").removeClass("hidden");
				 	$("#buttons").removeClass("hidden");
				 	$("#bills").removeClass("hidden");
				 	//var projectcode = null;
				 	var vendorcode = null;
				 	var billnum = 0;
				 	var id = null;
				 	
				 	var resourceURL = $("#contextpath").val()+"/vendordetails/retrivebyid/"+$("#vendselect").val();
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
				        			vendorcode = result.vendorcode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	 var url = $("#contextpath").val()+"/bills/retrivebyVendor/"+$("#vendselect").val();
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
				        		for(var i=0;i<results.length;i++){
				        			billnum = results[0].billno;
				        		}
				        	}else{
				        		billnum = 0;
				        	} 
				        }/* ,
				        error: function (xhr, ajaxOptions, thrownError) {
				        	alert("4");
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		} */
				   });
				 	if(billnum != 0){
				 	 billnum = billnum.split("-");
				 	var increment = 0;
				 	var billarray = billnum[3]; 
				 	increment = parseInt(billarray)+1;
				 	}else{
				 		increment = billnum+1;
				 	}
				 	$("#billno").val("SL-BILL-"+vendorcode+"-"+((increment <=9) ? ("0"+ increment) : increment));
				 	$("#BillNo").removeClass("hidden");  
			 	}else{
			 		$("#mandatory").addClass("hidden");
				 	$("#buttons").addClass("hidden");
				 	$("#bills").addClass("hidden");
			 	}
			});
				 	
				 	
			$('#addBill').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				//invoice
				var vendid = $("#vendselect").val();
				var billdate = $("#billdate").datepicker().val();
				var duedate = $("#duedates").datepicker().val();
				var dueamount = $("#dueamounts").val();
				var amounttype = $("#type").val();
				var comments = $("#comments").val();
				//var status = $("#stat").val();
				var billno = $("#billno").val();
				var duedatevalidation ="";
				
				if(billno == "" || billno.length == 0) validation = false;
				if(billdate == "" || billdate.length == 0) validation = false;
				if(duedate == "" || duedate.length == 0) validation = false;
				if(dueamount == "" || dueamount.length == 0) validation = false;
				if(vendid == "" || vendid.length == 0) validation = false;
				//if(status == "" || status.length == 0) validation = false;
				if(amounttype == "" || amounttype.length == 0) validation = false;
				if(comments == "" || comments.length == 0) validation = false;
				var billdatevalidation = $.datepicker.parseDate('dd-mm-yy',billdate);
				if(duedate != ""){
					duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
					if ((billdatevalidation) > (duedatevalidation))  validation = false; 
				}else{
					duedate = "null";
				}
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/bills/add/"+billdate+"/"+duedate+"/"+dueamount+"/"+amounttype+"/"+vendid+"/"+billno+"/"+comments;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#billdate").val("");
							$("#vendid").val("");
							$("#duedates").val("");
							$("#dueamounts").val("");
							$("#type").val("");
							$("#comments").val("");
							//$("#stat").val("");
							$("#vendselect").val("");
							$("#mandatory").addClass("hidden");
						 	$("#buttons").addClass("hidden");
						 	$("#bills").addClass("hidden");
						 	$("#BillNo").addClass("hidden");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#userMsgContent").html("Bill added successfully ...");
								$.fancybox.open('#userMsg');
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
		});
	  
	
	
	  
	</script>
</html>
