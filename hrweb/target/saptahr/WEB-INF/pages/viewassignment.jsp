<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
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
						<li class="active"><a href="#" id="menu_project">Project</a>
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath() %>/project/addproject">Add Project</a></li>
								<li><a href="<%=request.getContextPath() %>/project/viewproject">View Project</a></li>
								<li><a href="<%=request.getContextPath() %>/customer" id="menu_customer">Customer</a></li>
								<li><a href="<%=request.getContextPath() %>/assignment" id="menu_assignment">Assignment</a> </li>
							</ul>
						</li>
						<li><a href="#" id="menu_asset">Payroll</a> 
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
		<!--Assignment List Starts-->
			<div id="contentArea">
				<div align = "left" id="headlist" class="MRGT10PX"><h1>Assignment<b class="saptaColor"> List</b></h1></div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Assignment<b class="saptaColor"> Detail</b></h1></div>
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; height:25px; margin:0; text-align:center">
									<option value="all" style="text-align:center" >--- All ---</option>
									<option value="findbyid" style="text-align:left">Find By Assignment Id</option>
									<option value="findbyEmpid" style="text-align:left">Find By Employee Id</option>
								</select>
							</td>
						</tr>
					</table>
					<table width = "443px" align ="center"> 
						<tr id = "assignsearch" class = "hidden">
							<td align="right" width = "135px" style="padding-left: 77px;-webkit-padding-left: 79px;"><sup class="saptaColor">*</sup>Enter Assignment Id</td>
							<td style=" padding-right: 2px;">:</td>
							<td align="left" colspan = "2" tabindex="2"style=" padding-left: 0px; ">
								<input name="assignid" id="assignid" type="text" style="width: 200px; height:25px; padding: 0px; margin-left: 7px;"/>
								<input type="button" value="Find" id="findByAssignId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>								
						</tr>
					</table>
					<table width = "443px" align ="center"> 
						<tr id = "empsearch" class = "hidden">
							<td align="right" width = "135px" style="padding-left: 77px;-webkit-padding-left: 79px;"><sup class="saptaColor">*</sup>Enter Employee Id</td>
							<td style=" padding-right: 2px;">:</td>
							<td align="left" colspan = "2" tabindex="2"style=" padding-left: 0px; ">
								<input name="emp_id" id="emp_id" type="text" style="width: 200px; height:25px; padding: 0px; margin-left: 7px;"/>
								<input type="button" value="Find" id="findByEmployeeId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>								
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				<div id="empassList" class="hidden MRGT10PX">
					<table id="assigngridtable"></table>
					<div id="assigngridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX">
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
			<!--Assignment List End-->
			<!-- Assignment Details Starts-->
				<div id="assignmentDetail" class="hidden MRGT10PX">
					<div align = "left"  id="back_assignlist" class = ""><a href="#" id="show_showassignlist">Assignment List </a>/ Assignment Details</div><br/>
					<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
								<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
							</c:when>
					</c:choose>	
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
					</div>
					<table class="tableContent">
						<tr>
							<td class="lableContent">Assignment Id</td>
							<td class="value"><input id="assign_id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Start Date</td>
							<td id="startdate_tabledata" class="value hidden"><input id="startdate" disabled="disabled" class="inputdisable"></td>
							<td id="startdate_tablediv" class="value"><div id="optional_startdate" class="value"></div></td>
						</tr>
						<tr>
							<td class="lableContent">End Date</td>
							<td id="enddate_tabledata" class="value hidden"><input id="enddate" disabled="disabled" class="inputdisable"></td>
							<td id="enddate_tablediv" class="value"><div id="optional_enddate" class="value"></div></td>
						</tr>
						<tr class="">
							<td class="lableContentSelect">Status</td>
							<td class="valueContent">	
								<select id="assignstatus" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<option value="" style="text-align:center">---Select---</option>
									<option value="a">Active</option>
									<option value="i">In-Active</option>
								</select>
								<div id="optional_status" class="value"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Comments</td>
							<td class="value"><input id="comments" disabled="disabled" class="inputdisable"></td>
						</tr>
					</table>
			<!-- Employee Assignment Details Starts-->
					<div> <h1> <b class="saptaColor"> Employee</b> Details </h1></div>
					<table class="tableContent">
						<tr>
							<td class="lableContent">Employee Id</td>
							<td class="value"><a href="#" id="show_employee"> <div id="employeeid" disabled="disabled" class="inputdisable"></div></a></td>
						</tr>
						<tr>
							<td class="lableContent">First Name</td>
							<td class="value"><div id="fname"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Last Name</td>
							<td class="value"><div id="lname"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Email</td>
							<td class="value"><div id="eemail"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Mobile</td>
							<td class="value"><div id="emobile"></div></td>
						</tr>
					</table>
			<!-- Employee Assignment Details End-->
			<!-- Project Assignment Details Starts -->
					 <div> <h1> <b class="saptaColor"> Project</b> Details </h1></div>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Project Id</td>
								<td class="value"><div id="pid" disabled="disabled" class="inputdisable"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Customer Name</td>
								<td class="value"><a href="#" id="show_customer"> <div id="customer_id"> </div></a></td>
							</tr>
							<tr>
								<td class="lableContent">Project Name</td>
								<td class="value"><div id="pname"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Description</td>
								<td class="value"><div id="pdesc"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Type</td>
								<td class="value"><div id="ptype"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Status</td>
								<td class="value"><div id="pstatus"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Start Date</td>
								<td class="value"><div id="sdate"></div></td>
							</tr>
							<tr>
								<td class="lableContent">End Date</td>
								<td class="value"><div id="edate"></div></td>
							</tr>
						</table><br/>
					</div>
			<!-- Project Assignment Details Starts -->
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
					<a href="<%=request.getContextPath() %>/assignment/viewassignment" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
			<!-- Assignment Details End-->
			<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script>
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
				 $( "#startdate, #enddate" ).datepicker({
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
			var size = "${assignListSize}";
			if(size > 0){
				$("#empassList").removeClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#headlist").addClass("hidden");
			}
			var id = "${id}";
			var url = "";
			if(id == undefined || id == null || id.length <= 0 || id == ""){
				url = $("#contextpath").val()+"/assignment/get";
			}else{
				url = $("#contextpath").val()+"/assignment/get/"+id;
			}
			jQuery("#assigngridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Employee Name','Project Name', 'Start Date', 'End Date', 'Status'], 
				colModel:[
						  {name:'empid',index:'empid', width:195, resizable :true},
						  {name:'pid',index:'pid', width:195, resizable :true},
						  {name:'sdate',index:'sdate', width:195, resizable :false},
						  {name:'edate',index:'edate', width:195, resizable :false},
						  {name:'status',index:'status', width:133, resizable :false},],
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#assigngridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					assignmentDetails(id)
				}
			});
			jQuery("#assigngridtable").jqGrid('navGrid','#assigngridpager',{edit:false, add:false, del:false, search:false});
			function assignmentDetails(id) {
				$("body").css("cursor", "progress");
				var empid = null;
				var projectid = null;
				$("#empassList").addClass("hidden");
				$("#assignmentDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				var resourceURL = $("#contextpath").val()+"/assignment/retrivebyid/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						var sdat = data.response.result.enddate;
						var astatus = data.response.result.status;
						
						if(successflag == "true"){
							$.each(results, function (i, result) {
								empid = result.empid;
								projectid = result.projectid;
								$("#assign_id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#startdate").val((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#optional_startdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").val((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#optional_enddate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#assignstatus").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("In-Active");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								
								$("#employeeid").html((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
								$("#pid").html((result.projectid == undefined || result.projectid == null || result.projectid.length <= 0) ? "-" : result.projectid);
							}); 
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
				var resourceURL = $("#contextpath").val()+"/assignment/retrivebyempid/"+empid;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						
						if(successflag == "true"){
							$.each(results, function (i, result){
								$("#fname").html((result.firstname == undefined || result.firstname == null || result.firstname.length <= 0) ? "-" : result.firstname);
								$("#lname").html((result.lastname == undefined || result.lastname == null || result.lastname.length <= 0) ? "-" : result.lastname);
								$("#eemail").html((result.email == undefined || result.email == null || result.email.length <= 0) ? "-" : result.email);
								$("#emobile").html((result.mobile == undefined || result.mobile == null || result.mobile.length <= 0) ? "-" : result.mobile);
							}); 
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
				var resourceURL = $("#contextpath").val()+"/assignment/retrivebyprojectid/"+projectid;
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
								<c:forEach items="${customerList}" var="custlist">
									if("${custlist.id}" == result.customerid){
										$("#customer_id").html("${custlist.name}")
									}
								</c:forEach>
								//$("#customer_id").html((result.customerid == undefined || result.customerid == null || result.customerid.length <= 0) ? "-" : result.customerid);
								$("#pname").html((result.projectname == undefined || result.projectname == null || result.projectname.length <= 0) ? "-" : result.projectname);
								$("#pdesc").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#ptype").html((result.type == undefined || result.type == null || result.type.length <= 0) ? "-" : result.type);
								if(result.status == "a"){
									$("#pstatus").html("Active");
								} else if(result.status == "i"){
									$("#pstatus").html("In-Active");
								}
								else if((result.status == undefined || result.status == null || result.status.length <= 0)){
									$("#pstatus").html("-");
								}
								$("#sdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#edate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
							}); 
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
				$("body").css("cursor", "default");
			}
			$('#findoption').on('change', function (e) {
				$("#assignid").val("");
				$("#emp_id").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/assignment/get";
					$("#assigngridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#assigngridtable").trigger("reloadGrid");
					$("#empassList").removeClass("hidden");
					$("#assignsearch").addClass("hidden");
					$("#empsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#assignmentDetail").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#empassList").addClass("hidden");
					$("#assignmentDetail").addClass("hidden");
					$("#assignsearch").removeClass("hidden");
					$("#empsearch").addClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
			   }else if(optionval.val() == "findbyEmpid"){
					$("#empassList").addClass("hidden");
					$("#assignmentDetail").addClass("hidden");
					$("#assignsearch").addClass("hidden");
					$("#empsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
			   }
			});
			$("#edit").click(function() {
				$("body").css("cursor", "default");
				$("#startdate_tabledata").removeClass("hidden");
				$("#startdate_tablediv").addClass("hidden");
				$("#enddate_tabledata").removeClass("hidden");
				$("#enddate_tablediv").addClass("hidden");
					//Select box Properties
				$("#assignstatus").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				//Clearing " - " values if the value was null
				
				if($("#startdate").val() == "-"){
					$("#startdate").val("");
				}
				if($("#enddate").val() == "-"){
					$("#enddate").val("");
				}
				if($("#comments").val() == "-"){
					$("#comments").val("");
				}
				
				$("#assign_id").prop( "disabled", true );
				$("#startdate").prop( "disabled", false );
				$("#enddate").prop( "disabled", false );
				$("#comments").prop( "disabled", false );
				
				$("#assign_id").removeClass("inputdisable");
				$("#startdate").removeClass("inputdisable");
				$("#enddate").removeClass("inputdisable");
				$("#comments").removeClass("inputdisable");
				
				$("#assign_id").addClass("inputBorder");
				$("#startdate").addClass("inputBorder");
				$("#enddate").addClass("inputBorder");
				$("#comments").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#decline_yes").click(function() {
				$("#startdate_tabledata").removeClass("hidden");
				$("#startdate_tablediv").addClass("hidden");
				$("#enddate_tabledata").removeClass("hidden");
				$("#enddate_tablediv").addClass("hidden");
				//Select box Properties
				$("#assignstatus").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment About Details
				declineAssingmentDeatils();
				$("#assign_id").prop( "disabled", true );
				$("#startdate").prop( "disabled", true );
				$("#enddate").prop( "disabled", true );
				$("#comments").prop( "disabled", true );
				
				$("#assign_id").removeClass("inputBorder");
				$("#startdate").removeClass("inputBorder");
				$("#enddate").removeClass("inputBorder");
				$("#comments").removeClass("inputBorder");

				$("#assign_id").addClass("inputdisable");
				$("#startdate").addClass("inputdisable");
				$("#enddate").addClass("inputdisable");
				$("#comments").addClass("inputdisable");
				 $.fancybox.close();
			});
			function declineAssingmentDeatils(){
				var id = $("#assign_id").val();
				var resourceURL = $("#contextpath").val()+"/assignment/retrivebyid/"+id;
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
								$("#assign_id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#startdate").val((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#optional_startdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").val((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#optional_enddate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#assignstatus").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("In-Active");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#assignstatus").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								$("#startdate_tabledata").addClass("hidden");
								$("#startdate_tablediv").removeClass("hidden");
								$("#enddate_tabledata").addClass("hidden");
								$("#enddate_tablediv").removeClass("hidden");
								$("#employeeid").html((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
								$("#pid").html((result.projectid == undefined || result.projectid == null || result.projectid.length <= 0) ? "-" : result.projectid);
							}); 
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
			$("#update").click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				var id = $("#assign_id").val();
				var startdate = $("#startdate").datepicker().val();
				var enddate = $("#enddate").datepicker().val();
				var comments = $("#comments").val();
				var status = $("#assignstatus").val();
				var employeeid = $("#employeeid").html();
				var pid = $("#pid").html();
				if(startdate == "" || startdate.length == 0) validation = false; 
				if(enddate == "" || enddate.length == 0) validation = false; 
				if(status == "" || status.length == 0) validation = false;
				var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
				var enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
				if ((startdatevalidation) >= (enddatevalidation))  validation = false; 
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(comments == "" || comments.length == 0 || comments == "-") comments = "null"; 
					var resourceURL = $("#contextpath").val()+"/assignment/update/"+id+"/"+startdate+"/"+enddate+"/"+status+"/"+employeeid+"/"+pid+"/"+comments;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								//Status Selectbox Properties
								if(status == "a"){
									$("#optional_status").html("Active");
								}else if(status == "i"){
									$("#optional_status").html("In-Active");
								}
								$("#assignstatus").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								
								$("#edit").removeClass("hidden");
								$("#delete").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								// add element value as " - " if value is emply or null after updation
								
								if($("#startdate").val() == "" || $("#startdate").val() == "-"){
									$("#startdate").val("-");
									$("#optional_startdate").html("-");
								} else{
									$("#optional_startdate").html(startdate);
								}
								$("#startdate_tabledata").addClass("hidden");
								$("#startdate_tablediv").removeClass("hidden");
								if($("#enddate").val() == "" || $("#enddate").val() == "-"){
									$("#enddate").val("-");
									$("#optional_enddate").html("-");
								} else {
									$("#optional_enddate").html(enddate);
								}
								$("#enddate_tabledata").addClass("hidden");
								$("#enddate_tablediv").removeClass("hidden");
								if($("#comments").val() == "" || $("#comments").val() == "-"){
									$("#comments").val("-");
								}
								
								$("#assign_id").prop( "disabled", true );
								$("#startdate").prop( "disabled", true );
								$("#enddate").prop( "disabled", true );
								$("#comments").prop( "disabled", true );
								$("#employeeid").prop( "disabled", true );
								$("#pid").prop( "disabled", true );
								
								$("#assign_id").removeClass("inputBorder");
								$("#startdate").removeClass("inputBorder");
								$("#enddate").removeClass("inputBorder");
								$("#comments").removeClass("inputBorder");
								$("#employeeid").removeClass("inputBorder");
								$("#pid").removeClass("inputBorder");
								
								$("#assign_id").addClass("inputdisable");
								$("#startdate").addClass("inputdisable");
								$("#enddate").addClass("inputdisable");
								$("#comments").addClass("inputdisable");
								$("#employeeid").addClass("inputdisable");
								$("#pid").addClass("inputdisable");
								$("#alertMsgContent").html("Assignment details updated successfully...");
								$.fancybox.open('#alertMsg');
							}else{
								$("#edit").addClass("hidden");
								$("#delete").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
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
			$("#delete").click(function(){
				$("#confirmationMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#confirmMsg');
			});
			$("#delete_yes").click(function(){
				$("body").css("cursor", "progress");
				var id = $("#assign_id").val();
				var resourceURL = $("#contextpath").val()+"/assignment/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
								$("#successful_msg_content").html("Assignment deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
				$("body").css("cursor", "default");
			});
			$("#delete_no").click(function(){
				 $.fancybox.close();
			 });
			function assignmentDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/assignment/get";
				$("#assigngridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#assigngridtable").trigger("reloadGrid");
				$("#empassList").removeClass("hidden");
				$("#assignsearch").addClass("hidden");
				$("#empsearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#assignmentDetail").addClass("hidden");
			}
			$('#assignid').keypress(function(event){
				if(event.which == 13) {
					$("#empassList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyempid();
				}
			});
			$('#emp_id').keypress(function(event){
				if(event.which == 13) {
					$("#empassList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyempid();
				}
			});
			$("#findByAssignId").click(function() {
				$("body").css("cursor", "progress");
				$("#empassList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyempid();
				$("body").css("cursor", "default");
			});
			$("#findByEmployeeId").click(function() {
				$("body").css("cursor", "progress");
				$("#empassList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyempid();
				$("body").css("cursor", "default");
			});
			function findbyempid(){
				$("body").css("cursor", "progress");
				var count = 0;
				/* var aid = 0;
				var eid = 0; */
				aid = $("#assignid").val().split(" ").join("");
				eid = $("#emp_id").val().split(" ").join("");
				<c:forEach items="${assignList}" var="assignlist">
					if("${assignlist.id}" == aid){
						var resourceURL = $("#contextpath").val()+"/assignment/get/"+aid;
						$("#assigngridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#assigngridtable").trigger("reloadGrid");
						count++;
						$("#empassList").removeClass("hidden");
					}else if("${assignlist.empid}" == eid){
						var resourceURL = $("#contextpath").val()+"/assignment/getEmp/"+eid;
						$("#assigngridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#assigngridtable").trigger("reloadGrid");
						count++;
						$("#empassList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0 ){
					if(aid != 0 || aid != "" || aid.length != 0){
						document.getElementById("alertMsgContent").innerHTML = "Assignment details not found for the given id " + aid.bold();
						$.fancybox.open('#alertMsg');
					 }else if(eid != 0 || eid != "" || eid.length != 0){
						document.getElementById("alertMsgContent").innerHTML = "Assignment details not found for the given Employee id " + eid.bold();
						$.fancybox.open('#alertMsg');
					 } 
					var resourceURL = $("#contextpath").val()+"/assignment/get";
					$("#projectgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
						$("#assigngridtable").trigger("reloadGrid");
						$("#empassList").addClass("hidden");
						$("#mandatorycheck").addClass("hidden");
				}
				$("body").css("cursor", "default");
			}
			$("#show_showassignlist").click(function() {
				$("body").css("cursor", "progress");
				
				    var resourceURL = $("#contextpath").val()+"/assignment/get";
					if($("#findoption").val() != "all"){
						var aid = $("#asignid").val();
						resourceURL = $("#contextpath").val()+"/assignment/get/"+aid;
					}
					
					$("#assigngridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#assigngridtable").trigger("reloadGrid");
					
					
					$("#assignmentDetail").addClass("hidden");
					$("#empassList").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#headlist").removeClass("hidden");
					$("#startdate_tabledata").removeClass("hidden");
					$("#startdate_tablediv").addClass("hidden");
					$("#enddate_tabledata").removeClass("hidden");
					$("#enddate_tablediv").addClass("hidden");
					$("#assignstatus").removeClass("hidden");
					$("#optional_status").addClass("hidden");
					$("#assignstatus").removeClass("hidden");
					$("#optional_status").addClass("hidden");
					
					$("#edit").removeClass("hidden");
					$("#delete").removeClass("hidden");
					$("#updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#id").prop( 'disabled', false );
					$("#assign_id").prop( "disabled", true );
					$("#startdate").prop( "disabled", true );
					$("#enddate").prop( "disabled", true );
					$("#comments").prop( "disabled", true );
					
					$("#assign_id").removeClass("inputBorder");
					$("#startdate").removeClass("inputBorder");
					$("#enddate").removeClass("inputBorder");
					$("#comments").removeClass("inputBorder");

					$("#assign_id").addClass("inputdisable");
					$("#startdate").addClass("inputdisable");
					$("#enddate").addClass("inputdisable");
					$("#comments").addClass("inputdisable");
				$("body").css("cursor", "default");
			});	
			$("#show_employee").click(function() {
				$("body").css("cursor", "progress");
					var resourceURL = $("#contextpath").val()+"/employee/viewemployee/"+$("#employeeid").html();
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});	
			$("#show_customer").click(function() {
				$("body").css("cursor", "progress");
				var id = null;
				<c:forEach items="${customerList}" var="custlist">
					if("${custlist.name}" == $("#customer_id").html()){
						id = "${custlist.id}";
					}
				</c:forEach>
					var resourceURL = $("#contextpath").val()+"/customer/viewcustomer/"+id;
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});	
	</script>
</html>
