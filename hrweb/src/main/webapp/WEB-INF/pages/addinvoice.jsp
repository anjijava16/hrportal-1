<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style type="text/css">
			.ui-datepicker-trigger {
				position: initial;
			  /*   margin-left: 11px; */
			    margin-top: 13px;
			}
	
			option:focus {outline:none;}
			option::-moz-focus-inner {border:0;}
	
		</style>
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>	
		<!--Header End-->
		<div id="innerContainer">
		
		<!--Content Area START-->
			<div id="contentArea">
				<div id="vendor">
					<div id = "customerselect" class="">
					<div  id = "empselect" style="width:100%">
						<table class="optionTable" align ="center">
							<tr>
								<td align="right" style="float:none;" class="invoicetd"><sup class="saptaColor">*</sup>Choose&nbsp;Customer&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="custselect">
										<option value="" style="text-align: center;">--- Select Customer ---</option> 
										<c:forEach items="${customerList}" var="customerlist">
											<option value="${customerlist.id}" style="text-align: left;">${customerlist.id} - ${customerlist.name} </option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr id = "projselect" class="hidden MRGL10PX">
								<td align="right" style="float:none"><sup class="saptaColor">*</sup>Choose&nbsp;Project&nbsp;:</td>
								<td align="left" style="float:none">	
									<select id="selectproject">
									</select>
								</td>
							</tr>
							
							<!-- <tr id = "typeofinvoicediv" class="hidden ">
								<td align="right" style="float:none"><sup class="saptaColor">*</sup>Choose&nbsp;Invoice&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="typeofinvoiceselect" >
										<option value="" style="text-align: center;">--- Select Invoice Type ---</option>
										<option value="h" style="text-align: left;">Hourly</option>
										<option value="d" style="text-align: left;">Daily</option>
										<option value="w" style="text-align: left;">Weekly</option>
										<option value="m" style="text-align: left;">Monthly</option>
										<option value="f" style="text-align: left;">Fixed</option> 
									</select>
								</td>
							</tr>
							
							
							<tr id = "amounttypediv" class="hidden">
								<td align="right" style="float:none" ><sup class="saptaColor">*</sup>Choose&nbsp;Amount&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="amounttypeselect" >
										<option value="" style="text-align: center;">--- Select Amount Type ---</option>
										<option value="i" style="text-align: left;">INR</option>
										<option value="u" style="text-align: left;">USD</option>
										<option value="e" style="text-align: left;">EUR</option>
										<option value="g" style="text-align: left;">GBP</option> 
									</select>
								</td>
							</tr>
							
							<tr id = "invoicenodiv" class="hidden">
								<td align="right" style="margin: 0px;float:none"><sup class="saptaColor" >*</sup>Invoice Number&nbsp;:</td>
								<td align="left" style="float:none">						
									<input id="invoiceno" disabled="disabled" class="inputdisabletxtbold font9px MRGL10PX"  style="padding:5px 0; width:98%"/>
								</td>
							</tr> -->
						</table>
					</div>
					<div class="responsive hidden" id="viewAssignment">
						<table class="data display" id="viewAssignmentTbl" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Assignment&nbsp;Id</th>
									<th class="">Employee&nbsp;Name</th>
									<th class="">Project&nbsp;Name</th>
									<th class="">Project&nbsp;Type</th>
									<th class="">Start&nbsp;Date</th>
									<th class="">End&nbsp;Date</th>
									<th class="">Status</th>
								</tr>
							</thead>	
							<tbody>
							</tbody>				
						</table>
					</div>
					<!-- Assignment Details Starts-->
				<div id="assignmentDetail" class="hidden MRGT10PX">
					<!-- <div align="left" id="back_showassignlist" class=""><a href="#" id="show_showassignlist">Assignment List </a>/ Assignment Details</div><br/> -->
					
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
									<!-- <td align = "right"><input type="button" value="Show Invoice" class="leftElement MRGL10PX" id="showinvoice"/></td>
									<td align = "right"><input type="button" value="Back" class="rightElement graybtn" id="back"/></td>	 -->
								</c:when>
							</c:choose>	
							<!-- <div id="updatebutton" class="hidden" align="left">
								<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
								<input  id="decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
							</div> -->
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
									<td class="lableContentSelect">Project Type</td>
									<td class="valueContent">
										<select id="billtype" class="selectBox hidden" style="margin:0px; text-align:center" class="inputdisable">
											<option value="" style="text-align: center;">--- Project Type ---</option>
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
				   
				   <div id="invoiceterms" class="" style="padding: 2px;">
					<div class="responsive">
					   <div class="data">
				   			<div id = "" style="width:30%;margin:0 auto; padding: 25px 0px 5px 0px;">
								<!-- <span align="right" style="margin: 0px;float:none"></span> -->
								<span align="left" >						
									<sup class="saptaColor" >*</sup>Invoice Number&nbsp;:
									<input id="invoiceno"  class=" font9px MRGL10PX"  style="padding:5px 0; font-weight:800;"/>
								</span>
							</div>
						</div>
						<table class="data" >
							   <tr>
								   <th class="first"><sup class="saptaColor">*</sup>Invoice&nbsp;Date</th>
								   <th class="" style="width:50%">Terms</th>
								   <th class="last"><sup class="saptaColor">*</sup>Due&nbsp;Date</th>
							   </tr>                                        
							   <tr class="invoice_due_datepic">
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="invoicedate" id="invoicedate" readonly="readonly" type="text" class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
								    <td><div style="text-align: center;">Due on date specified</div></td>
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="duedate" id="duedate" readonly="readonly" type="text"  class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
							   </tr>		   
					   </table>
					   </div>
				</div>
					
				<div id="invoiceitemcontent" class="" style="padding: 2px;">
					<div class="responsive">
					   <table id="invoicetablecontent" class="data">
							   <tr>
								   <th class="first"><sup class="saptaColor">*</sup>Reference</th>
								   <th class=""><sup class="saptaColor">*</sup>From</th>
								   <th class=""><sup class="saptaColor">*</sup>To</th>
								   <th id="totaldays" class="hidden"><sup class="saptaColor">*</sup>Total&nbsp;Days</th>
								   <th id="totalhours" class=""><sup class="saptaColor">*</sup>Total&nbsp;<span id="typeofperiod">Days</th>
								   <th id="rate_header" class=""><sup class="saptaColor">*</sup>Rate<span id="slashspan">/</span><span id="fixedtypeofperiodrate hidden"></span><span id="typeofperiodrate"></span></th>
								   <th class="total_amt"><sup class="saptaColor">*</sup>Total&nbsp;(<span class="headamounttype"></span>)</th>
								   <th class="last"><sup class="saptaColor">*</sup>Net&nbsp;Amount&nbsp;(<span class="headamounttype"></span>)</th>
								   <th style="background-color: white; border:0; padding:0;"><div id="addinvoice" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX"><img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/></div></th>
							   </tr>                                        
							   <tr id="invoicecontenttablerow_1">
							   	   <td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_1" id="refnumbername_1" type="text" /></div></td>
							   	   <td><div  style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_1" id="servicefrom_1" readonly="readonly" type="text" class="datePcK datePicMob" style="float:left"/></b></div></td>
							   	   <td><div  style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_1" id="serviceto_1" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td>
							   	   <td class = "totaldaysrow hidden"><div style="width: 95%; margin: 0 auto;"><input name="totaldays_1"  class="" id="totaldays_1" type="text" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_1"  class="perrateperiod" id="totalhrss_1" type="text" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_1" id="rateperhr_1" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td id="rate_value"><div style="width: 95%; margin: 0 auto;"><input name="total_1" id="total_1" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td id="netamt_td"><div style="width: 100%; margin: 0 auto;"><input name="netamt_1" id="netamt_1" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td>
							   	   <td class="noborder">
										<div id="invoice_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											&nbsp;<%-- <img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/> --%>
										</div>
									</td>
							   </tr>		   
					   </table>
					   </div>
					</div>
					<div class="clearWidth" id="sub_total" style="margin: 10px 0;">
						<div class="clearTable rightElement MRGRINVDIV sub_tot_div">
							<div class="leftElement BLDTEXT12PX ">Sub Total</div>
							<div id="subtotalamountdivision" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>
					<div class="clearWidth" id="service_tax" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGRINVDIV div_Width">
							<div class="leftElement BLDTEXT12PX ">Service Tax&nbsp;(<span id="serviceTaxPer"></span>%)</div>
							<div id="servicetax" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>
					
					<div id="totalamountunderline" class="clearWidth" id="">
						<div class="clearTable rightElement WDTH25PER underlinediv">
						</div>
					</div>
					<div class="clearWidth" id="total_amount" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGRINVDIV tot_div">
							<div class="leftElement BLDTEXT12PX ">Total	</div>
							<div id="totalamountdivision" class="rightElement BLDTEXT12PX">0.00</div>
						</div>
					</div>
					<div class="clearWidth" id="buttons">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="addInvoice"/>
							</div>
						 </div>
					</div>
					
					<div style="text-align: center;" id="mandatory" class=""><b class="saptaColor">*</b>mandatory fields</div>
				</div>
				
			
			</div>
			<%-- <div id="confirmMsg" class="hidden" >
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
			</div> --%>
			<!-- Assignment Details End-->
									
					
					<div id="confirmMsg" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContent"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px"></a>
					</div>
					<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
						</div>
					</div>
				</div>
				
			</div>
	<!--Content Area END-->
			
		</div>   
	</div>
	<%@include file="footer.jsp"%>
	</body>
	  <script type="text/javascript">
	  var serviceTaxPercentage = 0;
	  $(document).ready(function(){
		  
			$("body").css("cursor", "progress");
			
			$("#menu_payments").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Invoice");
			$(function() {
				
				 $( "#duedate, #servicefrom_1, #serviceto_1" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
				 });
				 
				 $( "#invoicedate" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy",
					 onSelect:  serviceTaxPercentage
				 });
			 });
			
			$('#viewAssignmentTbl tbody').on('click', 'tr',function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	assignmentDetails(id);
		        	/* $("#invoiceterms,#invoiceitemcontent").removeClass("hidden");
		        	$("#mandatory").removeClass("hidden");
				 	$("#buttons").removeClass("hidden");
				 	$("#invoice").removeClass("hidden");
				 	$("#invoicenodiv").removeClass("hidden");
				 	$('#invoicedate').datepicker('setDate', 'today'); */
		        }
		    });
			
			$('#selectproject').on('change', function (e){
				$("#block_overlay").removeClass("hidden")
				$("#viewAssignment").removeClass("hidden");
				var url = "";
				url = $("#contextpath").val()+"/assignment/getempassign/"+$("#selectproject").val();
				
				$('#viewAssignmentTbl').DataTable().clear().destroy();
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
			 	/* $("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden"); */
			 	if($("#selectproject").val() != "null"){
			 		/* if(!$("#buttons").hasClass("hidden") && !$("#mandatory").hasClass("hidden")){
			 			$("#buttons").removeClass("hidden");
			 			$("#mandatory").removeClass("hidden");
			 			$("#invoicenodiv").removeClass("hidden");
			 		}else{
			 			$("#buttons").addClass("hidden");
			 			$("#mandatory").addClass("hidden");
			 			$("#invoicenodiv").addClass("hidden");
			 		}
			 		$("#typeofinvoicediv").removeClass("hidden"); */
				 	var projectcode = null;
				 	var customercode = null;
				 	var invoicenum = 0;
				 	var id = null;
				 	
				 	var resourceURL = $("#contextpath").val()+"/customer/retrivebyid/"+$("#custselect").val();
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
				        			customercode = result.customercode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#block_overlay").addClass("hidden")
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	var URL = $("#contextpath").val()+"/project/retrivebyid/"+$("#selectproject").val();
				 	$.ajax({
				        url : URL,
				        type : 'GET',
				        dataType : 'json',
				        async : false,
				        success: function(data) {
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	
				        	if(successflag == "true"){
				        		$.each(results, function (i, result) {
				        			projectcode = result.projectcode;
				        		});
				        	}else{
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#block_overlay").addClass("hidden")
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	
				 	/* var url = $("#contextpath").val()+"/invoice/retrivebycustandproject/"+$("#selectproject").val()+"/"+$("#custselect").val(); */
				 	var url = $("#contextpath").val()+"/invoice/getinvoice";
				 	var currentYear = new Date().getYear();
				 	$.ajax({
				        url : url,
				        type : 'GET',
				        dataType : 'json',
				        async : false,
				        success: function(data) {
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	if(successflag == "true"){
				        		if(results.length > 0){
				        			for(var i=0;i<results.length;i++){
					        			invoicenum = results[0].invoiceno;
					        		}	
				        		}else{
				        			invoicenum = 0;
				        		}
				        		$("#block_overlay").addClass("hidden")
				        	}else{
				        		invoicenum = 0;
				        	} 
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#block_overlay").addClass("hidden")
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
				 	if(invoicenum != 0){
				 		var invoiceNumber = invoicenum;
				 		invoicenum = invoicenum.split("-");
					 	var increment = 0;
					 	var invoicearray = invoicenum[2]; 
					 	increment = parseInt(invoicearray)+1;
					 	if(increment <= 9){
					 		increment = "0"+increment;
					 	}
					 	$("#invoiceno").val(invoiceNumber.substr(0, 8)+increment);
				 	}else{
				 		$("#invoiceno").val("");
				 	}
				 	//"SL-"+(currentYear.toString().substr(1,3))+"-"+(parseInt(currentYear.toString().substr(1,3))+1)+"-"+((increment <=9) ? ("0"+ increment) : increment)
				 	
			 	}else{
			 		/* $("#buttons").addClass("hidden");
		 			$("#mandatory").addClass("hidden"); */
			 		$("#typeofinvoiceselect").val("");
			 		$("#typeofinvoicediv").addClass("hidden");
			 		$("#amounttypeselect").val("");
			 		$("#amounttypediv").addClass("hidden");
			 		/* $("#invoicenodiv").addClass("hidden"); */
			 		/* $("#invoiceterms").addClass("hidden"); */
			 		$("#invoicedate").val("");
			 		$("#duedate").val("");
			 		//$("#invoiceitemcontent").addClass("hidden");
			 		/* $("#addinvoice").addClass("hidden");
			 		$("#sub_total").addClass("hidden");
			 		$("#service_tax").addClass("hidden");
			 		$("#totalamountunderline").addClass("hidden");
			 		$("#total_amount").addClass("hidden"); */
			 		$("#servicetax").html("0.00");
			 		$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#refnumbername_"+i).val(" ");
						$("#servicefrom_"+i).val("");
						$("#serviceto_"+i).val(" ");
						$("#totalhrss_"+i).val(" ");
						$("#rateperhr_"+i).val(" ");
						/* $("#total_"+i).val(" ");  */
						$("#netamt_"+i).val(" ");
					});
					$("#invoicedate").val("");
					$("#duedate").val("");
			 	}
			});
			var counter = 2;
			var removeCount = 2;
			$("#addinvoice").click(function () {
				var newemp_dynamic = $(document.createElement('tr')).attr("id", 'invoicecontenttablerow_' + counter);
				if($("#billtype").val() != "f"){
					/* <td><div style="width: 95%; margin: 0 auto;"><input name="total_' + counter +'" id="total_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td> */
					if($("#billtype").val() == "d"){
						newemp_dynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_' + counter +'" id="refnumbername_' + counter +'" type="text"/></div></td><td style="width: 161px;"><div style=" margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_' + counter +'" id="servicefrom_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_' + counter +'" id="serviceto_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_' + counter +'" id="totalhrss_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_' + counter +'" id="rateperhr_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="netamt_' + counter +'" id="netamt_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)""/></div></td><td class="noborder"><div id="invoice_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					}else{
						newemp_dynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_' + counter +'" id="refnumbername_' + counter +'" type="text"/></div></td><td style="width: 161px;"><div style=" margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_' + counter +'" id="servicefrom_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_' + counter +'" id="serviceto_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totaldaysrow"><div style="width: 95%; margin: 0 auto;"><input name="totaldays_' + counter +'" id="totaldays_' + counter +'" class="" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_' + counter +'" id="totalhrss_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_' + counter +'" id="rateperhr_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="netamt_' + counter +'" id="netamt_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)""/></div></td><td class="noborder"><div id="invoice_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					}
				}
				if($("#billtype").val() == "f"){
					newemp_dynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="refnumbername_' + counter +'" id="refnumbername_' + counter +'" type="text"/></div></td><td  style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="servicefrom_' + counter +'" id="servicefrom_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td  style="width: 161px;"><div style="margin: 0 auto;"><b style="float:left" class="datePicInput"><input name="serviceto_' + counter +'" id="serviceto_' + counter +'" readonly="readonly" type="text"  class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totalhrsrow"><div style="width: 95%; margin: 0 auto;"><input name="totalhrss_' + counter +'" id="totalhrss_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rateperhr_' + counter +'" id="rateperhr_' + counter +'" class="perrateperiod" type="text" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="netamt_' + counter +'" id="netamt_' + counter +'" disabled="disabled" class="inputdisable" style="text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="noborder"><div id="invoice_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
				}
				newemp_dynamic.appendTo("#invoicetablecontent");
				$(function() {
					 $( "#servicefrom_"+counter+",#serviceto_"+counter).datepicker({
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
				counter++;
				removeCount++;
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
			$(document).on('click','[id^="invoice_remove_"]', function(e) {
				var id = $(this).attr("id");
				var i = id.substring(15, id.length);
				if(removeCount==2){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("Atleast one detail sholud be required...");
					$.fancybox.open('#errorMsg');
			    }else{
			    	removeCount--;
			    	var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount == ""){
			    		netamount = 0;
			    	}
			    	if($("#amounttype").val() == "inr"){
			    		totalamount = $("#subtotalamountdivision").html();
			    	}else{
			    		totalamount = $("#totalamountdivision").html();
			    	}
			    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					var completeLastTotal1 = lasttotal.toFixed(2);
					if($("#amounttype").val() == "inr"){
						var servicetax = (parseFloat(completeLastTotal1) * serviceTaxPercentage) / 100;
						$("#servicetax").html(servicetax.toFixed(2));
						$("#subtotalamountdivision").html(completeLastTotal1);
						var completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax);
						$("#totalamountdivision").html(parseFloat(completeLastTotal).toFixed(2));
					}else{
						$("#totalamountdivision").html(parseFloat(completeLastTotal1).toFixed(2));
					}
					$("#subtotalamountdivision").html(parseFloat(completeLastTotal1).toFixed(2));
					
			        $("#invoicecontenttablerow_" + i).remove();
			    }   
			 });
			$('#custselect').on('change', function (e){
				$("#block_overlay").removeClass("hidden");
				/* $("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden"); */
			 	/* $("#invoice").addClass("hidden"); */
			 	$("#viewAssignment").addClass("hidden");
			 	$("#projselect").addClass("hidden");
			 	/* $("#invoicenodiv").addClass("hidden"); */
			 	if($("#custselect").val() != ""){
			 		var resourceURL = $("#contextpath").val()+"/project/retrivebycustid/"+$("#custselect").val();
					 $.ajax({
					        url : resourceURL,
					        type : 'GET',
					        dataType : 'json',
					        success: function(data) {
					        	var successflag = data.response.successflag;
					        	var errors = data.response.errors;
					        	var results = data.response.result;
					        	
					        	if(successflag == "true"){
					        		$('#selectproject').find('option').remove();
					        		var optionTag = "<option value='null' style='text-align: center;'>--- Select Project ---</option>";
					        		$('#selectproject').append(optionTag);
					        		 for(var i = 0; i < results.length; i++){
					        			$('#selectproject').append($('<option>', { 
								            value: results[i].id,
								            text : results[i].dispname,
								            style: "text-align: left;"
								        }));
					        		}
					        		$("#projselect").removeClass("hidden");
					        		$("#block_overlay").addClass("hidden")
					        	}else{
					        		$("#block_overlay").addClass("hidden")
					        		$("#projselect").addClass("hidden");
					        	} 
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					        	$("#block_overlay").addClass("hidden")
					        	$("#errorMsgContent").html(thrownError);
					    		$.fancybox.open('#errorMsg');
					   		}
					   });
					   $("#typeofinvoiceselect").val("");
				 		$("#typeofinvoicediv").addClass("hidden");
				 		$("#amounttypeselect").val("");
				 		/* $("#amounttypediv").addClass("hidden");
				 		$("#invoicenodiv").addClass("hidden");
				 		$("#invoiceterms").addClass("hidden"); */
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		/* $("#invoiceitemcontent").addClass("hidden");
				 		$("#addinvoice").addClass("hidden");
				 		$("#sub_total").addClass("hidden");
				 		$("#service_tax").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#total_amount").addClass("hidden"); */
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#totaldays_"+i).val("");
							$("#netamt_"+i).val("");
						});
						$("#invoicedate").val("");
						$("#duedate").val("");
				 	} else{
				 		$("#selectproject").val("");
				 		$("#projselect").addClass("hidden");
				 		$("#typeofinvoiceselect").val("");
				 		$("#typeofinvoicediv").addClass("hidden");
				 		$("#amounttypeselect").val("");
				 		$("#amounttypediv").addClass("hidden");
				 		/* $("#invoicenodiv").addClass("hidden"); */
				 		//$("#invoiceterms").addClass("hidden");
				 		$("#invoicedate").val("");
				 		$("#duedate").val("");
				 		//$("#invoiceitemcontent").addClass("hidden");
				 		/* $("#addinvoice").addClass("hidden");
				 		$("#sub_total").addClass("hidden");
				 		$("#service_tax").addClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#total_amount").addClass("hidden"); */
				 		$("#servicetax").html("0.00");
				 		$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#totaldays_"+i).val("");
							$("#netamt_"+i).val("");
						});
						$("#invoicedate").val("");
						$("#duedate").val("");
						$("#block_overlay").addClass("hidden")
				 	}
				});
			
			/* $('#typeofinvoiceselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	if($("#typeofinvoiceselect").val() != ""){
						$("#amounttypediv").removeClass("hidden");
						if($("#amounttypeselect").val() != ""){
							$("#mandatory").removeClass("hidden");
						 	$("#buttons").removeClass("hidden");
						 	$("#invoice").removeClass("hidden");
						 	$("#invoicenodiv").removeClass("hidden");
						}
						if($("#typeofinvoiceselect").val() == "h"){
							$("#typeofperiod").html("Hours");
							$("#slashspan").removeClass("hidden");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#typeofperiodrate").html("Hour");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "d"){
							$("#typeofperiod").html("Days");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Day");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "w"){
							$("#typeofperiod").html("Weeks");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Week");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "m"){
							$("#typeofperiod").html("Months");
							$("#slashspan").removeClass("hidden");
							$("#typeofperiodrate").html("Month");
							$("#rate_header").removeClass("hidden");
							$("#rate_value").removeClass("hidden");
							$("#fixedtypeofperiodrate").html("");
							$("#totalhours").removeClass("hidden");
							$(".totalhrsrow").removeClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
						if($("#typeofinvoiceselect").val() == "f"){
							$("#typeofperiodrate").html("");
							$("#rate_header").addClass("hidden");
							$("#rate_value").addClass("hidden");
							$("#slashspan").addClass("hidden");
							$(".totalhrsrow").addClass("hidden");
							$("#fixedtypeofperiodrate").html("Fixed");
							$("#totalhours").addClass("hidden");
							$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								$("#totalhrss_"+i).val("");
								$("#rateperhr_"+i).val("");
								$("#total_"+i).val("");
								$("#netamt_"+i).val("");
							});
							$("#servicetax").html("0.00");
							$("#subtotalamountdivision").html("0.00");
							$("#totalamountdivision").html("0.00");
						}
				 	}else{
				 		$("#mandatory").addClass("hidden");
					 	$("#buttons").addClass("hidden");
					 	$("#total_amount").addClass("hidden");
					 	$("#invoice").addClass("hidden");
					 	$("#invoicenodiv").addClass("hidden");
					 	$("#invoiceterms").addClass("hidden");
					 	$("#addinvoice").addClass("hidden");
					 	$("#invoiceitemcontent").addClass("hidden");
					 	$("#sub_total").addClass("hidden");
					 	$("#service_tax").addClass("hidden");
					 	$("#amounttypediv").addClass("hidden");
					 	$("#amounttypeselect").val("");
					 	$("#rate_header").removeClass("hidden");
						$("#rate_value").removeClass("hidden");
				 	}
				}); */
			/* $('#amounttypeselect').on('change', function (e){
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	$("#invoiceterms").addClass("hidden");
			 	$("#addinvoice").addClass("hidden");
			 	$("#invoiceitemcontent").addClass("hidden");
			 	if($("#amounttypeselect").val() != ""){
				 		$("#mandatory").removeClass("hidden");
					 	$("#buttons").removeClass("hidden");
					 	$("#total_amount").removeClass("hidden");
					 	$("#invoice").removeClass("hidden");
					 	$("#invoicenodiv").removeClass("hidden");
					 	$("#invoiceterms").removeClass("hidden");
					 	$("#addinvoice").removeClass("hidden");
					 	$("#invoiceitemcontent").removeClass("hidden");
					 	if($("#amounttypeselect").val() == "i"){
					 		var totalamount = $("#totalamountdivision").html();
					 		var servicetax = parseFloat(totalamount * serviceTaxPercentage ) / 100;
							var completetotalamount = parseFloat(totalamount) + parseFloat(servicetax);
							$("#servicetax").html(servicetax.toFixed(2));
							$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
							$("#totalamountdivision").html(completetotalamount.toFixed(2));
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").removeClass("hidden");
						 	$("#totalamountunderline").removeClass("hidden");
					 		$(".headamounttype").html("&#x20B9;");
					 		$(".headamounttype").addClass("WebRupee");
					 		$(".headamounttype").addClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "u"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#servicetax").html(0.00);
					 		$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
						 	$("#totalamountunderline").addClass("hidden");
					 		$(".headamounttype").html("&#36;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "e"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#servicetax").html(0.00);
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
						 	$("#totalamountunderline").addClass("hidden");
					 		$(".headamounttype").html("&#8364;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	if($("#amounttypeselect").val() == "g"){
					 		$("#sub_total").removeClass("hidden");
						 	$("#service_tax").addClass("hidden");
						 	$("#totalamountunderline").addClass("hidden");
						 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
						 	$("#servicetax").html(0.00);
						 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						 	$("#totalamountdivision").html(totalamount.toFixed(2));
					 		$(".headamounttype").html("&#163;");
					 		$(".headamounttype").removeClass("WebRupee");
					 		$(".headamounttype").removeClass("rupyaINR");
					 	}
					 	$("#buttons").removeClass("hidden");
				 	}else{
				 		$("#mandatory").addClass("hidden");
					 	$("#buttons").addClass("hidden");
					 	$("#total_amount").addClass("hidden");
					 	$("#invoice").addClass("hidden");
					 	$("#invoicenodiv").addClass("hidden");
					 	$("#invoiceterms").addClass("hidden");
					 	$("#addinvoice").addClass("hidden");
					 	$("#sub_total").addClass("hidden");
					 	$("#service_tax").addClass("hidden");
					 	
					 	$("#invoiceitemcontent").addClass("hidden");
					 	$("#subtotalamountdivision").html("0.00");
						$("#totalamountdivision").html("0.00");
					 	$("#servicetax").html("0.00");
					 	$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#refnumbername_"+i).val("");
							$("#servicefrom_"+i).val("");
							$("#serviceto_"+i).val("");
							$("#totalhrss_"+i).val("");
							$("#rateperhr_"+i).val("");
							$("#total_"+i).val("");
							$("#netamt_"+i).val("");
					 });
				 	}
				}); */
				
			 $('#addInvoice').click(function(){
						$("#block_overlay").removeClass("hidden");
				 		var validation = true;
						var invoicenumber = $("#invoiceno").val();
						var invoicedate = $("#invoicedate").datepicker().val();
						var duedate = $("#duedate").datepicker().val();
						var customerid = $("#custselect").val();
						var projectid = $("#selectproject").val();
						var invoicetype = $("#billtype").val();
						var amounttype = $("#amounttype").val();
						
						if(invoicenumber == "" || invoicenumber.length == 0) validation = false;
						if(invoicedate == "" || invoicedate.length == 0) validation = false;
						if(duedate == "" || duedate.length == 0) validation = false;
						if(customerid == "" || customerid.length == 0) validation = false;
						if(projectid == "" || projectid.length == 0) validation = false;
						if(invoicetype == "" || invoicetype.length == 0) validation = false;
						if(amounttype == "" || amounttype.length == 0) validation = false;
						
						var invoicedatevalidation = $.datepicker.parseDate('dd-mm-yy',invoicedate);
						var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
						if ((invoicedatevalidation) > (duedatevalidation))  validation = false; 
						
				 $('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						
						var reference = $("#refnumbername_"+i).val();
						var servicefrom = $("#servicefrom_"+i).val();
						var serviceto = $("#serviceto_"+i).val();
						var totalhrs = $("#totalhrss_"+i).val();
						var rateperhr = $("#rateperhr_"+i).val();
						/* var dueamount = $("#total_"+i).val(); */
						var dueamount = $("#netamt_"+i).val();
						var noofdays = $("#totaldays_"+i).val();
						if(reference == "" || reference.length == 0) validation = false;
						if(servicefrom == "" || servicefrom.length == 0) validation = false;
						if(serviceto == "" || serviceto.length == 0) validation = false;
						//if($("#billtype").val() != "f"){
						if(totalhrs == "" || totalhrs.length == 0) validation = false;
						//}
						if($("#billtype").val() != "f"){
							if( $("#billtype").val() != "d"){
								if(noofdays == "" || noofdays.length == 0) validation = false;
							}
						}
						if(rateperhr == "" || rateperhr.length == 0) validation = false;
						if(dueamount == "" || dueamount.length == 0) validation = false;
						
						var servicefromvalidation = $.datepicker.parseDate('dd-mm-yy',servicefrom);
						var servicetovalidation = $.datepicker.parseDate('dd-mm-yy',serviceto);
						if ((servicefromvalidation) > (servicetovalidation))  validation = false; 
				 });
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					var invoicenumber = $("#invoiceno").val();
					var invoicedate = $("#invoicedate").datepicker().val();
					var duedate = $("#duedate").datepicker().val();
					var customerid = $("#custselect").val();
					var projectid = $("#selectproject").val();
					var invoicetype = $("#billtype").val();
					var amounttype = $("#amounttype").val();
					
					var servicetaxper = 0;
					var servicetax = 0;
					var totalamount = 0;
					if(amounttype == "inr"){
						totalamount = $("#subtotalamountdivision").html();
						servicetax = $("#servicetax").html();
						servicetaxper = parseFloat($("#serviceTaxPer").html());
					}else{
						totalamount = $("#totalamountdivision").html();
					}
					var resourceURL = $("#contextpath").val()+"/invoice/add/"+invoicenumber+"/"+invoicedate+"/"+duedate+"/"+customerid+"/"+projectid+"/"+totalamount+"/"+servicetax+"/"+invoicetype+"/"+servicetaxper+"/"+amounttype;
					
					$.ajax({
						url : resourceURL,
						type : 'GET',
						async: false,
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								addInvoiceDetails();
								$("#block_overlay").addClass("hidden");
							}else{
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
			});
			function addInvoiceDetails(){
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					var invoicenumber = $("#invoiceno").val();
					var reference = $("#refnumbername_"+i).val();
					var servicefrom = $("#servicefrom_"+i).val();
					var serviceto = $("#serviceto_"+i).val();
					var dueamount = $("#netamt_"+i).val();
					var noofdays = $("#totaldays_"+i).val();
					var totalhrs = $("#totalhrss_"+i).val();
					if($("#billtype").val() == "f"){
						noofdays = totalhrs
						totalhrs = 0;
					}else if ($("#billtype").val() == "d"){
						 noofdays = totalhrs;
					}
					
					if(noofdays == "" || noofdays == undefined){
						noofdays = 0;
					}
					var rateperhr = $("#rateperhr_"+i).val();
					//var dueamount = $("#total_"+i).val();
					var resourceURL = $("#contextpath").val()+"/invoice/addinvoicedetails/"+invoicenumber+"/"+reference+"/"+servicefrom+"/"+serviceto+"/"+totalhrs+"/"+rateperhr+"/"+dueamount+"/"+noofdays;
					$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async: false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$("#refnumbername_"+i).val("");
									$("#servicefrom_"+i).val("");
									$("#serviceto_"+i).val("");
									$("#totalhrss_"+i).val("");
									$("#rateperhr_"+i).val("");
									$("#totaldays_"+i).val("");
									$("#netamt_"+i).val("");
									//clear Variables As Null
									reference = null;
									servicefrom = null;
									serviceto = null;
									totalhrs = null;
									rateperhr = null;
									dueamount = null;
									totaldays = null;
									$("#block_overlay").addClass("hidden")
								}else{
									$("#block_overlay").addClass("hidden")
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#block_overlay").addClass("hidden")
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
					});
					$("#userMsgContent").html("Invoice generated ...");
					$.fancybox.open('#userMsg');
			});
			}
			$("#back").on("click", function(){
				$("#viewAssignment").removeClass("hidden");
				$("#viewAssignmentTbl").removeClass("hidden");
				$("#empselect").removeClass("hidden");
				/*$("#assignmentDetail").addClass("hidden");
				$("#mandatory").addClass("hidden");
			 	$("#buttons").addClass("hidden");
			 	$("#total_amount").addClass("hidden");
			 	$("#invoice").addClass("hidden");
			 	$("#invoicenodiv").addClass("hidden");
			 	$("#invoiceterms").addClass("hidden");
			 	$("#sub_total").addClass("hidden");
			 	$("#addinvoice").addClass("hidden");
			 	$("#invoiceitemcontent").addClass("hidden"); */
				var table = $("#viewAssignmentTbl").DataTable().destroy();
				var resourceURL = $("#contextpath").val()+"/assignment/getempassign/"+$("#selectproject").val();
				
				$("#viewAssignmentTbl").dataTable({
					"ajax": resourceURL,
					"aaSorting" : [],
				});
				$("#invoicedate").val("");
		 		$("#duedate").val("");
		 		/* $("#invoiceitemcontent").addClass("hidden");
		 		$("#addinvoice").addClass("hidden");
		 		$("#sub_total").addClass("hidden");
		 		$("#service_tax").addClass("hidden");
		 		$("#totalamountunderline").addClass("hidden");
		 		$("#total_amount").addClass("hidden"); */
		 		$("#servicetax").html("0.00");
		 		$("#subtotalamountdivision").html("0.00");
				$("#totalamountdivision").html("0.00");
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					$("#refnumbername_"+i).val(" ");
					$("#servicefrom_"+i).val("");
					$("#serviceto_"+i).val(" ");
					$("#totalhrss_"+i).val(" ");
					$("#rateperhr_"+i).val(" ");
					/* $("#total_"+i).val(" ");  */
					$("#netamt_"+i).val(" ");
				});
				$("#invoicedate").val("");
				$("#duedate").val("");
			});
			
			$("#viewAssignmentTbl").on("click", function(){
				$("#viewAssignment").addClass("hidden");
				$("#viewAssignmentTbl").addClass("hidden");
				$("#empselect").addClass("hidden");
				//$("#assignmentDetail").addClass("hidden");
				/* $("#mandatory").removeClass("hidden");
			 	$("#buttons").removeClass("hidden");
			 	$("#sub_total").removeClass("hidden");
			 	$("#total_amount").removeClass("hidden");
			 	$("#invoice").removeClass("hidden");
			 	$("#invoicenodiv").removeClass("hidden");
			 	$("#invoiceterms").removeClass("hidden");
			 	$("#addinvoice").removeClass("hidden");
			 	$("#invoiceitemcontent").removeClass("hidden"); */
			 	$("#invoicedate").datepicker('setDate', 'today');
			 	
			 	var invoiceDate = $("#invoicedate").val();
				serviceTaxPercentage(invoiceDate);
			 	/* if($("#powo").val()!=""){
			 		$("#refnumbername_1").val($("#powo").val());
			 	} else {
			 		$("#refnumbername_1").val("");
			 	} */
				//type of invoice
			 	if($("#billtype").val() == "h"){
					$("#typeofperiod").html("Hours");
					$(".total_amt").addClass("hidden");
					$(".totaldaysrow").removeClass("hidden");
					$("#totaldays").removeClass("hidden");
					$("#rate_value").addClass("hidden");
					$("#slashspan").removeClass("hidden");
					$("#rate_header").removeClass("hidden");
					//$("#rate_value").removeClass("hidden");
					$("#typeofperiodrate").html("Hour");
					$("#fixedtypeofperiodrate").html("");
					$("#totalhours").removeClass("hidden");
					$(".totalhrsrow").removeClass("hidden");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#total_"+i).val(""); */
						$("#totaldays_"+i).val("");
						$("#netamt_"+i).val("");
					});
					$("#servicetax").html("0.00");
					$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				}
				if($("#billtype").val() == "d"){
					$("#typeofperiod").html("Days");
					$("#slashspan").removeClass("hidden");
					$(".total_amt").addClass("hidden");
					$("#rate_value").addClass("hidden");
					$("#typeofperiodrate").html("Day");
					$("#rate_header").removeClass("hidden");
					//$("#rate_value").removeClass("hidden");
					$("#fixedtypeofperiodrate").html("");
					$("#totalhours").removeClass("hidden");
					$(".totalhrsrow").removeClass("hidden");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#total_"+i).val(""); */
						$("#netamt_"+i).val("");
					});
					$("#servicetax").html("0.00");
					$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				}
				if($("#billtype").val() == "w"){
					$("#typeofperiod").html("Weeks");
					$("#slashspan").removeClass("hidden");
					$(".totaldaysrow").removeClass("hidden");
					$("#totaldays").removeClass("hidden");
					$(".total_amt").addClass("hidden");
					$("#rate_value").addClass("hidden");
					$("#typeofperiodrate").html("Week");
					$("#rate_header").removeClass("hidden");
					//$("#rate_value").removeClass("hidden");
					$("#fixedtypeofperiodrate").html("");
					$("#totalhours").removeClass("hidden");
					$(".totalhrsrow").removeClass("hidden");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#totaldays_"+i).val(""); */
						$("#totaldays_"+i).val("");
						$("#netamt_"+i).val("");
					});
					$("#servicetax").html("0.00");
					$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				}
				if($("#billtype").val() == "m"){
					$("#typeofperiod").html("Months");
					$("#slashspan").removeClass("hidden");
					$(".total_amt").addClass("hidden");
					$("#rate_value").addClass("hidden");
					$(".totaldaysrow").removeClass("hidden");
					$("#totaldays").removeClass("hidden");
					$("#typeofperiodrate").html("Month");
					$("#rate_header").removeClass("hidden");
					//$("#rate_value").removeClass("hidden");
					$("#fixedtypeofperiodrate").html("");
					$("#totalhours").removeClass("hidden");
					$(".totalhrsrow").removeClass("hidden");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#total_"+i).val(""); */
						$("#totaldays_"+i).val("");
						$("#netamt_"+i).val("");
					});
					$("#servicetax").html("0.00");
					$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				}
				if($("#billtype").val() == "f"){
					$("#typeofperiodrate").html("");
					$("#rate_header,.total_amt, #netamt_td").addClass("hidden");
					$("#rate_value").addClass("hidden");
					$("#slashspan").addClass("hidden");
					$(".totalhrsrow").removeClass("hidden");
					/* $("#fixedtypeofperiodrate").html("Fixed"); */
					$("#totalhours").removeClass("hidden");
					//$(".total_amt,#rate_value").removeClass("hidden");
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#total_"+i).val(""); */
						$("#netamt_"+i).val("");
					});
					$("#servicetax").html("0.00");
					$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				}
				
				// amount type
				if($("#amounttype").val() != ""){
			 		/* $("#mandatory").removeClass("hidden");
				 	$("#buttons").removeClass("hidden");
				 	$("#total_amount").removeClass("hidden");
				 	$("#invoice").removeClass("hidden");
				 	$("#invoicenodiv").removeClass("hidden"); */
				 	//$("#invoiceterms").removeClass("hidden");
				 	/* $("#addinvoice").removeClass("hidden");
				 	$("#invoiceitemcontent").removeClass("hidden"); */
				 	if($("#amounttype").val() == "inr"){
				 		var totalamount = $("#totalamountdivision").html();
				 		var servicetax = parseFloat(totalamount * serviceTaxPercentage ) / 100;
						var completetotalamount = parseFloat(totalamount) + parseFloat(servicetax);
						$("#servicetax").html(servicetax.toFixed(2));
						$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
						$("#totalamountdivision").html(completetotalamount.toFixed(2));
				 		/* $("#sub_total").removeClass("hidden");
					 	$("#service_tax").removeClass("hidden");
					 	$("#totalamountunderline").removeClass("hidden"); */
				 		$(".headamounttype").html("INR");
// 				 		$(".headamounttype").addClass("WebRupee");
// 				 		$(".headamounttype").addClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "usd"){
				 		/* $("#sub_total").removeClass("hidden");
					 	$("#service_tax").addClass("hidden"); */
					 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
					 	$("#servicetax").html(0.00);
				 		$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
					 	$("#totalamountdivision").html(totalamount.toFixed(2));
					 	/* $("#totalamountunderline").addClass("hidden"); */
				 		$(".headamounttype").html("USD");
// 				 		$(".headamounttype").removeClass("WebRupee");
// 				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "eur"){
				 		/* $("#sub_total").removeClass("hidden");
					 	$("#service_tax").addClass("hidden"); */
					 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
					 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
					 	$("#servicetax").html(0.00);
					 	$("#totalamountdivision").html(totalamount.toFixed(2));
					 	//$("#totalamountunderline").addClass("hidden");
				 		$(".headamounttype").html("EUR");
// 				 		$(".headamounttype").removeClass("WebRupee");
// 				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "gbp"){
				 		/* $("#sub_total").removeClass("hidden");
					 	$("#service_tax").addClass("hidden");
					 	$("#totalamountunderline").addClass("hidden"); */
					 	var totalamount = parseFloat($("#totalamountdivision").html()) - parseFloat($("#servicetax").html());
					 	$("#servicetax").html(0.00);
					 	$("#subtotalamountdivision").html(parseFloat(totalamount).toFixed(2));
					 	$("#totalamountdivision").html(totalamount.toFixed(2));
				 		$(".headamounttype").html("GBP");
// 				 		$(".headamounttype").removeClass("WebRupee");
// 				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
				 	$("#buttons").removeClass("hidden");
			 	}else{
			 		$("#mandatory").addClass("hidden");
				 	/* $("#buttons").addClass("hidden");
				 	$("#total_amount").addClass("hidden");
				 	$("#invoice").addClass("hidden");
				 	$("#invoicenodiv").addClass("hidden"); */
				 	//$("#invoiceterms").addClass("hidden");
				 	/* $("#addinvoice").addClass("hidden");
				 	$("#sub_total").addClass("hidden");
				 	$("#service_tax").addClass("hidden");
				 	
				 	$("#invoiceitemcontent").addClass("hidden"); */
				 	$("#subtotalamountdivision").html("0.00");
					$("#totalamountdivision").html("0.00");
				 	$("#servicetax").html("0.00");
				 	$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#refnumbername_"+i).val("");
						$("#servicefrom_"+i).val("");
						$("#serviceto_"+i).val("");
						$("#totalhrss_"+i).val("");
						$("#rateperhr_"+i).val("");
						/* $("#total_"+i).val(""); */
						$("#netamt_"+i).val("");
				 });
			 	}
			});
			
			// Service TAX Date calculation - START
			  function serviceTaxPercentage(invoiceDate){
					var invDate = "";
					var june2016 = "";
					
					invoiceDate = invoiceDate.split("-");
					invoiceDate = invoiceDate[2]+"-"+invoiceDate[1]+"-"+invoiceDate[0];
					invDate = new Date(invoiceDate);
					june2016 = new Date("Jun 01 2016");
					if(invDate >= june2016){
						serviceTaxPercentage = 15;
						$(".perrateperiod").trigger("focusout");
					}else{
						serviceTaxPercentage = 14.5;
						$(".perrateperiod").trigger("focusout");
					}
					$("#serviceTaxPer").html(serviceTaxPercentage);
			  }
			// Service TAX Effective Date calculation - END
			
			
			function assignmentDetails(id) {
				$("#block_overlay").removeClass("hidden")
				$("body").css("cursor", "progress");
				var empid = null;
				var projectid = null;
				$("#viewAssignmentTbl_wrapper").addClass("hidden");
				$("#viewAssignment").addClass("hidden");
				$("#empselect").addClass("hidden");
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
								$("#service_tax").addClass("hidden");
								if(result.amounttype == "inr"){
									$("#service_tax").removeClass("hidden");
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
							$("#block_overlay").addClass("hidden")
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden")
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
							$("#block_overlay").addClass("hidden")
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden")
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
							$("#block_overlay").addClass("hidden")
						}else{
							$("#block_overlay").addClass("hidden")
							$("#errorMsgContent").html(errors);
							$.fancybox.open('#errorMsg');
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#block_overlay").addClass("hidden")
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
			   });	
				
				$("body").css("cursor", "default");
			}
			$('#decline').click(function() {
				$("#confirmationMsgContent").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			$('#decline_no').on("click",function() {
				$.fancybox.close();
			});
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		}).on('focusout', '.perrateperiod', function() {
			var id = $(this).attr("id");
			var i = id.substring(10, id.length);
			//service tax effective date calculation STARTS
			var invoiceDate = $("#invoicedate").val().split("-");
			invoiceDate = invoiceDate[2]+"-"+invoiceDate[1]+"-"+invoiceDate[0];
			var invDate = new Date(invoiceDate);
			var june2016 = new Date("Jun 01 2016");
			if(invDate >= june2016){
				serviceTaxPercentage = 15;
			}else{
				serviceTaxPercentage = 14.5;
			}
			//service tax effective date percentage calculation ENDS
			if($("#billtype").val() != "f"){
				var totalperiod = $("#totalhrss_"+i).val();
				var periodperrate = $("#rateperhr_"+i).val();
				if(totalperiod != "" && periodperrate != ""){
					totalamount = parseFloat(totalperiod) * parseFloat(periodperrate);
					var completetotalamount = totalamount.toFixed(2);
					/* $("#total_"+i).val(completetotalamount); */
					$("#netamt_"+i).val(completetotalamount);
					
					var lastTotal = 0;
					var netamount = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat($("#netamt_"+i).val());
							var completeLastTotal1 = lastTotal.toFixed(2);
							if($("#amounttype").val() == "inr"){
								var servicetax = (parseFloat(completeLastTotal1) * serviceTaxPercentage ) / 100;
								$("#servicetax").html(servicetax.toFixed(2));
								completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax);
								completeLastTotal = completeLastTotal.toFixed(2);
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal);
							}else{
							//$("#subtotalamountdivision").html(completeLastTotal);
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal1);
							}
						}
						
					});
				}else{
					var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	var completeLastTotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount != "" && netamount != 0 && netamount != null){
			    		if($("#amounttype").val() == "inr"){
			    			totalamount = $("#subtotalamountdivision").html();
			    			var servicetax = 0;
					    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					    	servicetax = (lasttotal * serviceTaxPercentage) / 100;
					    	var totalamount = lasttotal + servicetax;
							$("#subtotalamountdivision").html(lasttotal.toFixed(2));
							$("#totalamountdivision").html(totalamount.toFixed(2));
							$("#servicetax").html(servicetax.toFixed(2));
							/* $("#total_"+i).val(""); */
							$("#netamt_"+i).val("");
			    		}else{
			    			var netamount = 0;
			    			var totalamount = 0;
			    			netamount = $("#netamt_"+i).val();
			    			totalamount = $("#totalamountdivision").html();
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#subtotalamountdivision").html(lasttotal.toFixed(2));
			    			$("#totalamountdivision").html(lasttotal.toFixed(2));
			    			/* $("#total_"+i).val(""); */
							$("#netamt_"+i).val("");
			    		}
			    		
			    	}
				}
			}
			if($("#billtype").val() == "f"){
				var periodperrate = $("#rateperhr_"+i).val();
				if(periodperrate != ""){
					totalamount = parseFloat(periodperrate);
					var completetotalamount = totalamount.toFixed(2);
					/* $("#total_"+i).val(completetotalamount); */
					$("#netamt_"+i).val(completetotalamount);
					var lastTotal = 0;
					var netamount = 0;
					var completeLastTotal = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat(netamount);
							completeLastTotal1 = lastTotal.toFixed(2);
							if($("#amounttype").val() == "inr"){
								var servicetax = (parseFloat(completeLastTotal1) * serviceTaxPercentage) / 100;
								$("#servicetax").html(servicetax.toFixed(2));
								$("#subtotalamountdivision").html(completeLastTotal1);
								completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax.toFixed(2));
								$("#totalamountdivision").html(completeLastTotal.toFixed(2));
							}else{
								$("#subtotalamountdivision").html(completeLastTotal1);
								$("#totalamountdivision").html(completeLastTotal1);
							}
						}
						
					});
				} else{
					var netamount = 0;
			    	var totalamount = 0;
			    	var lasttotal = 0;
			    	var completeLastTotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount != "" && netamount != 0 && netamount != null){
			    		if($("#amounttype").val() == "i"){
			    			totalamount = $("#subtotalamountdivision").html();
			    			var servicetax = 0;
					    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					    	servicetax = (lasttotal * serviceTaxPercentage) / 100;
					    	var totalamount = lasttotal + servicetax;
							$("#subtotalamountdivision").html(lasttotal.toFixed(2));
							$("#totalamountdivision").html(totalamount.toFixed(2));
							$("#servicetax").html(servicetax.toFixed(2));
							/* $("#total_"+i).val(""); */
							$("#netamt_"+i).val("");
			    		}else{
			    			var totalamount = 0;
			    			totalamount = $("#totalamountdivision").html();
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#totalamountdivision").html(lasttotal.toFixed(2));
			    			$("#subtotalamountdivision").html(lasttotal.toFixed(2));
			    			/* $("#total_"+i).val(""); */
							$("#netamt_"+i).val("");
			    		}
			    		
			    	}
				}
			}
			
	    });
		
	</script>
</html>

