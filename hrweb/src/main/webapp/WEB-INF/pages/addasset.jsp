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
				<div id="asset">
					<table id="asset" style="margin-top: 20px">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
							<td><input name="names" id="names" type="text" onkeypress="return ValidateAlpha(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Asset Type&nbsp;:</td>
							<td align="left">						
								<select id="sassettypeid" class="" style=" text-align: center;">
									<option value="" style="text-align: center;">--- Select Asset Type ---</option> 
									<c:forEach items="${assetTypeList}" var="assetType">
										<option value="${assetType.id}" style="text-align: left;">${assetType.dispname}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Price&nbsp;:</td>
							<td><input name="price" id="price" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Vendors&nbsp;:</td>
							<td align="left">						
								<select id="svendorid" class="" style=" text-align: center;">
									<option value="" style="text-align: center;">--- Select Vendors ---</option> 
									<c:forEach items="${vendorList}" var="vendor">
										<option value="${vendor.id}" style="text-align: left;">${vendor.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Date of Purchased&nbsp;:</td>
							<td><b style="float:left"><input name="date" type="text" id="date" class="datePcK" readonly="readonly"/></b></td>
							<td align="right">Guarantee Expired&nbsp;:</td>
							<td><b style="float:left"><input name="gdate" id="gdate" type="text" class="datePcK " readonly="readonly"/></b></td>
						</tr>
						<tr>
							<td align="right">Warranty Expired&nbsp;:</td>
							<td><b style="float:left"><input name="wdate" id="wdate" type="text" class="datePcK" readonly="readonly"/></b></td>
						</tr>
					</table>
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addAsset"/>
							</div>
						 </div>
					</div>
					<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
						</div>
					</div>
					<div id="confirmMsg" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style="margin-top: 10px">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
					</div>
				</div>
			</div>
			<div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
	<!--Content Area END-->
	 	 	
		</div>   
		 <%@include file="footer.jsp"%>
	</body>       
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_misc").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Asset");
			$(function() {
	            $( "#date, #wdate, #gdate" ).datepicker({
	               yearRange: '1950:2100',
				   defaultDate: new Date(),
	               changeMonth:true,
	               changeYear:true,
	               showOn: "button",
	               buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	               buttonImageOnly: true,
	               dateFormat :"dd-mm-yy"
	            });
	         });
			
			$('#addAsset').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				
				var name = $("#names").val();
				var assettypeid = $("#sassettypeid").val();
				var dateofpurchased = $("#date").datepicker().val();
				dateofpurchased = dateofpurchased.split('/').join('-');
				var vendorid = $("#svendorid").val();
				var warrantyofexpired = $("#wdate").datepicker().val();
				warrantyofexpired = warrantyofexpired.split('/').join('-');
				var guranteeofexpired = $("#gdate").datepicker().val();
				guranteeofexpired = guranteeofexpired.split('/').join('-');
				var price = $("#price").val();
				
				
				if(name == "" || name.length == 0) validation = false;
				if(assettypeid == "" || assettypeid.length == 0) validation = false;
				if(dateofpurchased == "" || dateofpurchased.length == 0) validation = false; 
				if(vendorid == "" || vendorid.length == 0) validation = false; 
				/* if(warrantyofexpired == "" || warrantyofexpired.length == 0) validation = false; 
				if(guranteeofexpired == "" || guranteeofexpired.length == 0) validation = false; */ 
				/* 	if ((warrantyofexpiredvalidation) => (guranteeofexpiredvalidation))  validation = false; 	 */	
				if(price == "" || price.length == 0) validation = false;
				var dateofpurchasedvalidation = $.datepicker.parseDate('dd-mm-yy',dateofpurchased);
				var warrantyofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',warrantyofexpired);
				var guranteeofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',guranteeofexpired);
				if(warrantyofexpired != "" || warrantyofexpired.length != 0){
					if ((dateofpurchasedvalidation) >= (warrantyofexpiredvalidation))  validation = false;
				}
				if(guranteeofexpired != "" || guranteeofexpired.length != 0){
					if ((warrantyofexpiredvalidation) >= (guranteeofexpiredvalidation))  validation = false; 
				} 		
				
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(warrantyofexpired == "" || warrantyofexpired.length == 0) warrantyofexpired = "null"; 
					if ((warrantyofexpiredvalidation) => (guranteeofexpiredvalidation))  guranteeofexpired = "null"; 
					var resourceURL = $("#contextpath").val()+"/asset/add/"+name+"/"+assettypeid+"/"+dateofpurchased+"/"+vendorid+"/"+warrantyofexpired+"/"+price+"/"+guranteeofexpired;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#names").val("");
							$("#sassettypeid").val("");
							$("#date").val("");
							$("#svendorid").val("");
							$("#wdate").val("");
							$("#gdate").val("");
							$("#price").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#userMsgContent").html("Asset added successfully...");
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
			
			
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
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