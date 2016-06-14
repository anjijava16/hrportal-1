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
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr id="vendorsearch" class = "hidden">
							<td align="right"> <sup class="saptaColor">*</sup>Enter Vendor Id</td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<input name="vendorid" id="vendorid" type="text" style=" padding: 0px; margin-left: 7px; height: 22px;"/>
								<input type="button" value="Find" id="findByVendorId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>										
						</tr>
					</table>
					<div class="responsive">
						<table class="data display" id="vendorDataTable" cellspacing="0" width="100%">
							<thead>
								<tr>
								<th class="first">Vendor&nbsp;Id</th>
									<th class="">Vendor&nbsp;Code</th>
									<th class="">Vendor&nbsp;Name</th>
									<th class="">Email</th>
								</tr>	
							</thead>				
							<tbody></tbody>
						</table>
					</div>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="vendorDetail" class="hidden MRGT10PX">
					<div align="left" id="back_assignlist" class="">
						<a href="#" id="show_vendor">Vendor List </a>/ Vendor Details
					</div><br/>
					<c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
							<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
						</c:when>
					</c:choose>	
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="decline" class="rightElement graybtn" type="button" value="Decline" style="  align="left"/>
					</div>
						<!-- Vendor -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent"> Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Name</td>
							<td class="value"><input id="name" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
								<td class="lableContent">Vendor Code</td>
								<td class="value"><input id="vendorcode" disabled="disabled" class="inputdisable"/></td>
							</tr>
						<tr>
							<td class="lableContent">Address</td>
							<td class="value">
								<input id="addr" disabled="disabled" class="inputdisable hidden">
								<div id="optional_addr" class="value"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Pincode</td>
							<td class="value"><input id="pincode" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Phone No</td>
							<td class="value"><input id="phoneno" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Fax</td>
							<td class="value"><input id="fax" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Mobile No</td>
							<td class="value"><input id="mobileno" disabled="disabled" maxlength="10" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr>
							<td class="lableContent">Email</td>
							<td class="value"><input id="emailid" disabled="disabled" class="inputdisable"></td>
						</tr>
					</table>
				</div>
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
				<a href="<%=request.getContextPath() %>/vendordetails/viewvendor" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
		</div>
			<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Vendor<b class='saptaColor'> List</b>");
			$("body").css("cursor", "progress");
			$(function(){
				var id = "${id}";
				var name = "${name}";
				var url = "";
				if(id.length > 0){
					url = $("#contextpath").val()+"/vendordetails/get/"+id;
				}else if(name.length > 0) {
					url = $("#contextpath").val()+"/vendordetails/getName/"+name;
				}else{
					url = $("#contextpath").val()+"/vendordetails/get";
				}
				$("#vendorDataTable").dataTable({
					"ajax": url,
					 "aaSorting" : [],
				});
			})
			$('#vendorDataTable tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	vendorDetails(id);
		    	}
		    });
			$("#menu_misc").addClass("active");
			$("body").css("cursor", "default");
			var vendorSize = "${vendorListSize}";
			if(vendorSize != null && vendorSize != 0){
				$("#vendorList").addClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").addClass("hidden");
				$("#vendorList").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
			} 
			function vendorDetails(custid){
				$("#block_overlay").removeClass("hidden");
				$("#vendorList").addClass("hidden");
				$("#vendorDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#vendorDataTable_wrapper").addClass("hidden");
				
				var resourceURL = $("#contextpath").val()+"/vendordetails/retrivebyid/"+custid;
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
								$("#name").val((result.vendorname == undefined || result.vendorname == null || result.vendorname.length <= 0) ? "-" : result.vendorname);
								$("#vendorcode").val((result.vendorcode == undefined || result.vendorcode == null || result.vendorcode.length <= 0) ? "-" : result.vendorcode);
								$("#addr").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
								$("#optional_addr").html((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
								$("#pincode").val((result.pincode == undefined || result.pincode == null || result.pincode.length <= 0) ? "-" : result.pincode);
								$("#phoneno").val((result.phoneno == undefined || result.phoneno == null || result.phoneno.length <= 0) ? "-" : result.phoneno);
								$("#fax").val((result.fax == undefined || result.fax == null || result.fax.length <= 0) ? "-" : result.fax);
								$("#mobileno").val((result.mobileno == undefined || result.mobileno == null || result.mobileno.length <= 0) ? "-" : result.mobileno);
								$("#emailid").val((result.email == undefined || result.email == null || result.email.length <= 0) ? "-" : result.email);
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
			$('#findoption').on('change', function (e) {
				$("#vendorid").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/vendordetails/get";
					$("#vendorgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});

					$("#vendorgridtable").trigger("reloadGrid");
					$("#vendorList").addClass("hidden");
					$("#vendorsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#vendorDetail").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#vendorList").addClass("hidden");
					$("#vendorDetail").addClass("hidden");
					$("#vendorsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					$('#vendorid').on('change', function (e) {
						if($("#vendorid").val() != ""){
							var id =	$("#vendorid").val();
							$("#vendorDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#vendorList").addClass("hidden");
							$("#vendorDetail").addClass("hidden");
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
				$("#addr").removeClass("hidden");
				$("#optional_addr").addClass("hidden");
				//Clearing " - " values if the value was null
				
				if($("#name").val() == "-"){
					$("#name").val("");
				}
				if($("#vendorcode").val() == "-"){
					$("#vendorcode").val("");
				}
				if($("#addr").val() == "-"){
					$("#addr").val("");
				}
				if($("#pincode").val() == "-" || $("#pincode").val() == null){
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
				$("#vendorcode").prop( "disabled", false );
				$("#addr").prop( "disabled", false );
				$("#pincode").prop( "disabled", false );
				$("#phoneno").prop( "disabled", false );
				$("#fax").prop( "disabled", false );
				$("#mobileno").prop( "disabled", false );
				$("#emailid").prop( "disabled", false );
				
				$("#id").removeClass("inputdisable");
				$("#name").removeClass("inputdisable");
				$("#vendorcode").removeClass("inputdisable");
				$("#addr").removeClass("inputdisable");
				$("#pincode").removeClass("inputdisable");
				$("#phoneno").removeClass("inputdisable");
				$("#fax").removeClass("inputdisable");
				$("#mobileno").removeClass("inputdisable");
				$("#emailid").removeClass("inputdisable");
				
				$("#id").addClass("inputBorder"); 
				$("#name").addClass("inputBorder");
				$("#vendorcode").addClass("inputBorder");
				$("#addr").addClass("inputBorder");
				$("#pincode").addClass("inputBorder");
				$("#phoneno").addClass("inputBorder");
				$("#fax").addClass("inputBorder");
				$("#mobileno").addClass("inputBorder");
				$("#emailid").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			$("#decline_yes").click(function() {
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment About Details
				declineVendorDeatils();
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#vendorcode").prop( "disabled", true );
				$("#addr").prop( "disabled", true );
				$("#pincode").prop( "disabled", true );
				$("#phoneno").prop( "disabled", true );
				$("#fax").prop( "disabled", true );
				$("#mobileno").prop( "disabled", true );
				$("#emailid").prop( "disabled", true );
				
				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#vendorcode").removeClass("inputBorder");
				$("#addr").removeClass("inputBorder");
				$("#pincode").removeClass("inputBorder");
				$("#phoneno").removeClass("inputBorder");
				$("#fax").removeClass("inputBorder");
				$("#mobileno").removeClass("inputBorder");
				$("#emailid").removeClass("inputBorder");
				
				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#vendorcode").addClass("inputdisable");
				$("#addr").addClass("inputdisable");
				$("#pincode").addClass("inputdisable");
				$("#phoneno").addClass("inputdisable");
				$("#fax").addClass("inputdisable");
				$("#mobileno").addClass("inputdisable");
				$("#emailid").addClass("inputdisable");
				$.fancybox.close();
			});
			function declineVendorDeatils(){
				$("#block_overlay").removeClass("hidden");
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/vendordetails/retrivebyid/"+id;
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
								$("#name").val((result.vendorname == undefined || result.vendorname == null || result.vendorname.length <= 0) ? "-" : result.vendorname);
								$("#vendorcode").val((result.vendorcode == undefined || result.vendorcode == null || result.vendorcode.length <= 0) ? "-" : result.vendorcode);
								$("#addr").val((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
								$("#optional_addr").html((result.address == undefined || result.address == null || result.address.length <= 0) ? "-" : result.address);
								$("#optional_addr").removeClass("hidden");
								$("#addr").addClass("hidden");
								$("#pincode").val((result.pincode == undefined || result.pincode == null || result.pincode.length <= 0) ? "-" : result.pincode);
								$("#phoneno").val((result.phoneno == undefined || result.phoneno == null || result.phoneno.length <= 0) ? "-" : result.phoneno);
								$("#fax").val((result.fax == undefined || result.fax == null || result.fax.length <= 0) ? "-" : result.fax);
								$("#mobileno").val((result.mobileno == undefined || result.mobileno == null || result.mobileno.length <= 0) ? "-" : result.mobileno);
								$("#emailid").val((result.email == undefined || result.email == null || result.email.length <= 0) ? "-" : result.email);
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
				var id = $("#id").val();
				var name = $("#name").val();
				var vendorcode = $("#vendorcode").val();
				var address = $("#addr").val();
				address = address.replace("#","=");
				address = address.replace("/","*");
				var pincode = $("#pincode").val();
				var phoneno = $("#phoneno").val();
				var fax = $("#fax").val();
				var mobileno = $("#mobileno").val();
				var emailid = $("#emailid").val();
				if(name == "" || name.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				/* if(pincode == "" || pincode.length == 0) validation = false; */
				/* if(emailid == "" || emailid.length == 0) validation = false; */
				if(vendorcode == "" || vendorcode.length == 0) validation = false;
				if(emailid != "" || emailid.length > 0){
					if(!validateEmail(emailid)) validation = false;
				}
				if(mobileno != "" || mobileno.length > 0){
					if(mobileno.length < 10) validation = false;
				}
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(phoneno == "" || phoneno == "-" || phoneno.length == 0) phoneno = "null";
					if(pincode == "" || pincode == "-" || pincode.length == 0) pincode = "null";
					if(fax == "" || fax == "-" || fax.length == 0) fax = "null";
					if(mobileno == "" || mobileno == "-" || mobileno.length == 0) mobileno = "null";
					if(emailid == "" || emailid == "-" || emailid.length == 0) emailid = "null";
					var resourceURL = $("#contextpath").val()+"/vendordetails/update/"+id+"/"+name+"/"+address+"/"+pincode+"/"+phoneno+"/"+fax+"/"+emailid+"/"+mobileno+"/"+vendorcode;	
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
								if($("#vendorcode").val() == "" || $("#vendorcode").val() == "-"){
									$("#vendorcode").val("-");
								}
								if($("#addr").val() == "" || $("#addr").val() == "-"){
									$("#addr").val("-");
								}
								if($("#pincode").val() == "" || $("#pincode").val() == "-"){
									$("#pincode").val("-");
								}
								if($("#phoneno").val() == "" || $("#phoneno").val() == "-"){
									$("#phoneno").val("-");
								}
								if($("#fax").val() == "" || $("#fax").val() == "-"){
									$("#fax").val("-");
								}
								if($("#mobileno").val() == "" || $("#mobileno").val() == "-"){
									$("#mobileno").val("-");
								}
								if($("#emailid").val() == "" || $("#emailid").val() == "-"){
									$("#emailid").val("-");
								}
								
								if($("#addr").val() == "" || $("#addr").val() == "-"){
									$("#optional_addr").html("-");
								}else{
									address = address.replace("=", "#");
									address = address.replace("*", "/");
									$("#optional_addr").html(address);
								}
								$("#optional_addr").removeClass("hidden");
								$("#addr").addClass("hidden");
								
								$("#id").prop( "disabled", true );
								$("#name").prop( "disabled", true );
								$("#vendorcode").prop( "disabled", true );
								$("#addr").prop( "disabled", true );
								$("#pincode").prop( "disabled", true );
								$("#phoneno").prop( "disabled", true );
								$("#fax").prop( "disabled", true );
								$("#mobileno").prop( "disabled", true );
								$("#emailid").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#name").removeClass("inputBorder");
								$("#vendorcode").removeClass("inputBorder");
								$("#addr").removeClass("inputBorder");
								$("#pincode").removeClass("inputBorder");
								$("#phoneno").removeClass("inputBorder");
								$("#fax").removeClass("inputBorder");
								$("#mobileno").removeClass("inputBorder");
								$("#emailid").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#name").addClass("inputdisable");
								$("#vendorcode").addClass("inputdisable");
								$("#addr").addClass("inputdisable");
								$("#pincode").addClass("inputdisable");
								$("#phoneno").addClass("inputdisable");
								$("#fax").addClass("inputdisable");
								$("#mobileno").addClass("inputdisable");
								$("#emailid").addClass("inputdisable"); 
								$("#block_overlay").addClass("hidden");
								$("#alertMsgContent").html("Vendor details updated successfully...");
								$.fancybox.open('#alertMsg');
							}else{
								$("#block_overlay").addClass("hidden");
								$("#edit").addClass("hidden");
								$("#delete").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
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
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/vendordetails/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						$("#block_overlay").addClass("hidden");
						if(successflag == "true"){
								$("#successful_msg_content").html("Vendor deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
								//vendorDeleteReloader();
						}else{
							$("#errorMsgContent").html("Parent row cant be deleted.....");
							$.fancybox.open('#errorMsg');
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
			 $("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 }); 
			$("#vendorid").click(function() {
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/vendordetails/viewvendor/"+$("#vendorid").val();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
				
			function vendorDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/vendordetails/get";
				$("#vendorgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#vendorgridtable").trigger("reloadGrid");
				$("#vendorList").removeClass("hidden");
				$("#vendorsearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#vendorDetail").addClass("hidden");
			}
			
			$('#vendorid').keypress(function(event){
				$("body").css("cursor", "progress");
				if(event.keyCode == 13) {
					$("#vendorList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#vendorDetail").addClass("hidden");
					findbyvendorid();
				} 
				$("body").css("cursor", "default");
			});
			
			$("#findByVendorId").click(function() {
				$("body").css("cursor", "progress");
				
				$("#vendorList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#vendorDetail").addClass("hidden");
				findbyvendorid();
				
				$("body").css("cursor", "default");
			});
			function findbyvendorid(){
				$("body").css("cursor", "progress");
				var count = 0;
				var id = $("#vendorid").val().split(" ").join("");
				<c:forEach items="${vendorList}" var="vendor">
					if(id=="${vendor.id}"){
						var resourceURL = $("#contextpath").val()+"/vendordetails/get/"+id;
						$("#vendorgridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#vendorgridtable").trigger("reloadGrid");
						count++;
						$("#vendorList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Vendor details not found for the given id " + id.bold();
					$.fancybox.open('#alertMsg');
					var resourceURL = $("#contextpath").val()+"/vendordetails/get";
					$("#vendorgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#vendorgridtable").trigger("reloadGrid");
				}
				$("body").css("cursor", "default");
			}
			$("#show_vendor").click(function(){
				$("body").css("cursor", "progress");
				var table = $("#vendorDataTable").DataTable().destroy();
				var resourceURL = $("#contextpath").val()+"/vendordetails/get";
				
				$("#vendorDataTable").dataTable({
					"ajax": resourceURL,
					 "aaSorting" : [],
				});
				$("#vendorDetail").addClass("hidden");
				$("#vendorList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				
				$("#vendorsearch").addClass("hidden");
				$("#findoption").val("all");
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#vendorcode").prop( "disabled", true );
				$("#addr").prop( "disabled", true );
				$("#pincode").prop( "disabled", true );
				$("#phoneno").prop( "disabled", true );
				$("#fax").prop( "disabled", true );
				$("#mobileno").prop( "disabled", true );
				$("#emailid").prop( "disabled", true );
				
				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#vendorcode").removeClass("inputBorder");
				$("#addr").removeClass("inputBorder");
				$("#pincode").removeClass("inputBorder");
				$("#phoneno").removeClass("inputBorder");
				$("#fax").removeClass("inputBorder");
				$("#mobileno").removeClass("inputBorder");
				$("#emailid").removeClass("inputBorder");
				
				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#vendorcode").addClass("inputdisable");
				$("#addr").addClass("inputdisable");
				$("#pincode").addClass("inputdisable");
				$("#phoneno").addClass("inputdisable");
				$("#fax").addClass("inputdisable");
				$("#mobileno").addClass("inputdisable");
				$("#emailid").addClass("inputdisable");
				
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>
