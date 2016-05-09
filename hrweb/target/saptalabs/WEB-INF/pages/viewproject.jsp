<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
			.ui-datepicker-trigger{
				margin-top: 3px;
			}
		</style>
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
	<div id="innerContainer">
		<!--Project List Starts-->
			<div id="contentArea">
				<div class="responsive">
					<table class="data display" id="viewProjectTbl" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Project&nbsp;Id</th>
								<th class="">Project&nbsp;Code</th>
								<th class="">Display&nbsp;Name</th>
								<th class="">Status</th>
							</tr>
						</thead>					
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="projectDetail" class="hidden MRGT10PX">
					<div align="left" id="back_projectlist" class=""><a href="#" id="show_showprojectlist">Project List </a>/ Project Details</div><br/>
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
					<!-- Project -->
					
					<table class="tableContent">
						<tr class="">
							<td class="lableContent">Project Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Customer Name</td>
							<td class="value"><a href="#" id="show_customer"><div id="customer_id"></div></a></td>
						</tr>
						<tr class="">
							<td class="lableContent">Name</td>
							<td class="value"><input id="name" disabled="disabled" class="inputdisable" ></td>
						</tr>
						<tr class="">
							<td class="lableContent">Display Name</td>
							<td class="value"><input id="dispname" disabled="disabled" class="inputdisable" ></td>
						</tr>
						<tr class="">
							<td class="lableContent">Project Code</td>
							<td class="value">
							<input id="prjectcode" disabled="disabled" class="inputdisable" ></td>
						</tr>
						<tr class="">
							<td class="lableContent">Description</td>
							<td class="value">
								<input id="descr" disabled="disabled" class="inputdisable">
								<div id="optional_descr" class="value"></div>
							</td>
						</tr>
						<tr class="">
							<td class="lableContentSelect"style="height:20px;">Status</td>
							<td class="valueContent">	
								<select id="status" class="selectBox hidden" style="margin:0px;text-align:center; height: 24px;" class="inputdisable">
									<!-- <option value="" style="text-align:center">---Select---</option> -->
									<option value="a" style="text-align:left">Active</option>
									<option value="i" style="text-align:left">Inactive</option>
								</select>
								<div id="optional_status" class="value"></div>
							</td>
						</tr>
						<tr class="">
							<td class="lableContent">Type</td>
							<td class="value"><input id="type" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Start Date</td>
							<td class="value hidden" id="startdate_tabledata">
								<b style="float:left; height: 20px;"><input id="startdate" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
							</td>
							<td class="value" id="startdate_tablediv">
								<div id="optional_startdate" class="value"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">End Date</td>
							<td class="value hidden" id="enddate_tabledata">
								<b style="float:left; height: 20px;"><input id="enddate" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
							</td>
							<td class="value" id="enddate_tablediv">
								<div id="optional_enddate" class="value"></div>
							</td>
						</tr>
					</table>
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
					<a href="<%=request.getContextPath() %>/project/viewproject" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
			</div>
		<!--Project List End-->
			<%@include file="footer.jsp"%>
		</div>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Project<b class='saptaColor'> List</b>");
			var id = "${id}";
			var url = "";
			if(id == undefined || id == null || id.length <= 0 || id == "" || id == 0){
				url = $("#contextpath").val()+"/project/get";
			}else{
				url = $("#contextpath").val()+"/project/getbyid/"+id;
			}
			$("#viewProjectTbl").dataTable({
				"ajax": url
			});
			
			$('#viewProjectTbl tbody').on('click', 'tr',function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		       		projectDetails(id);
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
			var projectSize = "${projectListSize}";
			if(projectSize != null && projectSize != 0){
				$("#projectList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#projectList").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#headlist").removeClass("hidden");
			} 

			$('#findoption').on('change', function (e) {
				$("#projectid").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/project/get";
					$("#projectgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#projectgridtable").trigger("reloadGrid");
					$("#projectList").removeClass("hidden");
					$("#projectsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#projectDetail").addClass("hidden");
					
				}else if(optionval.val() == "findbyid"){
					$("#projectList").addClass("hidden");
					$("#projectDetail").addClass("hidden");
					$("#projectsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					
					$('#projectid').on('change', function (e) {
						if($("#projectid").val() != ""){
							var id =	$("#projectid").val();
							$("#projectDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#projectList").addClass("hidden");
							$("#projectDetail").addClass("hidden");
						}
					});
				}		
			});
			$("#show_customer").click(function() {
				$("body").css("cursor", "progress");
				var id = null;
				<c:forEach items="${customerList}" var="customerlist">
					if("${customerlist.name}" == $("#customer_id").html()){
						id = "${customerlist.id}";
					}
				</c:forEach>
				var resourceURL = $("#contextpath").val()+"/customer/viewcustomer/"+id;
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});	

			function projectDetails(id) {
				$("body").css("cursor", "progress");
				$("#viewProjectTbl_wrapper").addClass("hidden");
				$("#projectDetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				var resourceURL = $("#contextpath").val()+"/project/retrivebyid/"+id;
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
								if(result.customerid != undefined || result.customerid != null || result.customerid.length >= 0 ){
									<c:forEach items="${customerList}" var="customerlist">
										if("${customerlist.id}" == result.customerid){
											$("#customer_id").html("${customerlist.name}");
										}
									</c:forEach>
								}
								$("#name").val((result.projectname == undefined || result.projectname == null || result.projectname.length <= 0) ? "-" : result.projectname);
								
								$("#prjectcode").val((result.projectcode == undefined || result.projectcode == null || result.projectcode.length <= 0) ? "-" : result.projectcode);
								$("#dispname").val((result.dispname == undefined || result.dispname == null || result.dispname.length <= 0) ? "-" : result.dispname);
								$("#descr").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#optional_descr").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#descr").addClass("hidden");
								$("#optional_descr").removeClass("hidden");
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("Inactive");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#type").val((result.type == undefined || result.type == null || result.type.length <= 0) ? "-" : result.type);
								$("#startdate").val((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#optional_startdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").val((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#optional_enddate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
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

			$("#edit").click(function(){
				$("body").css("cursor", "progress");
				//Select box Properties
				$("#status").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#startdate_tabledata").removeClass("hidden");
				$("#startdate_tablediv").addClass("hidden");
				
				$("#enddate_tabledata").removeClass("hidden");
				$("#enddate_tablediv").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				if($("#name").val() == "-"){
					$("#name").val("");
				}
				if($("#dispname").val() == "-"){
					$("#dispname").val("");
				}
				if($("#prjectcode").val() == "-"){
					$("#prjectcode").val("");
				}
				if($("#descr").val() == "-"){
					$("#descr").val("");
				}
				if($("#startdate").val() == "-"){
					$("#startdate").val("");
				}
				if($("#enddate").val() == "-"){
					$("#enddate").val("");
				}
				
				$("#descr").removeClass("hidden");
				$("#optional_descr").addClass("hidden");
				
				
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", false );
				$("#prjectcode").prop( "disabled", false );
				$("#dispname").prop( "disabled", false );
				$("#descr").prop( "disabled", false );
				$("#type").prop( "disabled", false );
				$("#startdate").prop( "disabled", false );
				$("#enddate").prop( "disabled", false );

				$("#id").removeClass("inputdisable");
				$("#name").removeClass("inputdisable");
				$("#prjectcode").removeClass("inputdisable");
				$("#dispname").removeClass("inputdisable");
				$("#descr").removeClass("inputdisable");
				$("#type").removeClass("inputdisable");
				$("#startdate").removeClass("inputdisable");
				$("#enddate").removeClass("inputdisable");

				$("#id").addClass("inputBorder"); 
				$("#name").addClass("inputBorder");
				$("#prjectcode").addClass("inputBorder");
				$("#dispname").addClass("inputBorder");
				$("#descr").addClass("inputBorder");
				$("#type").addClass("inputBorder");
				$("#startdate").addClass("inputBorder");
				$("#enddate").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#decline_yes").click(function(){
				$("#status").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				$("#startdate_tabledata").addClass("hidden");
				$("#startdate_tablediv").removeClass("hidden");
				$("#enddate_tabledata").addClass("hidden");
				$("#enddate_tablediv").removeClass("hidden");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#decline").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment About Details
				declineProjectDeatils();
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#prjectcode").prop( "disabled", true );
				$("#dispname").prop( "disabled", true );
				$("#descr").prop( "disabled", true );
				$("#type").prop( "disabled", true );
				$("#startdate").prop( "disabled", true );
				$("#enddate").prop( "disabled", true );

				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#prjectcode").removeClass("inputBorder");
				$("#dispname").removeClass("inputBorder");
				$("#descr").removeClass("inputBorder");
				$("#type").removeClass("inputBorder");
				$("#startdate").removeClass("inputBorder");
				$("#enddate").removeClass("inputBorder");

				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#prjectcode").addClass("inputdisable");
				$("#dispname").addClass("inputdisable");
				$("#descr").addClass("inputdisable");
				$("#type").addClass("inputdisable");
				$("#startdate").addClass("inputdisable");
				$("#enddate").addClass("inputdisable");
				$.fancybox.close();
			});
			function declineProjectDeatils(){
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/project/retrivebyid/"+id;
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
								if(result.customerid != undefined || result.customerid != null || result.customerid.length >= 0 ){
									<c:forEach items="${customerList}" var="customerlist">
										if("${customerlist.id}" == result.customerid){
											$("#customer_id").html("${customerlist.name}");
										}
									</c:forEach>
								}
								$("#name").val((result.projectname == undefined || result.projectname == null || result.projectname.length <= 0) ? "-" : result.projectname);
								$("#dispname").val((result.dispname == undefined || result.dispname == null || result.dispname.length <= 0) ? "-" : result.dispname);
								$("#descr").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#optional_descr").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#descr").addClass("hidden");
								$("#optional_descr").removeClass("hidden");
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("Inactive");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#type").val((result.type == undefined || result.type == null || result.type.length <= 0) ? "-" : result.type);
								$("#startdate").val((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#optional_startdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").val((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
								$("#optional_enddate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
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
				var id = $("#id").val();
				var customer_id = null;
				<c:forEach items="${customerList}" var="customerlist">
					if("${customerlist.name}" == $("#customer_id").html()){
						customer_id = "${customerlist.id}";
					}
				</c:forEach>
				var name = $("#name").val();
				var prjectcode = $("#prjectcode").val();
				var dispname = $("#dispname").val();
				var descr = $("#descr").val();
				var status = $("#status").val();
				var type = $("#type").val();
				var startdate = $("#startdate").datepicker().val();
				var enddate = $("#enddate").datepicker().val();
				var enddatevalidation = "";

				if(name == "" || name.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				if(type == "" || type.length == 0) validation = false;
				if(startdate == "" || type.length == 0) validation = false;
				//if(enddate == "" || enddate.length == 0) validation = false;
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
					if(descr == "" || descr == "-" || descr.length == 0) descr = "null";
	
					var resourceURL = $("#contextpath").val()+"/project/update/"+id+"/"+customer_id+"/"+name+"/"+dispname+"/"+descr+"/"+status+"/"+type+"/"+startdate+"/"+enddate+"/"+prjectcode;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									if(status == "a"){
										$("#optional_status").html("Active");
									}else if(status == "i"){
										$("#optional_status").html("Inactive");
									}
								
									if($("#name").val() == "" || $("#name").val() == "-"){
										$("#name").val("-");
									}
									if($("#dispname").val() == "" || $("#dispname").val() == "-"){
										$("#dispname").val("-");
										$("#optional_dispname").html("-");
									}else{
										$("#optional_dispname").html(descr);
									}
									if($("#descr").val() == "" || $("#descr").val() == "-"){
										$("#descr").val("-");
										$("#optional_descr").html("-");
									}else{
										$("#optional_descr").html(descr);
									}
									if($("#startdate").val() == "" || $("#startdate").val() == "-"){
										$("#optional_startdate").html("-");
									} else {
										$("#optional_startdate").html(startdate);
									}
									if($("#enddate").val() == "" || $("#enddate").val() == "-"){
										$("#optional_enddate").html("-");
									} else {
										$("#optional_enddate").html(enddate);
									}
									
									if($("#prjectcode").val() == "" || $("#prjectcode").val() == "-"){
										$("#prjectcode").val("-");
									}
									
									$("#descr").addClass("hidden");
									$("#optional_descr").removeClass("hidden");
									
									$("#status").addClass("hidden");
									$("#optional_status").removeClass("hidden");
									
									$("#startdate_tabledata").addClass("hidden");
									$("#startdate_tablediv").removeClass("hidden");
									
									$("#enddate_tabledata").addClass("hidden");
									$("#enddate_tablediv").removeClass("hidden");
									
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
									$("#decline").removeClass("hidden");
									$("#updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#id").prop( 'disabled', false );
									
									$("#id").prop( "disabled", true );
									$("#name").prop( "disabled", true );
									$("#prjectcode").prop( "disabled", true );
									$("#dispname").prop( "disabled", true );
									$("#descr").prop( "disabled", true );
									$("#type").prop( "disabled", true );
									$("#startdate").prop( "disabled", true );
									$("#enddate").prop( "disabled", true );
									
									$("#id").removeClass("inputBorder");
									$("#name").removeClass("inputBorder");
									$("#prjectcode").removeClass("inputBorder");
									$("#dispname").removeClass("inputBorder");
									$("#descr").removeClass("inputBorder");
									$("#type").removeClass("inputBorder");
									$("#startdate").removeClass("inputBorder");
									$("#enddate").removeClass("inputBorder");
									
									$("#id").addClass("inputdisable");
									$("#name").addClass("inputdisable");
									$("#prjectcode").addClass("inputdisable");
									$("#dispname").addClass("inputdisable");
									$("#descr").addClass("inputdisable");
									$("#type").addClass("inputdisable");
									$("#startdate").addClass("inputdisable");
									$("#enddate").addClass("inputdisable"); 
									 
									$("#alertMsgContent").html("Project details updated successfully ...");
									$.fancybox.open('#alertMsg');
										
								}else{
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
									$("#decline").addClass("hidden");
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
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/project/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
							if(successflag == "true"){
								$("#successful_msg_content").html("Project detail deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
								//projectDeleteReloader();
							}else{
								$("#errorMsgContent").html("Parent row cant be deleted.....");
								$.fancybox.open('#errorMsg');	
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
			

			function projectDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/project/get";
				$("#projectgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#projectgridtable").trigger("reloadGrid");
				$("#projectList").removeClass("hidden");
				$("#projectsearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#projectDetail").addClass("hidden");
			}
			
			$("body").css("cursor", "default");
		});	
		
		
		$("#show_showprojectlist").click(function() {
			$("#projectDetail").addClass("hidden");
			var table = $('#viewProjectTbl').DataTable();
			table.destroy();
			var resourceURL = $("#contextpath").val()+"/project/get";
			$('#viewProjectTbl').dataTable( {
		        "ajax": resourceURL
		    } );
			
			$("#status").addClass("hidden");
			$("#optional_status").removeClass("hidden");
			
			$("#startdate_tabledata").addClass("hidden");
			$("#startdate_tablediv").removeClass("hidden");
			
			$("#enddate_tabledata").addClass("hidden");
			$("#enddate_tablediv").removeClass("hidden");
			
			$("#edit").removeClass("hidden");
			$("#delete").removeClass("hidden");
			$("#decline").removeClass("hidden");
			$("#updatebutton").addClass("hidden");
			$("#findoption").prop( 'disabled', false );
			$("#id").prop( 'disabled', false );
			
			$("#id").prop( "disabled", true );
			$("#name").prop( "disabled", true );
			$("#prjectcode").prop( "disabled", true );
			$("#dispname").prop( "disabled", true );
			$("#descr").prop( "disabled", true );
			$("#type").prop( "disabled", true );
			$("#startdate").prop( "disabled", true );
			$("#enddate").prop( "disabled", true );
			
			$("#id").removeClass("inputBorder");
			$("#name").removeClass("inputBorder");
			$("#prjectcode").removeClass("inputBorder");
			$("#dispname").removeClass("inputBorder");
			$("#descr").removeClass("inputBorder");
			$("#type").removeClass("inputBorder");
			$("#startdate").removeClass("inputBorder");
			$("#enddate").removeClass("inputBorder");
			
			$("#id").addClass("inputdisable");
			$("#name").addClass("inputdisable");
			$("#prjectcode").addClass("inputdisable");
			$("#dispname").addClass("inputdisable");
			$("#descr").addClass("inputdisable");
			$("#type").addClass("inputdisable");
			$("#startdate").addClass("inputdisable");
			$("#enddate").addClass("inputdisable"); 
			 
		});
		
	</script>
</html>
