<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<style type="text/css">
			.ui-datepicker-trigger{
				margin-top: 3px;
				/* margin-left: 2px; */
			}
		</style>
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
		<!--Assignment List Starts-->
			<div id="contentArea">
				<div class="responsive">
				<table class="data display" id="viewAssignmentTbl" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th class="first">Assignment&nbsp;Id</th>
							<th class="">Employee&nbsp;Name</th>
							<th class="">Project&nbsp;Name</th>
							<th class="">Bill&nbsp;Type</th>
							<th class="">Start&nbsp;Date</th>
							<th class="">End&nbsp;Date</th>
							<th class="">Status</th>
						</tr>
					</thead>	
					<tbody>
					</tbody>				
				</table>
				</div>
				<div id="norecords" class="hidden MRGT10PX">
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
				<!--Assignment List End-->
				<!-- Assignment Details Starts-->
				<div id="assignmentDetail" class="hidden MRGT10PX">
					<div align="left" id="back_showassignlist" class=""><a href="#" id="show_showassignlist">Assignment List </a>/ Assignment Details</div><br/>
					
					<div class="tabsMenu">
						<a href="#tab21" class="ass_tab_arrow"><div class="tabImagLt"><img src="<%=request.getContextPath() %>/resources/images/previous.png" alt="Previous" style="width:15px;"/></div></a>
						<div class="scrl" >
						<div class="scrlMenu">
						 	 <ul class="tab-links"  style="width:350px">
							    <li id="tab_li1" class="active"><a href="#tab1">Assignment</a></li>
							    <li id="tab_li2"><a href="#tab2">Employee Details</a></li>
							    <li id="tab_li3"><a href="#tab3">Project</a></li>
						 	 </ul>
						 </div>
						 </div>
						 <a href="#tab15" class="ass_tab_arrow"><div class="tabImagRt"><img src="<%=request.getContextPath() %>/resources/images/nextLeft.png" alt="Next" style="width:15px;"></imag></div></a>	
						
					</div>
					
					<div class="tab-content">
						
					    <div id="tab1" class="tab active">
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
					    	<table class="tableContent" >
								<tr>
									<td class="lableContent">Assignment Id</td>
									<td class="value"><input id="assign_id" disabled="disabled" class="inputdisable"></td>
								</tr>
								<tr>
									<td class="lableContent">Start Date</td>
									<td id="startdate_tabledata" class="value hidden">
										<b style="float:left; height: 20px;"><input id="startdate" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
									</td>
									<td id="startdate_tablediv" class="value"><div id="optional_startdate" class="value"></div></td>
								</tr>
								<tr>
									<td class="lableContent">End Date</td>
									<td id="enddate_tabledata" class="value hidden">
										<b style="float:left; height: 20px;"><input id="enddate" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
									</td>
									<td id="enddate_tablediv" class="value"><div id="optional_enddate" class="value"></div></td>
								</tr>
								<tr>
									<td class="lableContent">PO / WO</td>
									<td class="value"><input id="powo" disabled="disabled" class="inputdisable"></td>
								</tr>
								<tr>
									<td class="lableContent">Amount</td>
									<td class="value"><input id="amount" disabled="disabled" class="inputdisable"></td>
								</tr>
								<tr>
									<td class="lableContentSelect">Amount Type</td>
									<td class="valueContent">
										<select id="amounttype" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
											<option value="" style="text-align: center;">--- Amount Type ---</option>
											<option value="inr" style="text-align: left;">INR</option>
											<option value="usd" style="text-align: left;">USD</option>
											<option value="eur" style="text-align: left;">EUR</option>
											<option value="gbp" style="text-align: left;">GBP</option> 
										</select>
										<div id="optional_amounttype" class="value"></div>
									</td>
								</tr>
								<tr>
									<td class="lableContentSelect">Bill Type</td>
									<td class="valueContent">
										<select id="billtype" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
											<option value="" style="text-align: center;">--- Bill Type ---</option>
											<option value="h" style="text-align: left;">Hourly</option>
											<option value="d" style="text-align: left;">Daily</option>
											<option value="w" style="text-align: left;">Weekly</option>
											<option value="m" style="text-align: left;">Monthly</option>
											<option value="f" style="text-align: left;">Fixed</option> 
										</select>
										<div id="optional_billtype" class="value"></div>
									</td>
								</tr>
								<tr class="">
									<td class="lableContentSelect">Status</td>
									<td class="valueContent">	
										<select id="assignstatus" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
											<!-- <option value="" style="text-align:center">---Select---</option> -->
											<option value="a" style="text-align:left">Active</option>
											<option value="i" style="text-align:left">Closed</option>
										</select>
										<div id="optional_status" class="value"></div>
									</td>
								</tr>
								<tr>
									<td class="lableContent">Comments</td>
									<td class="value"><input id="comments" disabled="disabled" class="inputdisable"></td>
								</tr>
							</table>
					    </div>
					    <div id="tab2" class="tab">
					    	<!-- Employee Assignment Details Starts-->
							<table class="tableContent">
								<tr>
									<td class="lableContent">Employee Id</td>
									<td class="value"><a href="#" id="show_employee"> <div id="employeeid"></div></a></td>
								</tr>
								<tr>
									<td class="lableContent">First Name</td>
									<td class="valueContent"><div id="fname"></div></td>
								</tr>
								<tr>
									<td class="lableContent">Last Name</td>
									<td class="valueContent"><div id="lname"></div></td>
								</tr>
								<tr>
									<td class="lableContent">Email</td>
									<td class="valueContent"><div id="eemail"></div></td>
								</tr>
								<tr>
									<td class="lableContent">Mobile</td>
									<td class="valueContent"><div id="emobile"></div></td>
								</tr>
							</table>
							<!-- Employee Assignment Details End-->
					    </div>
					 
					    <div id="tab3" class="tab">
							<!-- Project Assignment Details Starts -->
							<table class="tableContent">
								<tr>
									<td class="lableContent">Project Name</td>
									<td class="value"><a href="#" id="show_Project"><div id="pid"></div></a></td>
								</tr>
								<tr>
									<td class="lableContent">Customer Name</td>
									<td class="value"><a href="#" id="show_customer"> <div id="customer_id"> </div></a></td>
								</tr>
							</table><br/>
							<!-- Project Assignment Details Starts -->
					    </div>
				   </div>
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
		<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Assignment<b class='saptaColor'> List");
			$("body").css("cursor", "progress");
			
			var scrolcount = 1;
			var scrol=50;
		    $("div.tabImagRt").click(function(){
		    	var scrolwidth = $("div.scrl").scrollLeft();
		    		    	
		    	if(scrolwidth <= 100){			    
		    		scrol+=50; 	
			    	scrolcount = scrolwidth;
			    	$("div.scrl").animate({scrollLeft: scrol}, 100);
			    	
			    	//$( "div.scrl" ).scrollLeft(scrol);
		    	}
		    });
		    $("div.tabImagLt").click(function(){
		    	var scrolleftwidth = $("div.scrl").scrollLeft();
		    	
		    	if(scrolleftwidth > 0){
			    	scrol-=50;
			    	$("div.scrl").animate({scrollLeft: scrol}, 100);
			    	//$( "div.scrl" ).scrollLeft(scrol);	
		    	}
		    	
			    //$( "div.scrl" ).scrollLeft(scrol);	
		    });
			
			
			
			
			var id = "${id}";
			var url = "";
			url = $("#contextpath").val()+"/assignment/get";
			
			
			$("#viewAssignmentTbl").dataTable({
				responsive:true,
				"ajax": url,
				"aaSorting" : [],
				"aoColumns": [ 
			                  {sClass: "alignleft"}, 
			                  {sClass: "alignleft"}, 
			                  {sClass: "alignleft"},
			                  {sClass: "center"},
			                  {sClass: "center"},
			                  {sClass: "center"},
			                  {sClass: "center"}
			                ]
			});
			
			//$("#viewAssignmentTbl").dataTable();
			
			$('#viewAssignmentTbl tbody').on('click', 'tr',function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	assignmentDetails(id);
		        }
		    });
			
			$("body").css("cursor", "default");
			$("#menu_project").addClass("active");
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
				$("#norecords").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#headlist").removeClass("hidden");
			}
			
			function assignmentDetails(id) {
				$("body").css("cursor", "progress");
				var empid = null;
				var projectid = null;
				$("#viewAssignmentTbl_wrapper").addClass("hidden");
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
									$("#optional_status").html("Closed");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#powo").val((result.powo == undefined || result.powo == null || result.powo.length <= 0) ? "-" : result.powo);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "inr"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "usd"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								} 
								$("#billtype").val((result.billtype == undefined || result.billtype == null || result.billtype.length <= 0) ? "-" : result.billtype);
								if(result.billtype == "h"){
									$("#optional_billtype").html("Hourly");
								}else if(result.billtype == "d"){
									$("#optional_billtype").html("Daily");
								}else if(result.billtype == "w"){
									$("#optional_billtype").html("Weekly");
								}else if(result.billtype == "m"){
									$("#optional_billtype").html("Monthly");
								}else if(result.billtype == "f"){
									$("#optional_billtype").html("Fixed");
								}else if(result.billtype == undefined || result.billtype == "null" || result.billtype == null || result.billtype.length <= 0){
									$("#optional_billtype").html("-");
								}
								$("#employeeid").html((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
								<c:forEach items="${projectList}" var="projectlist">
									if("${projectlist.id}" == result.projectid){
										$("#pid").html("${projectlist.dispname}");
									}
								</c:forEach>
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
					async : false,
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
					async : false,
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
				$("body").css("cursor", "progress");
				$("#startdate_tabledata").removeClass("hidden");
				$("#startdate_tablediv").addClass("hidden");
				$("#enddate_tabledata").removeClass("hidden");
				$("#enddate_tablediv").addClass("hidden");
					//Select box Properties
				$("#assignstatus").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				$("#billtype").removeClass("hidden");
				$("#optional_billtype").addClass("hidden");
				
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
				if($("#powo").val() == "-"){
					$("#powo").val("");
				}
				if($("#amount").val() == "-"){
					$("#amount").val("");
				}
				$("#assign_id").prop( "disabled", true );
				$("#startdate").prop( "disabled", false );
				$("#enddate").prop( "disabled", false );
				$("#comments").prop( "disabled", false );
				$("#powo").prop( "disabled", false );
				$("#amount").prop( "disabled", false );
				
				$("#assign_id").removeClass("inputdisable");
				$("#startdate").removeClass("inputdisable");
				$("#enddate").removeClass("inputdisable");
				$("#comments").removeClass("inputdisable");
				$("#powo").removeClass("inputdisable");
				$("#amount").removeClass("inputdisable");
				
				$("#assign_id").addClass("inputBorder");
				$("#startdate").addClass("inputBorder");
				$("#enddate").addClass("inputBorder");
				$("#comments").addClass("inputBorder");
				$("#powo").addClass("inputBorder");
				$("#amount").addClass("inputBorder");
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
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				$("#billtype").removeClass("hidden");
				$("#optional_billtype").addClass("hidden");
				
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
				$("#powo").prop( "disabled", true );
				$("#amount").prop( "disabled", true )
				
				$("#assign_id").removeClass("inputBorder");
				$("#startdate").removeClass("inputBorder");
				$("#enddate").removeClass("inputBorder");
				$("#comments").removeClass("inputBorder");
				$("#powo").removeClass("inputBorder");
				$("#amount").removeClass("inputBorder");

				$("#assign_id").addClass("inputdisable");
				$("#startdate").addClass("inputdisable");
				$("#enddate").addClass("inputdisable");
				$("#comments").addClass("inputdisable");
				$("#powo").addClass("inputdisable");
				$("#amount").addClass("inputdisable");
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
									$("#optional_status").html("Closed");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#powo").val((result.powo == undefined || result.powo == null || result.powo.length <= 0) ? "-" : result.powo);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								 if(result.amounttype == "inr"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "usd"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								} 
								$("#billtype").val((result.billtype == undefined || result.billtype == null || result.billtype.length <= 0) ? "-" : result.billtype);
								if(result.billtype == "h"){
									$("#optional_billtype").html("Hourly");
								}else if(result.billtype == "d"){
									$("#optional_billtype").html("Daily");
								}else if(result.billtype == "w"){
									$("#optional_billtype").html("Weekly");
								}else if(result.billtype == "m"){
									$("#optional_billtype").html("Monthly");
								}else if(result.billtype == "f"){
									$("#optional_billtype").html("Fixed");
								}else if(result.billtype == undefined || result.billtype == null || result.billtype.length <= 0){
									$("#optional_billtype").html("-");
								} 
								$("#assignstatus").addClass("hidden");
								$("#amounttype").addClass("hidden");
								$("#billtype").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								$("#optional_billtype").removeClass("hidden");
								$("#startdate_tabledata").addClass("hidden");
								$("#startdate_tablediv").removeClass("hidden");
								$("#enddate_tabledata").addClass("hidden");
								$("#enddate_tablediv").removeClass("hidden");
								$("#employeeid").html((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
								<c:forEach items="${projectList}" var="projectlist">
									if("${projectlist.id}" == result.projectid){
										$("#pid").html("${projectlist.dispname}");
									}
								</c:forEach>
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
				var powo = $("#powo").val();
				var amount = $("#amount").val();
				var amounttype = $("#amounttype").val();
				var billtype = $("#billtype").val();
				var enddatevalidation = "";
				var pid = "";
				<c:forEach items="${projectList}" var="projectlist">
					if("${projectlist.dispname}" == $("#pid").html()){
						pid = "${projectlist.id}";
					}
				</c:forEach>
				
				if(startdate == "" || startdate.length == 0) validation = false; 
				//if(enddate == "" || enddate.length == 0) validation = false; 
				if(status == "" || status.length == 0) validation = false;
				var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
				if(enddate != ""){
					enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) > (enddatevalidation))  validation = false; 
				}else{
					enddate = "null";
				}
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(comments == "" || comments.length == 0 || comments == "-") comments = "null";
					if(powo == "" || powo.length == 0 || powo == "-") powo = "null"; 
					if(amount == "" || amount.length == 0 || amount == "-") amount = "null"; 
					if(amounttype == "" || amounttype.length == 0 || amounttype == "-") amounttype = "null"; 
					if(billtype == "" || billtype.length == 0 || billtype == "-") billtype = "null"; 
					var resourceURL = $("#contextpath").val()+"/assignment/update/"+id+"/"+startdate+"/"+enddate+"/"+powo+"/"+status+"/"+employeeid+"/"+pid+"/"+comments+"/"+amount+"/"+amounttype+"/"+billtype;
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
									$("#optional_status").html("Closed");
								}
								$("#assignstatus").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								
								if(amounttype == "inr"){
									$("#optional_amounttype").html("INR");
								}else if(amounttype == "usd"){
									$("#optional_amounttype").html("USD");
								}else if(amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
								}else if(amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								if(billtype == "h"){
									$("#optional_billtype").html("Hourly");
								}else if(billtype == "d"){
									$("#optional_billtype").html("Daily");
								}else if(billtype == "w"){
									$("#optional_billtype").html("Weekly");
								}else if(billtype == "m"){
									$("#optional_billtype").html("Monthly");
								}else if(billtype == "f"){
									$("#optional_billtype").html("Fixed");
								}
								$("#billtype").addClass("hidden");
								$("#optional_billtype").removeClass("hidden");
								
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
								if($("#amount").val() == "" || $("#amount").val() == "-"){
									$("#amount").val("-");
								}
								if($("#powo").val() == "" || $("#powo").val() == "-"){
									$("#powo").val("-");
								}
								
								$("#assign_id").prop( "disabled", true );
								$("#startdate").prop( "disabled", true );
								$("#enddate").prop( "disabled", true );
								$("#comments").prop( "disabled", true );
								$("#powo").prop( "disabled", true );
								$("#amount").prop( "disabled", true );
								$("#employeeid").prop( "disabled", true );
								$("#pid").prop( "disabled", true );
								
								$("#assign_id").removeClass("inputBorder");
								$("#startdate").removeClass("inputBorder");
								$("#enddate").removeClass("inputBorder");
								$("#comments").removeClass("inputBorder");
								$("#powo").removeClass("inputBorder");
								$("#amount").removeClass("inputBorder");
								$("#employeeid").removeClass("inputBorder");
								$("#pid").removeClass("inputBorder");
								
								$("#assign_id").addClass("inputdisable");
								$("#startdate").addClass("inputdisable");
								$("#enddate").addClass("inputdisable");
								$("#comments").addClass("inputdisable");
								$("#powo").addClass("inputdisable");
								$("#amount").addClass("inputdisable");
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
				var aid = 0;
				var eid = 0;
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
				if(count == 0){
					if(aid != 0 || aid != "" || aid.length != 0 || aid != null && (!$("#assignsearch").hasClass("hidden"))){
						document.getElementById("alertMsgContent").innerHTML = "Assignment details not found for the given assignment id " + aid.bold();
						$.fancybox.open('#alertMsg');
					 }else if(eid != 0 || eid != "" || eid.length != 0 || eid != null && (!$("#empsearch").hasClass("hidden"))){
						document.getElementById("alertMsgContent").innerHTML = "Assignment details not found for the given employee id " + eid.bold();
						$.fancybox.open('#alertMsg');
					 } 
						$("#assigngridtable").trigger("reloadGrid");
						$("#empassList").addClass("hidden");
						$("#mandatorycheck").addClass("hidden");
				}
				$("body").css("cursor", "default");
			}
			/* $("#show_showassignlist").click(function() {
				$("body").css("cursor", "progress");
				
				    var resourceURL = $("#contextpath").val()+"/assignment/get";
					
					$("#assigngridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#assigngridtable").trigger("reloadGrid");
					
					
					$("#findoption").val("all");
					$("#assignmentDetail").addClass("hidden");
					$("#empassList").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#headlist").removeClass("hidden");
					$("#startdate_tabledata").addClass("hidden");
					$("#startdate_tablediv").removeClass("hidden");
					$("#enddate_tabledata").addClass("hidden");
					$("#enddate_tablediv").removeClass("hidden");
					$("#assignstatus").removeClass("hidden");
					$("#optional_status").addClass("hidden");
					$("#assignstatus").removeClass("hidden");
					$("#optional_status").addClass("hidden");
					$("#assignsearch").addClass("hidden");
					$("#empsearch").addClass("hidden");
					$("#assignstatus").addClass("hidden");
					$("#optional_status").removeClass("hidden");
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
			}); */	
			
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
			
			$("#show_Project").click(function() {
				$("body").css("cursor", "progress");
				var id = null;
				<c:forEach items="${projectList}" var="projectlist">
					if("${projectlist.dispname}" == $("#pid").html()){
						id = "${projectlist.id}";
					}
				</c:forEach>
					var resourceURL = $("#contextpath").val()+"/project/viewproject/"+id;
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
			
			
			$("#show_showassignlist").click(function(){
			
				$( "div.scrl" ).scrollLeft(0);
				 $('.tab-content #tab1').show().siblings().hide();	        	
		        // Change/remove current tab to active
		        $('#tab_li1').addClass('active').siblings().removeClass('active');
				 
				scrol = 50;
			
			
				var table = $("#viewAssignmentTbl").DataTable().destroy();
				var resourceURL = $("#contextpath").val()+"/assignment/get";
				
				$("#viewAssignmentTbl").dataTable({
					"ajax": resourceURL,
					"aaSorting" : [],
				});
				
				$("#findoption").val("all");
				$("#assignmentDetail").addClass("hidden");
				$("#empassList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#startdate_tabledata").addClass("hidden");
				$("#startdate_tablediv").removeClass("hidden");
				$("#enddate_tabledata").addClass("hidden");
				$("#enddate_tablediv").removeClass("hidden");
				$("#assignstatus").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				$("#assignstatus").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				$("#billtype").removeClass("hidden");
				$("#optional_billtype").addClass("hidden");
				$("#assignsearch").addClass("hidden");
				$("#empsearch").addClass("hidden");
				$("#assignstatus").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				$("#amounttype").addClass("hidden");
				$("#optional_amounttype").removeClass("hidden");
				$("#billtype").addClass("hidden");
				$("#optional_billtype").removeClass("hidden");
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				$("#assign_id").prop( "disabled", true );
				$("#startdate").prop( "disabled", true );
				$("#enddate").prop( "disabled", true );
				$("#comments").prop( "disabled", true );
				$("#powo").prop( "disabled", true );
				$("#amount").prop( "disabled", true );
				
				$("#assign_id").removeClass("inputBorder");
				$("#startdate").removeClass("inputBorder");
				$("#enddate").removeClass("inputBorder");
				$("#comments").removeClass("inputBorder");
				$("#powo").removeClass("inputBorder");
				$("#amount").removeClass("inputBorder");
				$("#assign_id").addClass("inputdisable");
				$("#startdate").addClass("inputdisable");
				$("#enddate").addClass("inputdisable");
				$("#comments").addClass("inputdisable");
				$("#powo").addClass("inputdisable");
				$("#amount").addClass("inputdisable");
				
				$("#assignmentDetail").addClass("hidden");
				
			});
			
			$("body").css("cursor", "default");
		});	
	</script>
</html>
