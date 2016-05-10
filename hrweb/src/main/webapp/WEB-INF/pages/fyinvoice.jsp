<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="head.jsp"%>
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
			<img id="pdfreport" class="MRGL10PX" src="<%=request.getContextPath() %>/resources/icons/pdf.png" style="margin: 4px 20px 0 0; float: right; cursor: pointer;"/>
			<!-- <input type="button" value="Report" class="leftElement MRGL10PX" id="pdfreport" style="margin: 4px 20px 0 0;"/> -->
			<div id = "optiondiv"  style="width:100%">
				<table  align ="center" class="optionTable">
					<tr style="width:100%">
						<td align="right">From&nbsp;&nbsp;&nbsp;:</td>
						<td align="left" colspan = "2" style=" padding-left: 10px;" >
							<b style="float:left"><input name="startyear" id="startyear" type="text" class="datePcKview" readonly="readonly"/></b>
						</td>
						<td align="right">To&nbsp;&nbsp;&nbsp;:</td>
						<td align="left" colspan = "2" style=" padding-left: 10px;" >
							<b style="float:left"><input name="startyear" id="endyear" type="text" class="datePcKview" readonly="readonly"/></b>
							<input type="button" value="Find" id="findByFinancialYear" style="float:right; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-top: 4px;xmargin-left: spx;"/>
						</td>
					</tr>
				</table>
			</div>
			<div id="totaldiv1" align="center" style="width: 100%;">
					<table   align ="center" class="optionTable">
						<tr>
							<td class="currenttotalamtrupyatd1 " align="right" style="margin-left:auto; margin-top:0;" >Amount&nbsp;Received&nbsp;:</td>
							<!-- <td class="currenttotalamtrupyatd " style="margin-left:auto;" >&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD " style="margin-left:auto;" ></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight: bold;">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight: bold;width: 109px;" /></td>
						</tr>
					</table>
			</div>
			<div  id = "fy_details_report">
				<div id = "fy_details">
					<div id="fiancialdashboard" class="dashboard">
					 </div>
					</div>
					<div id="norecords" class="hidden MRGT10PX"><h3 align="center" id="noListAvailable"></h3></div>
				</div>
			</div>
			<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Invoice <b class='saptaColor'>Report");
			$("#menu_fyreports").addClass("active");
				var choosenYear = 0;
				$( "#startyear" ).datepicker({
		               yearRange: '1950:2100',
					   defaultDate: new Date(),
		               changeMonth:true,
		               changeYear:true,
		               showOn: "button",
		               buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
		               buttonImageOnly: true,
		               dateFormat :"dd-mm-yy"
		            });
				$( "#endyear" ).datepicker({
		               yearRange: '1950:2100',
					   defaultDate: new Date(),
		               changeMonth:true,
		               changeYear:true,
		               showOn: "button",
		               buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
		               buttonImageOnly: true,
		               dateFormat :"dd-mm-yy"
		            });
			
			//to get the Month Name from the Date
			Date.prototype.monthName = function() {
			    return this.toUTCString().split(' ')[2]
			}
			
			var renderDueDateSize = 0;
			var currentdate = new Date();
			var currentYear = currentdate.getFullYear();
			var nextYear = currentYear+1;
			if(currentdate.getMonth() < 3){
				currentYear = currentYear-1;
				nextYear = currentYear+1;
			}
			//Start Year
			var strStartDate = "01-04-"+currentYear;
			var currentdate = strStartDate;
			$("#startyear").val(strStartDate);
			
			//End Year 
			var strEndDate = "31-03-"+nextYear;
			var nextdate = strEndDate;
			$("#endyear").val(strEndDate);
			
			finalYearReportProcess(currentdate, nextdate);
			
			$("#findByFinancialYear").click(function() {
				$("[id^='fiancialdashboardrow_']").each(function() {
					var id = $(this).attr('id');
					$("#"+id).remove();
				});

				//Start Year 
				var findCurrentDate = $("#startyear").datepicker().val();
				
				//End Year 
				var findNextDate = $("#endyear").datepicker().val();
				
				finalYearReportProcess(findCurrentDate, findNextDate);
				
			});
			
			$(document).on('click', '.fymonthlist' ,function(){
				var id = $(this).attr('id');
				var recordid = id.substring(8);
				var monthYearVal = $("#monthYear_"+recordid).html();
				var resourceURL = $("#contextpath").val()+"/externalinvoice/viewfyinvoice/"+monthYearVal;
				$(this).attr("href", resourceURL);
			});
			
			function finalYearReportProcess(currentdate, nextYear){
				var completeTotalAmount = 0;
				var resourceURL = $("#contextpath").val()+"/fyreports/getextinvoicereport/"+currentdate+"/"+nextYear;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var results = data.response.result;
						
						if(successflag == "true"){
							var invoicedate = new Array();
							$.each(results, function (i, result){
								invoicedate.push(result.invoicedate);
							});
							var dueAmount = 0;
							var count = 1;
							var flag = 1;
							var dashboardCount = 1;
							var invoiceMonthYear = null;
							var newinvoicedate = duplicateDateRemoval(invoicedate);
							for(var i=0; i<newinvoicedate.length; i++){
								var dateFormated = stringToDateConversion(newinvoicedate[i]);
								var conertedMonth = findMonth(dateFormated.getMonth());
								invoiceMonthYear = conertedMonth+" "+dateFormated.getFullYear();
								var firstDay = new Date(dateFormated.getFullYear(), dateFormated.getMonth(), 1);
								var lastDay = new Date(dateFormated.getFullYear(), dateFormated.getMonth() + 1, 0);
								var resultCount = 0;
								$.each(results, function (i, result){
										var fullInvoiceDateFormated = stringToDateConversion(result.invoicedate);
										if(firstDay <= fullInvoiceDateFormated && fullInvoiceDateFormated <= lastDay){
											if(result.status === "i"){
												dueAmount = parseFloat(dueAmount)+parseFloat(result.received_amount);
												completeTotalAmount = parseFloat(completeTotalAmount)+parseFloat(result.received_amount);
												resultCount++;
											}
										}
								});
								if(resultCount != 0){
								
									var financialYearDynamic = $(document.createElement('div')).attr("id", 'fiancialdashboardrow_' +dashboardCount).attr("class", 'fyDashboardRow');
									financialYearDynamic.html('<div class="cellB"><div class="information"><a href="javascript:void(0);" class="fymonthlist" id="fymonth_' + count +'"><h4 id="monthYear_' + count +'" align="center"></h4><h5 class="small-font" align="center"><b id="dueamount_' + count +'"></b></h5></a></div></div>');
									financialYearDynamic.appendTo("#fiancialdashboard");
									$("#monthYear_"+count).html(invoiceMonthYear);
									$("#dueamount_"+count).html("<p  id='fyPtag'><span class='rupyaINR FONFA35PX'>&#x20B9;</span></p><p class='FYDIVP'><span class='FONTW'>"+numberWithCommas(dueAmount.toFixed(2))+"</span></p>");
									
									dashboardCount++;
									count++;
									invoiceMonthYear = null;
									dueAmount = 0;
								}
								$("#currenttotalamttd").val(numberWithCommas(completeTotalAmount.toFixed(2)));
							}
							$("#fy_details").removeClass("hidden");
							$("#norecords").addClass("hidden");
							$("#totaldiv1").removeClass("hidden");
							$("#pdfreport").removeClass("hidden");
						}else{
							$("#noListAvailable").html(errors);
							
							$("#pdfreport").addClass("hidden");
							$("#norecords").removeClass("hidden");
							$("#fy_details").addClass("hidden");
							$("#totaldiv1").addClass("hidden");
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$("#errorMsgContent").html(thrownError);
						$.fancybox.open('#errorMsg');
					}
				});
				
			}
			
			
			$("#pdfreport").click(function() {
				var startDate = $("#startyear").val();
				var endDate = $("#endyear").val();
				document.location.href =  $("#contextpath").val()+"/invoicepdfreport?startDate="+startDate+"&endDate="+endDate;

			});
			
			
		});
	</script>
</html>