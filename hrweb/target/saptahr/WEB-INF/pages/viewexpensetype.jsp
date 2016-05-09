<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
	</head>
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
										<li><a href="<%=request.getContextPath() %>/invoice/addviewinvoice">View Invoice</a></li>
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
						<li class="active"><a href="#" >Miscellaneous</a>
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
		<!--Project List Starts-->
			<div id="contentArea">
				<div align="left" id="headlist"> <h1>Project<b class="saptaColor"> List</b></h1> </div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Project<b class="saptaColor"> Detail</b></h1></div>
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0">
									<option value="all" >--- All ---</option>
									<option value="findbyid" >Find By Project Id</option>
								</select>
							</td>
						</tr>
						<tr id = "projectsearch" class = "hidden">
							<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Choose Project</td>
							<td>:</td>
							<td align="left">
								<select id="projectid" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0">
									<option value="">---- Select Project Id ----</option> 
									<c:forEach items="${projectList}" var="project">
										<option value="${project.id}">${project.id} - ${project.name}</option>
									</c:forEach>
								</select>
							</td>										
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				
				<div id="projectList" class="MRGT10PX">
					<table id="projectgridtable"></table>
					<div id="projectgridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"> 
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
				
				<div id="projectDetail" class="hidden MRGT10PX">
					<div align="left" id="back_projectlist" class=""><a href="#" id="show_showprojectlist">Project List </a>/ Project Details </div><br/>
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
		<!-- Expense Type Details Starts -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent">Project Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Customer Id</td>
							<td class="value"><a href="#" id="show_customer"><div id="customer_id"></div></a></td>
						</tr>
						<tr class="">
							<td class="lableContent">Name</td>
							<td class="value"><input id="name" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Display Name</td>
							<td class="value"><input id="dispname" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Description</td>
							<td class="value"><input id="descr" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Status</td>
							<td class="value">
								<select id="status" class="selectBox"  disabled="disabled" style="margin-left:0px; width:162px;" class="inputdisable">
									<option value="">Select</option>
									<option value="a">Active</option>
									<option value="i">In-Active</option>
								</select>
							</td>
						</tr>
						<tr class="">
							<td class="lableContent">Type</td>
							<td class="value"><input id="type" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Start Date</td>
							<td class="value"><input id="startdate" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">End Date</td>
							<td class="value"><input id="enddate" disabled="disabled" class="inputdisable"></td>
						</tr>
					</table>
		<!-- Expense Type Details End -->
				</div>
			</div>
		</div>
		<footer>powered by <b><a href="http://saptalabs.com"target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script>
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
				 $( "#startdate, #enddate" ).datepicker({
					 yearRange: '1950:2050',
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
				$("#headlist").addClass("hidden");
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
							var resourceURL = $("#contextpath").val()+"/project/getbyid/"+id;
							$("#projectgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#projectgridtable").trigger("reloadGrid");
							
							$("#projectList").removeClass("hidden");
							$("#projectDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#projectList").addClass("hidden");
							$("#projectDetail").addClass("hidden");
						}
					});
				}		
			});
			$('#projectid').keypress(function(event){
				if(event.which == 13) {
					$("#projectList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyprojectid();
				}
			});
			$("#findByProjId").click(function() {
				$("#projectList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyprojectid();
			});
			function findbyprojectid(){
				var count = 0;
				var projectid = $("#projectid").val().split(" ").join("");
					<c:forEach items="${projectList}" var="project">
						if("${project.id}" == projectid){
							var resourceURL = $("#contextpath").val()+"/project/get/"+projectid;
							$("#projectgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#projectgridtable").trigger("reloadGrid");
							count++;
							$("#projectList").removeClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}
					</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Project details not found for the given id " + projectid.bold();
					$.fancybox.open('#alertMsg');
				}
			}
			var id = "${id}";
			var url = "";
			if(id == undefined || id == null || id.length <= 0 || id == ""){
				url = $("#contextpath").val()+"/project/get";
			}else{
				url = $("#contextpath").val()+"/project/get/"+id;
			}
			jQuery("#projectgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Project Id',' Name', 'Disp Name', 'Status','Start Date ','End Date'], 
				colModel:[{name:'projectid',index:'projectid', width:100, resizable :false},
						  {name:'name',index:'name', width:214, resizable :true},
						  {name:'dispname',index:'dispname', width:262, resizable :true},
						  {name:'status',index:'status', width:108, resizable :true},
						  {name:'startdate',index:'startdate', width:112, resizable :true},
						  {name:'enddate',index:'enddate', width:112, resizable :true},],
						  
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#projectgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					projectDetails(id)
				}
			});
			jQuery("#projectgridtable").jqGrid('navGrid','#projectgridpager',{edit:false, add:false, del:false, search:false});
		
			$("#show_showprojectlist").click(function() {
				$("body").css("cursor", "progress");
				$("#projectDetail").addClass("hidden");
				$("#projectList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("body").css("cursor", "default");
			});
		
			$("#show_customer").click(function() {
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/customer/viewcustomer/"+$("#customer_id").html();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});	
			function projectDetails(id){
				$("body").css("cursor", "progress");
				$("#projectList").addClass("hidden");
				$("#projectDetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				var resourceURL = $("#contextpath").val()+"/project/retrivebyid/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data){
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							$.each(results, function (i, result){
								$("#id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#customer_id").html((result.customerid == undefined || result.customerid == null || result.customerid.length <= 0) ? "-" : result.customerid);
								$("#name").val((result.projectname == undefined || result.projectname == null || result.projectname.length <= 0) ? "-" : result.projectname);
								$("#dispname").val((result.dispname == undefined || result.dispname == null || result.dispname.length <= 0) ? "-" : result.dispname);
								$("#descr").val((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "" : result.status);
								$("#type").val((result.type == undefined || result.type == null || result.type.length <= 0) ? "-" : result.type);
								$("#startdate").val((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").val((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
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
		
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", false );
				$("#dispname").prop( "disabled", false );
				$("#descr").prop( "disabled", false );
				$("#status").prop( "disabled", false );
				$("#type").prop( "disabled", false );
				$("#startdate").prop( "disabled", false );
				$("#enddate").prop( "disabled", false );
				
				$("#id").removeClass("inputdisable");
				$("#name").removeClass("inputdisable");
				$("#dispname").removeClass("inputdisable");
				$("#descr").removeClass("inputdisable");
				$("#status").removeClass("inputdisable");
				$("#type").removeClass("inputdisable");
				$("#startdate").removeClass("inputdisable");
				$("#enddate").removeClass("inputdisable");
				
				$("#id").addClass("inputBorder"); 
				$("#name").addClass("inputBorder");
				$("#dispname").addClass("inputBorder");
				$("#descr").addClass("inputBorder");
				$("#status").addClass("inputBorder");
				$("#type").addClass("inputBorder");
				$("#startdate").addClass("inputBorder");
				$("#enddate").addClass("inputBorder");
				$("body").css("cursor", "default");
			});

			$("#decline").click(function() {
				$("body").css("cursor", "progress");
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#dispname").prop( "disabled", true );
				$("#descr").prop( "disabled", true );
				$("#status").prop( "disabled", true );
				$("#type").prop( "disabled", true );
				$("#startdate").prop( "disabled", true );
				$("#enddate").prop( "disabled", true );
				
				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#dispname").removeClass("inputBorder");
				$("#descr").removeClass("inputBorder");
				$("#status").removeClass("inputBorder");
				$("#type").removeClass("inputBorder");
				$("#startdate").removeClass("inputBorder");
				$("#enddate").removeClass("inputBorder");
				
				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#dispname").addClass("inputdisable");
				$("#descr").addClass("inputdisable");
				$("#status").addClass("inputdisable");
				$("#type").addClass("inputdisable");
				$("#startdate").addClass("inputdisable");
				$("#enddate").addClass("inputdisable");
				$("body").css("cursor", "default");
			});

			$("#update").click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				var id = $("#id").val();
				var customer_id = $("#customer_id").html();
				var name = $("#name").val();
				var dispname = $("#dispname").val();
				var descr = $("#descr").val();
				var status = $("#status").val();
				var type = $("#type").val();
				var startdate = $("#startdate").datepicker().val();
				var enddate = $("#enddate").datepicker().val();
				
				if(name == "" || name.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				if(type == "" || type.length == 0) validation = false;
				if(startdate == "" || type.length == 0) validation = false;
				if(enddate == "" || enddate.length == 0) validation = false;
				
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(descr == "" || descr == "-" || descr.length == 0) descr = "null";
					var resourceURL = $("#contextpath").val()+"/project/update/"+id+"/"+customer_id+"/"+name+"/"+dispname+"/"+descr+"/"+status+"/"+type+"/"+startdate+"/"+enddate;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#edit").removeClass("hidden");
								$("#delete").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								$("#id").prop( "disabled", true );
								$("#name").prop( "disabled", true );
								$("#dispname").prop( "disabled", true );
								$("#descr").prop( "disabled", true );
								$("#status").prop( "disabled", true );
								$("#type").prop( "disabled", true );
								$("#startdate").prop( "disabled", true );
								$("#enddate").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#name").removeClass("inputBorder");
								$("#dispname").removeClass("inputBorder");
								$("#descr").removeClass("inputBorder");
								$("#status").removeClass("inputBorder");
								$("#type").removeClass("inputBorder");
								$("#startdate").removeClass("inputBorder");
								$("#enddate").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#name").addClass("inputdisable");
								$("#dispname").addClass("inputdisable");
								$("#descr").addClass("inputdisable");
								$("#status").addClass("inputdisable");
								$("#type").addClass("inputdisable");
								$("#startdate").addClass("inputdisable");
								$("#enddate").addClass("inputdisable"); 
								 
								$("#alertMsgContent").html("Expenstype updated successfully...");
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
			$("#delete").click(function() {
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
								 $("#alertMsgContent").html("Project deleted successfully ...");
									$.fancybox.open('#alertMsg');
									projectDeleteReloader();
							}else{
									
							} 
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
				$("body").css("cursor", "default");
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
		});	
	</script>
</html>
