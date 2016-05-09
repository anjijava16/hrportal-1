<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<body>
		<div id="innerContainer">
		<!--Header Start-->
			<header>
				<div class="clearBlock">
					<div class="leftElement">
						<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Sapta Labs" /></a>
					</div>
					<div class="rightElement MRGR10PX">
						<a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a>
					</div>		
					<div class="rightElement MRGR10PX">welcome <b><c:out value="${session.username}"></c:out></b></div>
				</div>
				<nav>
					<ul class="dropdown">
						<li><a href="<%=request.getContextPath() %>/employee" id="menu_employee">Employee</a></li>
						<li><a href="#" id="menu_project">Project</a>
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/project/addproject">Add Project</a></li>
								<li><a href="<%=request.getContextPath() %>/project/viewproject">View Project</a></li>
								<li><a href="<%=request.getContextPath() %>/customer" id="menu_customer">Customer</a></li>
								<li><a href="<%=request.getContextPath() %>/assignment" id="menu_assignment">Assignment</a> </li>
							</ul>
						</li>
						<li class="active"><a href="#" id="menu_asset">Payroll</a> 
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/empctc">Emp CTC</a></li>
								<li><a href="<%=request.getContextPath() %>/payroll">Emp Payroll</a></li>
								<li><a href="<%=request.getContextPath() %>/professionaltax">Emp PT</a></li>
								<li><a href="#" >TDS</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/tds/paytds">Pay TDS</a></li>
										<li><a href="<%=request.getContextPath() %>/tds/viewtds">View TDS</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li><a href="#" >Payments</a> 
							<ul class="sub_menu">
							    <li><a href="#" >Invoice</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/invoice/addinvoice">Add Invoice</a></li>
										<li><a href="<%=request.getContextPath() %>/invoice/viewinvoice">View Invoice</a></li>
									</ul>
								</li>
								<li><a href="#">Bills</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/bills/addbill">Add Bill</a></li>
										<li><a href="<%=request.getContextPath() %>/bills/viewbills">View Bills</a></li>
									</ul>
								</li>
							</ul>
						</li>	
						<li><a href="#" >Miscellaneous</a>
							<ul class="sub_menu">
								<li><a href="#">Expenses</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/expense/addexpense">Add Expense</a></li>
										<li><a href="<%=request.getContextPath() %>/expense/viewexpense">View Expense</a></li>
										<li><a href="<%=request.getContextPath() %>/expensetype">Expense Type</a></li>
									</ul>
								</li>
								<li><a href="#">Asset</a>
									<ul>
										<li><a href="<%=request.getContextPath() %>/asset/addasset">Add Asset</a></li>
										<li><a href="<%=request.getContextPath() %>/asset/viewasset">View Asset</a></li>
										<li><a href="<%=request.getContextPath() %>/assettype">Asset Type</a></li>
									</ul>	
								</li>
								<li><a href="<%=request.getContextPath() %>/vendordetails">Vendor Detail</a></li>
							</ul>
						</li>				
					</ul> 
				</nav> 
			</header>
		<!--Header End-->
		<!--Expense Type List-->
			<div id="employeeCTCList">
				<h1 align="center" id="noctcAvailable" class="hidden">Details <b class="saptaColor">Not Available</b> </h1>
				<div id="empctc" class="hidden">
					<h1><b class="saptaColor">Employee CTC</b> List</h1>
					 <div id = "optiondiv" class="cmnTable">
						<table width = "443px" align ="center">
							<tr>
								<td align="right" width = "150px">Choose Option</td>
								<td>:</td>
								<td align="left">						
									<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center">
										<option value="all" style="text-align: center;">--- All ---</option>
										<option value="findbyempid" style="text-align: left;">Find By Employee Id</option>
									</select>
								</td>
							</tr>
							<tr id="employeesearch" class = "hidden">
								<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Enter Employee Id</td>
								<td>:</td>
								<td align="left" colspan = "2" style=" padding-left: 0px;" >
									<input name="empfid" id="empfid" type="text" style="width: 195px; padding: 0px; margin-left: 7px;"/>
									<input type="button" value="Find" id="findByEmployeeId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
								</td>										
							</tr>
						</table>
						<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
					</div>
					 <table class="data" id="tbl">
						<tr>
							<th class="first">Employee Id</th>
							<th class="">CTC</th>
							<th class="">Start Date</th>
							<th class="">End Date</th>
							<th class="">Operation</th>
						</tr>					
						<c:forEach items="${empctcList}" var="empctclist">
							<tr>
								<td id="name_${empctclist.id}">${empctclist.empid}</td>
								<td id="number_${empctclist.id}">${empctclist.empctc}</td>
								<fmt:formatDate value="${empctclist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
								<td id="startdate_${empctclist.id}">${formattedDate}</td>
								<fmt:formatDate value="${empctclist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
								<c:if test="${empctclist.enddate == null}">
									<td id="enddate_${empctclist.id}">-</td>
								</c:if>
								<c:if test="${empctclist.enddate != null}">
									<td id="enddate_${empctclist.id}">${formattedEndDate}</td>
								</c:if>
								
								<td style="text-align:center"><a href='#' id="edit_${empctclist.id}">Update</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="empCTCDetails">
				<h1><b class="saptaColor">Add</b> New</h1>
				<table id="empCTCTable">
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee Id :</td>
						<td><input name="empid" id="empid" type="text" style="width: 200px;" onkeypress="return validateNumeric(event)"/></td>
						<td align="right"><sup class="saptaColor">*</sup>CTC :</td>
						<td><input name="employeectc" id="employeectc" type="text" style="width: 200px;" onkeypress="return validateNumeric(event)"/></td>								
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Start Date :</td>
						<td><input name="startdate" id="startdate" type="text" style="width: 200px;  height: 20px" class="datePcK"/></td>
						<td align="right">End Date :</td>
						<td><input name="enddate" id="enddate" type="text" style="width: 200px;  height: 20px" class="datePcK"/></td>
					</tr>	
					<tr>
						<td colspan=6 align ="left">
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
				<!-- <div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> --> 
				<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
			</div>
			<div id="empctcList" class="MRGT10PX">
				<table id="empctcgridtable"></table>
				<div id="empctcgridpager"></div>
			</div>
			<div id="editdetail" class="hidden">
				<h1>Update <b class="saptaColor">CTC Details</b></h1>
				<b class="saptaColor"><div id="notify_error"></div></b>
				<table>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Employee Id :</td>						
						<td><div id="editempid" onkeypress="return validateNumeric(event)" style="padding-left: 0px;"></div></td> 
						<td align="right"><sup class="saptaColor">*</sup>Employee CTC :</td>
						<td><input name="editemployeectc" id="editemployeectc" type="text" style="width: 200px;" onkeypress="return validateNumeric(event)" /></td>
					</tr>
					<tr>
						<td align="right"><sup class="saptaColor">*</sup>Start Date :</td>
						<td><input name="editstartdate" id="editstartdate" type="text" style="width: 200px;  height: 20px" class="datePcK"/></td>
						<td align="right">End Date :</td>
						<td><input name="editenddate" id="editenddate" type="text" style="width: 200px;  height: 20px" class="datePcK"/></td>
					</tr>
					<tr>
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
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empctc" id="menu_miscellaneous" ><input type="button" value="Done" id="asset" /></a></div>
			</div>
			<%-- <div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/empctc" id="menu_miscellaneous" ><input type="button" value="Done" id="user" /></a></div>
			</div> --%>
			<div id="confirmMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmMsgContent"></div>
				<div class="clearTable rightElement MRGT10PX">
					<div class="leftElement">
						<a href="#" id="confirmation" ><input type="button" value="Ok" id="user" /></a>
					</div>
					<div class="rightElement MRGL10PX">
						<a href ="#" style="text-decoration: none"><input type="button" value="Decline" class="graybtn" id = "decline"/>&nbsp;</a>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/empctc" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>	
	<script type="text/javascript">
		$(document).ready(function(){
			$(function() {
				 $( "#startdate, #enddate, #editstartdate, #editenddate" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
				 });
			 });	
			var ctcSize = "${empctcListsize}";
			if(ctcSize != null && ctcSize != 0){
				$("#empctcList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#empctcList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#optiondiv").addClass("hidden");
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
				enddate = enddate.split('/').join('-');

				if(empid == "" || empid.length == 0) validation = false;
				if(empctc == "" || empctc.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0) validation = false;
				if(enddate != "" || enddate.length != 0 || enddate == "null"){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) >= (enddatevalidation))  validation = false; 
				
				}
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(enddate == "" || enddate.length == 0) enddate = "null";
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
								$("#ctcMsgContent").html("Employee CTC added successfully ...");
								$.fancybox.open('#assetMsg', {closeBtn: false});
							}else{
								$("#errorMsgContent").html("Employee already has a active ctc please update...");
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
			
			/* $('#decline').click(function() {
				$.fancybox.close();
				$("body").css("cursor", "progress");
			});
			 */
			$("a[id^='edit_']").click(function() {
				$("body").css("cursor", "progress");
				var id = $(this).attr('id');
				var recordid = id.substring(5);
				$("#notify_error").html("");
				<c:forEach items="${empctcList}" var="empctclist">
					if("${empctclist.id}"==recordid){
						<fmt:formatDate value="${empctclist.startdate}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
						$("#editempid").html("${empctclist.empid}");
						$("#editemployeectc").val("${empctclist.empctc}");
						$("#editstartdate").val("${formattedDate}");
						var formatedate = "";
						if("${empctclist.enddate}" != ""){
							<fmt:formatDate value="${empctclist.enddate}" var="formattedEndDate" type="date" pattern="dd-MM-yyyy" />
							formatedate = "${formattedEndDate}";
						}
						$("#editenddate").val(formatedate);
					}
				</c:forEach>
				$.fancybox.open('#editdetail');
				$("body").css("cursor", "default");
			});
			
			$('#findoption').on('change', function (e) {
				$("#empfid").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/empctc/getbyempid";
					$("#empctcgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#empctcgridtable").trigger("reloadGrid");
					$("#empctcList").addClass("hidden");
					$("#tbl").removeClass("hidden");
					$("#empCTCDetails").removeClass("hidden");
					$("#employeesearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					//$("#assetDetail").addClass("hidden");
				}else if(optionval.val() == "findbyempid"){
					$("#empctcList").addClass("hidden");
					//$("#assetDetail").addClass("hidden");
					$("#employeesearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					$("#tbl").addClass("hidden");
					$("#empCTCDetails").addClass("hidden");
					$('#empfid').on('change', function (e) {
						if($("#empfid").val() != ""){
							var id =	$("#empfid").val();
							/* var resourceURL = $("#contextpath").val()+"/asset/get/"+id;
							$("#assetgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#assetgridtable").trigger("reloadGrid"); */
							//$("#assetList").removeClass("hidden");
							//$("#assetDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#empctcList").addClass("hidden");
							//$("#assetDetail").addClass("hidden");
						}
					});
				}
			});
			 
			var url = $("#contextpath").val()+"/empctc/getbyempid/"+empid;

			jQuery("#empctcgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Employee Id',' CTC', 'Start Date ','End Date', 'Status'], 
				colModel:[{name:'empid',index:'empid', width:162, resizable :false},
						  {name:'employeectc',index:'employeectc', width:142, resizable :true},
						  {name:'startdate',index:'startdate', width:210, resizable :true},
						  {name:'enddate',index:'enddate', width:215, resizable :true},
						  {name:'status',index:'status', width:183, resizable :true},],
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
				/* onSelectRow: function(id){
					empctcDetails(id)
				} */
			});
			jQuery("#empctcgridtable").jqGrid('navGrid','#empctcgridpager',{edit:false, add:false, del:false, search:false});
			
			$('#empfid').keypress(function(event){
				if(event.keyCode == 13) {
					$("#empctcList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					//$("#assetDetail").addClass("hidden");
					findbyempid();
				} 
			});
			
			$("#findByEmployeeId").click(function() {
				$("#empctcList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				//$("#assetDetail").addClass("hidden");
				findbyempid();
				
			});
			
			function findbyempid(){
				var count = 0;
				var empid = $("#empfid").val().split(" ").join("");
				<c:forEach items="${empctcList}" var="ctc">
					if("${ctc.empid}" == empid){
						var resourceURL = $("#contextpath").val()+"/empctc/getbyempid/"+empid;
						 $("#empctcgridtable").setGridParam({
							url:resourceURL,
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#empctcgridtable").trigger("reloadGrid"); 
						count++;
						$("#empctcList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "EmpCTC details not found for the given id " + empid.bold();
					$.fancybox.open('#alertMsg');
					var resourceURL = $("#contextpath").val()+"/empctc/get";
					 $("#empctcgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#empctcgridtable").trigger("reloadGrid");
				}
			}

			
			$('#updateDetails').click(function() {
				$("body").css("cursor", "progress");
				var validation = true;
				var empid = $("#editempid").html();
				var employeectc =$("#editemployeectc").val();
				var startdate = $("#editstartdate").datepicker().val();
				var enddate = $("#editenddate").datepicker().val();
				
				if(empid == "" || empid.length == 0) validation = false;
				if(employeectc == "" || employeectc.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0) validation = false;
				if(enddate != "" || enddate.length != 0 || enddate == "null"){
					var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
					var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) >= (enddatevalidation))  validation = false; 
				
				}
				if(validation == false){
					$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
				}else{
					if(enddate == "" || enddate.length == 0) enddate = "null";
					var resourceURL = $("#contextpath").val()+"/empctc/update/"+empid+"/"+employeectc+"/"+startdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#editempid").html('');
								$("#editemployeectc").val('');
								$("#editstartdate").val('');
								$("#editenddate").val('');
								$("#userMsgContent").html("Details updated successfully ...");
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
				 $.fancybox.close();
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			
			$("body").css("cursor", "default");
		});
	</script>
</html>