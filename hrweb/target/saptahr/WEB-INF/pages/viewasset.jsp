t<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<div id="contentArea">
				<div align = "left" id="headlist"><h1>Asset<b class="saptaColor"> List</b></h1></div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Asset<b class="saptaColor"> Detail</b></h1></div>
			    <div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center">
									<option value="all" style="text-align: center;">--- All ---</option>
									<option value="findbyid" style="text-align: left;">Find By Asset Id</option>
								</select>
							</td>
						</tr>
						<tr id="assetsearch" class = "hidden">
							<td align="right" width = "150px"> <sup class="saptaColor">*</sup>Enter Asset Id</td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<input name="assetid" id="assetid" type="text" style="width: 195px; padding: 0px; margin-left: 7px;"/>
								<input type="button" value="Find" id="findByAssetId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>										
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				<div id="assetList" class="MRGT10PX">
					<table id="assetgridtable"></table>
					<div id="assetgridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="assetDetail" class="hidden MRGT10PX">
					<div align="left" id="back_assignlist" class="">
						<a href="#" id="show_asset">Asset List </a>/ Asset Details
					</div><br/>
					<c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
							<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
						</c:when>
					</c:choose>	
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="decline" class="rightElement graybtn" type="button" value="Decline" align="left"/>
					</div>
						<!-- Asset -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent"> Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Name</td>
							<td class="value"><input id="name" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
						</tr>
						<tr>
							<td class="lableContentSelect">Asset Type </td>
							<td class="value">
								<select id="assettypeid" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<c:forEach items="${assetTypeList}" var="assetType">
										<option value="${assetType.id}">${assetType.dispname}</option>
									</c:forEach>
								</select>
								<div id="optional_assettypeid" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Vendor </td>
							<td class="value">
								<select id="vendor_id" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable">
									<c:forEach items="${vendorList}" var="vendor">
										<option value="${vendor.id}">${vendor.name}</option>
									</c:forEach>
								</select>
								<div id="optional_vendor_id" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Date of Purchased</td>
							<td id="dop_tabledata" class="value hidden"><input id="dop" disabled="disabled" class="inputdisable"></td>
							<td id="dop_tablediv" class="value"><div id="optional_dop"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Warranty of Asset</td>
							<td id="assetwarranty_tabledata" class="value hidden"><input id="assetwarranty" disabled="disabled" class="inputdisable"></td>
							<td id="assetwarranty_tablediv" class="value"><div id="optional_assetwarranty"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Guarantee of Asset</td>
							<td id="assetguarantee_tabledata" class="value hidden"><input id="assetguarantee" disabled="disabled" class="inputdisable"></td>
							<td id="assetguarantee_tablediv" class="value"><div id="optional_assetguarantee"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Price</td>
							<td class="value"><input id="price" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
					</table>
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
				<a href="<%=request.getContextPath() %>/asset/viewasset" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
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
				 $( "#dop, #assetwarranty, #assetguarantee" ).datepicker({
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
			var assetSize = "${assetListSize}";
			if(assetSize != null && assetSize != 0){
				$("#assetList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				
				$("#assetList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#optiondiv").addClass("hidden");
			} 
			var id = "${id}";
			var url = "";
			if(id == undefined || id == null || id.length <= 0 || id == ""){
				url = $("#contextpath").val()+"/asset/get";
			}else{
				url = $("#contextpath").val()+"/asset/get/"+id;
			}
			jQuery("#assetgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Asset Name', 'Asset Type', 'Vendor Name', 'Price'], 
				colModel:[{name:'name',index:'name', width:318, resizable :true},
						  {name:'assettypeid',index:'assettypeid', width:213, resizable :true},
						  {name:'vendorid',index:'vendorid', width:237, resizable :true},
						  {name:'price',index:'price', width:150, resizable :true}],
						
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#assetgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(assetid){
					assetDetails(assetid);
				}
			});
			jQuery("#assetgridtable").jqGrid('navGrid','#assetgridpager',{edit:false, add:false, del:false, search:false});
			
			function assetDetails(assetid){
				$("#assetList").addClass("hidden");
				$("#assetDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				var resourceURL = $("#contextpath").val()+"/asset/retrivebyid/"+assetid;
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
								$("#name").val((result.name == undefined || result.name == null || result.name.length <= 0) ? "-" : result.name);
								$("#assettypeid").val((result.assettypeid == undefined || result.assettypeid == null || result.assettypeid.length <= 0) ? "" : result.assettypeid);
								<c:forEach items="${assetTypeList}" var="assetType">
									if("${assetType.id}" == result.assettypeid){
										$("#optional_assettypeid").html("${assetType.dispname}");
									}
								</c:forEach>
								$("#vendor_id").val((result.vendorid == undefined || result.vendorid == null || result.vendorid.length <= 0) ? "-" : result.vendorid);
								<c:forEach items="${vendorList}" var="vendor">
									if("${vendor.id}" == result.vendorid){
										$("#optional_vendor_id").html("${vendor.name}");
									}
								</c:forEach>
								$("#dop").val((result.dateofpurchased == undefined || result.dateofpurchased == null || result.dateofpurchased.length <= 0) ? "-" : result.dateofpurchased);
								$("#optional_dop").html((result.dateofpurchased == undefined || result.dateofpurchased == null || result.dateofpurchased.length <= 0) ? "-" : result.dateofpurchased);
								$("#assetwarranty").val((result.warrantyofexpired == undefined || result.warrantyofexpired == null || result.warrantyofexpired.length <= 0) ? "-" : result.warrantyofexpired);
								$("#optional_assetwarranty").html((result.warrantyofexpired == undefined || result.warrantyofexpired == null || result.warrantyofexpired.length <= 0) ? "-" : result.warrantyofexpired);
								$("#assetguarantee").val((result.guranteeofexpired == undefined || result.guranteeofexpired == null || result.guranteeofexpired.length <= 0) ? "-" : result.guranteeofexpired);
								$("#optional_assetguarantee").html((result.guranteeofexpired == undefined || result.guranteeofexpired == null || result.guranteeofexpired.length <= 0) ? "-" : result.guranteeofexpired);
								$("#price").val((result.price == undefined || result.price == null || result.price.length <= 0) ? "-" : result.price);
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
			$('#findoption').on('change', function (e) {
				$("#assetid").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/asset/get";
					$("#assetgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#assetgridtable").trigger("reloadGrid");
					$("#assetList").removeClass("hidden");
					$("#assetsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#assetDetail").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#assetList").addClass("hidden");
					$("#assetDetail").addClass("hidden");
					$("#assetsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					$('#assetid').on('change', function (e) {
						if($("#assetid").val() != ""){
							var id =	$("#assetid").val();
							/* var resourceURL = $("#contextpath").val()+"/asset/get/"+id;
							$("#assetgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#assetgridtable").trigger("reloadGrid"); */
							//$("#assetList").removeClass("hidden");
							$("#assetDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#assetList").addClass("hidden");
							$("#assetDetail").addClass("hidden");
						}
					});
				}
			});
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				$("#assettypeid").removeClass("hidden");
				$("#optional_assettypeid").addClass("hidden");
				$("#vendor_id").removeClass("hidden");
				$("#optional_vendor_id").addClass("hidden");
				$("#dop_tabledata").removeClass("hidden");
				$("#dop_tablediv").addClass("hidden");
				$("#assetwarranty_tabledata").removeClass("hidden");
				$("#assetwarranty_tablediv").addClass("hidden");
				$("#assetguarantee_tabledata").removeClass("hidden");
				$("#assetguarantee_tablediv").addClass("hidden");
				
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", false );
				$("#dop").prop( "disabled", false );
				$("#assetwarranty").prop( "disabled", false );
				$("#assetguarantee").prop( "disabled", false );
				$("#price").prop( "disabled", false );
				
				$("#id").removeClass("inputdisable");
				$("#name").removeClass("inputdisable");
				$("#dop").removeClass("inputdisable");
				$("#assetwarranty").removeClass("inputdisable");
				$("#assetguarantee").removeClass("inputdisable");
				$("#price").removeClass("inputdisable");
				
				$("#id").addClass("inputBorder");
				$("#name").addClass("inputBorder");
				$("#dop").addClass("inputBorder");
				$("#assetwarranty").addClass("inputBorder");
				$("#assetguarantee").addClass("inputBorder");
				$("#price").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			$("#decline_yes").click(function() {
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment Details
				declineAssetDeatils();
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#dop").prop( "disabled", true );
				$("#assetwarranty").prop( "disabled", true );
				$("#assetguarantee").prop( "disabled", true );
				$("#price").prop( "disabled", true );
				
				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#dop").removeClass("inputBorder");
				$("#assetwarranty").removeClass("inputBorder");
				$("#assetguarantee").removeClass("inputBorder");
				$("#price").removeClass("inputBorder");
				
				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#dop").addClass("inputdisable");
				$("#assetwarranty").addClass("inputdisable");
				$("#assetguarantee").addClass("inputdisable");
				$("#price").addClass("inputdisable");
				$.fancybox.close();
			});
			function declineAssetDeatils(){
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/asset/retrivebyid/"+id;
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
								$("#name").val((result.name == undefined || result.name == null || result.name.length <= 0) ? "-" : result.name);
								$("#assettypeid").val((result.assettypeid == undefined || result.assettypeid == null || result.assettypeid.length <= 0) ? "" : result.assettypeid);
								<c:forEach items="${assetTypeList}" var="assetType">
									if("${assetType.id}" == result.assettypeid){
										$("#optional_assettypeid").html("${assetType.dispname}");
									}
								</c:forEach>
								$("#assettypeid").addClass("hidden");
								$("#optional_assettypeid").removeClass("hidden");
								
								$("#vendor_id").val((result.vendorid == undefined || result.vendorid == null || result.vendorid.length <= 0) ? "" : result.vendorid);
								<c:forEach items="${vendorList}" var="vendor">
									if("${vendor.id}" == result.vendorid){
										$("#optional_vendor_id").html("${vendor.name}");
									}
								</c:forEach>
								$("#vendor_id").addClass("hidden");
								$("#optional_vendor_id").removeClass("hidden");
								$("#dop").val((result.dateofpurchased == undefined || result.dateofpurchased == null || result.dateofpurchased.length <= 0) ? "-" : result.dateofpurchased);
								$("#optional_dop").html((result.dateofpurchased == undefined || result.dateofpurchased == null || result.dateofpurchased.length <= 0) ? "-" : result.dateofpurchased);
								$("#dop_tabledata").addClass("hidden");
								$("#dop_tablediv").removeClass("hidden");
								$("#vendor_id").val((result.vendorid == undefined || result.vendorid == null || result.vendorid.length <= 0) ? "-" : result.vendorid);
								$("#assetwarranty").val((result.warrantyofexpired == undefined || result.warrantyofexpired == null || result.warrantyofexpired.length <= 0) ? "-" : result.warrantyofexpired);
								$("#optional_assetwarranty").html((result.warrantyofexpired == undefined || result.warrantyofexpired == null || result.warrantyofexpired.length <= 0) ? "-" : result.warrantyofexpired);
								$("#assetwarranty_tabledata").addClass("hidden");
								$("#assetwarranty_tablediv").removeClass("hidden");
								$("#assetguarantee").val((result.guranteeofexpired == undefined || result.guranteeofexpired == null || result.guranteeofexpired.length <= 0) ? "-" : result.guranteeofexpired);
								$("#optional_assetguarantee").html((result.guranteeofexpired == undefined || result.guranteeofexpired == null || result.guranteeofexpired.length <= 0) ? "-" : result.guranteeofexpired);
								$("#assetguarantee_tabledata").addClass("hidden");
								$("#assetguarantee_tablediv").removeClass("hidden");
								$("#price").val((result.price == undefined || result.price == null || result.price.length <= 0) ? "-" : result.price);
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
				var name = $("#name").val();
				var dateofpurchased = $("#dop").datepicker().val();
				var assettypeid = $("#assettypeid").val();
				var vendorid = $("#vendor_id").val();
				var warrantyofexpired = $("#assetwarranty").datepicker().val();
				var guranteeofexpired = $("#assetguarantee").datepicker().val();
				var price = $("#price").val();

				if(name == "" || name.length == 0) validation = false;
				if(dateofpurchased == "" || dateofpurchased.length == 0) validation = false; 
				if(warrantyofexpired == "" || warrantyofexpired.length == 0) validation = false; 
				if(guranteeofexpired == "" || guranteeofexpired.length == 0) validation = false; 
				if(price == "" || price.length == 0) validation = false; 
				var dateofpurchasedvalidation = $.datepicker.parseDate('dd-mm-yy',dateofpurchased);
				var warrantyofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',warrantyofexpired);
				if ((dateofpurchasedvalidation) >= (warrantyofexpiredvalidation))  validation = false; 
				guranteeofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',guranteeofexpired);
				if ((warrantyofexpiredvalidation) > (guranteeofexpiredvalidation))  validation = false; 

				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var resourceURL = $("#contextpath").val()+"/asset/update/"+id+"/"+name+"/"+assettypeid+"/"+dateofpurchased+"/"+vendorid+"/"+warrantyofexpired+"/"+guranteeofexpired+"/"+price;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#edit").removeClass("hidden");
								$("#delete").removeClass("hidden");
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								//Asset Type Selectbox Properties
								<c:forEach items="${assetTypeList}" var="assetType">
									if("${assetType.id}" == assettypeid){
										$("#optional_assettypeid").html("${assetType.dispname}");
									}
								</c:forEach>
								$("#assettypeid").addClass("hidden");
								$("#optional_assettypeid").removeClass("hidden");
								
								//Vendor Selectbox Properties
								<c:forEach items="${vendorList}" var="vendor">
									if("${vendor.id}" == vendorid){
										$("#optional_vendor_id").html("${vendor.name}");
									}
								</c:forEach>
								$("#vendor_id").addClass("hidden");
								$("#optional_vendor_id").removeClass("hidden");
								
								if($("#dop").val() == "" || $("#dop").val() == "-"){
									$("#dop").val("-");
									$("#optional_dop").html("-");
								} else{
									$("#optional_dop").html(dateofpurchased);
								}
								$("#dop_tabledata").addClass("hidden");
								$("#dop_tablediv").removeClass("hidden");
								if($("#assetwarranty").val() == "" || $("#assetwarranty").val() == "-"){
									$("#assetwarranty").val("-");
									$("#optional_assetwarranty").html("-");
								} else{
									$("#optional_assetwarranty").html(warrantyofexpired);
								}
								$("#assetwarranty_tabledata").addClass("hidden");
								$("#assetwarranty_tablediv").removeClass("hidden");
								if($("#assetguarantee").val() == "" || $("#assetguarantee").val() == "-"){
									$("#assetguarantee").val("-");
									$("#optional_assetguarantee").html("-");
								} else{
									$("#optional_assetguarantee").html(guranteeofexpired);
								}
								$("#assetguarantee_tabledata").addClass("hidden");
								$("#assetguarantee_tablediv").removeClass("hidden");
								
								$("#id").prop( "disabled", true );
								$("#name").prop( "disabled", true );
								$("#dop").prop( "disabled", true );
								$("#assetwarranty").prop( "disabled", true );
								$("#assetguarantee").prop( "disabled", true );
								$("#price").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#name").removeClass("inputBorder");
								$("#dop").removeClass("inputBorder");
								$("#assetwarranty").removeClass("inputBorder");
								$("#assetguarantee").removeClass("inputBorder");
								$("#price").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#name").addClass("inputdisable");
								$("#dop").addClass("inputdisable");
								$("#assetwarranty").addClass("inputdisable");
								$("#assetguarantee").addClass("inputdisable");
								$("#price").addClass("inputdisable");
								$("#alertMsgContent").html("Asset details updated successfully ...");
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
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/asset/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
								$("#successful_msg_content").html("Asset deleted successfully ...");
								$.fancybox.open('#deletedsuccessful_fancybox'); 
								//assetDeleteReloader();
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
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 }); 
			function assetDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/asset/get";
				$("#assetgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#assetgridtable").trigger("reloadGrid");
				$("#assetList").removeClass("hidden");
				$("#assetsearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#assetDetail").addClass("hidden");
			}
			
			$('#assetid').keypress(function(event){
				if(event.keyCode == 13) {
					$("#assetList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#assetDetail").addClass("hidden");
					findbyassetid();
				} 
			});
			
			$("#findByAssetId").click(function() {
				$("#assetList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#assetDetail").addClass("hidden");
				findbyassetid();
				
			});
			
			function findbyassetid(){
				var count = 0;
				var assetid = $("#assetid").val().split(" ").join("");
				<c:forEach items="${assetList}" var="asset">
					if("${asset.id}" == assetid){
						var resourceURL = $("#contextpath").val()+"/asset/get/"+assetid;
						 $("#assetgridtable").setGridParam({
							url:resourceURL,
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#assetgridtable").trigger("reloadGrid"); 
						count++;
						$("#assetList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Asset details not found for the given id " + assetid.bold();
					$.fancybox.open('#alertMsg');
					var resourceURL = $("#contextpath").val()+"/asset/get";
					 $("#assetgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#assetgridtable").trigger("reloadGrid");
				}
			}
			$("#show_vendor").click(function() {
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/asset/viewvendor/"+$("#vendor_id").html();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			$("#show_asset").click(function(){
				$("body").css("cursor", "progress");
				
				var resourceURL = $("#contextpath").val()+"/asset/get";
				if($("#findoption").val() != "all"){
					var assetid = $("#assetid").val();
					resourceURL = $("#contextpath").val()+"/asset/get/"+assetid;
				}
				$("#assetgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#assetgridtable").trigger("reloadGrid"); 
				
				$("#assetDetail").addClass("hidden");
				$("#assetList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment Details
				declineAssetDeatils();
				$("#id").prop( "disabled", true );
				$("#name").prop( "disabled", true );
				$("#dop").prop( "disabled", true );
				$("#assetwarranty").prop( "disabled", true );
				$("#assetguarantee").prop( "disabled", true );
				$("#price").prop( "disabled", true );
				
				$("#id").removeClass("inputBorder");
				$("#name").removeClass("inputBorder");
				$("#dop").removeClass("inputBorder");
				$("#assetwarranty").removeClass("inputBorder");
				$("#assetguarantee").removeClass("inputBorder");
				$("#price").removeClass("inputBorder");
				
				$("#id").addClass("inputdisable");
				$("#name").addClass("inputdisable");
				$("#dop").addClass("inputdisable");
				$("#assetwarranty").addClass("inputdisable");
				$("#assetguarantee").addClass("inputdisable");
				$("#price").addClass("inputdisable");
				
				
				$("body").css("cursor", "default");
			});
		});
	</script>
</html>
