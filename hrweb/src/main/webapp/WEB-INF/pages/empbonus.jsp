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
			.hide-calendar .ui-datepicker-calendar {
			  display: none;
			}
		</style>
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		<!--Expense Type List-->
		<div id="empBonusDetails" class="hidden">
				<h1><b class="saptaColor">Add</b> New</h1>
				<b class="saptaColor"><div id="notify_errors"></div></b>
				<table id="empCTCTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee&nbsp;Id&nbsp;:</td>
						<td><input name="empid" id="empid" type="text"  onkeypress="return validateNumeric(event)"/></td>
						
						<td align="right"><sup class="saptaColor">*</sup>Bonus&nbsp;Amount:</td>
						<td><input name="bonusamount" id="bonusamount" type="text"  onkeypress="return validateNumeric(event)"/></td>
												
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Bonus&nbsp;Month&nbsp;:</td>
						<td><b style="float:left"><input name="bonusmonth" id="bonusmonth" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
						
						<td align="right">comments&nbsp;:</td>
						<td><input name="comments" id="comments"type="text" /></td>
					
					</tr>
					
					<!-- <tr>
						<td align="right">End Date&nbsp;:</td>
						<td><b style="float:left"><input name="enddate" id="enddate" type="text" style="height: 20px" class="datePcK"/></b></td>
					</tr>	 -->
					<tr>
						<td colspan=6 align ="left" class="tab_sec_mob">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement MRGL10PX">
										<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
									</div>
									<div class="rightElement MRGL10PX">
										<input type="button" value="Submit" id="addempBonusDetails"/> 
									</div>
									
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor ">*</b>mandatory fields</div>
			</div>
			<div id="employeeBonusList" style="padding:10px;">
				<div id="empbonus">
					
					<div id="addbonus" style="cursor: pointer; margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new ctc"/>
					</div>
					<div id="addloptextid" class="addbutntext"><b class="saptaColor">New</b> Bonus</div>
					<div class="responsive">
						<table class="data display" id="bonustable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Employee&nbsp;Id</th>
									<th class="">Bonus</th>
									<th class="">Bonus&nbsp;Month</th>
									<th class="">Paid&nbsp;On</th>
									<th class="">Comments</th>
									<th class="">Operation</th>
								</tr>
							</thead>					
							<c:forEach items="${empBonusList}" var="empbonusList">
								<tr>
									
									 <td id="name_${empbonusList.id}">${empbonusList.empid}</td>
									 <td id="bonus_${empbonusList.id}">${empbonusList.bonusamount}</td> 
								
									 <fmt:formatDate value="${empbonusList.bonusmonth}" var="formattedDate" type="date" pattern="MMM yyyy" />
									<td id="bonusmonth_${empbonusList.id}" style="text-align: center;">${formattedDate}</td>
									
									<fmt:formatDate value="${empbonusList.paidon}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
									<c:if test="${empbonusList.paidon == null}">
										<td id="enddate_${empbonusList.id}" style="text-align: center;"></td>
									</c:if>
									<c:if test="${empbonusList.paidon != null}">
										<td id="enddate_${empbonusList.id}" style="text-align: center;">${formattedEndDate}</td>
									</c:if> 
									
									<td id="comments_${empbonusList.id}">${empbonusList.comments}</td>
									<td style="text-align:center"><a href='#' id="edit_${empbonusList.id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' id="delete_${empbonusList.id}">Delete</a></td>
								</tr>
							</c:forEach>
						</table>
						</div>
					<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<div id="empbonusList" class="MRGT10PX">
				<table id="empctcgridtable"></table>
				<div id="empctcgridpager"></div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">Bonus Details</b></h1>
				<b class="saptaColor"><div id="notify_error" ></div></b>
				<table>
					<tr>
						<td align="right"><sup class="saptaColor " >*</sup>Employee&nbsp;Id&nbsp;:</td>						
						<td><input name="editempid" id="editempid" type="text" style="border:0;background-color: white;" disabled/></td> 
						
						<td align="right"  style="margin-top:9px"> <sup class="saptaColor">*</sup>Bonus&nbsp;Amount:</td>
						<td><input name="editbonusamount" id="editbonusamount" type="text"  onkeypress="return validateNumeric(event)"/></td>
					</tr>
					<tr>
						<td align="right"  style="margin-top:9px"> <sup class="saptaColor">*</sup>Bonus&nbsp;Month :</td>
						<td><b style="float:left"><input name="editbonusmonth" id="editbonusmonth" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
						
						
							<td align="right"  style="margin-top:9px">Comments :</td>
							<td><input name="editComment" id="editComment" type="text"/></td>
							<td><b style="float:left"><input name="bonusid" class="hidden" id="bonusid" type="text"/></b></td>
						
						<!-- <td align="right">Paidon :</td>
						<td><b style="float:left"><input name="editenddate" id="editenddate" type="text" class="datePcK"/></b></td>
						<td><b style="float:left"><input name="lopid" class="hidden" id="lopid" type="text"/></b></td> -->
						
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
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empbonus" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empbonus" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="" ><input type="button" value="Yes I'm" id="confirmation" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="<%=request.getContextPath() %>/empbonus" style="text-decoration: none"><input type="button" value="Decline" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="confirmation_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/empbonus" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pageTitle").html("Employee <b class='saptaColor'>Bonus</b>");
			$("body").css("cursor", "progress");
			$( "#editbonusmonth" ).focus(function() {
				 if(!$("#ui-datepicker-div").hasClass("hide-calendar")){
					 $('#ui-datepicker-div').toggleClass('hide-calendar');
				 }
			 });
			$( "#bonusmonth" ).focus(function() {
				 if(!$("#ui-datepicker-div").hasClass("hide-calendar")){
					 $('#ui-datepicker-div').toggleClass('hide-calendar');
				 }
			 });
			$(function(){
				$("#bonustable").dataTable({
					"aaSorting": []
				});
			})
			$("#menu_payroll").addClass("active");
			 
			 
			 /* $( "#bonusmonth" ).focus(function() {
				$("#ui-datepicker-div").removeClass("hide-calendar")
			 }); */
			$(function() {
				 /*  $("#bonusmonth,#editbonusmonth").datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
	            }) */
	            $("#bonusmonth,#editbonusmonth").datepicker({
						yearRange: '1950:2100',
						defaultDate: new Date(),
						changeMonth:true,
						changeYear:true,
						showOn: "button",
						buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
						buttonImageOnly: true,
						dateFormat :"MM yy",
						monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
						showButtonPanel:true,
						onClose: function(dateText, inst){
							var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
							var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
							$(this).datepicker('setDate', new Date(year, month, 1));
						},
						gotoCurrent: true
		            }).datepicker('setDate',"0");
	          /*   $("#editenddate").datepicker({
					 yearRange: '1950:2100',
					 changeMonth: true,
					 defaultDate: new Date(),
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
	            }) */
	            
	        });
			
			var lopSize = "${emplopListsize}";
			if(lopSize != null && lopSize != 0){
				$("#empbonusList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#empbonusList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#noctcAvailable").addClass("hidden");
			} 
			
			 $("body").css("cursor", "default");
			var emplopList = "${emplopListsize}";			
			if(emplopList > 0){
				$("#empbonus").removeClass("hidden");
				$("#empbonusList").addClass("hidden");
			}else{ 
				$("#noctcAvailable").removeClass("hidden");
			} 
			
			$('#addempBonusDetails').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#empid").val();
				var bonus = $("#bonusamount").val();
				var bonusMonth = $("#bonusmonth").datepicker().val();
				var Paidon = "null";
				var comment = $("#comments").val();
				bonusMonth = monthConversion(bonusMonth);
				bonusMonth = bonusMonth.split('/').join('-');
				if(empid == "" || empid.length == 0) validation = false;				
				if(bonus == "" || bonus.length == 0) validation = false;
				if(bonusMonth == "" || bonusMonth.length == 0 || bonusMonth == "undefined-undefined-undefined") validation = false;
				
				if(validation == false){
					$("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				}else{
				
					if(comment == "" || comment.length == 0) comment = "null";
					var resourceURL = $("#contextpath").val()+"/empbonus/add/"+empid+"/"+bonus+"/"+bonusMonth+"/"+comment;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#empid").val('');
							$("#bonusamount").val('');
							$("#bonusmonth").val('');
							$("#bonusComment").val('');
							if(successflag == "true"){
								$("#ctcMsgContent").html("Employee Bonus  added successfully...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
							}else{
								$("#ctcMsgContent").html(errors);
								$.fancybox.open('#assetMsg');
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
			
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${empBonusList}" var="empbonusList">
					if("${empbonusList.id}"==recordid){
						<fmt:formatDate value="${empbonusList.bonusmonth}" var="formattedDate" type="date" pattern="MMM yyyy" />
						$("#editempid").val("${empbonusList.empid}");
						$("#editbonusmonth").val("${formattedDate}");
						$("#editbonusamount").val("${empbonusList.bonusamount}");
						$("#editComment").val("${empbonusList.comments}");
						$("#bonusid").val("${empbonusList.id}");
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
					var resourceURL = $("#contextpath").val()+"/empbonus/delete/"+recordid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#userMsgContent").html("Bonus deleted successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
							}
						},
						error: function (xhr, ajaxOptions, thrownError) {
						}
					});
				});
			});
			
			$('#updateDetails').click(function() {
				$("body").css("cursor", "progress");
				$("#notify_error").html("");
				var validation = true;
				var empbonusid = $("#bonusid").val();
				var empid = $("#editempid").val();
				var editbonusamount = $("#editbonusamount").val();
				var editbonusmonth = $("#editbonusmonth").val();
				var editcomment = $("#editComment").val();
				editbonusmonth = monthConversion(editbonusmonth);
				editbonusmonth = editbonusmonth.split('/').join('-');
				if(empid == "" || empid.length == 0) validation = false;
				if(editbonusmonth == "" || editbonusmonth.length == 0) validation = false;
				if(validation == false){
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					if(editcomment == "" || editcomment.length == 0) editcomment = "null";
					var resourceURL = $("#contextpath").val()+"/empbonus/update/"+empbonusid+"/"+empid+"/"+editbonusamount+"/"+editbonusmonth+"/"+editcomment;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#editempid").val('');
							$("#editbonusmonth").val('');
							$("#editcomment").html('');
							$("#editbonusamount").val('');
							if(successflag == "true"){
								$("#userMsgContent").html("Employee Bonus details updated successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
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
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.open('#empBonusDetails');
			 });
			 $("#confirmation_no").click(function(){
				 $.fancybox.close();
				 $.fancybox.open('#empBonusDetails');
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$('#addbonus').click(function() {
				$("#notify_errors").html("");
				$("#empid").val('');
				$("#bonusamount").val('');
				$("#bonusmonth").val('');
				$("#bonusComment").val('');
				$.fancybox.open('#empBonusDetails');
				$("body").css("cursor", "default");
			});
		});
	</script>
</html>