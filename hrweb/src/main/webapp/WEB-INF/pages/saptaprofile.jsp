<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
			<div id="contentArea">
			
				<div class = "content" style=" border: none;">
					
					 <c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							<td align = "right"><input type="button" value="Add" id="add"/></td>	
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							<td align = "right"><input type="button" value="Edit" id="edit"/></td>	
						</c:when>
					</c:choose>
					<div id="submitbutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Submit"  id="submit"/>
						<input  id="submit_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
					</div>
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="update_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
					</div>
					<table class="tableContent">
						<tr class = "">
							<td class="lableContent">Company Name<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="companyname" disabled="disabled" class="inputdisable hidden"  onkeypress="return ValidateAlpha(event)" value="${saptaprofileList.companyname}"></input><div id="optional_companyname">${saptaprofileList.companyname}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Company Address<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="address" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.address}"></input><div id="optional_address">${saptaprofileList.address}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Office Phone No<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="phoneno" disabled="disabled" class="inputdisable hidden" onkeypress="return validateNumeric(event)" value="${saptaprofileList.officephno}"></input><div id="optional_phoneno">${saptaprofileList.officephno}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Website<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="website" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.website}"></input><div id="optional_website">${saptaprofileList.website}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Mobile No<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="mobileno" disabled="disabled" class="inputdisable hidden" onkeypress="return validateNumeric(event)" maxlength="10" value="${saptaprofileList.mobilenum}"></input><div id="optional_mobileno">${saptaprofileList.mobilenum}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Email<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="email" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.emailid}"></input><div id="optional_email">${saptaprofileList.emailid}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">City<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="city" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.city}" onkeypress="return ValidateAlpha(event)"></input><div id="optional_city">${saptaprofileList.city}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Pincode<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="pincode" disabled="disabled" class="inputdisable hidden" maxlength="6" onkeypress="return validateNumeric(event)" value="${saptaprofileList.pincode}"></input><div id="optional_pincode">${saptaprofileList.pincode}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">State<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="state" disabled="disabled" class="inputdisable hidden" onkeypress="return ValidateAlpha(event)" value="${saptaprofileList.state}"></input><div id="optional_state">${saptaprofileList.state}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Country<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="country" disabled="disabled" class="inputdisable hidden" onkeypress="return ValidateAlpha(event)" value="${saptaprofileList.country}"></input><div id="optional_country">${saptaprofileList.country}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">TAN<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="tan" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.tan}"></input><div id="optional_tan">${saptaprofileList.tan}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">PAN<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="pan" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.pan}"></input><div id="optional_pan">${saptaprofileList.pan}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">CIN<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="cin" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.cin}"></input><div id="optional_cin">${saptaprofileList.cin}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">ST<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="st" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.st}"></input><div id="optional_st">${saptaprofileList.st}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Account Name<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="accountname" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.accntname}" onkeypress="return ValidateAlpha(event)"></input><div id="optional_accountname">${saptaprofileList.accntname}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Account Number<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="accountnum" disabled="disabled" class="inputdisable hidden" onkeypress="return validateNumeric(event)" value="${saptaprofileList.accntnum}"></input><div id="optional_accountnum">${saptaprofileList.accntnum}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Bank Name<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="bankname" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.bankname}" onkeypress="return ValidateAlpha(event)"></input><div id="optional_bankname">${saptaprofileList.bankname}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Bank Branch<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="bankbranch" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.bankbranch}"></input><div id="optional_bankbranch">${saptaprofileList.bankbranch}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">IFS Code<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="ifsccode" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.ifsccode}"></input><div id="optional_ifsccode">${saptaprofileList.ifsccode}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Swift Code<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="swiftcode" disabled="disabled" class="inputdisable hidden" value="${saptaprofileList.swiftcode}"></input><div id="optional_swiftcode">${saptaprofileList.swiftcode}</div></td>
						</tr>
						<tr class = "">
							<td class="lableContent">Branch Address<sup class="saptaColor mandatory hidden">*</sup></td>
							<td class="value"><input id="branchaddress" disabled="disabled" class="inputdisable hidden hidden" value="${saptaprofileList.branchaddress}"></input><div id="optional_branchaddress">${saptaprofileList.branchaddress}</div></td>
						</tr>
						<tr class = "hidden">
							<td class="lableContent">Id</td>
							<td class="value"><input id="id"  value="${saptaprofileList.id}"></input><div id="optional_id">${saptaprofileList.id}</div></td>
						</tr>
					</table>
				</div>
				<div id="mandatoryfields" class="hidden" style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
				</div>
			</div> 
			<div id="update_userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="update_userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/saptaprofile/viewsaptaprofile" ><input type="button" value="Done" id="user" /></a>
				</div>
			</div> 
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="submit_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="submit_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="update_confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="update_confirmationMsgContentDecline"></div>
				<input type="button" id="update_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="update_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Saptalabs <b class='saptaColor'>Profile</b>");
			$("body").css("cursor", "progress");
			$("#menu_misc").addClass("active");
			var saptaprofilelistSize = "${saptaprofileList}";
			if(saptaprofilelistSize != null && saptaprofilelistSize != 0 ){
				$("#add").addClass("hidden");
				$("#edit").removeClass("hidden");
			}else{
				$("#edit").addClass("hidden");
				$("#add").removeClass("hidden");
			} 
			
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#add").addClass("hidden");
				$(".mandatory").removeClass("hidden");
				$("#mandatoryfields").removeClass("hidden");
				$("#updatebutton").removeClass("hidden");
				$("#edit").addClass("hidden");
				
				$("#companyname").removeClass("hidden");
				$("#optional_companyname").addClass("hidden");
				
				$("#address").removeClass("hidden");
				$("#optional_address").addClass("hidden");
				/* $("#branchaddress").removeClass("hidden");
				$("#optional_branchaddress").addClass("hidden"); */
				
				$("#phoneno").removeClass("hidden");
				$("#optional_phoneno").addClass("hidden");
				
				$("#website").removeClass("hidden");
				$("#optional_website").addClass("hidden");
				
				$("#mobileno").removeClass("hidden");
				$("#optional_mobileno").addClass("hidden");
				
				$("#email").removeClass("hidden");
				$("#optional_email").addClass("hidden");
				
				$("#tan").removeClass("hidden");
				$("#optional_tan").addClass("hidden");
				
				$("#pan").removeClass("hidden");
				$("#optional_pan").addClass("hidden");
				
				$("#cin").removeClass("hidden");
				$("#optional_cin").addClass("hidden");
				
				$("#st").removeClass("hidden");
				$("#optional_st").addClass("hidden");
				
				$("#accountname").removeClass("hidden");
				$("#optional_accountname").addClass("hidden");
				
				$("#accountnum").removeClass("hidden");
				$("#optional_accountnum").addClass("hidden");
				
				$("#bankname").removeClass("hidden");
				$("#optional_bankname").addClass("hidden");
				
				$("#bankbranch").removeClass("hidden");
				$("#optional_bankbranch").addClass("hidden");
				
				$("#ifsccode").removeClass("hidden");
				$("#optional_ifsccode").addClass("hidden");
				
				$("#swiftcode").removeClass("hidden");
				$("#optional_swiftcode").addClass("hidden");
				
				$("#branchaddress").removeClass("hidden");
				$("#optional_branchaddress").addClass("hidden");
				
				$("#city").removeClass("hidden");
				$("#optional_city").addClass("hidden");
				
				$("#pincode").removeClass("hidden");
				$("#optional_pincode").addClass("hidden");
				
				$("#state").removeClass("hidden");
				$("#optional_state").addClass("hidden");
				
				$("#country").removeClass("hidden");
				$("#optional_country").addClass("hidden");
				
				
				$("#companyname").prop("disabled",false);
				$("#address").prop("disabled",false);
				$("#website").prop("disabled",false);
				$("#phoneno").prop("disabled",false);
				$("#mobileno").prop("disabled",false);
				$("#email").prop("disabled",false);
				$("#tan").prop("disabled",false);
				$("#pan").prop("disabled",false);
				$("#cin").prop("disabled",false);
				$("#st").prop("disabled",false);
				$("#accountname").prop("disabled",false);
				$("#accountnum").prop("disabled",false);
				$("#bankname").prop("disabled",false);
				$("#bankbranch").prop("disabled",false);
				$("#ifsccode").prop("disabled",false);
				$("#swiftcode").prop("disabled",false);
				$("#branchaddress").prop("disabled",false);
				$("#optional_branchaddress").prop("disabled",false);
				$("#city").prop("disabled",false);
				$("#pincode").prop("disabled",false);
				$("#state").prop("disabled",false);
				$("#country").prop("disabled",false);
				
				$("#companyname").removeClass("inputdisable");
				$("#address").removeClass("inputdisable");
				$("#website").removeClass("inputdisable");
				$("#phoneno").removeClass("inputdisable");
				$("#mobileno").removeClass("inputdisable");
				$("#email").removeClass("inputdisable");
				$("#tan").removeClass("inputdisable");
				$("#pan").removeClass("inputdisable");
				$("#cin").removeClass("inputdisable");
				$("#st").removeClass("inputdisable");
				$("#accountname").removeClass("inputdisable");
				$("#accountnum").removeClass("inputdisable");
				$("#bankname").removeClass("inputdisable");
				$("#bankbranch").removeClass("inputdisable");
				$("#ifsccode").removeClass("inputdisable");
				$("#swiftcode").removeClass("inputdisable");
				$("#branchaddress").removeClass("inputdisable");
				$("#city").removeClass("inputdisable");
				$("#pincode").removeClass("inputdisable");
				$("#state").removeClass("inputdisable");
				$("#country").removeClass("inputdisable");
				
				$("#companyname").addClass("inputBorder");
				$("#address").addClass("inputBorder");
				$("#website").addClass("inputBorder");
				$("#phoneno").addClass("inputBorder");
				$("#mobileno").addClass("inputBorder");
				$("#email").addClass("inputBorder");
				$("#tan").addClass("inputBorder");
				$("#pan").addClass("inputBorder");
				$("#cin").addClass("inputBorder");
				$("#st").addClass("inputBorder");
				$("#accountname").addClass("inputBorder");
				$("#accountnum").addClass("inputBorder");
				$("#bankname").addClass("inputBorder");
				$("#bankbranch").addClass("inputBorder");
				$("#ifsccode").addClass("inputBorder");
				$("#swiftcode").addClass("inputBorder");
				$("#branchaddress").addClass("inputBorder");
				$("#city").addClass("inputBorder");
				$("#pincode").addClass("inputBorder");
				$("#state").addClass("inputBorder");
				$("#country").addClass("inputBorder");
				
				$("body").css("cursor", "default");
			});
			 
			$("#add").click(function() {
				$("#submitbutton").removeClass("hidden");
				$("#add").addClass("hidden");
				$(".mandatory").removeClass("hidden");
				$("#mandatoryfields").removeClass("hidden");
				$("#companyname").removeClass("hidden");
				$("#optional_companyname").addClass("hidden");
				
				$("#address").removeClass("hidden");
				$("#optional_address").addClass("hidden");
				
				$("#website").removeClass("hidden");
				$("#optional_website").addClass("hidden");
				
				$("#phoneno").removeClass("hidden");
				$("#optional_phoneno").addClass("hidden");
				
				$("#mobileno").removeClass("hidden");
				$("#optional_mobileno").addClass("hidden");
				
				$("#email").removeClass("hidden");
				$("#optional_email").addClass("hidden");
				
				$("#tan").removeClass("hidden");
				$("#optional_tan").addClass("hidden");
				
				$("#pan").removeClass("hidden");
				$("#optional_pan").addClass("hidden");
				
				$("#cin").removeClass("hidden");
				$("#optional_cin").addClass("hidden");
				
				$("#st").removeClass("hidden");
				$("#optional_st").addClass("hidden");
				
				$("#accountname").removeClass("hidden");
				$("#optional_accountname").addClass("hidden");
				
				$("#accountnum").removeClass("hidden");
				$("#optional_accountnum").addClass("hidden");
				
				$("#bankname").removeClass("hidden");
				$("#optional_bankname").addClass("hidden");
				
				$("#bankbranch").removeClass("hidden");
				$("#optional_bankbranch").addClass("hidden");
				
				$("#ifsccode").removeClass("hidden");
				$("#optional_ifsccode").addClass("hidden");
				
				$("#swiftcode").removeClass("hidden");
				$("#optional_swiftcode").addClass("hidden");
				
				$("#branchaddress").removeClass("hidden");
				$("#optional_branchaddress").addClass("hidden");
				
				$("#city").removeClass("hidden");
				$("#optional_city").addClass("hidden");
				
				$("#pincode").removeClass("hidden");
				$("#optional_pincode").addClass("hidden");
				
				$("#state").removeClass("hidden");
				$("#optional_state").addClass("hidden");
				
				$("#country").removeClass("hidden");
				$("#optional_country").addClass("hidden");
				
				$("#companyname").prop("disabled",false);
				$("#address").prop("disabled",false);
				$("#website").prop("disabled",false);
				$("#phoneno").prop("disabled",false);
				$("#mobileno").prop("disabled",false);
				$("#email").prop("disabled",false);
				$("#tan").prop("disabled",false);
				$("#pan").prop("disabled",false);
				$("#cin").prop("disabled",false);
				$("#st").prop("disabled",false);
				$("#accountname").prop("disabled",false);
				$("#accountnum").prop("disabled",false);
				$("#bankname").prop("disabled",false);
				$("#bankbranch").prop("disabled",false);
				$("#ifsccode").prop("disabled",false);
				$("#swiftcode").prop("disabled",false);
				$("#branchaddress").prop("disabled",false);
				$("#optional_branchaddress").prop("disabled",false);
				$("#city").prop("disabled",false);
				$("#pincode").prop("disabled",false);
				$("#state").prop("disabled",false);
				$("#country").prop("disabled",false);
				
				$("#companyname").removeClass("inputdisable");
				$("#address").removeClass("inputdisable");
				$("#website").removeClass("inputdisable");
				$("#phoneno").removeClass("inputdisable");
				$("#mobileno").removeClass("inputdisable");
				$("#email").removeClass("inputdisable");
				$("#tan").removeClass("inputdisable");
				$("#pan").removeClass("inputdisable");
				$("#cin").removeClass("inputdisable");
				$("#st").removeClass("inputdisable");
				$("#accountname").removeClass("inputdisable");
				$("#accountnum").removeClass("inputdisable");
				$("#bankname").removeClass("inputdisable");
				$("#bankbranch").removeClass("inputdisable");
				$("#ifsccode").removeClass("inputdisable");
				$("#swiftcode").removeClass("inputdisable");
				$("#branchaddress").removeClass("inputdisable");
				$("#city").removeClass("inputdisable");
				$("#pincode").removeClass("inputdisable");
				$("#state").removeClass("inputdisable");
				$("#country").removeClass("inputdisable");
				
				$("#companyname").addClass("inputBorder");
				$("#address").addClass("inputBorder");
				$("#website").addClass("inputBorder");
				$("#phoneno").addClass("inputBorder");
				$("#mobileno").addClass("inputBorder");
				$("#email").addClass("inputBorder");
				$("#tan").addClass("inputBorder");
				$("#pan").addClass("inputBorder");
				$("#cin").addClass("inputBorder");
				$("#st").addClass("inputBorder");
				$("#accountname").addClass("inputBorder");
				$("#accountnum").addClass("inputBorder");
				$("#bankname").addClass("inputBorder");
				$("#bankbranch").addClass("inputBorder");
				$("#ifsccode").addClass("inputBorder");
				$("#swiftcode").addClass("inputBorder");
				$("#branchaddress").addClass("inputBorder");
				$("#optional_branchaddress").addClass("inputBorder");
				$("#city").addClass("inputBorder");
				$("#pincode").addClass("inputBorder");
				$("#state").addClass("inputBorder");
				$("#country").addClass("inputBorder");
				
			});
			
			$("#submit").click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				
				var validation = true;
				var companyname = $("#companyname").val();
				var address = $("#address").val();
				address = address.replace("#","=");
				var website = $("#website").val();
				var officephno = $("#phoneno").val();
				var mobilenum = $("#mobileno").val();
				var emailid = $("#email").val();
				var tan = $("#tan").val();
				var pan = $("#pan").val();
				var cin = $("#cin").val();
				var st = $("#st").val();
				var accountname = $("#accountname").val();
				var accntnum = $("#accountnum").val();
				var bankname = $("#bankname").val();
				var bankbranch = $("#bankbranch").val();
				var ifsccode = $("#ifsccode").val();
				var swiftcode = $("#swiftcode").val();
				var branchaddress = $("#branchaddress").val();
				branchaddress = branchaddress.replace("#","=");
				var city = $("#city").val();
				var pincode = $("#pincode").val();
				var state = $("#state").val();
				var country = $("#country").val();
				
				if(companyname == "" || companyname.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				if(website == "" || website.length == 0) validation = false;
				if(officephno == "" || officephno.length == 0) validation = false;
				if(mobilenum == "" || mobilenum.length == 0) validation = false;
				if(emailid == "" || emailid.length == 0) validation = false;
				if(tan == "" || tan.length == 0) validation = false;
				if(pan == "" || pan.length == 0) validation = false;
				if(cin == "" || cin.length == 0) validation = false;
				if(st == "" || st.length == 0) validation = false;
				if(accountname == "" || accountname.length == 0) validation = false;
				if(accntnum == "" || accntnum.length == 0) validation = false;
				if(bankname == "" || bankname.length == 0) validation = false;
				if(bankbranch == "" || bankbranch.length == 0) validation = false;
				if(ifsccode == "" || ifsccode.length == 0) validation = false;
				if(swiftcode == "" || swiftcode.length == 0) validation = false;
				if(branchaddress == "" || branchaddress.length == 0) validation = false;
				if(city == "" || city.length == 0) validation = false;
				if(pincode == "" || pincode.length == 0) validation = false;
				if(state == "" || state.length == 0) validation = false;
				if(country == "" || country.length == 0) validation = false;
				if(!validateEmail(emailid)) validation = false;
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/saptaprofile/add/"+tan+"/"+pan+"/"+accountname+"/"+website+"/"+accntnum+"/"+bankname+"/"+bankbranch+"/"+ifsccode+"/"+swiftcode+"/"+branchaddress+"/"+companyname+"/"+address+"/"+city+"/"+pincode+"/"+state+"/"+country+"/"+officephno+"/"+emailid+"/"+mobilenum+"/"+cin+"/"+st;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Saptaprofile added successfully...");
								$.fancybox.open('#userMsg');
								$(".mandatory").addClass("hidden");
								$("#mandatoryfields").addClass("hidden");
								// Clearing profile
								$("#companyname").val("");
								$("#address").val("");
								$("#website").val("");
								$("#phoneno").val("");
								$("#mobileno").val("");
								$("#email").val("");
								$("#tan").val("");
								$("#pan").val("");
								$("#cin").val("");
								$("#st").val("");
								$("#accountname").val("");
								$("#accountnum").val("");
								$("#bankname").val("");
								$("#bankbranch").val("");
								$("#ifsccode").val("");
								$("#swiftcode").val("");
								$("#branchaddress").val("");
								$("#city").val("");
								$("#pincode").val("");
								$("#state").val("");
								$("#country").val("");
							}else{
								$("#errorMsgContent").html(errors);
								$.fancybox.open('#errorMsg');
							} 
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
			
			$("#update").click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				
				var id = $("#id").val();
				var companyname = $("#companyname").val();
				var address = $("#address").val();
				address = address.replace("#","=");
				var website = $("#website").val();
				var officephno = $("#phoneno").val();
				var mobilenum = $("#mobileno").val();
				var emailid = $("#email").val();
				var tan = $("#tan").val();
				var pan = $("#pan").val();
				var cin = $("#cin").val();
				var st = $("#st").val();
				var accntname = $("#accountname").val();
				var accntnum = $("#accountnum").val();
				var bankname = $("#bankname").val();
				var bankbranch = $("#bankbranch").val();
				var ifsccode = $("#ifsccode").val();
				var swiftcode = $("#swiftcode").val();
				var branchaddress = $("#branchaddress").val();
				branchaddress = branchaddress.replace("#","=");
				var city = $("#city").val();
				var pincode = $("#pincode").val();
				var state = $("#state").val();
				var country = $("#country").val();
				
				if(companyname == "" || companyname.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				if(website == "" || website.length == 0) validation = false;
				if(officephno == "" || officephno.length == 0) validation = false;
				if(mobilenum == "" || mobilenum.length == 0) validation = false;
				if(emailid == "" || emailid.length == 0) validation = false;
				if(tan == "" || tan.length == 0) validation = false;
				if(pan == "" || pan.length == 0) validation = false;
				if(cin == "" || cin.length == 0) validation = false;
				if(st == "" || st.length == 0) validation = false;
				if(accntname == "" || accntname.length == 0) validation = false;
				if(accntnum == "" || accntnum.length == 0) validation = false;
				if(bankname == "" || bankname.length == 0) validation = false;
				if(bankbranch == "" || bankbranch.length == 0) validation = false;
				if(ifsccode == "" || ifsccode.length == 0) validation = false;
				if(swiftcode == "" || swiftcode.length == 0) validation = false;
				if(branchaddress == "" || branchaddress.length == 0) validation = false;
				if(city == "" || city.length == 0) validation = false;
				if(pincode == "" || pincode.length == 0) validation = false;
				if(state == "" || state.length == 0) validation = false;
				if(country == "" || country.length == 0) validation = false;
				if(!validateEmail(emailid)) validation = false;
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/saptaprofile/update/"+id+"/"+tan+"/"+pan+"/"+accntname+"/"+website+"/"+accntnum+"/"+bankname+"/"+bankbranch+"/"+ifsccode+"/"+swiftcode+"/"+branchaddress+"/"+companyname+"/"+address+"/"+city+"/"+pincode+"/"+state+"/"+country+"/"+officephno+"/"+emailid+"/"+mobilenum+"/"+cin+"/"+st;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#add").addClass("hidden");
								$("#submitbutton").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
								$("#edit").addClass("hidden");
								$(".mandatory").addClass("hidden");
								$("#mandatoryfields").addClass("hidden");
								$("#companyname").prop("disabled",true);
								$("#optional_companyname").prop("disabled",true);
								$("#address").prop("disabled",true);
								$("#optional_address").prop("disabled",true);
								$("#website").prop("disabled",true);
								$("#optional_website").prop("disabled",true);
								$("#phoneno").prop("disabled",true);
								$("#optional_phoneno").prop("disabled",true);
								$("#mobileno").prop("disabled",true);
								$("#optional_mobileno").prop("disabled",true);
								$("#email").prop("disabled",true);
								$("#optional_email").prop("disabled",true);
								$("#tan").prop("disabled",true);
								$("#optional_tan").prop("disabled",true);
								$("#pan").prop("disabled",true);
								$("#optional_pan").prop("disabled",true);
								$("#cin").prop("disabled",true);
								$("#optional_cin").prop("disabled",true);
								$("#st").prop("disabled",true);
								$("#optional_st").prop("disabled",true);
								$("#accountname").prop("disabled",true);
								$("#optional_accountname").prop("disabled",true);
								$("#accountnum").prop("disabled",true);
								$("#optional_accountnum").prop("disabled",true);
								$("#bankname").prop("disabled",true);
								$("#optional_bankname").prop("disabled",true);
								$("#bankbranch").prop("disabled",true);
								$("#optional_bankbranch").prop("disabled",true);
								$("#ifsccode").prop("disabled",true);
								$("#optional_ifsccode").prop("disabled",true);
								$("#swiftcode").prop("disabled",true);
								$("#optional_swiftcode").prop("disabled",true);
								$("#branchaddress").prop("disabled",true);
								$("#optional_branchaddress").prop("disabled",true);
								$("#city").prop("disabled",true);
								$("#optional_city").prop("disabled",true);
								$("#pincode").prop("disabled",true);
								$("#optional_pincode").prop("disabled",true);
								$("#state").prop("disabled",true);
								$("#optional_state").prop("disabled",true);
								$("#country").prop("disabled",true);
								$("#optional_country").prop("disabled",true);
								
								$("#companyname").removeClass("inputBorder");
								$("#optional_companyname").removeClass("inputBorder");
								
								$("#address").removeClass("inputBorder");
								$("#optional_address").removeClass("inputBorder");
								$("#website").removeClass("inputBorder");
								$("#optional_website").removeClass("inputBorder");
								$("#phoneno").removeClass("inputBorder");
								$("#optional_phoneno").removeClass("inputBorder");
								$("#mobileno").removeClass("inputBorder");
								$("#optional_mobileno").removeClass("inputBorder");
								$("#email").removeClass("inputBorder");
								$("#optional_email").removeClass("inputBorder");
								$("#tan").removeClass("inputBorder");
								$("#optional_tan").removeClass("inputBorder");
								$("#pan").removeClass("inputBorder");
								$("#optional_pan").removeClass("inputBorder");
								$("#cin").removeClass("inputBorder");
								$("#optional_cin").removeClass("inputBorder");
								$("#st").removeClass("inputBorder");
								$("#optional_st").removeClass("inputBorder");
								$("#accountname").removeClass("inputBorder");
								$("#optional_accountname").removeClass("inputBorder");
								$("#accountnum").removeClass("inputBorder");
								$("#optional_accountnum").removeClass("inputBorder");
								$("#bankname").removeClass("inputBorder");
								$("#optional_bankname").removeClass("inputBorder");
								$("#bankbranch").removeClass("inputBorder");
								$("#optional_bankbranch").removeClass("inputBorder");
								$("#ifsccode").removeClass("inputBorder");
								$("#optional_ifsccode").removeClass("inputBorder");
								$("#swiftcode").removeClass("inputBorder");
								$("#optional_swiftcode").removeClass("inputBorder");
								$("#branchaddress").removeClass("inputBorder");
								$("#optional_branchaddress").removeClass("inputBorder");
								$("#city").removeClass("inputBorder");
								$("#optional_city").removeClass("inputBorder");
								$("#pincode").removeClass("inputBorder");
								$("#optional_pincode").removeClass("inputBorder");
								$("#state").removeClass("inputBorder");
								$("#optional_state").removeClass("inputBorder");
								$("#country").removeClass("inputBorder");
								$("#optional_country").removeClass("inputBorder");
								
								$("#companyname").addClass("inputdisable");
								$("#optional_companyname").addClass("inputdisable");
								$("#address").addClass("inputdisable");
								$("#optional_address").addClass("inputdisable");
								$("#website").addClass("inputdisable");
								$("#optional_website").addClass("inputdisable");
								$("#phoneno").addClass("inputdisable");
								$("#optional_phoneno").addClass("inputdisable");
								$("#mobileno").addClass("inputdisable");
								$("#optional_mobileno").addClass("inputdisable");
								$("#email").addClass("inputdisable");
								$("#optional_email").addClass("inputdisable");
								$("#tan").addClass("inputdisable");
								$("#optional_tan").addClass("inputdisable");
								$("#pan").addClass("inputdisable");
								$("#optional_pan").addClass("inputdisable");
								$("#cin").addClass("inputdisable");
								$("#optional_cin").addClass("inputdisable");
								$("#st").addClass("inputdisable");
								$("#optional_st").addClass("inputdisable");
								$("#accountname").addClass("inputdisable");
								$("#optional_accountname").addClass("inputdisable");
								$("#accountnum").addClass("inputdisable");
								$("#optional_accountnum").addClass("inputdisable");
								$("#bankname").addClass("inputdisable");
								$("#optional_bankname").addClass("inputdisable");
								$("#bankbranch").addClass("inputdisable");
								$("#optional_bankbranch").addClass("inputdisable");
								$("#ifsccode").addClass("inputdisable");
								$("#optional_ifsccode").addClass("inputdisable");
								$("#swiftcode").addClass("inputdisable");
								$("#optional_swiftcode").addClass("inputdisable");
								$("#branchaddress").addClass("inputdisable");
								$("#optional_branchaddress").addClass("inputdisable");
								$("#city").addClass("inputdisable");
								$("#optional_city").addClass("inputdisable");
								$("#pincode").addClass("inputdisable");
								$("#optional_pincode").addClass("inputdisable");
								$("#state").addClass("inputdisable");
								$("#optional_state").addClass("inputdisable");
								$("#country").addClass("inputdisable");
								$("#optional_country").addClass("inputdisable");
								$("#block_overlay").addClass("hidden");
								$("#update_userMsgContent").html("Saptaprofile updated successfully...");
								$.fancybox.open('#update_userMsg');
							}else{
								$("#add").removeClass("hidden");
								$("#submitbutton").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#edit").removeClass("hidden");
								$("#block_overlay").addClass("hidden");
								$("#errorMsgContent").html(errors);
								$.fancybox.open('#errorMsg');
							} 
							
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
			
			$("#update_decline").click(function(){
				$("#update_confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#update_confirmMsgDecline');
			});
			$("#submit_decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#submit_decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $("#update_decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $("#submit_decline_yes").click(function() {
				 window.location = $("#contextpath").val()+"/saptaprofile/viewsaptaprofile";
					$.fancybox.close();
				});
			 $("#update_decline_yes").click(function() {
					window.location = $("#contextpath").val()+"/saptaprofile/viewsaptaprofile";
					$.fancybox.close();
				});
			$("body").css("cursor", "default");
		});
	</script>
</html>
