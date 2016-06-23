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
		
		<div id="empTDSDetails" class="hidden">
				<h1><b class="saptaColor">Add</b> New</h1>
				<b class="saptaColor"><div id="notify_errors"></div></b>
				<table id="empTDSTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee&nbsp;Id&nbsp;:</td>
						<td><input name="empid" id="empid" type="text"  onkeypress="return validateNumeric(event)"/></td>
						
						<td align="right"><sup class="saptaColor">*</sup>TDS&nbsp;Amount:</td>
						<td><input name="tdsamount" id="tdsamount" type="text"  onkeypress="return validateNumeric(event)"/></td>
												
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>TDS&nbsp;Month&nbsp;:</td>
						<td><b style="float:left"><input name="tdsmonth" id="tdsmonth" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
						
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
										<input type="button" value="Submit" id="addempTDSDetails"/> 
									</div>
									
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor ">*</b>mandatory fields</div>
			</div>
			<div id="employeeTDSList" style="padding:10px;">
				<div id="emptds">
					
					<div id="addtds" style="cursor: pointer; margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new ctc"/>
					</div>
					<div id="addloptextid" class="addbutntext"><b class="saptaColor">New</b> TDS</div>
					<div class="responsive">
						<table class="data display" id="tdstable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Employee&nbsp;Id</th>
									<th class="">Employee&nbsp;Name</th>
									<th class="">TDS Amount</th>
									<th class="">TDS&nbsp;Month</th>
									<th class="">Paid&nbsp;On</th>
									<th class="">Comments</th>
									<th class="fyreportth">Operation</th>
								</tr>
							</thead>					
							<c:forEach items="${empTDSList}" var="emptdsList">
								<tr>
									
									 <td id="name_${emptdsList.id}" style="text-align:center;">${emptdsList.empid}</td>
									 
									 <c:forEach items="${employeeList}" var="employeeList">
										<c:if test="${emptdsList.empid == employeeList.id}">
											<td id="employeename_${emptdsList.id}" style="text-align: center;">${employeeList.fname} ${employeeList.lname}</td>
										</c:if> 
									 </c:forEach>
									 
									 <td id="tds_${emptdsList.id}" style="text-align:right;">${emptdsList.tds}</td> 
								
									 <fmt:formatDate value="${emptdsList.tdsmonth}" var="formattedDate" type="date" pattern="MMM yyyy" />
									<td id="tdsmonth_${emptdsList.id}" style="text-align: center;">${formattedDate}</td>
									
									<fmt:formatDate value="${emptdsList.paidon}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
									<c:if test="${emptdsList.paidon == null}">
										<td id="enddate_${emptdsList.id}" style="text-align: center;"></td>
									</c:if>
									<c:if test="${emptdsList.paidon != null}">
										<td id="enddate_${emptdsList.id}" style="text-align: center;">${formattedEndDate}</td>
									</c:if> 
									
									<td id="comments_${emptdsList.id}" style="text-align:center;">${emptdsList.comments}</td>
									<td style="text-align:center"><a href='#' id="edit_${emptdsList.id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' id="delete_${emptdsList.id}">Delete</a></td>
								</tr>
							</c:forEach>
						</table>
						</div>
					<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<div id="emptdsList" class="MRGT10PX">
				<table id="empctcgridtable"></table>
				<div id="empctcgridpager"></div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">TDS Details</b></h1>
				<b class="saptaColor"><div id="notify_error" ></div></b>
				<table>
					<tr>
						<td align="right"><sup class="saptaColor " >*</sup>Employee&nbsp;Id&nbsp;:</td>						
						<td><input name="editempid" id="editempid" type="text" style="border:0;background-color: white;" disabled/></td> 
						
						<td align="right"  style="margin-top:9px"> <sup class="saptaColor">*</sup>TDS&nbsp;Amount:</td>
						<td><input name="edittdsamount" id="edittdsamount" type="text"  onkeypress="return validateNumeric(event)"/></td>
					</tr>
					<tr>
						<td align="right"  style="margin-top:9px"> <sup class="saptaColor">*</sup>TDS&nbsp;Month :</td>
						<td><b style="float:left"><input name="edittdsmonth" id="edittdsmonth" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
						
						
							<td align="right"  style="margin-top:9px">Comments :</td>
							<td><input name="editComment" id="editComment" type="text"/></td>
							<td><b style="float:left"><input name="tdsid" class="hidden" id="tdsid" type="text"/></b></td>
						
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
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emptds" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emptds" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="" ><input type="button" value="Yes I'm" id="confirmation" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="<%=request.getContextPath() %>/emptds" style="text-decoration: none"><input type="button" value="Decline" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="confirmation_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/emptds" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pageTitle").html("Employee <b class='saptaColor'>TDS</b>");
			$("body").css("cursor", "progress");
			$( "#edittdsmonth" ).focus(function() {
				 if(!$("#ui-datepicker-div").hasClass("hide-calendar")){
					 $('#ui-datepicker-div').toggleClass('hide-calendar');
				 }
			 });
			$( "#tdsmonth" ).focus(function() {
				 if(!$("#ui-datepicker-div").hasClass("hide-calendar")){
					 $('#ui-datepicker-div').toggleClass('hide-calendar');
				 }
			 });
			
			$("#menu_payroll").addClass("active");
			 
			 
			 /* $( "#tdsmonth" ).focus(function() {
				$("#ui-datepicker-div").removeClass("hide-calendar")
			 }); */
			$(function() {
				 /*  $("#tdsmonth,#edittdsmonth").datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
	            }) */
	            $("#tdsmonth,#edittdsmonth").datepicker({
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
				$("#emptdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#emptdsList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#noctcAvailable").addClass("hidden");
			} 
			
			 $("body").css("cursor", "default");
			var emplopList = "${emplopListsize}";			
			if(emplopList > 0){
				$("#emptds").removeClass("hidden");
				$("#emptdsList").addClass("hidden");
			}else{ 
				$("#noctcAvailable").removeClass("hidden");
			} 
			
			$('#addempTDSDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#empid").val();
				var tds = $("#tdsamount").val();
				var tdsMonth = $("#tdsmonth").datepicker().val();
				var Paidon = "null";
				var comment = $("#comments").val();
				tdsMonth = monthConversion(tdsMonth);
				tdsMonth = tdsMonth.split('/').join('-');
				if(empid == "" || empid.length == 0) validation = false;				
				if(tds == "" || tds.length == 0) validation = false;
				if(tdsMonth == "" || tdsMonth.length == 0 || tdsMonth == "undefined-undefined-undefined") validation = false;
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				}else{
				
					if(comment == "" || comment.length == 0) comment = "null";
					var resourceURL = $("#contextpath").val()+"/emptds/add/"+empid+"/"+tds+"/"+tdsMonth+"/"+comment;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#empid").val('');
							$("#tdsamount").val('');
							$("#tdsmonth").val('');
							$("#tdsComment").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#ctcMsgContent").html("Employee TDS  added successfully...");
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
				<c:forEach items="${empTDSList}" var="emptdsList">
					if("${emptdsList.id}"==recordid){
						<fmt:formatDate value="${emptdsList.tdsmonth}" var="formattedDate" type="date" pattern="MMM yyyy" />
						$("#editempid").val("${emptdsList.empid}");
						$("#edittdsmonth").val("${formattedDate}");
						$("#edittdsamount").val("${emptdsList.tds}");
						$("#editComment").val("${emptdsList.comments}");
						$("#tdsid").val("${emptdsList.id}");
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
					var resourceURL = $("#contextpath").val()+"/emptds/delete/"+recordid;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("TDS deleted successfully...");
								$.fancybox.open('#userMsg', {closeBtn: false});
							}
						},
						error: function (xhr, ajaxOptions, thrownError) {
							$("#block_overlay").addClass("hidden");
						}
					});
				});
			});
			
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
				$(".fyreportth").addClass("hidden");
				var amount = 0;
				var url = "";
				fymonthYear = monthConversion(fymonthYear);
				fymonthYear = fymonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/emptds/getbyemptdsmonth/"+fymonthYear;
				var resourceurl = $("#contextpath").val()+"/emptds/getbyemptdsmonth/"+fymonthYear;
				   $("#block_overlay").removeClass("hidden");  
					$.ajax({
			        url : resourceurl,
			        type : 'GET',
			        dataType : 'json',
			        async : false,
			        success: function(data) {
			        	/* var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							alert(1);
							$.each(results, function (i, result) {
								amount = parseFloat(amount) + parseFloat(result.amount);	
							});
							
						} */
			        	$("#block_overlay").addClass("hidden");
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			        	$("#block_overlay").addClass("hidden");
			   		}
			   });   
				$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
				$("#tdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
				$('#tdstable').DataTable().clear().destroy();
				$("#tdstable").dataTable({
					"ajax": url,
					"aaSorting" : [],
					"aoColumns": [ 
				                  {sClass: "center"}, 
				                  {sClass: "center"},
				                  {sClass: "alignright"},
				                  {sClass: "center"},
				                  {sClass: "center"},
				                  {sClass: "center"},
				                  {sClass: "hidden"}
				                ]
				}); 
				
			}else{
				$(function(){
					/* $('#tdstable').DataTable().clear().destroy(); */
					var url = $("#contextpath").val()+"/emptds/get";
					$("#tdstable").dataTable({
						
						"aaSorting": []
					});
				})
			}
			
			
			$('#updateDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				$("#notify_error").html("");
				var validation = true;
				var emptdsid = $("#tdsid").val();
				var empid = $("#editempid").val();
				var edittdsamount = $("#edittdsamount").val();
				var edittdsmonth = $("#edittdsmonth").val();
				var editcomment = $("#editComment").val();
				edittdsmonth = monthConversion(edittdsmonth);
				edittdsmonth = edittdsmonth.split('/').join('-');
				if(empid == "" || empid.length == 0) validation = false;
				if(edittdsmonth == "" || edittdsmonth.length == 0) validation = false;
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					if(editcomment == "" || editcomment.length == 0) editcomment = "null";
					var resourceURL = $("#contextpath").val()+"/emptds/update/"+emptdsid+"/"+empid+"/"+edittdsamount+"/"+edittdsmonth+"/"+editcomment;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#editempid").val('');
							$("#edittdsmonth").val('');
							$("#editcomment").html('');
							$("#edittdsamount").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Employee TDS details updated successfully...");
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
				 $.fancybox.open('#empTDSDetails');
			 });
			 $("#confirmation_no").click(function(){
				 $.fancybox.close();
				 $.fancybox.open('#empTDSDetails');
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$('#addtds').click(function() {
				$("#notify_errors").html("");
				$("#empid").val('');
				$("#tdsamount").val('');
				$("#tdsmonth").val('');
				$("#tdsComment").val('');
				$.fancybox.open('#empTDSDetails');
				$("body").css("cursor", "default");
			});
		});
	</script>
</html>