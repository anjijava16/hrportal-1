<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
	
		<style>
			.ui-datepicker-calendar{
				display:none;
			}
			.ui-datepicker-trigger {
			    margin-left: 2px;
			}
		</style>
	
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
			<div id="contentArea" style="overflow: hidden;">
				<div align = "center" id="headdetail1" class="hidden MRGT10PX"> <h1> <b class="saptaColor"> Payroll</b> for the month of&nbsp;<span id="dynamicmonth"></span></h1></div>
				<div id = "optiondiv" style="width: 100%;">
					<table align ="center" class="optionTable" >
						<tr>
							<td align="right" >Choose&nbsp;Month&nbsp;:</td>
							<td align="left" colspan = "2"  class="classMob"  style=" padding-left: 10px;">
								<b style="float:left;"><input name="payrollmonth" id="payrollmonth" type="text" class="datePcKview dateInput" readonly="readonly"/></b>
								<input type="button" value="Find" style="float:left; margin-top: 4px;margin-left: 6px;" id="findByMonth"/>
							</td>
						</tr>
						<tr>
							<td class="currenttotalamtrupyatd1 mobMART0PX" align=right id="totalcounttd1">Total&nbsp;Amount&nbsp;:</td>
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight:bold;">&#x20B9;</span><span id="currenttotalamttd"  style="border: 0;background-color: white; width: 100px;font-weight:bold;" >${totalamount}</span></td>
						</tr>
						
					</table>
				</div>
				<%--  <div id="totaldiv" align ="center">
					<table id="totalcount" align ="center">
						<tr>
							<td align=right id="totalcounttd1">Total&nbsp;Amount&nbsp;:</td>
							<!-- <td c4lass="currenttotalamtrupyatd" style="margin-left:auto;">&#x20B9;</td> -->
							<td align="left"  id="currenttotalamttd" class="PADDLFT1PX BLD" >${totalamount}</td>
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;">&#x20B9;</span><span id="currenttotalamttd"  style="border: 0;background-color: white;">${totalamount}</span></td>
						</tr>
						
					</table>
				</div>	 --%>
				<div id="datedisable" class="hidden">
					<table align ="center" class="hidden">
						<tr>
							<td align="right">Chosen Month&nbsp;:</td>
							<td align="left" colspan = "2" >
								<b><input name="ptmonthdisable" id="ptmonthdisable" type="text" class="datePcKview" readonly="readonly" value="May 2015" style="font-weight: bold;"/></b>
							</td>
						</tr>
					</table>
				</div>
				<div class="responsive">
					 <table class="data display" id="payrolltable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Employee&nbsp;Id</th>
								<th class="">Employee&nbsp;Name</th>
								<th class="">Status</th>
								<th class="">Amount&nbsp;(<span class="rupyaINR">&#x20B9;</span>)</th>
 							</tr>
						</thead>
						
						<tbody>
						</tbody>					
					</table>
				</div>
				<div id="payrollDetail" class="hidden MRGT10PX">
					<div align="left" id="back_assignlist" class="">
						<a href="#" id="show_payroll">Payroll List </a>/ Payroll Details
					</div>
					<br/>
					<div>
						<div class="rightElement MRGL10PX">
							<input type="button" value="View Payslip"  id="paysliptab" class="graybtn" style="padding-right: 6px; border-right-width: 0px; margin-right: 10px;" />
						</div>
						<div class="rightElement MRGL10PX">
							<input type="button" value="Send Payslip"  id="sendPaysliptab" class="graybtn" style="padding-right: 6px; border-right-width: 0px; margin-right: 10px;" />
						</div>
					</div> 
					<br/>
					<table class="tableContent" id="table_id" style="margin-top: 27px;">
					</table><br/>
					
					<!-- <div><div>No Of LOP</div><div id="lossofpay"></div></div> -->
					<table class="tableContent hidden" id="lop_table">
						<tr>
							<td class="lableContent">No Of LOP</td>
							<td class="value" id="lossofpay"></td>
						</tr>
					</table><br/>
					 
					  <div id="sal_table_id" style="margin-top: 3%;"> 
					  <div class="responsive" >
					  	<div style="max-width:100%;"> 
						 	<!-- <div class="WDTH50PER" align ="center"> -->
							 	<table  align ="center" style="left:0; float: left;" class="WDTH50PER MOBWID275PX">
									<tr>
										<td align="right" style="margin-top: 0px; width:51%; ">Annual&nbsp;CTC&nbsp;:</td>
										 <td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD"  ><span style="margin-left: 10px;font-weight: bold;">&#x20B9;</span><input id="annualctc" disabled style="border: 0;background-color: white;font-weight: bold; width: 100px;" /></td>
							
									</tr>
								</table>
							<!-- </div>  -->
							 <!-- <div class="WDTH50PER"> -->
							 	<table  align ="center" style="left:50%; " class="WDTH50PER MOBWID275PX">
									<tr>
										<td align="right" style="margin-top: 0px; width:51%; " >Monthly&nbsp;CTC&nbsp;:</td>
										<!-- <td class="middlecellcol" style="width: 24px;">:</td> -->
										<!--  <td class="WebRupee PADDRGT1PX BLD rupyaINR" width="11px" style="padding-top: 2px;">&#x20B9;</td> -->
										<!-- <td id="monthlyctctd" class="PADDLFT1PX BLD"  width="192px"><input id="monthlyctc" disabled="disabled" class="inputdisable" style="font-weight: bold";></input></td> -->
										 <td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight: bold;">&#x20B9;</span><input id="monthlyctc" disabled style="border: 0;background-color: white;font-weight: bold; width: 100px;" /></td>
							
									</tr>
								</table>
						<!-- 	</div> -->
						 </div>
						
						 	<table id="sal_table" class="">
						 		<tr id="sal_details" class="">
						 			<td style="padding-bottom: 0px;" class="sal_details_td">
						 				<table class="bordered" class="sal_details_table">
											<tr >
												<td class="bordertop">CODE</td>
												<td class="top">:</td>
												<td class="righttop"><div id="employeeid" class="sal_details_table_div"></div></td>
												<td class="bordertop MOBBOR0PX">BIRTH DATE</td>
												<td class="top">:</td>
												<td class="righttop"><div id="dob" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">NAME</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="fname" class="sal_details_table_div"></div></td>
												<td class="leftcell MOBBOR0PX">JOINING DATE</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="jdate" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">FATHER NAME</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="relationship" class="sal_details_table_div"></div></td>
												<td class="leftcell MOBBOR0PX">PAN NO</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="pan" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">DEPARTMENT</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="dept" class="sal_details_table_div"></div></td>
												<td class="leftcell MOBBOR0PX">AADHAR NO</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="aadharno" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">DESIGNATION</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="postapplied"  class="sal_details_table_div"></div></td>
												<td class="leftcell MOBBOR0PX">PF NO</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="pfno" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">BANK NAME</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="bankname" class="sal_details_table_div"></div></td>
												<td class="leftcell MOBBOR0PX">JOINING&nbsp;LOCATION</td>
												<td class="middlecell">:</td>
												<td class="rightcell"><div id="joininglocation" class="sal_details_table_div"></div></td>
											</tr>
											<tr>
												<td class="leftcell">ACCOUNT NO</td>
												<td class="middlecell">:</td>
												<td class="rightcell  MOBBOR0PX"><div class="sal_details_table_div" id="accountno"></div></td>
												<td class="leftcell MOBBOR0PX">DAYS PAYABLE</td>
												<td class="middlecell">:</td>
												<td class="rightcell "><div id="days" class=" sal_details_table_div hidden" ></div>
												<div id="dayspayable" class="sal_details_table_div hidden" contenteditable="true" style="width: 50px;border: 1px solid #dcdcdc;border-radius: 2px;padding: 2px;"></div></td>
											</tr>
										</table>
									</td>
								</tr>
						 	<tr id ="sal_details_cal">
						 		<td style="padding-top: 0px;" class="sal_details_td">	
									<table class="sal_details_cal" class="sal_details_table">	
										<tr>
											<td class="middlecell1">EARNINGS (<span class="rupyaINR WebRupee">&#x20B9;</span>)</td>
											<td class="emptycell">DEDUCTION (<span class="rupyaINR WebRupee">&#x20B9;</span>)</td>
										</tr>
									</table>
									<table class="sal_details_basic" class="sal_details_td">	
									<tr>
										<td class="bottomcell8 MOBWIDTH">Description</td>
										<td class="bottomcell8 MOBWIDTH">Amount (<span class="rupyaINR WebRupee">&#x20B9;</span>)</td>
										<td class="bottomcell8 MOBWIDTH">Description</td>
										<td class="bottomcell1 MOBWIDTH">Amount (<span class="rupyaINR WebRupee">&#x20B9;</span>)</td>
									</tr>
									<tr>
										<td class="bottomcell2 MOBWIDTH">Basic</td>
										<td class="bottomcell6 MOBWIDTH"><div  id="mbasic" class="sal_details_table_div"></div></td>
										<td class="bottomcell2 MOBWIDTH">PF</td>
										<td class="bottomcell3 MOBWIDTH"><div id="mpf" class="sal_details_table_div"></div></td>
										<td class="bottomcell3 MOBWIDTH hidden" ><div id="mctc" class="sal_details_table_div"></div></td>
									</tr>
									<tr>
										<td class="bottomcell2 MOBWIDTH">HRA</td>
										<td class="bottomcell6 MOBWIDTH"><div id="mhra" class="sal_details_table_div"></div></td>
										<td class="bottomcell2 MOBWIDTH">PT</td>
										<td class="bottomcell3 MOBWIDTH"><div id="mpt" class="sal_details_table_div"></div></td>
									</tr>
									<tr>
										<td class="bottomcell2 MOBWIDTH ">Conveyance&nbsp;Allowances</td>
										<td class="bottomcell6 MOBWIDTH"><div id="mconvay" class="sal_details_table_div"></div></td>
										<td class="bottomcell2 MOBWIDTH">TDS</td>
										<td class="bottomcell3 MOBWIDTH"><div id="tds" class="sal_details_table_div"></div></td>
									</tr>
									<tr>
										<td class="bottomcell2 MOBWIDTH">Personal&nbsp;Allowances</td>
										<td class="bottomcell6 MOBWIDTH"><div id="mpersonal" class="sal_details_table_div"></div></td>
										<td class="bottomcell2 MOBWIDTH " style="height:15px;"><span class="hidden">LOP</span></td>
										<td class="bottomcell3 MOBWIDTH " style="height:15px;"><div id="mlop" class="sal_details_table_div hidden" ></div></td>
									</tr>
									<tr>
										<td class="bottomcell MOBWIDTH">Total Earnings</td>
										<td class="bottomcell7 MOBWIDTH"><div id="totalearnings" class="sal_details_table_div"></div></td>
										<td class="bottomcell MOBWIDTH">Total Deduction</td>
										<td class="bottomcell9 MOBWIDTH"><div id="totaldeduction" class="sal_details_table_div"></div></td>
									</tr>
									<tr>
										<td class="bottomcell MOBWIDTH1">Net&nbsp;Payable&nbsp;Amount&nbsp;:</td>
										<td class="bottomcell5 MOBWIDTH"><div id="netpayableamount" class="sal_details_table_div"></div></td>
										<td class="bottomcell5 MOBWIDTH3"><div id="" class="sal_details_table_div"></div></td>
										<td class="bottomcell4 MOBWIDTH2"><div id="" class="sal_details_table_div"></div></td>
									</tr>
								</table>
							</td>		
						</tr>
								<tr>
									<td colspan="3" align ="left" style="width: 100%;">
										<div class="clearWidth">
											<div class="clearTable rightElement" style="margin-top: 15px;">
												<div class="rightElement MRGL10PX">
													<input type="button" value="Pay Salary"  id="paysalarytab"  class="hidden"/>
												</div>
												<div class="leftElement MRGR10PX">
													<input type="button" value="Advance Salary" id="adsalarypay" class="graybtn" style="margin-right: -10px;" />
												</div>
											</div>
										</div>
									</td>
								</tr>	
						</table>
						</div>	
				</div> 
			</div>	
		
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/payroll"><input type="button" value="Done" id="user" /></a>
				</div>
			 </div>
			<div id="addiv" class=" hidden">
                <h1 style="margin-bottom: 4px;">Advance<b class="saptaColor"> Payment</b></h1>
                 <table align ="center" class="hidden optionTable" id="dateselect">
                     <tr>
                         <td align="right"><sup class="saptaColor">*</sup>Choose&nbsp;Month&nbsp;:</td>
                         <td align="left" colspan = "2" style=" padding-left: 10px;">
                                 <b style="float:left"><input name="selecteddate" id="selecteddate" type="text" class="datePcKview" readonly="readonly" value=" " style="font-weight: bold;margin:10px 0;"/></b>
                         </td>
                     </tr>
                 </table>
	             <div id =""class="rightElement MRGL10PX">
	                             <input type="button" value="Submit" id="paysal" style="float:none; margin-top: 4px; width: 70px;"/>
	             </div>
	             <div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b> mandatory fields<br/></div>
             </div>
			<div class="hidden">
			<input name="currentmonth" id="currentmonth" type="text" style="width: 195px; padding: 0px; margin-left: 7px;"/>
			</div>
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline" style= "margin-bottom: 6px;"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel">
				<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement " value="Yes I'm" style = "margin-right: 7px;">&nbsp;</a>
			</div>
			
			<div id="confirmMsgdate" class="hidden" >
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmationMsgContentDate" style= "margin-bottom: 6px;"></div>
				<input type="button" id="date_select" class="rightElement " value="Done" style = "margin-right: 7px;">&nbsp;
			</div>
		</div>
			<%@include file="footer.jsp"%>
	</div>	
	</body>
	<script>
		function startDateConversion(startDate){
			var newStartDate=null;
			if(startDate.indexOf("/")!=-1 && startDate.indexOf("/")==startDate.lastIndexOf("/")){
				var date_entered = startDate.split("/");
				if(date_entered!=null && date_entered.length==2){
					var month_enter=date_entered[0];
					var year_enter=date_entered[1];
					var day = "01";
					newStartDate = day+'/'+month_enter+'/'+year_enter;
				}
			}
			return newStartDate;
		} 
		  
		 function monthConversionWithNullDate(startDate){
			var newStartDate = null;
			var date_entered = startDate.split(" ");
			if(date_entered != null && date_entered.length == 2){
				var month_enter = date_entered[0];
				var year_enter = date_entered[1];
				var day = "00";
				var month = null;
				if("Jan" == month_enter){
					month = "02"
				}else if ("Feb" == month_enter){
					month = "03"
				}else if ("Mar" == month_enter){
					month = "04"
				}else if ("Apr" == month_enter){
					month = "05"
				}else if ("May" == month_enter){
					month = "06"		
				}else if ("Jun" == month_enter){
					month = "07"
				}else if ("Jul" == month_enter){
					month = "08"
				}else if ("Aug" == month_enter){
					month = "09"
				}else if ("Sep" == month_enter){
					month = "10"
				}else if ("Oct" == month_enter){
					month = "11"
				}else if ("Nov" == month_enter){
					month = "12"
				}else if("Dec" == month_enter){
				    month = "13"
				}
			}	  
			newStartDate = day+'/'+month+'/'+year_enter;
			return newStartDate;
		}  
	
		$(document).ready(function(){
			$("#pageTitle").html("Payroll<b class='saptaColor'> List</b>");
			$("#menu_payroll").addClass("active");
			$("#lop_table").hide();
			var monthYear = "${fymonth}";
			
			if(monthYear != null && monthYear != ""){
				$(function() {     
		            $( "#payrollmonth" ).datepicker({
						yearRange: '1950:2100',
						defaultDate: new Date(),
						changeMonth:true,
						changeYear:true,
						showOn: "button",
						buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
						buttonImageOnly: true,
						dateFormat :"MM yy",
						monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
						showButtonPanel:true,
						onClose: function(dateText, inst){
							var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
							var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
							$(this).datepicker('setDate', new Date(year, month, 1));
						},
						gotoCurrent: true
		            })
		        });
                  
				$("#payrollmonth").val("${fymonth}");
				dateMonthYear = monthConversion(monthYear);
				dateMonthYear = dateMonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/payroll/retrivebymonth/"+dateMonthYear;
				var resourceURL = $("#contextpath").val()+"/payroll/gettotalamount/"+dateMonthYear;
					$.ajax({
				        url : resourceURL,
				        type : 'GET',
				        dataType : 'json',
				        success: function(data) {
				        	$("#currenttotalamttd").html((data).toFixed(2));
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				        	$("#errorMsgContent").html(thrownError);
				    		$.fancybox.open('#errorMsg');
				   		}
				   });
			} else {
				$(function() {     
		            $( "#payrollmonth" ).datepicker({
						yearRange: '1950:2100',
						defaultDate: new Date(),
						changeMonth:true,
						changeYear:true,
						showOn: "button",
						buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
						buttonImageOnly: true,
						dateFormat :"MM yy",
						monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
						showButtonPanel:true,
						onClose: function(dateText, inst){
							var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
							var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
							$(this).datepicker('setDate', new Date(year, month, 1));
						},
						gotoCurrent: true
		            }).datepicker('setDate',"0");
		        });
				url = $("#contextpath").val()+"/payroll/retrivebymonth";
			}
		 	$("#payrolltable").dataTable({
		 		"ajax": url,
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
		                .column( 3 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                },0 );
		 
		            // Total over this page
		            pageTotal = api
		                .column( 3, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 1).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            		
		            );
		            $("#currenttotalamttd").html(parseFloat(pageTotal).toFixed(2)); 
		        },
		 		"aoColumns": [ 
                  {sClass: "alignleft"}, 
                  {sClass: "alignleft"},
                  {sClass: "alignleft"},
                  {sClass: "alignright"}
                ]
		 	});
			
		 	var table = $('#payrolltable tbody').on('click', 'tr', function(){
		 		var id = $('td', this).eq(0).text();
		 		var date = $("#payrollmonth").datepicker().val();
		        if(id != "No data available in table"){
		        	var saltype = "c";
		        	payrollDetails(id,date,saltype);
		        }
		        
		    });
			$(function() {
	            $( "#selecteddate" ).datepicker({
					yearRange: '1950:2100',
					defaultDate: new Date(),
					changeMonth:true,
					changeYear:true,
					showOn: "button",
					buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
					buttonImageOnly: true,
					dateFormat :"MM yy",
					monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					showButtonPanel:true,
					onClose: function(dateText, inst){
						var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
						var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
						$(this).datepicker('setDate', new Date(year, month, 1));
					},
					gotoCurrent: true
	            })
	            
	        });
			
			$(function() {
	            $( "#currentmonth" ).datepicker({
	               yearRange: '1950:2100',
				   defaultDate: new Date(),
	               changeMonth:true,
	               changeYear:true,
	               dateFormat :"mm/yy",
	               gotoCurrent: true
	            }).datepicker('setDate',"0");
	        });	
			
			var payrollSize = "${payedlistsize}";
			if(payrollSize != null && payrollSize != 0){
				$("#payrollList").removeClass("hidden");
				$("#norecords").addClass("hidden");
				$("#addiv").addClass("hidden");	
			}else{
				$("#norecords").removeClass("hidden");
				$("#payrollList").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#addiv").addClass("hidden");
			} 
			
			$("#findByMonth").click(function() {
				$("#payrollList").removeClass("hidden");
				$("#datedisable").addClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#addiv").addClass("hidden");
				$("#payrollDetail").addClass("hidden");
				$("#adsalarypay").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headdetail1").addClass("hidden");
				$("#sal_table_id").addClass("hidden");
				
				var month = $("#payrollmonth").datepicker().val();
				month =  monthConversion(month)
				month = month.split('/').join('-');
				$("#selecteddate").datepicker('setDate', null);
				
				var resourceURL = $("#contextpath").val()+"/payroll/gettotalamount/"+month;
				$.ajax({
			        url : resourceURL,
			        type : 'GET',
			        dataType : 'json',
			        success: function(data) {
			        	$("#currenttotalamttd").html((data).toFixed(2));
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			        	$("#errorMsgContent").html(thrownError);
			    		$.fancybox.open('#errorMsg'); 
			   		}
			    }); 
				
				var month = $("#payrollmonth").datepicker().val();
				month =  monthConversion(month)
				month = month.split('/').join('-');
				var table = $('#payrolltable').DataTable();
				table.destroy();
				var resourceURL = $("#contextpath").val()+"/payroll/retrivebymonth/"+month;
				$('#payrolltable').dataTable( {
			        "ajax": resourceURL,
			        "aoColumns": [ 
	                     {sClass: "alignleft"}, 
	                     {sClass: "alignleft"},
	                     {sClass: "alignleft"},
	                     {sClass: "alignright"}
	                  ]
			    });
			});
			
			$("#show_employee").click(function() {
				$("body").css("cursor", "default");
					var resourceURL = $("#contextpath").val()+"/employee/viewemployee/"+$("#employeeid").html();
					$(this).attr("href", resourceURL);
			});	
			
			$("#show_payroll").click(function() {
				$("#selecteddate").datepicker('setDate', null);
				$("#payrollDetail").addClass("hidden");
				$("#payrollList").addClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headdetail1").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#sal_table_id").addClass("hidden");
				$("#choosetype").addClass("hidden");
				$("#paysalarytab").addClass("hidden");
				$("#dateselect").addClass("hidden");
				$("#paysal").addClass("hidden");
				$("#colon").addClass("hidden");
				$("#addiv").addClass("hidden");
				$("#datedisable").addClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#totaldiv").removeClass("hidden");
				
				var  payrollmonth = $("#payrollmonth").datepicker().val();
				payrollmonth = monthConversion(payrollmonth);
				payrollmonth = payrollmonth.split('/').join('-');
				var table = $('#payrolltable').DataTable();
				table.destroy();
				var resourceURL = $("#contextpath").val()+"/payroll/retrivebymonth/"+payrollmonth;
				$('#payrolltable').dataTable({
			        "ajax": resourceURL,
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
		                .column( 3 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                },0 );
		 
		            // Total over this page
		            pageTotal = api
		                .column( 3, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 1).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            		
		            );
		            $("#currenttotalamttd").html(parseFloat(pageTotal).toFixed(2)); 
		        },
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"},
                      {sClass: "alignright"}
                    ]
			    });
				
			});
			
			$(document).on('click','[id^="show_project_"]', function(e) {
				var id = $(this).attr('id');
				var recordid = id.substring(13);
				var resourceURL = $("#contextpath").val()+"/project/viewproject/"+recordid;
				$(this).attr("href", resourceURL);
			});
			
			$("#paysal").click(function() {
				 if($("#selecteddate").datepicker().val() == ""){
					 $("#notify_errors").html("All necessary information has not been provided or it may be invalid data");
				  }else{
					$("#paysalarytab").removeClass("hidden");
					$("#paysliptab").addClass("hidden");
					$("#sendPaysliptab").addClass("hidden");
					
					var currentmonth = $("#currentmonth").datepicker().val();
					var currentmonth = startDateConversion(currentmonth);
					currentmonth = currentmonth.split('/').join('-'); 
					var  payrollmonth = $("#selecteddate").datepicker().val();
					payrollmonth = monthConversion(payrollmonth);
					payrollmonth = payrollmonth.split('/').join('-');
					var currentmonthvalidation = $.datepicker.parseDate('dd-mm-yy',currentmonth); 
				    var ptmonthvalidation = $.datepicker.parseDate('dd-mm-yy',payrollmonth);
					if(currentmonthvalidation < ptmonthvalidation){
						var empid = $("#employeeid").html();
						var date = $("#selecteddate").datepicker().val();
						var resourceURL = $("#contextpath").val()+"/payroll/getempmonth/"+empid+"/"+payrollmonth;
						$.ajax({
					        url : resourceURL,
					        type : 'GET',
					        dataType : 'json',
					        success: function(data) {
					        	if(data == "1"){
					        		$("#alertMsgContent").html("Advance salary already paid for selected month...");
					        		$("#adsalarypay").removeClass("hidden");
									$("#paysalarytab").addClass("hidden");
					        		$.fancybox.open('#alertMsg');
					        	
					        	}else{
					        		$.fancybox.close();
					        		var saltype = "a";
					        		payrollDetails(empid,date,saltype);
					        	} 
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					        	$("#errorMsgContent").html(thrownError);
					    		$.fancybox.open('#errorMsg');
					   		}
					   }); 
						
					}else{
						$("#alertMsgContent").html("Cannot pay advance salary for selected month...");
						$("#adsalarypay").removeClass("hidden");
						$("#paysalarytab").addClass("hidden");
						$.fancybox.open('#alertMsg');
					} 
				}
			});
			
			$("#paysliptab").click(function() {
				var employee = $("#employeeid").html();
				var currentmonth = $("#ptmonthdisable").val();
				var currentdate = monthConversion(currentmonth);
				currentdate = currentdate.split("/").join("-");
				document.location.href =  $("#contextpath").val()+"/viewpayslip?employee="+employee+"&currentmonth="+currentdate+"&strcurrentmonth="+currentmonth+"&viewpayslip=viewpayslip";				
			});
			$("#sendPaysliptab").click(function() {
				var employee = $("#employeeid").html();
				var currentmonth = $("#ptmonthdisable").val();
				var currentdate = monthConversion(currentmonth);
				currentdate = currentdate.split("/").join("-");
				document.location.href =  $("#contextpath").val()+"/sendpayslip?employee="+employee+"&currentmonth="+currentdate+"&strcurrentmonth="+currentmonth+"&sendpayslip=sendpayslip";				
			});
			$("#paysalarytab").click(function() {
				$("#adsalarypay").addClass("hidden");
				var salarymonthdate = monthConversion($("#dynamicmonth").html());
				var date = new Date();
				var m = date.getMonth()+1;
				var y = date.getFullYear();
				
				var currentdate = "";
				if(m <= 9){
					currentdate = "01/"+"0"+m+"/"+y;
				}else{
					currentdate = "01/"+m+"/"+y;
				}
				var payrolltype = "";
				if(salarymonthdate == currentdate ){
					 payrolltype = "c";
				}else{
					payrolltype = "a";
				}
				paysalarynow(payrolltype);
			});
			
			$('#findoption').on('change', function (e) {
				var optionval = $("option:selected", this);
				if(optionval.val() != "null"){
					if(optionval.val() == "c"){
						$("#dateselect").removeClass("hidden");
						$("#paysal").removeClass("hidden");
						$("#colon").addClass("hidden");
					}else{
						$("#dateselect").removeClass("hidden");
						$("#paysal").removeClass("hidden");
						$("#colon").removeClass("hidden");
					}
					
				}
			});
			
			$("#adsalarypay").click(function() {
				$("#dateselect").removeClass("hidden");
				$("#paysal").removeClass("hidden");
				$("#addiv").removeClass("hidden");
				$("#declinedivid").removeClass("hidden");
				$("#decline").removeClass("hidden");
				$("#totaldiv").addClass("hidden");
				
			});
			
		});
		
		$("#dayspayable").bind('keyup mouseup', function () {
			//$("#lop_table").hide();
			var strCurrentMonth = $("#dynamicmonth").html();
          	var convertedDateMonth = monthConversion(strCurrentMonth);
			var monthyear = convertedDateMonth.split("/");
			var daysinMonth = numberofDaysinMonth(monthyear[1], monthyear[2]);
			if($("#dayspayable").html() != ""){
				var numberofdayspayable = $("#dayspayable").html();
				if(numberofdayspayable > 0){
					if(numberofdayspayable <= daysinMonth){
							var annualctc = $("#annualctc").val();
							var monthlyctc = $("#monthlyctc").val();
							var perdaysalary = (monthlyctc / daysinMonth);
							var restrictedsalary = (perdaysalary*numberofdayspayable);
							/* $("#lossofpay").html("");
							if((daysinMonth-numberofdayspayable) > 0){
								$("#lop_table").show();
								$("#lossofpay").html((daysinMonth-numberofdayspayable));
							} */
							montlySalCalculator(restrictedsalary);
					}else{
						$("#alertMsgContent").html(strCurrentMonth+" Have Only " + daysinMonth + " Days... ");
			    		$.fancybox.open('#alertMsg');
			    		$("#dayspayable").html(daysinMonth);
					}
				}else{
					$("#dayspayable").html(1);
				}
				
			}           
		});
		
		function paysalarynow(payrolltype){
			var basic = $("#mbasic").html();
			var hra = $("#mhra").html();
			var misc = $("#mmisc").html();
			var personal = $("#mpersonal").html();
			var conveyance = $("#mconvay").html();
			var pt = $("#mpt").html();
			var tds = $("#tds").html();
			var pf = $("#mpf").html();
			var lop = $("#lossofpay").html();
			var dayspayable = $("#dayspayable").html();
			var payrollmonth = $("#dynamicmonth").html();
			payrollmonth = monthConversion(payrollmonth);
			payrollmonth = payrollmonth.split('/').join('-');
			var empmonthlyctc = $("#monthlyctc").val();
			var totalearnings = $("#totalearnings").html();
			var totaldeduction = $("#totaldeduction").html();
			var netpayableamount = $("#netpayableamount").html();
			var empid = $("#employeeid").html();
			var payrolltype = payrolltype;
			if(pt == null || pt == undefined || pt == "" || pt == 0.00 || pt == "0.00"){
				var pt = 0;
			}
			if(tds == null || tds == undefined || tds == "" || tds == 0.00 || tds == "0.00"){
				var tds = 0;
			}
			if(pf == null || pf == undefined || pf == "" || pf == 0.00 || pf == "0.00"){
				var pf = 0;
			}
			if(lop == null || lop == undefined || lop == "" || lop == 0.00 || lop == "0.00"){
				var lop = 0;
			}
			if($("#selecteddate").datepicker().val() != ""){
				payrollmonth = $("#selecteddate").datepicker().val();
				payrollmonth = monthConversion(payrollmonth);
				payrollmonth = payrollmonth.split('/').join('-');
			}
			
			var resourceURL = $("#contextpath").val()+"/payroll/add/"+empid+"/"+basic+"/"+hra+"/"+personal+"/"+conveyance+"/"+pt+"/"+tds+"/"+pf+"/"+lop+"/"+totalearnings+"/"+totaldeduction+"/"+empmonthlyctc+"/"+netpayableamount+"/"+payrollmonth+"/"+dayspayable+"/"+payrolltype;
			$.ajax({
		        url : resourceURL,
		        type : 'GET',
		        dataType : 'json',
		        success: function(data) {
		        	var successflag = data.response.successflag;
		        	var errors = data.response.errors;
		        	var results = data.response.result;
		        	if(successflag == "true"){
		        		
		        		$("#selecteddate").datepicker('setDate', null);
					    $("#userMsgContent").html("Salary has been paid...");
			    		$.fancybox.open('#userMsg');
			    		$("#datedisable").addClass("hidden");
			    		$("#optiondiv").removeClass("hidden");
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
		
		function payrollDetails(empid, date, saltype){
			$("#days").addClass("hidden");
			$("#dayspayable").removeClass("hidden");
			var selectedmonth  = date;
			$("#dynamicmonth").html(selectedmonth);
			selectedmonth = monthConversionWithNullDate(selectedmonth);
			selectedmonth = selectedmonth.split('/').join('-');
			var resourceURL = $("#contextpath").val()+"/payroll/getempctc/"+empid+"/"+selectedmonth;
			$.ajax({
				url : resourceURL,
				type : 'GET',
				async : false,
				dataType : 'json',
				success: function(data) {
					var successflag = data.response.successflag;
					var errors = data.response.errors;
					var results = data.response.result;
					if(successflag == "true"){
						$('#table_id').empty();
						$("#payrolltable_wrapper").addClass("hidden");
						$("#datedisable").removeClass("hidden");
						$("#optiondiv").addClass("hidden");
						$("#payrollDetail").removeClass("hidden");
						$("#adsalarypay").removeClass("hidden");
						$("#headlist").addClass("hidden");
						$("#headdetail1").removeClass("hidden");
						$("#headdetail").removeClass("hidden");
						$("#sal_table_id").removeClass("hidden");
						$("#declinedivid").addClass("hidden");
						$("#decline").addClass("hidden");
						$("#totaldiv").addClass("hidden");
						$("#selecteddate").datepicker('setDate', null);
						var mnth = $("#payrollmonth").datepicker().val();
						$("#ptmonthdisable").val(mnth);
						
						var resourceURL = $("#contextpath").val()+"/payroll/retrivebyempid/"+empid;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$.each(results, function (i, result){
										$("#employeeid").html(empid);
										if(result.middlename == undefined)
											$("#fname").html((result.firstname == undefined || result.firstname == null || result.firstname.length <= 0) ? "" : result.firstname+" "+result.lastname);
											else
											$("#fname").html((result.firstname == undefined || result.firstname == null || result.firstname.length <= 0) ? "" : result.firstname+" "+result.middlename+" "+result.lastname);
										$("#aadharno").html((result.aadharno == undefined || result.aadharno == null || result.aadharno.length <= 0) ? "" : result.aadharno);
										$("#pan").html((result.pan == undefined || result.pan == null || result.pan.length <= 0) ? "" : result.pan);
										$("#pfno").html((result.pfno == undefined || result.pfno == null || result.pfno.length <= 0) ? "" : result.pfno);
									}); 
								}else{
									fancybox.open('#errorMsg');
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
						});
						var resourceURL = $("#contextpath").val()+"/payroll/retriveempdetailsbyid/"+empid;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$.each(results, function (i, result){
										$("#employeeid").html(empid);
										$("#dob").html((result.dob == undefined || result.dob == null || result.dob.length <= 0) ? "" : result.dob);
										$("#postapplied").html((result.postapplied == undefined || result.postapplied == null || result.postapplied.length <= 0) ? "" : result.postapplied);
										$("#joininglocation").html((result.joininglocation == undefined || result.joininglocation == null || result.joininglocation.length <= 0) ? "" : result.joininglocation);
										$("#dept").html((result.department == undefined || result.department == null || result.department.length <= 0) ? "" : result.department);
										$("#jdate").html((result.jdate == undefined || result.jdate == null || result.jdate.length <= 0) ? "" : result.jdate);
									}); 
								}else{
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
						});
						var resourceURL = $("#contextpath").val()+"/payroll/retriveempaccbyid/"+empid;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$.each(results, function (i, result){
										$("#employeeid").html(empid);
										$("#bankname").html((result.bankname == undefined || result.bankname == null || result.bankname.length <= 0) ? "" : result.bankname);
										$("#accountno").html((result.accountno == 0 || result.accountno == undefined || result.accountno == null || result.accountno == "null" || result.accountno.length <= 0) ? "" : result.accountno);
									}); 
								}else{
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
						});
						
						var count = 0;
						var resourceURL = $("#contextpath").val()+"/payroll/retriveempfamilyid/"+empid;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$.each(results, function (i, result){
										$("#employeeid").html(empid);
										if(result.reletionship.toUpperCase() == "FATHER"){
											$("#relationship").html((result.name == undefined || result.name == null|| result.name.length <= 0) ? "" : result.name);
											count ++;
										}
										if(count == 0){
											$("#relationship").html("");
										}
									}); 
								}else{
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
						});
						
						
						var selectedmonth  = $("#payrollmonth").datepicker().val();
						selectedmonth = monthConversionWithNullDate(selectedmonth);
						selectedmonth = selectedmonth.split('/').join('-');
						var resourceURL = $("#contextpath").val()+"/payroll/getempctc/"+empid+"/"+selectedmonth;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$.each(results, function (i, result){
										var employeectc = result.empctc;
										employeectc = parseFloat(employeectc);
										$("#annualctc").val((result.empctc == undefined || result.empctc == null || result.empctc.length <= 0) ? "" : employeectc.toFixed(2));
									}); 
								}else{
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
						});
						var currentmonth  = date;
						currentmonth = monthConversion(currentmonth);
						currentmonth = currentmonth.split('/').join('-');
						var resourceURL = $("#contextpath").val()+"/payroll/retrivebyempidandcurrentmonth/"+empid+"/"+currentmonth;
						
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								if(successflag == "true"){
									$("#days").removeClass("hidden");
									$("#dayspayable").addClass("hidden");
									$.each(results, function (i, result){
										$("#mbasic").html((result.basicpay == undefined || result.basicpay == null || result.basicpay.length <= 0) ? "" : (result.basicpay).toFixed(2));
										$("#mhra").html((result.hra == undefined || result.hra == null || result.hra.length <= 0) ? "" : (result.hra).toFixed(2));
										$("#mconvay").html((result.conveyanceallowances == undefined || result.conveyanceallowances == null || result.conveyanceallowances.length <= 0) ? "" : (result.conveyanceallowances).toFixed(2));
										$("#mpersonal").html((result.personalallowances == undefined || result.personalallowances == null || result.personalallowances.length <= 0) ? "" : (result.personalallowances).toFixed(2));
										$("#mpf").html((result.providentfund == undefined || result.providentfund == null || result.providentfund.length <= 0 || result.providentfund == 0) ? "" : (result.providentfund).toFixed(2));
										$("#mpt").html((result.professionaltax == undefined || result.professionaltax == null || result.professionaltax.length <= 0 || result.professionaltax == 0) ? "" : (result.professionaltax).toFixed(2));
										$("#mlop").html((result.lossofpay == undefined || result.loseofpay == null || result.loseofpay.length <= 0 || result.loseofpay == 0) ? "" : result.loseofpay);
										if(result.lossofpay > 0){
											$("#lop_table").show();
											$("#lossofpay").html(result.lossofpay);
										}
										$("#tds").html((result.taxdeductionsource == undefined || result.taxdeductionsource == null || result.taxdeductionsource.length <= 0 || result.taxdeductionsource == 0) ? "" : (result.taxdeductionsource).toFixed(2));
										$("#totalearnings").html((result.totalearnings == undefined || result.totalearnings == null || result.totalearnings.length <= 0) ? "" : (result.totalearnings).toFixed(2));
										$("#totaldeduction").html((result.totaldeduction == undefined || result.totaldeduction == null || result.totaldeduction.length <= 0) ? "" : (result.totaldeduction).toFixed(2));
										$("#netpayableamount").html((result.netpayableamount == undefined || result.netpayableamount == null || result.netpayableamount.length <= 0) ? "" : (result.netpayableamount).toFixed(2));
										$("#monthlyctc").val((result.empmonthlyctc == undefined || result.empmonthlyctc == null || result.empmonthlyctc.length <= 0) ? "" : (result.empmonthlyctc).toFixed(2));
										$("#days").html((result.dayspayable == undefined || result.dayspayable == null || result.dayspayable.length <= 0) ? "" : result.dayspayable);
									}); 
								}else{
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
								salarynotpaidcalculation(date);
							}
						});
						
						
						var resourceURL = $("#contextpath").val()+"/payroll/getEmp/"+empid;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								
								if(successflag == "true"){
									$("#table_id").removeClass("hidden");
									$("#prjctdetail").removeClass("hidden");
									$.each(results, function (i, result) {
										var projectname = null;
										<c:forEach items="${projectList}" var="projectlist">
							        		if("${projectlist.id}" == result.projectid){
							        			projectname = "${projectlist.dispname}";
											}
						        		</c:forEach>
			   			        		$('<tr/>').appendTo('#table_id')
			   			                .append($('<td/>').attr("class", "lableContent").html("Project Name"))
			   			        		.append($('<td/>').attr("class", "value").html('<a href="#" id="show_project_'+result.projectid+'">'+projectname+'</a>'));
			   			        		$('<tr/>').appendTo('#table_id')
			   			                .append($('<td/>').attr("class", "lableContent").html("Start Date"))
			   			        		.append($('<td/>').attr("class", "").html(result.startdate));
			   			        		$('<tr/>').appendTo('#table_id')
			   			                .append($('<td/>').attr("class", "lableContent").html("End Date"))
			   			        		.append($('<td/>').attr("class", "").html(result.enddate));
			   			        		var status = null;
			   			        		if(result.status == "a"){
			   			        			status = "Active";
			   			        		}else{
			   			        			status = "Inactive";
			   			        		}
			   			        		$('<tr/>').appendTo('#table_id')
			   			                .append($('<td/>').attr("class", "lableContent").html("Status"))
			   			        		.append($('<td/>').attr("class", "").html(status));
									}); 
								}else{
									$("#table_id").addClass("hidden");
									$("#prjctdetail").addClass("hidden");
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
					   });	
						
						var currentmonth = $("#currentmonth").datepicker().val();
						var currentmonth = startDateConversion(currentmonth);
						currentmonth = currentmonth.split('/').join('-'); 
						var selectedmonth = monthConversion(date);
						selectedmonth = selectedmonth.split('/').join('-');
						var currentmonthvalidation = $.datepicker.parseDate('dd-mm-yy',currentmonth); 
						var ptmonthvalidation = $.datepicker.parseDate('dd-mm-yy',selectedmonth);
						var resourceURL = $("#contextpath").val()+"/payroll/retrivebymnth/"+selectedmonth;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							async : false,
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								var results = data.response.result;
								$("#paysalary").removeClass("hidden");
								if(successflag == "true"){
									$.each(results, function (i, result) {
										if(result.empid == empid){
											if(result.salstatus == "Paid"){
												if(currentmonthvalidation > ptmonthvalidation) {
													 $("#adsalarypay").addClass("hidden")
													 $("#paysliptab").removeClass("hidden")
													 $("#sendPaysliptab").removeClass("hidden")
												 }else if(currentmonthvalidation < ptmonthvalidation) {
													 $("#paysalarytab").addClass("hidden")
													 $("#adsalarypay").removeClass("hidden")
													 $("#paysliptab").removeClass("hidden")
													 $("#sendPaysliptab").removeClass("hidden")
												 }else{
													$("#paysalarytab").addClass("hidden")
													$("#adsalarypay").removeClass("hidden")
													$("#paysliptab").removeClass("hidden")
													$("#sendPaysliptab").removeClass("hidden")
												 }
											}else{
												if((currentmonthvalidation > ptmonthvalidation)) {
													 $("#paysalarytab").removeClass("hidden")
													 $("#adsalarypay").addClass("hidden")
													 $("#paysliptab").addClass("hidden")
													 $("#sendPaysliptab").addClass("hidden")
												 }else if((currentmonthvalidation < ptmonthvalidation)) {
													 $("#paysalarytab").removeClass("hidden")
													 $("#adsalarypay").removeClass("hidden")
													 $("#paysliptab").addClass("hidden")
													 $("#sendPaysliptab").addClass("hidden")
												 }else{
													 $("#paysalarytab").removeClass("hidden")
													 $("#adsalarypay").removeClass("hidden")
													 $("#paysliptab").addClass("hidden")
													 $("#sendPaysliptab").addClass("hidden")
												 }
											}
										}
									});
								}else{
									
								}
							},
							error: function (xhr, ajaxOptions, thrownError) {
							}
					   });
					}else{
						$("#paysalarytab").addClass("hidden");
						$("#alertMsgContent").html("CTC for the employee not found...");
						$.fancybox.open('#alertMsg');
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
				}
		   });
			
			function salarynotpaidcalculation(date){
				//getting no of days Payable value
				$("#lop_table").hide();
				var strCurrentMonth = $("#ptmonthdisable").val();
	            var convertedDateMonth = monthConversion(strCurrentMonth);
				var monthyear = convertedDateMonth.split("/");
				var daysinMonth = numberofDaysinMonth(monthyear[1], monthyear[2]);
				/* var selectedmonth  = $("#payrollmonth").datepicker().val(); */
				var selectedmonth  = date; 
				selectedmonth = monthConversionWithNullDate(selectedmonth);
				selectedmonth = selectedmonth.split('/').join('-');
				
				var resourceURL = $("#contextpath").val()+"/payroll/getempctc/"+empid+"/"+selectedmonth;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					async : false,
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						
						if(successflag == "true"){
							var msc = "";
							var conv = "";
							$.each(results, function (i, result) {
								var resourceURL = $("#contextpath").val()+"/payroll/getconstnt";
								$.ajax({
									url : resourceURL,
									type : 'GET',
									async : false,
									dataType : 'json',
									success: function(data) {
										var successflag = data.response.successflag;
										var errors = data.response.errors;
										var results = data.response.result;
										if(successflag == "true"){
											$.each(results, function (i, result) {
												conv = result.callowance;
												msc = result.mallowance;
											});
										}
									},error: function (xhr, ajaxOptions, thrownError) {
										
									}
								});		
								
								var ctc = result.empctc;
								var ctc1=(ctc*1).toFixed(2);
								$("#annualctc").val(ctc1);
								
								var mctc = (ctc/12).toFixed(2);
								$("#mctc").html(mctc);
								$("#monthlyctc").val(mctc);
								
								var ctc = result.empctc;
								
								var pt = 0.00;
								if(ctc >= 180000){
									pt = 200; 
									$("#mpt").html(parseFloat(pt).toFixed(2));
								}else{
									$("#mpt").html("");
								}
								var tds =0.00;
								var pf = 0.00;
								 if(pt != 0 && pt != 0.00){
									$("#mpt").html(parseFloat(pt).toFixed(2));
								} 
								 // TDS 15000 Deducted if monthly CTC Greater than or equal to 100000
								 if(mctc >= 100000){
									 tds = 15000;
									 $("#tds").html(parseFloat(tds).toFixed(2));
								 }else{
									 $("#tds").html("");
								 }
								if(pf != 0 && pf != 0.00){
									$("#mpf").html(parseFloat(pf).toFixed(2));
								}else{
									$("#mpf").html("");
								}
								if(mlop != 0 && pf != 0.00){
									$("#mpf").html(parseFloat(pf).toFixed(2));
								}
								
								var mctc = (ctc/12).toFixed(2);
								$("#mctc").html(mctc);
								
								var loseofpay = 0;
								var perdaysalary = mctc / daysinMonth;
								var selecteddatevalue  = date;
								selecteddatevalue = monthConversion(selecteddatevalue);
								selecteddatevalue = selecteddatevalue.split("/").join("-");
								var resourceURL = $("#contextpath").val()+"/emplop/getbyempidanddate/"+empid+"/"+selecteddatevalue;
								$.ajax({
									url : resourceURL,
									type : 'GET',
									async : false,
									dataType : 'json',
									success: function(data) {
										loseofpay = data;
									},
									error: function (xhr, ajaxOptions, thrownError) {
									}
								}); 
								
								var finallamount = perdaysalary * (daysinMonth - loseofpay);
								$("#dayspayable").html(daysinMonth - loseofpay);
								$("#lossofpay").html("");
								if(loseofpay > 0){
									$("#lop_table").show();
									$("#lossofpay").html(loseofpay);
								}
								montlySalCalculator(finallamount);
							});
						}else{
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
					}
			   });
			}
			if(saltype == "a"){
				$("#dayspayable").removeClass("hidden");
				 var strCurrentMonth = $("#dynamicmonth").html();
	            var convertedDateMonth = monthConversion(strCurrentMonth);
				var monthyear = convertedDateMonth.split("/");
				var daysinMonth = numberofDaysinMonth(monthyear[1], monthyear[2]);
				$("#dayspayable").html(daysinMonth - $("#lossofpay").html());
				$("#days").addClass("hidden");
			}
		}

		function montlySalCalculator(monltlyamount){
			var basicsalary = ((monltlyamount * 40) / 100);
			var hraallowances = ((basicsalary * 40) / 100);
			var personalallowances = 1250; // Personal Allowance is Rs. 1250, it may change
			var conveyallowances = (monltlyamount - (basicsalary + hraallowances + personalallowances));
			if(conveyallowances <= 0){
			$("#mconvay").html("");
			conveyallowances = 0;
			personalallowances = monltlyamount - (basicsalary + hraallowances); 
			}else{
			$("#mconvay").html((conveyallowances).toFixed(2));
			}

			var totalearnings = (basicsalary + hraallowances + conveyallowances + personalallowances);

			var mpf = $("#mpf").html();
			var mpt = $("#mpt").html();
			var tds = $("#tds").html();

			var totaldeduction = mpf + mpt + tds;

			var netpayableamount = (totalearnings - totaldeduction);

			$("#totaldeduction").html(Math.round(totaldeduction).toFixed(2));
			$("#mbasic").html((basicsalary).toFixed(2));
			$("#mhra").html((hraallowances).toFixed(2));
			/* $("#mconvay").html((conveyallowances).toFixed(2)); */
			$("#mpersonal").html((personalallowances).toFixed(2)); 
			$("#totalearnings").html(Math.round(totalearnings).toFixed(2));

			$("#netpayableamount").html(Math.round(netpayableamount).toFixed(2));
		}
		
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			 
			 $("#date_select").click(function(){
				 $.fancybox.close();
			 });
			 $('#adsalarypay').click(function() {
					$.fancybox.open('#addiv');
					$("body").css("cursor", "default");
			});
	</script>
</html>
