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
		</style>
	
	</head>
	<body>
		<div id="innerContainer">
		<!--Header Start-->
			<header>
			
				<div class="clearBlock">
					<div class="leftElement">
						<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Sapta Labs" /></a></div>
					<div class="rightElement MRGR10PX"><a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a></div>	
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
			<div id="contentArea">
				<div align = "left" id="headlist"><h1>Payroll<b class="saptaColor"> List</b></h1></div>
				<div align = "left" id="headdetail" class="hidden MRGT10PX"> <h1>Payroll<b class="saptaColor"> Detail</b></h1></div>
				<div id = "optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Month</td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<b><input name="ptmonth" id="ptmonth" type="text" class="datePcK" readonly="readonly" style="font-weight: bold;"/></b>
								<input type="button" value="Find" id="findByMonth" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: spx;"/>
							</td>
						</tr>
					</table>
					<!-- <div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div> -->
				</div>
				<div id="datedisable" class="cmnTable hidden">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "91px">Chosen Month</td>
							<td>:</td>
							<td align="left" colspan = "2" style=" padding-left: 0px;" >
								<b><input name="ptmonthdisable" id="ptmonthdisable" type="text" class="datePcK" readonly="readonly" value="May 2015" style="font-weight: bold;"/></b>
							</td>
						</tr>
					</table>
					<!-- <div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div> -->
				</div>
				 <div id="payrollList" class="MRGT10PX">
					<table id="payrollgridtable"></table>
					<div id="payrollgridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="payrollDetail" class="hidden MRGT10PX">
					<div align="left" id="back_assignlist" class="">
						<a href="#" id="show_payroll">Payroll List </a>/ Payroll Details
					</div><br/>
					<div> <h1> <b class="saptaColor"> Employee</b> Details </h1></div>
					<table class="tableContent">
						<tr>
							<td class="lableContent">Employee Id</td>
							<td class="value"><a href="#" id="show_employee"> <div id="employeeid" disabled="disabled" class="inputdisable"></div></a></td>
						</tr>
						<tr>
							<td class="lableContent">First Name</td>
							<td class=""><div id="fname"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Last Name</td>
							<td class=""><div id="lname"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Email</td>
							<td class=""><div id="eemail"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Mobile</td>
							<td class=""><div id="emobile"></div></td>
						</tr>
					</table>
			<!-- Employee Assignment Details End-->
			<!-- Project Assignment Details Starts -->
					 <div id="prjctdetail"> <h1> <b class="saptaColor"> Project</b> Details </h1></div>
					<table class="tableContent" id="table_id">
					</table><br/>
				</div> 
			</div>
			<div id="sal_table_id" class="hidden">
				<div style= "margin-right: -28px; text-align: center;font-weight: bold;">Annexure A</div><br>
				<table class="data">
					<tr>
						<th class="first">Particulars</th>
						<th>Yearly</th>
						<th class="last">Monthly</th>
					</tr>
					<tr>
						<td>Annual CTC without Bonus & L. T. A.</td>
						<td id="actc"></td>
						<td id="mctc"></td>
					</tr>
					<tr>
						<td>Basic</td>
						<td  id="abasic"></td>
						<td  id="mbasic"></td>
					</tr>
					<tr>
						<td>H. R. A.</td>
						<td  id="ahra"></td>
						<td  id="mhra"></td>
					</tr>
					<tr>
						<td>Misc. Allowance</td>
						<td id="amisc"></td>
						<td id="mmisc"></td>
					</tr>
					<tr>
						<td>Medical Allowance</td>
						<td id="amedic"></td>
						<td id="mmedic"></td>
					</tr>
					<tr><td>Conveyance Allowance</td>
						<td id="aconvay"></td>
						<td id="mconvay"></td>
					</tr>
					
					<tr>
						<td class="mytd">Gross Salary (A)</td> 
						<td class="mytd" id="agrosssal"></td>
						<td class="mytd" id="mgrosssal"></td>
					</tr>
					<tr>
						<td>Professional Tax</td>
						<td id="apt"></td>
						<td id="mpt"></td>
					</tr>
					<tr>
						<td class="mytd">Net Salary Payable (B)</td>
						<td class="mytd" id="anetsal"></td>
						<td class="mytd" id="mnetsal"></td>
					</tr>
						
					<tr>
						<td>Conveyance Re-imbursement</td>
						<td id="aconvayre"></td>
						<td id="mconvayre"></td>
					</tr>
					
					<tr>
						<td class="mytd">Total Cost to the Company (A - B)</td>
						<td class="mytd" id="atcost"></td>
						<td class="mytd" id="mtcost"></td>
					</tr>
					<tr>
						<td colspan="3" align ="left">
							<!-- <div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement">
										<input type="button"  class="MRGT10PX" value="Pay Salary" id="salarypay"/>
									</div>
									<div class="rightElement">
										<input type="button"  class="MRGT10PX" value="Pay Salary" id="salarypay"/>
									</div>
								</div>
							</div> -->
							<div class="clearWidth">
								<div class="clearTable rightElement">
									<div class="leftElement">
										<input type="button" value="Pay Salary"  id="paysalarytab"  class="hidden"/>
									</div>
									<div class="rightElement MRGL10PX">
										<input type="button" value="Pay Advance Salary" id="adsalarypay"/>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<%-- <div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/payroll"><input type="button" value="Ok" id="user" /></a>
				</div>
			 </div> --%>
			 <div id="addiv" class="cmnTable">
				<table width = "443px" align ="center" class="hidden" id="dateselect">
					<tr>
						<td align="right" width = "184px"><sup class="saptaColor">*</sup>Choose Month</td>
						<td>:</td>
						<td align="left" colspan = "2">
							<input name="selecteddate" id="selecteddate" type="text" class="datePcK" readonly="readonly" value=" " style="font-weight: bold;"/>
							
							<input type="button" value="Pay Advance Salary " id="paysal" style="float:none;"/>
						</td>								
					</tr>
				</table>
				<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
			</div>
			<div class="hidden">
			<input name="currentmonth" id="currentmonth" type="text" style="width: 195px; padding: 0px; margin-left: 7px;"/>
			</div>
			<div id ="declinedivid"class="rightElement MRGL10PX hidden">
					<input id="decline" type="button" value="Decline" class="graybtn" style ="margin-top: -41px;margin-right: 138px;" />
			</div> 
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline" style= "margin-bottom: 6px;"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel">
				<a href ="<%=request.getContextPath() %>/payroll" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement " value="Yes I'm" style = "margin-right: 7px;">&nbsp;</a>
			</div>
			<!-- <div id ="paysaldivid"  class="hidden">
				<table width = "443px" align ="center" class="hidden" id="selectdate">
						<tr>
							<td align="right" width = "184px"><sup class="saptaColor">*</sup>Choose Date</td>
							<td>:</td>
							<td align="left" colspan = "2">
								<input name="dateofpay" id="dateofpay" type="text" style="width: 200px;margin:0" maxlength="10"/>
								<input type="button" value="Pay Salary " id="paysalary" style="float:none;" class="hidden"/>
							</td>								
						</tr>
				</table>
			</div> -->
			
		</div>
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
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
		  
		function monthConversion(startDate){
			var newStartDate=null;
			var date_entered = startDate.split(" ");
			if(date_entered!=null && date_entered.length==2){
				var month_enter=date_entered[0];
				var year_enter=date_entered[1];
				var day = "01";
				var month = null;
				if("Jan"== month_enter){
					month = "01"
				}else if ("Feb"== month_enter){
					month = "02"
				}else if ("Mar"== month_enter){
					month = "03"
				}else if ("Apr"== month_enter){
					month = "04"
				}else if ("May"== month_enter){
					month = "05"		
				}else if ("Jun"== month_enter){
					month = "06"
				}else if ("Jul"== month_enter){
					month = "07"
				}else if ("Aug"== month_enter){
					month = "08"
				}else if ("Sep"== month_enter){
					month = "09"
				}else if ("Oct"== month_enter){
					month = "10"
				}else if ("Nov"== month_enter){
					month = "11"
				}else if("Dec"== month_enter){
				    month = "12"
				}
			}	  
			newStartDate = day+'/'+month+'/'+year_enter;
			return newStartDate;
		} 
	
		$(document).ready(function(){
			$("body").css("cursor", "default");
			$(function() {
	            $( "#ptmonth" ).datepicker({
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
	            
                   /*  $("#ptmonth").focus(function() {
                    $('.ui-datepicker-calendar').hide();
                }); */
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
				$("#headlist").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#addiv").addClass("hidden");
			} 
			
			var url = $("#contextpath").val()+"/payroll/retrivebyptmonth";
			jQuery("#payrollgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Employee Id','Employee Name', 'Status'], 
				colModel:[
					{name:'empid',index:'empid', width:209, resizable :true},
					{name:'empname',index:'empname', width:350, resizable :true},
					{name:'salstatus',index:'salstatus', width:364, resizable :true},],					
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#payrollgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(empid){
					EmployeeDetails(empid);
				}
			});
			jQuery("#payrollgridtable").jqGrid('navGrid','#payrollgridpager',{edit:false, add:false, del:false, search:false});
			
			$("#findByMonth").click(function() {
				$("#payrollList").removeClass("hidden");
				$("#datedisable").addClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#addiv").addClass("hidden");
				$("#payrollDetail").addClass("hidden");
				$("#adsalarypay").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#sal_table_id").addClass("hidden");
				var month = $("#ptmonth").datepicker().val();
				month =  monthConversion(month)
				month = month.split('/').join('-');
				$("#selecteddate").datepicker('setDate', null);
				var resourceURL = $("#contextpath").val()+"/payroll/retrivebyptmonth/"+month;
				$("#payrollgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#payrollgridtable").trigger("reloadGrid");
			});
			
			$("#show_employee").click(function() {
				$("body").css("cursor", "progress");
					var resourceURL = $("#contextpath").val()+"/employee/viewemployee/"+$("#employeeid").html();
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});	
			
			
			$("#show_payroll").click(function() {
				$("body").css("cursor", "progress");
				$("#selecteddate").datepicker('setDate', null);
				$("#payrollDetail").addClass("hidden");
				$("#payrollList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
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
				/* $("#selecteddate").datepicker('setDate', null);
				alert($("#selecteddate").datepicker.val()); */
				
				
			});
			
			$(document).on('click','[id^="show_project_"]', function(e) {
				var id = $(this).attr('id');
				var recordid = id.substring(13);
				var resourceURL = $("#contextpath").val()+"/project/viewproject/"+recordid;
				$(this).attr("href", resourceURL);
			});
			
			$("#paysal").click(function() {
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
						var resourceURL = $("#contextpath").val()+"/payroll/getempmonth/"+empid+"/"+payrollmonth;
						$.ajax({
					        url : resourceURL,
					        type : 'GET',
					        dataType : 'json',
					        success: function(data) {
					        	if(data == "1"){
					        		$("#alertMsgContent").html("Advance salary already paid for selected month...");
									$.fancybox.open('#alertMsg');
					        	}else{
					        		var payrolltype = "a";
									paysalarynow(payrolltype);
					        	} 
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					        	$("#errorMsgContent").html(thrownError);
					    		$.fancybox.open('#errorMsg');
					   		}
					   }); 
						
					}else{
						$("#alertMsgContent").html("Cannot pay advance salary for selected month...");
						$.fancybox.open('#alertMsg');
					}					
			});
			
			$("#paysalarytab").click(function() {
				//$("#paysaldivid").removeClass("hidden");
				//$("#selectdate").removeClass("hidden");	
				//$("#paysalarytab").addClass("hidden");
				$("#adsalarypay").addClass("hidden");
				var payrolltype = "c";
				paysalarynow(payrolltype);
			});
			
			/* $("#paysalary").click(function() {
				$("#paysaldivid").removeClass("hidden");
				$("#selectdate").removeClass("hidden");
				
				var payrolltype = "c";
				paysalarynow(payrolltype);
				
			}); */
			
			$('#findoption').on('change', function (e) {
				var optionval = $("option:selected", this);
				if(optionval.val() != "null"){
					if(optionval.val()=="c"){
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
				$("#paysalarytab").addClass("hidden");
				$("#dateselect").removeClass("hidden");
				$("#adsalarypay").addClass("hidden");
				$("#paysal").removeClass("hidden");
				$("#addiv").removeClass("hidden");
				$("#declinedivid").removeClass("hidden");
				$("#decline").removeClass("hidden");
				
			});
			
		});
		
		function paysalarynow(payrolltype){
			var basic = $("#mbasic").html();
			var hra = $("#mhra").html();
			var misc = $("#mmisc").html();
			var medical = $("#mmedic").html();
			var conveyance = $("#mconvay").html();
			var pt = $("#mpt").html();
			var payrollmonth = $("#ptmonth").datepicker().val();
			payrollmonth = monthConversion(payrollmonth);
			payrollmonth = payrollmonth.split('/').join('-');
			var totalcost = $("#mtcost").html();
			var creimbursement = $("#mconvayre").html();
			var empmonthlyctc = $("#mctc").html();
			if(creimbursement == undefined ||creimbursement == null ||creimbursement == "-"){
				creimbursement = 0;
			} 
		   if($("#selecteddate").datepicker().val() != ""){
			   payrollmonth = $("#selecteddate").datepicker().val();
			   payrollmonth = monthConversion(payrollmonth);
			   payrollmonth = payrollmonth.split('/').join('-');
			   
		   }
			var empid = $("#employeeid").html();
			var resourceURL = $("#contextpath").val()+"/payroll/add/"+empid+"/"+basic+"/"+hra+"/"+misc+"/"+medical+"/"+conveyance+"/"+pt+"/"+payrollmonth+"/"+payrolltype+"/"+totalcost+"/"+creimbursement+"/"+empmonthlyctc;
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
		
		function EmployeeDetails(empid){
			$('#table_id').empty();
			$("#payrollList").addClass("hidden");
			$("#datedisable").removeClass("hidden");
			$("#optiondiv").addClass("hidden");
			$("#payrollDetail").removeClass("hidden");
			$("#adsalarypay").removeClass("hidden");
			$("#headlist").addClass("hidden");
			$("#headdetail").removeClass("hidden");
			$("#sal_table_id").removeClass("hidden");
			$("#declinedivid").addClass("hidden");
			$("#decline").addClass("hidden");
			$("#selecteddate").datepicker('setDate', null);
			var mnth = $("#ptmonth").datepicker().val();
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
					$("#errorMsgContent").html(thrownError);
					$.fancybox.open('#errorMsg');
				}
		   });	
			
			var resourceURL = $("#contextpath").val()+"/payroll/getempctc/"+empid;
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
							var ctc = result.empctc;
							$("#actc").html((ctc*1).toFixed(2));
							$("#mctc").html((ctc/12).toFixed(2));
							$("#abasic").html(((ctc*50)/100).toFixed(2));
							
							$("#mbasic").html((($("#mctc").html()*50)/100).toFixed(2));
							$("#ahra").html(((ctc*20)/100).toFixed(2));
							
							$("#mhra").html((($("#mctc").html()*20)/100).toFixed(2));
							$("#amisc").html(((ctc*14)/100).toFixed(2));
							
							$("#mmisc").html((($("#mctc").html()*14)/100).toFixed(2));
							$("#amedic").html(((ctc*10)/100).toFixed(2));
							
							$("#mmedic").html((($("#mctc").html()*10)/100).toFixed(2));
							$("#aconvay").html(((ctc*6)/100).toFixed(2));
							
							$("#mconvay").html((($("#mctc").html()*6)/100).toFixed(2));
							$("#agrosssal").html((ctc*1).toFixed(2));
							$("#mgrosssal").html((ctc/12).toFixed(2));
							
							var pt=null;
							if(ctc >= 180000){
								pt=200;
							}else{
								pt=100;
							}
							$("#apt").html(pt);
							$("#mpt").html(pt);
							$("#anetsal").html(pt*12);
							$("#mnetsal").html(pt);
							$("#aconvayre").html("-");
							$("#mconvayre").html("-");
							$("#atcost").html($("#agrosssal").html()-$("#anetsal").html());
							$("#mtcost").html($("#mgrosssal").html()-$("#mnetsal").html());
							
						});
					}else{
						
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
					$("#errorMsgContent").html(thrownError);
					$.fancybox.open('#errorMsg');
				}
		   });
			
			/* var ptmonth = $("#ptmonth").datepicker().val();
			var ptmonth = startDateConversion(ptmonth);
			ptmonth = ptmonth.split('/').join('-');
			var resourceURL = $("#contextpath").val()+"/payroll/retrivebystus/"+month;
			$.ajax({
				url : resourceURL,
				type : 'GET',
				async : false,
				dataType : 'json',
				success: function(data) {
					var successflag = data.response.successflag;
					var errors = data.response.errors;
					var results = data.response.result; */
					
					
		
			 
			 /* alert("currf"+currentmonth);
			 alert("self"+ptmonth); */
			/*  var ptmonth = startDateConversion(ptmonth) */
			 /* var currentmonth = startDateConversion(currentmonth) */
			/*  alert("method"+ptmonth)
			 alert("method"+currentmonth); */
			 
			/*  ptmonth = ptmonth.split('/').join('-');
			 currentmonth = currentmonth.split('/').join('-');  */
			 /* alert("split"+ptmonth);
			 alert("split"+currentmonth); */
			/* var currentmonthvalidation = $.datepicker.parseDate('dd-mm-yy',currentmonth); 
			var ptmonthvalidation = $.datepicker.parseDate('dd-mm-yy',ptmonth); */
		/* 	alert(currentmonthvalidation); 
			alert(ptmonthvalidation);
			alert((currentmonthvalidation>ptmonthvalidation));
			alert((currentmonthvalidation<ptmonthvalidation));  
			alert((currentmonthvalidation==ptmonthvalidation));  */
			/* <c:forEach items="${payedlist}" var="payedList">
			 	if("${payedList.empid}" == empid){ 
					if("${payedList.salstatus}" == "Paid"){
						alert("pay")
						if(currentmonthvalidation>ptmonthvalidation) {
							 $("#paysalarytab").addClass("hidden")
							 $("#adsalarypay").addClass("hidden")
						 }else if(currentmonthvalidation<ptmonthvalidation) {
							 $("#paysalarytab").addClass("hidden")
							 $("#adsalarypay").removeClass("hidden")
						 }else{
							 $("#paysalarytab").addClass("hidden")
							 $("#adsalarypay").removeClass("hidden")
						 }
					}else{
						alert("notpay")
						 if((currentmonthvalidation>ptmonthvalidation)) {
							 alert("last month pay")
							 $("#paysalarytab").removeClass("hidden")
							 $("#adsalarypay").addClass("hidden")
						 }else if((currentmonthvalidation<ptmonthvalidation)) {
							 $("#paysalarytab").addClass("hidden")
							 $("#adsalarypay").removeClass("hidden")
						 }else{
							 $("#paysalarytab").removeClass("hidden")
							 $("#adsalarypay").removeClass("hidden")
						 }
					}
				 } 
			</c:forEach> */
			var currentmonth = $("#currentmonth").datepicker().val();
			var currentmonth = startDateConversion(currentmonth);
			currentmonth = currentmonth.split('/').join('-'); 
			var month = $("#ptmonth").datepicker().val();
			var selectedmonth = monthConversion(month);
			selectedmonth = selectedmonth.split('/').join('-');
			var currentmonthvalidation = $.datepicker.parseDate('dd-mm-yy',currentmonth); 
			var ptmonthvalidation = $.datepicker.parseDate('dd-mm-yy',selectedmonth);
			/* alert(currentmonthvalidation>ptmonthvalidation);
			alert(currentmonthvalidation<ptmonthvalidation);
			alert(currentmonthvalidation==ptmonthvalidation); */
			var resourceURL = $("#contextpath").val()+"/payroll/retrivebyptmnth/"+selectedmonth;
			
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
									if(currentmonthvalidation>ptmonthvalidation) {
										 $("#paysalarytab").addClass("hidden")
										 $("#adsalarypay").addClass("hidden")
									 }else if(currentmonthvalidation<ptmonthvalidation) {
										 $("#paysalarytab").addClass("hidden")
										 $("#adsalarypay").removeClass("hidden")
									 }else{
										 $("#paysalarytab").addClass("hidden")
										 $("#adsalarypay").removeClass("hidden")
									 }
								}else{
									if((currentmonthvalidation>ptmonthvalidation)) {
										 $("#paysalarytab").removeClass("hidden")
										 $("#adsalarypay").addClass("hidden")
									 }else if((currentmonthvalidation<ptmonthvalidation)) {
										 $("#paysalarytab").addClass("hidden")
										 $("#adsalarypay").removeClass("hidden")
									 }else{
										 $("#paysalarytab").removeClass("hidden")
										 $("#adsalarypay").removeClass("hidden")
									 }
								}
							}
						});
					}else{
						
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {
					$("#errorMsgContent").html(thrownError);
					$.fancybox.open('#errorMsg');
				}
		   });
			
			/* <c:forEach items="${payedlist}" var="payedList">
				if("${payedList.empid}" == empid){
					if("${payedList.salstatus}" == "Paid"){
						$("#paysalary").addClass("hidden");
					}else{
						$("#paysalary").removeClass("hidden");
					}
				}
			</c:forEach> */
			$("body").css("cursor", "default");
		} 
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
	</script>
</html>
