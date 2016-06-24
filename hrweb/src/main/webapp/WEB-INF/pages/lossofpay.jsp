<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
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
		<!--Expense Type List-->
		<div id="empCTCDetails" class="hidden">
				<h1><b class="saptaColor">Add</b> New</h1>
				<b class="saptaColor"><div id="notify_errors"></div></b>
				<table id="empCTCTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee Id&nbsp;:</td>
						<td><input name="empid" id="empid" type="text"  onkeypress="return validateNumeric(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
						<td><b style="float:left"><input name="startdate" id="startdate" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
					</tr>
					<tr>
						<td align="right">End Date&nbsp;:</td>
						<td><b style="float:left"><input name="enddate" id="enddate" type="text" style="height: 20px" class="datePcK"/></b></td>
					</tr>	
					<tr>
						<td colspan=6 align ="left" class="tab_sec_mob">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement MRGL10PX">
										<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
									</div>
									<div class="rightElement MRGL10PX">
										<input type="button" value="Submit" id="addempCTCDetails"/> 
									</div>
									
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor ">*</b>mandatory fields</div>
			</div>
			<div id="employeeLOPList" style="padding:10px;">
				<div id="emplop">
					
					<div id="addctc" style="cursor: pointer; margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new ctc"/>
					</div>
					<div id="addloptextid" class="addbutntext"><b class="saptaColor">New</b> LOP</div>
					<div class="responsive">
						<table class="data display" id="ctctable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Employee&nbsp;Id</th>
									<th class="">Employee&nbsp;Name</th>
									<th class="">Start&nbsp;Date</th>
									<th class="">End&nbsp;Date</th>
									<th class="">Operation</th>
								</tr>
							</thead>					
							<c:forEach items="${emplopList}" var="emploplist">
								<tr>
									<td id="name_${emploplist.id}">${emploplist.empid}</td>
									<c:forEach items="${empdetailList}" var="employeedo">
										<c:if test="${employeedo.id == emploplist.empid}">
											<td id="empname_${emploplist.id}" >${employeedo.fname} ${employeedo.lname}</td>
										</c:if>
									</c:forEach>
									<fmt:formatDate value="${emploplist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
									<td id="startdate_${emploplist.id}" style="text-align: center;">${formattedDate}</td>
									<fmt:formatDate value="${emploplist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
									<c:if test="${emploplist.enddate == null}">
										<td id="enddate_${emploplist.id}" style="text-align: center;"></td>
									</c:if>
									<c:if test="${emploplist.enddate != null}">
										<td id="enddate_${emploplist.id}" style="text-align: center;">${formattedEndDate}</td>
									</c:if>
									
									<td style="text-align:center"><a href='#' id="edit_${emploplist.id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' id="delete_${emploplist.id}">Delete</a></td>
								</tr>
							</c:forEach>
						</table>
						</div>
					<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<div id="empctcList" class="MRGT10PX">
				<table id="empctcgridtable"></table>
				<div id="empctcgridpager"></div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">LOP Details</b></h1>
				<b class="saptaColor"><div id="notify_error" ></div></b>
				<table>
					<tr>
						<td align="right"><sup class="saptaColor " >*</sup>Employee Id :</td>						
						<td><input name="editempid" id="editempid" type="text" style="border:0;background-color: white;" disabled/></td> 
						<td align="right"  style="margin-top:9px"> <sup class="saptaColor">*</sup>Start Date :</td>
						<td><div id="editstartdate" style="font-weight: bold; margin:10px"></div></td>
					</tr>
					<tr>
						<td align="right">End Date :</td>
						<td><b style="float:left"><input name="editenddate" id="editenddate" type="text" class="datePcK"/></b></td>
						<td><b style="float:left"><input name="lopid" class="hidden" id="lopid" type="text"/></b></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="4" align ="left">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement" align="left">
										<input type="button"  class="MRGT10PX" value="Update" id="updateDetails"/>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
			</div>
			<div id="assetMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="ctcMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emplop" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emplop" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="" ><input type="button" value="Yes I'm" id="confirmation" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="#" style="text-decoration: none"><input type="button" value="Decline" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="confirmation_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/emplop" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pageTitle").html("Employee <b class='saptaColor'>LOP</b>");
			$("body").css("cursor", "progress");
			
			$(function(){
				$("#ctctable").dataTable({
					"aaSorting": []
				});
			})
			$("#menu_payroll").addClass("active");
			
			$(function() {
				 $("#startdate, #enddate").datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
	            })
	            
	            $("#editenddate").datepicker({
					 yearRange: '1950:2100',
					 changeMonth: true,
					 defaultDate: new Date(),
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
	            })
	            
	        });
			
			var lopSize = "${emplopListsize}";
			if(lopSize != null && lopSize != 0){
				$("#empctcList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#empctcList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#noctcAvailable").addClass("hidden");
			} 
			
			 $("body").css("cursor", "default");
			var emplopList = "${emplopListsize}";			
			if(emplopList > 0){
				$("#emplop").removeClass("hidden");
				$("#empctcList").addClass("hidden");
			}else{ 
				$("#noctcAvailable").removeClass("hidden");
			} 
			
			$('#addempCTCDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#empid").val();
				var startdate = $("#startdate").datepicker().val();
				var enddate = $("#enddate").datepicker().val();
				if(enddate == "" || enddate.length == 0 || enddate == null){
					enddate = "null";
				}
				if(empid == "" || empid.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0 || startdate == "undefined-undefined-undefined") validation = false;
				if(enddate != "null" && enddate.length != 0){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) > (enddatevalidation))  validation = false; 
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/emplop/add/"+empid+"/"+startdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#empid").val('');
							$("#startdate").val('');
							$("#enddate").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#ctcMsgContent").html("Employee loss of pay added successfully...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
							}else{
								$("#ctcMsgContent").html(errors);
								$.fancybox.open('#assetMsg');
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
			
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${emplopList}" var="emploplist">
					if("${emploplist.id}"==recordid){
						<fmt:formatDate value="${emploplist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
						$("#editempid").val("${emploplist.empid}");
						$("#editstartdate").html("${formattedDate}");
						$("#lopid").val("${emploplist.id}");
						var formatedate = "";
						if("${emploplist.enddate}" != ""){
							<fmt:formatDate value="${emploplist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
							formatedate = "${formattedEndDate}";
						}
						$("#editenddate").val(formatedate);
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			
			$("a[id^='delete_']").click(function() {
				$("#confirmMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#confirmMsg', {hideOnOverlayClick : false});
				var id = $(this).attr('id');
				var recordid = id.substring(7);
				$("#confirmation").click(function() {
					$("#block_overlay").removeClass("hidden");
					var resourceURL = $("#contextpath").val()+"/emplop/delete/"+recordid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("LOP deleted successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
							}
						},
						error: function (xhr, ajaxOptions, thrownError) {
							$("#block_overlay").addClass("hidden");
						}
					});
				});
			});
			
			$('#updateDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				$("#notify_error").html("");
				var validation = true;
				var emplopid = $("#lopid").val();
				var empid = $("#editempid").val();
				var editedstartdate = $("#editstartdate").html();
				var enddate = $("#editenddate").datepicker().val();
				if(enddate == "" && enddate.length == 0 && enddate == null){
					enddate = "null";
				}
				if(empid == "" || empid.length == 0) validation = false;
				if(editedstartdate == "" || editedstartdate.length == 0) validation = false;
				 if(enddate != "" && enddate.length != 0 && enddate != "null"){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',editedstartdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if (startdatevalidation > enddatevalidation)  validation = false; 
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/emplop/update/"+emplopid+"/"+empid+"/"+editedstartdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#editempid").val('');
							$("#editemployeectc").val('');
							$("#editstartdate").html('');
							$("#editenddate").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Employee loss of pay details updated successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
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
				 $.fancybox.open('#empCTCDetails');
			 });
			 $("#confirmation_no").click(function(){
				 $.fancybox.close();
				 $.fancybox.open('#empCTCDetails');
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$('#addctc').click(function() {
				$("#notify_errors").html("");
				$("#empid").val("");
				$("#employeectc").val("");
				$("#startdate").val("");
				$.fancybox.open('#empCTCDetails');
				$("body").css("cursor", "default");
			});
		});
	</script>
</html>