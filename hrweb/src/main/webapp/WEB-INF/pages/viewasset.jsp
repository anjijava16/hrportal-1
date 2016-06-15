<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
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
			<div id="contentArea">
				<div id="totaldiv1" style="width:100%">
					<table  align ="center" class="optionTable">
						<tr>
							<td align="right" style="margin-left:auto; margin-top:0;">Amount&nbsp;Paid&nbsp;:</td>
						<!-- 	<td class="WebRupee PADDRGT1PX BLD rupyaINR" width="2px" style="padding-top: 9px; margin-left: 0px;" class="rupyaINR WebRupee">&#x20B9;</td> -->
							<!-- <td id="currenttotalamttd" class="PADDLFT1PX BLD" style="margin-left: 0px;"></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight: bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight: bold; width: 109px;" /></td>
						</tr>
					</table>
				</div>
			    <div id = "optiondiv" class="cmnTable ">
					<table width = "443px" align ="center">
						<tr id="assetsearch" class = "hidden">
							<td align="right">Enter Asset Id<sup class="saptaColor">*</sup></td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<input name="assetid" id="assetid" type="text" style=" padding: 0px; margin-left: 7px; height: 22px; "/>
								<input type="button" value="Find" id="findByAssetId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
							</td>										
						</tr>
					</table>
					<div class="responsive">
						<table class="data display" id="assetDataTable" cellspacing="0" width="100%">
						<thead>
								<tr>
									<th class="first">Asset&nbsp;Id</th>
									<th class="">Asset&nbsp;Name</th>
									<th class="">Asset&nbsp;Type</th>
									<th class="">Vendor&nbsp;Name</th>
									<th class="">Price&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
								</tr>	
							</thead>
							<tbody></tbody>
						</table>
					</div>
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
								<select id="assettypeid" class="selectBox hidden" style="margin:0px;  text-align:center" class="inputdisable">
									<c:forEach items="${assetTypeList}" var="assetType">
										<option  style="text-align:left" value="${assetType.id}">${assetType.dispname}</option>
									</c:forEach>
								</select>
								<div id="optional_assettypeid" class="valueContent"></div>
							</td>
						</tr>
						<tr>
							<td class="lableContentSelect">Vendor </td>
							<td class="value">
								<select id="vendor_id" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
									<c:forEach items="${vendorList}" var="vendor">
										<option  style="text-align:left" value="${vendor.id}">${vendor.name}</option>
									</c:forEach>
								</select>
								<a href="#" id="show_vendor"><div id="optional_vendor_id" class="valueContent"></div></a>
							</td>
						</tr>
						<tr>
							<td class="lableContent">Date of Purchased</td>
							<td id="dop_tabledata" class="value hidden">
								<b style="float:left; height: 20px;"><input id="dop" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
							</td>
							<td id="dop_tablediv" class="value"><div id="optional_dop"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Warranty of Asset</td>
							<td id="assetwarranty_tabledata" class="value hidden">
								<b style="float:left; height: 20px;"><input id="assetwarranty" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
							</td>
							<td id="assetwarranty_tablediv" class="value"><div id="optional_assetwarranty"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Guarantee of Asset</td>
							<td id="assetguarantee_tabledata" class="value hidden">
								<b style="float:left; height: 20px;"><input id="assetguarantee" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 1px;"></b>
							</td>
							<td id="assetguarantee_tablediv" class="value"><div id="optional_assetguarantee"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Price</td>
							<td class="value"><input id="price" disabled="disabled" class="inputdisable" onkeypress="return validateNumericWithPrecision(event)"></td>
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
		<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){	
			$("#pageTitle").html("Asset<b class='saptaColor'> List</b>");
			$("body").css("cursor", "progress");
			$("#menu_misc").addClass("active");
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
				$("#assetList").addClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").addClass("hidden");
				$("#assetList").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
			} 
			
			
			var amount = 0;
			var url = ""; 
			var resourceurl = "";
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
				fymonthYear = monthConversion(fymonthYear);
				fymonthYear = fymonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/asset/getbymonth/"+fymonthYear;
				resourceurl = $("#contextpath").val()+"/asset/getbydatetotalamount/"+fymonthYear;
			} else{
				url = $("#contextpath").val()+"/asset/get";
				resourceurl = $("#contextpath").val()+"/asset/gettotalamount";
			}
			$("#assetDataTable").dataTable({
				"ajax": url,
				 "aaSorting" : [],
				"footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over all pages
		            total = api
		                .column( 4 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                },0 );
		 
		            // Total over this page
		            pageTotal = api
		                .column( 4, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 1).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            		
		            );
		            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
		        },
		        "aoColumns": [ 
                   {sClass: "alignleft"}, 
                   {sClass: "alignleft"}, 
                   {sClass: "alignleft"}, 
                   {sClass: "alignleft"},
                   {sClass: "alignright"}
                 ]
			});
			if(resourceurl != null && resourceurl != ""){
				$.ajax({
			        url : resourceurl,
			        type : 'GET',
			        dataType : 'json',
			        async : false,
			        success: function(data) {
			        	var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							$.each(results, function (i, result) {
								amount = parseFloat(amount) + parseFloat(result.price);	
							});
							$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   });
			}
			$('#assetDataTable tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	assetDetails(id);
		    	}
		    });
			function assetDetails(assetid){
				$("#block_overlay").removeClass("hidden");
				//Total Amount Div Hiding Process
				$("#totaldiv1").addClass("hidden");
				
				$("#assetList").addClass("hidden");
				$("#assetDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#assetDataTable_wrapper").addClass("hidden");
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
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
						$("#block_overlay").addClass("hidden");
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
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
					$("#assetList").addClass("hidden");
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
				
				if($("#assetwarranty").val() == "-"){
					$("#assetwarranty").val("");
				}if($("#assetguarantee").val() == "-"){
					$("#assetguarantee").val("");
				}
				
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
				$("#block_overlay").removeClass("hidden");
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
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
						$("#block_overlay").addClass("hidden");
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
			}
			$("#update").click(function(){
				$("#block_overlay").removeClass("hidden");
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
				/* if(warrantyofexpired == "" || warrantyofexpired.length == 0) validation = false; 
				if(guranteeofexpired == "" || guranteeofexpired.length == 0) validation = false;  */
				if(price == "" || price.length == 0) validation = false; 
				var dateofpurchasedvalidation = $.datepicker.parseDate('dd-mm-yy',dateofpurchased);
				var warrantyofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',warrantyofexpired);
				guranteeofexpiredvalidation = $.datepicker.parseDate('dd-mm-yy',guranteeofexpired);
				if(warrantyofexpired != "" || warrantyofexpired.length > 0){
					if ((dateofpurchasedvalidation) >= (warrantyofexpiredvalidation))  validation = false; 
				}
				if(guranteeofexpired != "" || guranteeofexpired.length > 0){
					if ((warrantyofexpiredvalidation) >= (guranteeofexpiredvalidation))  validation = false; 
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(warrantyofexpired == "" || warrantyofexpired.length == 0) warrantyofexpired = "null";
					if(guranteeofexpired == "" || guranteeofexpired.length == 0) guranteeofexpired = "null"; 
					var resourceURL = $("#contextpath").val()+"/asset/update/"+id+"/"+name+"/"+assettypeid+"/"+dateofpurchased+"/"+vendorid+"/"+warrantyofexpired+"/"+price+"/"+guranteeofexpired;
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
								$("#block_overlay").addClass("hidden");
								$("#alertMsgContent").html("Asset details updated successfully...");
								$.fancybox.open('#alertMsg');
							}else{
								$("#edit").addClass("hidden");
								$("#delete").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
								$("#block_overlay").addClass("hidden");
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
			$("#delete").click(function(){
				$("#confirmationMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#confirmMsg');
			});
			$("#delete_yes").click(function(){
				$("#block_overlay").removeClass("hidden");
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
							$("#block_overlay").addClass("hidden");
								$("#successful_msg_content").html("Asset deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox'); 
								//assetDeleteReloader();
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden");
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
					$("#block_overlay").addClass("hidden");
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
				var resourceURL = $("#contextpath").val()+"/vendordetails/viewvendorName/"+$("#optional_vendor_id").html();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			
			
			$("#show_asset").click(function(){
				$("body").css("cursor", "progress");
				var amount = 0;
				var table = $("#assetDataTable").DataTable().destroy();
				var resourceURL = $("#contextpath").val()+"/asset/get";
				
				$("#assetDataTable").dataTable({
					"ajax": resourceURL,
					 "aaSorting" : [],
					"footerCallback": function ( row, data, start, end, display ) {
			            var api = this.api(), data;
			 
			            // Remove the formatting to get integer data for summation
			            var intVal = function ( i ) {
			                return typeof i === 'string' ?
			                    i.replace(/[\$,]/g, '')*1 :
			                    typeof i === 'number' ?
			                        i : 0;
			            };
			 
			            // Total over all pages
			            total = api
			                .column( 4 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                },0 );
			 
			            // Total over this page
			            pageTotal = api
			                .column( 4, { "filter" : "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			            // Update footer
			            $( api.column( 1).footer() ).html(
			            	 '$'+pageTotal +' ( $'+ total +' total)' 
			            		
			            );
			            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
			        },
			        "aoColumns": [ 
                       {sClass: "alignleft"}, 
                       {sClass: "alignleft"}, 
                       {sClass: "alignleft"}, 
                       {sClass: "alignleft"},
                       {sClass: "alignright"}
                     ]
				});
				
				var url = $("#contextpath").val()+"/asset/gettotalamount";
				$.ajax({
			        url : resourceurl,
			        type : 'GET',
			        dataType : 'json',
			        async : false,
			        success: function(data) {
			        	var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						if(successflag == "true"){
							$.each(results, function (i, result) {
								amount = parseFloat(amount) + parseFloat(result.price);	
							});
							$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   });
					
				//Total Amount Div Hidden Remove Process
				$("#totaldiv1").removeClass("hidden");
				 
				 
				$("#assetDetail").addClass("hidden");
				$("#assetList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#assetsearch").addClass("hidden");
				$("#findoption").val("all");
				
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#id").prop( 'disabled', false );
				//Function Call For Decline Assignment Details
				//declineAssetDeatils();
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
				
				$("#assettypeid").addClass("hidden");
				$("#optional_assettypeid").removeClass("hidden");
				$("#vendor_id").addClass("hidden");
				$("#optional_vendor_id").removeClass("hidden");
				$("#dop_tabledata").addClass("hidden");
				$("#dop_tablediv").removeClass("hidden");
				$("#assetwarranty_tabledata").addClass("hidden");
				$("#assetwarranty_tablediv").removeClass("hidden");
				$("#assetguarantee_tabledata").addClass("hidden");
				$("#assetguarantee_tablediv").removeClass("hidden");
				
				$("body").css("cursor", "default");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>
