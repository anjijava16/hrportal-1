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
						<td><input name="empid" id="empid" type="text" onkeypress="return validateNumeric(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>CTC&nbsp;:</td>
						<td><input name="employeectc" id="employeectc" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>								
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
						<td><b style="float:left"><input  name="startdate" id="startdate" readonly="readonly" type="text" style="height: 20px" class="datePcK"/></b></td>
						<td align="right">End Date&nbsp;:</td>
						<td><b style="float:left"><input name="enddate" id="enddate" type="text" style="height: 20px" class="datePcK"/></b></td>
					</tr>	
					<tr>
						<td class="trClass"></td>
						<td colspan=6 align ="left" class="trClass1">
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement">
										<a href ="#" style="text-decoration: none"><input  id="decline" type="button" value="Decline" class="graybtn fontClass" style="margin-right: 5px;" /></a>
									</div>
									<div class="rightElement ">
										<input type="button" class="fontClass" value="Submit" id="addempCTCDetails"/> 
									</div>
									
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div class="MRGT10PX" style="text-align: center; "><b class="saptaColor ">*</b>mandatory fields</div>
			</div>
			<div id="employeeCTCList">
				<div id="empctc">
					
					<div id="addctc" style="cursor: pointer; margin-top: 0px;" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More" title="Add new ctc"/>
					</div>
					
					<div class="responsive">
						 <table class="data display" id="ctctable" cellspacing="0">
							<thead>
								<tr>
									<th class="first">Employee&nbsp;Id</th>
									<th class="">Employee&nbsp;Name</th>
									<th class="">CTC</th>
									<th class="">Start&nbsp;Date</th>
									<th class="">End&nbsp;Date</th>
									<th class="">Status</th>
									<th class="">Operation</th>
								</tr>
							</thead>					
							<c:forEach items="${empctcList}" var="empctclist">
								<tr>
									<td id="name_${empctclist.id}" >${empctclist.empid}</td>
									<td id="empname_${empctclist.id}">${empctclist.empname}</td>
									<td id="number_${empctclist.id}" class="alignright">${empctclist.empctc}</td>
									<fmt:formatDate value="${empctclist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
									<td id="startdate_${empctclist.id}" style="text-align:center">${formattedDate}</td>
									<fmt:formatDate value="${empctclist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
									<c:if test="${empctclist.enddate == null}">
										<td id="enddate_${empctclist.id}" style="text-align:center">-</td>
									</c:if>
									<c:if test="${empctclist.enddate != null}">
										<td id="enddate_${empctclist.id}" style="text-align:center">${formattedEndDate}</td>
									</c:if>
									<td id="status_${empctclist.id}" style="text-align:center">${empctclist.empstatus}</td>
									<td style="text-align:center">
										   <a href='#' id="edit_${empctclist.id}">Update</a>&nbsp;&nbsp;
											<a href='#' id="view_${empctclist.id}">View</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div style="margin-bottom: 10px;">&nbsp;</div>
				</div>
			</div>
			<div id="empctcList" class="MRGT10PX">
				<table id="empctcgridtable"></table>
				<div id="empctcgridpager"></div>
			</div>
			<div  id="viewList" class="hidden" style="padding:10px">
				<div align="left" id="back_assignlist" class="">
					<a href="#" id="show_ctc">CTC List </a>/ CTC Details
				</div><br/>
				<div class="responsive">
					 <table class="data display" id="ctcviewtable" cellspacing="0" style="width: 100%;">
						<thead>
							<tr>
								<th class="first">Employee&nbsp;Id</th>
								<th class="">CTC</th>
								<th class="" style="text-align:center">Start&nbsp;Date</th>
								<th class="" style="text-align:center">End&nbsp;Date</th>
								<th class="">Status</th>
							</tr>
						</thead>					
					</table>
				</div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">CTC Details</b></h1>
				<b class="saptaColor"><div id="notify_error" ></div></b>
				<table>
					<tr>
						<td align="right" class="mMR0PX"><sup class="saptaColor">*</sup>Employee Id&nbsp;:</td>						
						<td><input  id="editempid"  type="text"  style="border:0;background-color: white;" disabled />
						<!-- <div id="editempid" onkeypress="return validateNumeric(event)" style="padding-left: 10px;"/> --></td> 
						<td align="right"><sup class="saptaColor">*</sup>Employee CTC&nbsp;:</td>
						<td><input name="editemployeectc" id="editemployeectc" type="text"  onkeypress="return validateNumericWithPrecision(event)" /></td>
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
						<td><b style="float:left"><input name="editstartdate" readonly="readonly" id="editstartdate" type="text" style="height: 20px" class="datePcK"/></b></td>
						<td align="right">End Date&nbsp;:</td>
						<td class="editenddateclass"><b style="float:left"><input name="editenddate" id="editenddate" type="text" style="height: 20px" class="datePcK"/></b></td>
						<td><b style="float:left"><input name="ctcid" class="hidden" id="ctcid" type="text"/></b></td>
					</tr>
					<tr>
						<td class="trClass"></td>
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
				<div style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
			</div>
			<div id="assetMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="ctcMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empctc" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empctc" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="confirmation" ><input type="button" value="Done" id="user" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="#" style="text-decoration: none"><input type="button" value="Decline" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden">
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
				<%@include file="footer.jsp"%>
		</div>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_payroll").addClass("active");
			$("#pageTitle").html("Employee <b class='saptaColor'>CTC</b>");
			$(function(){
				$("#ctctable").dataTable();
			})
			
			$(function() {
				 $( "#startdate, #enddate, #editstartdate, #editenddate" ).datepicker({
					yearRange: '1950:2100',
					defaultDate: new Date(),
					changeMonth:true,
					changeYear:true,
					showOn: "button",
					buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
					buttonImageOnly: true,
					dateFormat :"dd-mm-yy",
					
	            })
	        });
			$("#show_ctc").click(function(){
				$("#employeeCTCList").removeClass("hidden");
				$("#viewList").addClass("hidden");
			});
			
			var ctcSize = "${empctcListsize}";
			if(ctcSize != null && ctcSize != 0){
				$("#empctcList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#empctcList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#noctcAvailable").addClass("hidden");
			} 
			
			 $("body").css("cursor", "default");
			var empctcList = "${empctcListsize}";			
			if(empctcList > 0){
				$("#empctc").removeClass("hidden");
				$("#empctcList").addClass("hidden");
			}else{ 
				$("#noctcAvailable").removeClass("hidden");
			} 
			
			$('#addempCTCDetails').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#empid").val();
				var empctc = $("#employeectc").val();
				var startdate = $("#startdate").datepicker().val();
				startdate = startdate.split('/').join('-');
				var enddate = $("#enddate").datepicker().val();
				if(enddate != "" && enddate.length != 0 && enddate != null){
					enddate = enddate.split('/').join('-');
				}else{
					enddate = "null";
				}
				if(empid == "" || empid.length == 0) validation = false;
				if(empctc == "" || empctc.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0 || startdate == "undefined-undefined-undefined") validation = false;
				if(enddate != "null" && enddate.length != 0){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) >= (enddatevalidation))  validation = false; 
				}
				if(validation == false){
					$("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				}else{
					var resourceURL = $("#contextpath").val()+"/empctc/add/"+empid+"/"+empctc+"/"+startdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#empid").val('');
							$("#employeectc").val('');
							$("#startdate").val('');
							$("#enddate").val('');
							
							if(successflag == "true"){
								$("#ctcMsgContent").html("Employee CTC added successfully...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
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
			
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${empctcList}" var="empctclist">
					if("${empctclist.id}"==recordid){
						<fmt:formatDate value="${empctclist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
							$("#editempid").val("${empctclist.empid}");
							$("#editemployeectc").val("${empctclist.empctc}");
							$("#editstartdate").val("${formattedDate}");
							$("#ctcid").val("${empctclist.id}");
							var formatedate = "";
							if("${empctclist.enddate}" != ""){
								<fmt:formatDate value="${empctclist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
								formatedate = "${formattedEndDate}";
							}
							$("#editenddate").val(formatedate);
							if("${empctclist.empstatus}" == 'Active'){
								$("#editemployeectc").prop("readonly", false);
								$("#editemployeectc").css("border","1");
								$("#editstartdate").prop("readonly", false);
								$("#editenddate").prop("readonly", false);
								$(".ui-datepicker-trigger").css("pointer-events","auto");
								$("#updateDetails").show();
							}else{
								$("#editemployeectc").prop("readonly", true);
								$("#editemployeectc").css("border","0");
								$("#editstartdate").prop("readonly", true);
								if(formatedate.length <= 0 ){
									$("#editenddate").prop("readonly", false);
									$(".editenddateclass .ui-datepicker-trigger").css("pointer-events","auto");
								}else{
									$("#editenddate").prop("readonly", true);
									$(".ui-datepicker-trigger").css("pointer-events","none");
								}
								
								$("#notify_error").html("Employee is Inactive");
							}
						
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			
			$("a[id^='view_']").click(function() {
				$("body").css("cursor", "progress");
				var table = $('#ctcviewtable').DataTable();
				table.destroy();
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#viewList").removeClass("hidden");
				$("#employeeCTCList").addClass("hidden");
				url = $("#contextpath").val()+"/empctc/getbyempid/"+recordid;
				
				$("#ctcviewtable").dataTable({
					"ajax": url,
					"aoColumns": [ 
				                  {sClass: "alignleft"}, 
				                  {sClass: "alignright"},
				                  {sClass: "center"},
				                  {sClass: "center"},
				                  {sClass: "center"}
				                ]
				});
				
					
				
				
				$("body").css("cursor", "default");
			});
			var url = $("#contextpath").val()+"/empctc/getbygrid";

			jQuery("#empctcgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Employee Id','Employee Name',' CTC', 'Start Date ','End Date', 'Status','Operation'], 
				colModel:[{name:'empid',index:'empid', width:162, resizable :false},
				          {name:'empName',index:'empid', width:162, resizable :true},
						  {name:'employeectc',index:'employeectc', width:142, resizable :true},
						  {name:'startdate',index:'startdate', width:210, resizable :true},
						  {name:'enddate',index:'enddate', width:215, resizable :true},
						  {name:'status',index:'status', width:183, resizable :true},
						  {name:'operation',index:'status', width:183, resizable :true}],
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#empctcgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
			});
			jQuery("#empctcgridtable").jqGrid('navGrid','#empctcgridpager',{edit:false, add:false, del:false, search:false});
			
			$('#updateDetails').click(function() {
				$("body").css("cursor", "progress");
				$("#notify_error").html("");
				var validation = true;
				var empid = $("#editempid").val();
				var employeectc =$("#editemployeectc").val();
				var editedstartdate = $("#editstartdate").datepicker().val();
				/* editedstartdate = monthConversion(editedstartdate); */
				editedstartdate = editedstartdate.split('/').join('-');
				var startdate = "";
				var endingdate = "";
				<c:forEach items="${empctcList}" var="empctclist">
					if("${empctclist.id}"==$("#ctcid").val()){
						<fmt:formatDate value="${empctclist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
						startdate = "${formattedDate}";
						<fmt:formatDate value="${empctclist.enddate}" var="formattedendDate" type="date" pattern="dd-MM-yyyy" />
						endingdate = "${formattedendDate}";
					}
				</c:forEach>
				var enddate = $("#editenddate").datepicker().val();
				if(enddate != "" && enddate.length != 0 && enddate != null){
					/* enddate = monthConversion(enddate); */
					enddate = enddate.split('/').join('-');
				}else{
					enddate = "null";
				}
				
				if(empid == "" || empid.length == 0) validation = false;
				if(employeectc == "" || employeectc.length == 0) validation = false;
				if(editedstartdate == "" || editedstartdate.length == 0) validation = false;
				 if(enddate != "" && enddate.length != 0 && enddate != "null"){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',editedstartdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if (startdatevalidation > enddatevalidation)  validation = false; 
				
				} 
				var startvalidation = $.datepicker.parseDate('dd-mm-yy',editedstartdate);
				var startdateval = $.datepicker.parseDate('dd-mm-yy',startdate);
				if(startvalidation < startdateval) { 
					 validation = false; 
					
				}
				/* if(endingdate != ""){
					 var startvalidation = $.datepicker.parseDate('dd-mm-yy',editedstartdate);
					 var endingdatevalidation = $.datepicker.parseDate('dd-mm-yy',endingdate); 
					 if(startvalidation <= endingdatevalidation) { 
						 validation = false;
					}
				} */
				if(validation == false){
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					if(enddate == "" || enddate.length == 0) enddate = "null";
					var resourceURL = $("#contextpath").val()+"/empctc/update/"+empid+"/"+employeectc+"/"+editedstartdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							$("#editempid").val('');
							$("#editemployeectc").val('');
							$("#editstartdate").val('');
							$("#editenddate").val('');
							if(successflag == "true"){
								$("#userMsgContent").html("Details updated successfully...");
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
			
			
			$("body").css("cursor", "default");
		});
	</script>
</html>