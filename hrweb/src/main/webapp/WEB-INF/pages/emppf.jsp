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
			.ui-datepicker-calendar{
				display:none;
			}
		</style>
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		
		<div id="empPFDetails" class="hidden">
				<h1><b class="saptaColor">Add</b> New</h1>
				<b class="saptaColor"><div id="notify_errors"></div></b>
				<table id="empPFTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee Id&nbsp;:</td>
						<td><input name="empid" id="empid" type="text"  onkeypress="return validateNumeric(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>PF Amount&nbsp;:</td>
						<td><input name="emppfamount" id="emppfamount" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>								
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>PF Month&nbsp;:</td>
						<td><b style="float:left"><input name="emppfmonth" id="emppfmonth" readonly="readonly" type="text" style="height: 20px;width:85px !important;" class="datePcK"/></b></td>
					</tr>	
					<tr>
						<td colspan=6 align ="left" class="tab_sec_mob">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement MRGL10PX">
										<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
									</div>
									<div class="rightElement MRGL10PX">
										<input type="button" value="Submit" id="addempPFDetails"/> 
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div style="text-align: center;"><b class="saptaColor ">*</b>mandatory fields</div>
			</div>
			<div id="employeePFList" style="padding:10px;">
				<div id="emppf">
					
					<div id="addpf" style="cursor: pointer; margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img class="floatRight" src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new PF"/>
					</div>
					<div id="addpftextid" class="addbutntext"><b class="saptaColor">Add</b> PF</div>
					
					<div align="center" style="width: 100%;" class="amount_table">
						<table   align ="center" class="optionTable">
							<tr>
								<td  align="right"  id="totalcounttd1" style="margin-top:0px;" >PF&nbsp;Amount&nbsp;Paid&nbsp;:</td>
								<!-- <td class="currenttotalamtrupyatd " style="margin-left:auto;" class="rupyaINR WebRupee">&#x20B9;</td> -->
								<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px; font-weight:bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0; background-color: white; width:109px; font-weight:bold;" /></td>
							</tr>
						</table>
					</div>
					<div class="responsive">
					 <table class="data display" id="pftable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Employee&nbsp;Id</th>
								<th class="">Employee&nbsp;Name</th>
								<th class="">PF&nbsp;Amount&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
								<th class="">PF&nbsp;Month</th>
								<th class="">Operation</th>
							</tr>
						</thead>					
						<c:forEach items="${emppfList}" var="emppfList">
							<tr>
								<td id="name_${emppfList.id}">${emppfList.empid}</td>
								 <c:forEach items="${employeeList}" var="employeeList">
									<c:if test="${emppfList.empid == employeeList.id}">
										<td id="employeename_${emppfList.id}" >${employeeList.fname} ${employeeList.lname}</td>
									</c:if> 
								 </c:forEach>
								<fmt:formatNumber type="number" var="decimalnumber"  minFractionDigits="2"  value="${emppfList.pfamount}" />
								<td id="number_${emppfList.id}" class="alignright">${decimalnumber}</td>
								<fmt:formatDate value="${emppfList.pfmonth}" var="formattedDate" type="date" pattern="MMM yyyy" />
								<td id="startdate_${emppfList.id}" style="text-align: center;">${formattedDate}</td>
								<td style="text-align:center"><a href='#' id="edit_${emppfList.id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' id="delete_${emppfList.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
					</div>
					<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<!-- <div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div> -->
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">PF Details</b></h1>
				<b class="saptaColor"><div id="notify_error" ></div></b>
				<table>
					<tr>
						<td align="right" style="margin: 0px ;"><sup class="saptaColor">*</sup>Employee Id&nbsp;:</td>						
						<td><div id="editempid" onkeypress="return validateNumeric(event)" style="padding-left: 10px;"></div></td> 
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>PF Amount&nbsp;:</td>
						<td><input name="editemployeepf" id="editemployeepf" type="text"  onkeypress="return validateNumericWithPrecision(event)" class="IPWDTH"/></td>
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>PF Month&nbsp;:</td>
						<td><b style="float:left"><input name="editstartdate" readonly="readonly" id="editstartdate" type="text" style="height: 20px; border: none; font-weight: bold;" class="" /></b></td>
						<td><b style="float:left"><input name="pfid" class="hidden" id="pfid" type="text"/></b></td>
					</tr>
					<tr>
						<td colspan="6"></td>
						<td colspan="6" align ="left">
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
				<div style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
			</div>
			<div id="assetMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="pfMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emppf" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/emppf" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="confirmation" ><input type="button" value="Yes I'm" id="user" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="#" style="text-decoration: none"><input type="button" value="Cancel" class="graybtn" id="cancel"/>&nbsp;</a>
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
			$("#menu_payroll").addClass("active");
			$("#pageTitle").html("Employee <b class='saptaColor'>PF</b>");
			$(function(){
				$("#pftable").dataTable();
			})
			
			
			$(function() {
				 $( "#emppfmonth" ).datepicker({
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
	            })
	        });
			
			var pfSize = "${emppfListsize}";
			if(pfSize != null && pfSize != 0){
				$("#emppfList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#emppfList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#nopfAvailable").addClass("hidden");
			} 
			
			$("body").css("cursor", "default");
			var emppfList = "${emppfListsize}";			
			if(emppfList > 0){
				$("#emppf").removeClass("hidden");
				$("#emppfList").addClass("hidden");
			}else{ 
				$("#nopfAvailable").removeClass("hidden");
			} 
			
			var url="";
			$('#pftable').DataTable({
		      "ajax": url,
		      "aaSorting": [],
		      "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over this page
		            pageTotal = api
		                .column( 2, { "filter": "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		             $("#currenttotalamttd").val(numberWithCommas(pageTotal.toFixed(2)));   
		        }
		    });
		    
			$('#addempPFDetails').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#empid").val();
				var emppf = $("#emppfamount").val();
				var pfmonth = $("#emppfmonth").datepicker().val();
				pfmonth = monthConversion(pfmonth);
				pfmonth = pfmonth.split('/').join('-');
				
				if(empid == "" || empid.length == 0) validation = false;
				if(emppf == "" || emppf.length == 0) validation = false;
				if(pfmonth == "" || pfmonth.length == 0 || pfmonth == "undefined-undefined-undefined") validation = false;
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/emppf/add/"+empid+"/"+emppf+"/"+pfmonth;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#empid").val('');
							$("#emppfamount").val('');
							$("#emppfmonth").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#pfMsgContent").html("Employee PF added successfully...");
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
			
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${emppfList}" var="emppflist">
					if("${emppflist.id}"==recordid){
						<fmt:formatDate value="${emppflist.pfmonth}" var="formattedDate" type="date" pattern="MMM yyyy" /> 
						$("#editempid").html("${emppflist.empid}");
						<fmt:formatNumber type="number" var="fractiondecimalnumber"  minFractionDigits="2"  value="${emppflist.pfamount}"/>
						$("#editemployeepf").val("${fractiondecimalnumber}");
						$("#editstartdate").val("${formattedDate}");
						$("#pfid").val("${emppflist.id}");
						var formatedate = "";
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			 
			$("a[id^='delete_']").click(function() {
				$("body").css("cursor", "progress");
				$("#confirmMsgContent").html("Are you sure want to delete ?");
				$.fancybox.open('#confirmMsg', {hideOnOverlayClick : false});
				var id = $(this).attr('id');
				var empid = id.substring(7);
				$("#confirmation").click(function() {
					$("#block_overlay").removeClass("hidden");
					var resourceURL = $("#contextpath").val()+"/emppf/delete/"+empid;
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
			
			$("#updateDetails").click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				$("#notify_error").html("");
				var validation = true;
				var id=$("#pfid").val();
				var empid = $("#editempid").html();
				var employeepf =$("#editemployeepf").val();
				employeepf = employeepf.split(',').join('');
				var editedstartdate = $("#editstartdate").datepicker().val();
				editedstartdate = monthConversion(editedstartdate);
				editedstartdate = editedstartdate.split('/').join('-');
				var startdate = "";
				<c:forEach items="${emppfList}" var="emppflist">
					if("${emppflist.id}" == id){if("${emppflist.pfamount}" == employeepf)validation = false;}
				</c:forEach>
				if(empid == "" || empid.length == 0) validation = false;
				if(employeepf == "" || employeepf.length == 0) validation = false;
				if(editedstartdate == "" || editedstartdate.length == 0) validation = false;
				
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/emppf/update/"+id+"/"+empid+"/"+employeepf+"/"+editedstartdate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#editempid").html('');
							$("#editemployeepf").val('');
							$("#editstartdate").val('');
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Details updated successfully...");
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
			$("#cancel").click(function(){
				 $.fancybox.close();
			});
			 $("#decline_no").click(function(){
				 $.fancybox.open('#empPFDetails');
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$('#addpf').click(function() {
				$("#notify_errors").html("");
				$("#empid").val("");
				$("#emppfamount").val("");
				$("#emppfmonth").val("");
				$.fancybox.open('#empPFDetails');
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>