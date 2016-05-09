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
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0">
									<option value="all" >--- All ---</option>
									<option value="findbyid" >Find By Assignment Id</option>
								</select>
								<%-- <img src="<%=request.getContextPath() %>/resources/images/i_pdf.png" id="assignmentpdf" alt="pdf export" class="leftElement MRGL10PX"/> --%>
							</td>
						</tr>
					</table>
					<table width = "443px" align ="center">
						<tr id = "assignsearch" class = "hidden">
							<td align="right" width = "167px"><sup class="saptaColor">*</sup>Enter Assignment Id</td>
							<td>:</td>
							<td align="left" colspan = "2">
								<input name="assignid" id="assignid" type="text" style="width: 200px;margin:0" maxlength="10"/>
								<input type="button" value="Find" id="findByAssignId" style="float:none;"/>
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
					<table class="tableContent">
						<tr>
							<td class="lableContent">Assignment Id</td>
							<td class="value"><div id="assign_id"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Start Date</td>
							<td class="value"><div id="startdate"></div></td>
						</tr>
						<tr>
							<td class="lableContent">End Date</td>
							<td class="value"><div id="enddate"></div></td>
						</tr>
					</table>
			<!-- Employee Assignment Details Starts-->
					<div> <h1> <b class="saptaColor"> Employee</b> Details </h1></div>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Employee Id</td>
								<td class="value"><a href="#" id="show_employee"> <div id="employeeid"></div></a></td>
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
								<td class="value"><div id="pid"></div></td>
							</tr>
							<tr>
								<td class="lableContent">Customer Id</td>
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
			<!-- Assignment Details End-->
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script>
		$(document).ready(function(){
			$("body").css("cursor", "default");
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
				colNames:['Id', 'Employee Id','Project Id', 'Start Date', 'End Date', 'Status', 'Comments'], 
				colModel:[{name:'id',index:'id', width:100, resizable :false},
						  {name:'empid',index:'empid', width:100, resizable :false},
						  {name:'pid',index:'pid', width:100, resizable :false},
						  {name:'sdate',index:'sdate', width:175, resizable :true},
						  {name:'edate',index:'edate', width:175, resizable :true},
						  {name:'status',index:'status', width:100, resizable :false},
						  {name:'comment',index:'comment', width:153, resizable :false},],
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
						
						if(successflag == "true"){
							$.each(results, function (i, result) {
								empid = result.empid;
								projectid = result.projectid;
								$("#assign_id").html((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#startdate").html((result.startdate == undefined || result.startdate == null || result.startdate.length <= 0) ? "-" : result.startdate);
								$("#enddate").html((result.enddate == undefined || result.enddate == null || result.enddate.length <= 0) ? "-" : result.enddate);
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
								$("#customer_id").html((result.customerid == undefined || result.customerid == null || result.customerid.length <= 0) ? "-" : result.customerid);
								$("#pname").html((result.projectname == undefined || result.projectname == null || result.projectname.length <= 0) ? "-" : result.projectname);
								$("#pdesc").html((result.description == undefined || result.description == null || result.description.length <= 0) ? "-" : result.description);
								$("#ptype").html((result.type == undefined || result.type == null || result.type.length <= 0) ? "-" : result.type);
								$("#pstatus").html((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
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
					$("#mandatorycheck").addClass("hidden");
					$("#assignmentDetail").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#empassList").addClass("hidden");
					$("#assignmentDetail").addClass("hidden");
					$("#assignsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
			   }
			});
			
			$('#assignid').keypress(function(event){
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
			
			function findbyempid(){
				$("body").css("cursor", "progress");
				var count = 0;
				var aid = $("#assignid").val().split(" ").join("");
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
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Assignment Details not found for the given id " + aid;
					$.fancybox.open('#alertMsg');
				}
			$("body").css("cursor", "default");
			}
		
			$("#show_showassignlist").click(function() {
				$("body").css("cursor", "progress");
				$("#assignmentDetail").addClass("hidden");
				$("#empassList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
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
					var resourceURL = $("#contextpath").val()+"/customer/viewcustomer/"+$("#customer_id").html();
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});	
	</script>
</html>
