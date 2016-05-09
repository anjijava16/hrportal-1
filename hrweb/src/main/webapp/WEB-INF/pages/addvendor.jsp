<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
			.ui-datepicker-trigger {
			    margin-left: 10px;
			    margin-top: 13px;
			}
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
					<table id="vendor">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
							<td><input name="names" id="names" type="text"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Vendor Code&nbsp;:</td>
							<td><input name="vendorcode" id="vendorcode" type="text"/></td>
						</tr>
						<tr>
							<td align="right">Phone No&nbsp;:</td>
							<td><input name="phon" id="phon" type="text" onkeypress="return validateNumeric(event)"/></td>
							<td align="right">Mobile No&nbsp;:</td>
							<td><input name="mob" id="mob" type="text"  maxlength="10" minlength="10" onkeypress="return validateNumeric(event)"/></td>
						</tr>
						<tr>
							<td align="right">Email&nbsp;:</td>
							<td><input name="emailid" id="emailid" type="text" /></td>
							<td align="right"><sup class="saptaColor">*</sup>Pincode&nbsp;:</td>
							<td><input name="pin" id="pin" type="text" /></td>
						</tr>
						<tr>
							<td align="right">Fax&nbsp;:</td>
							<td><input name="faxs" id="faxs" type="text"  onkeypress="return validateNumeric(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Address&nbsp;:</td>
							<td><textarea style="height: 100px; resize:none;" id="addr" name="addr"></textarea></td>
						</tr>
					</table>
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addVendor"/>
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
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
					</div>
				</div>
			</div>
			<div style="text-align: center;"  class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
	<!--Content Area END-->
		</div> 
		<%@include file="footer.jsp"%>  
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_misc").addClass("active");
			$("#pageTitle").html(" <b class='saptaColor'>New</b> Vendor");
			$('#addVendor').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				//vendor
				var name = $("#names").val();
				var vendorcode = $("#vendorcode").val();
				var address = $("#addr").val();
				address = address.replace("#","=");
				address = address.replace("/","*");
				var phoneno = $("#phon").val();
				var mobileno = $("#mob").val();
				var email = $("#emailid").val();
				var pincode = $("#pin").val();
				var fax = $("#faxs").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(vendorcode == "" || vendorcode.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				if(pincode == "" || pincode.length == 0) validation = false;
				if(email != "" || email.length > 0){
					if(!validateEmail(email)) validation = false;
				}
				
				 
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(fax == "" || fax.length == 0) fax = "null";
					if(phoneno == "" || phoneno.length == 0) phoneno = "null";
					if(mobileno == "" || mobileno.length == 0) mobileno = "null";
					if(email == "" || email.length == 0) email = "null";
					var resourceURL = $("#contextpath").val()+"/vendordetails/add/"+name+"/"+address+"/"+phoneno+"/"+mobileno+"/"+email+"/"+pincode+"/"+fax+"/"+vendorcode;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#names").val("");
							$("#vendorcode").val("");
							$("#addr").val("");
							$("#phon").val("");
							$("#mob").val("");
							$("#emailid").val("");
							$("#pin").val("");
							$("#faxs").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#userMsgContent").html("Vendor added successfully...");
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