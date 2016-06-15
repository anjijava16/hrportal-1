<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
		
			<!--Expense Type List-->
			<div id="assetTypeDetails" class="hidden" style="overflow-x:none">
				<h1><b class="saptaColor">Add</b> New</h1>
				<b class="saptaColor"><div id="notify_error1"></div></b>
				<table id="assetTypeTable" >
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
						<td><input name="name" id="name" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>Display Name&nbsp;:</td>
						<td><input name="dispname" id="dispname" type="text" onkeypress="return ValidateAlpha(event)"/></td>								
					</tr>	
					<tr>
						<td class="trClass"></td>
						<td colspan=6 align="left" >
							<div class="clearWidth">
								<div class="clearTable rightElement" style="width:134px;">
									<div class="rightElement">
										<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" style="margin-left: 3px;" /></a>
									</div>
									<div class="rightElement" >
										<input type="button" value="Submit" id="addExpenseTypeDetails"/>
									</div>
								</div>
							</div>
						</td>
					</tr>			
				</table>
				<div style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
			</div>
			<div id="assetTypeList" style="padding:10px;">
				<div id="assetType">
					<div id="addasset" style="cursor: pointer;  margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
						<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new asset type"/>
					</div>
					<div id="addassettextid" class="addbutntext"><b class="saptaColor">New</b> Asset Type </div>
					<table class="data display" id="example" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Name</th>
								<th class="">Display Name</th>
								<th class="">Operation</th>
							</tr>	
						</thead>				
						<c:forEach items="${assetTypeList}" var="assetType">
							<tr>
								<td id="name_${assetType.id}">${assetType.name}</td>
								<td id="number_${assetType.id}">${assetType.dispname}</td>
								<td style="text-align:center"><a href='#' id="edit_${assetType.id}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href='#' id="delete_${assetType.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
					<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">Asset Details</b></h1>
				<b class="saptaColor"><div id="notify_error"></div></b>
				<table>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
						<td><input name="editname" id="editname" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Display Name&nbsp;:</td>
						<td><input name="editdispname" id="editdispname" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
					</tr>
					<tr class="hidden">
						<td colspan="2" align ="left"><input name="editid" id="editid" type="text" /></td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td colspan="2" align ="left">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement">
										<input type="button"  class="MRGT10PX" value="Update" id="updateDetails"/>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
			</div>
			<div id="assetMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="assetMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/assettype" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/assettype" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="confirmation" ><input type="button" value="Done" id="user" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="<%=request.getContextPath() %>/assettype" style="text-decoration: none"><input type="button" value="Cancel" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
				
		</div>
		<%@include file="footer.jsp"%>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){	
			$("body").css("cursor", "progress");
			$("#pageTitle").html("Asset Type <b class='saptaColor'>List</b>");
			$(function(){
				$("#example").dataTable({
					 "aaSorting" : []
				});
			})
			$("#menu_misc").addClass("active");
			$("body").css("cursor", "default");
			var assetTypeListSize = "${assetTypeListSize}";			
			
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${assetTypeList}" var="asset">
					if("${asset.id}"==recordid){
						$("#editname").val("${asset.name}");
						$("#editdispname").val("${asset.dispname}");
						$("#editid").val("${asset.id}");
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			
			$('#decline').click(function() {
				$.fancybox.close();
				$("body").css("cursor", "default");
			});
				
			$('#updateDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var name = $("#editname").val();
				var dispname =$("#editdispname").val();
				var id =$("#editid").val();
				if(name == "" || name.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(id == "none" || id.length == 0) validation = false;
				if(validation == false){
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/assettype/update/"+id+"/"+name+"/"+dispname;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#editname").val('');
								$("#editdispname").val('');
								$("#editid").val('');
								$("#block_overlay").addClass("hidden");
								$("#userMsgContent").html("Details updated successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
								
							}else{
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
			
			$("a[id^='delete_']").click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				$("#confirmMsgContent").html("Are you sure want to delete ?");
				$.fancybox.open('#confirmMsg', {hideOnOverlayClick : false});
				var id = $(this).attr('id');
				var recordid = id.substring(7);
				$("#confirmation").click(function() {
					var resourceURL = $("#contextpath").val()+"/assettype/delete/"+recordid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Deleted successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
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
				});
				$("body").css("cursor", "default");	
			});
			
			$('#addExpenseTypeDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var name = $("#name").val();
				var dispname =$("#dispname").val();
				if(name == "" || name.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_error1").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/assettype/add/"+name+"/"+dispname;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#name").val('');
								$("#dispname").val('');
								$("#assetMsgContent").html("Asset Type added successfully...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
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
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.open('#assetTypeDetails');
			 });
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			
			$('#addasset').click(function() {
				$("#name").val('');
				$("#dispname").val('');
				$.fancybox.open('#assetTypeDetails');
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>