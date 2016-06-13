<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<style>
			.hide-calendar .ui-datepicker-calendar {
			  display: none;
			}
			.responsive .ui-datepicker-trigger{
				position:relative;
			}
		</style> 
	</head>
	<body>
		<!--Header Start-->
		<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
			<div id="contentArea">
				<div id = "optiondiv" style="width: 100%;">
					<table width = "443px" align ="center" class="optionTable">
						<tr>
							<td align="right">Choose&nbsp;Month&nbsp;&nbsp;&nbsp;:</td>
							<td align="left" colspan = "2" style="padding-left: 10px;min-width: 50%;" >
								<b style="float:left" class="WDT90PX"><input  name="invoicemonth" id="invoicemonth" type="text" class="WDT67PX datePcKview" readonly="readonly" style="margin-left:auto" /></b>
								<input type="button" value="Find" id="findByMonth" style="float:left; margin-top: 5px;" />
							</td>
						</tr>
						<tr>
							<td class="currenttotalamtrupyatd1 mobMART0PX" align="right"  style="margin-left:auto" >Invoice&nbsp;Amount&nbsp;:</td>
							<%-- <td class="currenttotalamtrupyatd " style="margin-left:auto;" class="rupyaINR WebRupee">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style="margin-left:auto">${totalamount}</td>  --%>
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight:bold;" class="rupyaINR WebRupee">&#x20B9;</span><span id="currenttotalamttd"  style="width: 109px;font-weight:bold;">${totalamount}</span></td>
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				<%-- <div id="totaldiv"  align ="center">
					<table id="totalcount" align ="center">
						<tr>
							<td class="currenttotalamtrupyatd1" align="right"  style="margin-left:auto" >Invoice&nbsp;Amount&nbsp;:</td>
							<td class="currenttotalamtrupyatd " style="margin-left:auto;" class="rupyaINR WebRupee">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style="margin-left:auto">${totalamount}</td> 
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;" class="rupyaINR WebRupee">&#x20B9;</span><span id="currenttotalamttd"  style="width: 100px;">${totalamount}</span></td>
						</tr>
					</table>
				</div> --%>
				<div class="responsive">
					<table class="data display" id="invoiceDataTable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Invoice&nbsp;No</th>
								<th class="">Status</th>
								<th class="">Amount&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
							</tr>	
						</thead>				
						<tbody></tbody>
					</table>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="invoicedetails" class="hidden MRGT10PX">
					<div align="left" id="back_invoiceList" class=""><a href="#" id="show_showinvoiceList">Invoice List </a>/ Invoice</div><br/>
					<c:choose>
						<c:when test="${ session.groupname == 'ad'}">
							
							<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
							<td align = "right"><input type="button" value="Invoice" class="leftElement MRGL10PX graybtn" id="pdf"/></td>
							<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>
						</c:when>
					</c:choose>	
					<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
					</div>
						<!-- Vendor -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent">Customer Name</td>
							<td class="value"><a href="#" id="show_customer"> <div id="customer_id" style="height: 25px; margin:0; text-align: left; font-weight: bold;"></div></a><input type="text" id="id" name="id" class="hidden"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Project Name</td>
							<td class="value"><a href="#" id="show_Project"><div id="pid" style="height: 25px; margin:0; text-align: left; font-weight: bold;"></div></a></td>
						</tr>
						<tr class="">
							<td class="lableContent">Invoice Type</td>
							<td class="value">
								<select id="typeofinvoice" class="leftElement selectBox hidden" tabindex="2" style="margin:0; text-align: center;">
									<option value="h" style="text-align: left;">Hourly</option>
									<option value="d" style="text-align: left;">Daily</option>
									<option value="w" style="text-align: left;">Weekly</option>
									<option value="m" style="text-align: left;">Monthly</option>
									<option value="f" style="text-align: left;">Fixed</option> 
								</select>
								<div id="optional_typeofinvoice" style="width: 200px; height: 25px; margin:0; text-align: left; font-weight: bold; class="value"></div>
							</td>
						</tr>
						<tr class="">
							<td class="lableContent">Amount Type</td>
							<td class="value">
								<select id="amounttype" class="leftElement selectBox hidden" tabindex="2" style=" margin:0; text-align: center;">
									<option value="inr" style="text-align: left;">INR</option>
									<option value="usd" style="text-align: left;">USD</option>
									<option value="eur" style="text-align: left;">EUR</option>
									<option value="gbp" style="text-align: left;">GBP</option> 
								</select>
								<div id="optional_amounttype" style="height: 25px; margin:0; text-align: left; font-weight: bold;" class="value"></div>
							</td>
						</tr>
						<tr class="">
							<td class="lableContent">Status</td>
							<td class="value">
								<select id="status" class="selectBox hidden" style="margin:0px;text-align: center;" class="inputdisable">
									<option value="a" style="text-align: left;">Pending</option>
									<option value="i" style="text-align: left;">Received</option>
								</select>
								<div id="optional_status" style="height: 25px; margin:0; text-align: left; font-weight: bold;" class="value"></div>
							</td>
						</tr>
						<tr class="">
							<td class="lableContent">Invoice No</td>
							<td class="value"><input id="invoiceno" disabled="disabled" class="inputdisabletxtbold"  /></td>
						</tr>
					</table>
					<br/>
						<div id="tablehead"><h1> <b class="saptaColor"> Received</b> Details </h1></div>
						<table class="hidden" id="recieve">
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Received&nbsp;Date&nbsp;:</td>
									<td><b style="float:left;margin-left:10px;"><input name="received_date" id="receiveddate"  readonly="readonly" type="text" class="datePcKview"/></b></td>
								<td align="right"><sup class="saptaColor">*</sup>Received&nbsp;Amount&nbsp;:</td>
								<td><input name="received_amount" id="receivedamount" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td> 
							</tr>
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Received&nbsp;Amount&nbsp;Type&nbsp;:</td>
								<td>
									<select id="receivedamounttype" name = "receivedamounttype" style="text-align: center;">
										<option value="inr" style="text-align: left;">INR</option>
										<option value="usd" style="text-align: left;">USD</option>
										<option value="eur" style="text-align: left;">EUR</option>
										<option value="gbp" style="text-align: left;">GBP</option>
									</select>
									<div id="optional_received_amounttype" class="value"></div>
								</td>
								<td align="right"><sup class="saptaColor">*</sup>Received&nbsp;Comments&nbsp;:</td>
								<td><textarea style=" height: 100px; resize:none;" id="receivedcomments" name="comments"></textarea></td>
							</tr>
						</table>
						<div id = "invoicereceiveddetails" class="hidden">
						<div align = "left" id="headlist"><h3>Received Amount<b class="saptaColor"> Details</b></h3></div>
						<div class="responsive">
							<table id="" class="data ">
								   <tr>
									   <th  class="first">Date</th>
									   <th  class="">Amount</th>
									   <th  class="">AmountType</th>
									   <th  class="last">Comments</th>
								   </tr>                                        
								   <tr>
									   <td style=" id=""><div><input id="receieveddate" disabled="disabled" class="inputdisable" style="text-align: center;"></input></div></td>
									   <td style="  id=""><div><input id="receievedamount" disabled="disabled" class="inputdisable" style="text-align: center; "></input></div></td>
									   <td style="  id=""><div><input id="receievedamounttype" disabled="disabled" class="inputdisable"style="text-align: center; "></input></div></td>
									   <td id=""><div id="receievedcomments" style="text-align: center; "></div></td>
								   </tr>		   
						   </table>
					   </div>
						</div>
						<br />
					<div id="invoiceterms" style="padding-top: 20px;">
					<div class="responsive">
					   <table class="data">
							   <tr>
								   <th class="first">Invoice&nbsp;Date</th>
								   <th class="">Terms</th>
								   <th class="last">Due&nbsp;Date</th>
							   </tr>                                        
							   <tr>
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="invoicedate" id="invoicedate" readonly="readonly" type="text"  class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
								   <td><div style="text-align: center;">Due on date specified</div></td>
								   <td style="text-align:center;"><div style="text-align: center;display: inline-block;"><b class="datePicInput"><input name="duedate" id="duedate" readonly="readonly" type="text" class="datePcK datePicMob" style="text-align: center; color: #777777;width: 90px !important;"/></b></div></td>
							   </tr>		   
					   </table>
					</div>
					</div>
					<div id="invoiceitemcontent" class="MRGT30PX" style="padding: 2px;">
					<div class="responsive">
					   <table id="invoicetablecontent" class="data">
							   <tr>
								   <th class="first">Reference</th>
								   <th class="">From</th>
								   <th class="">To</th>
								   <th id="totaldays" class="">Total&nbsp;Days</th>
								   <th id="totalhours" class="">Total&nbsp;<span id="typeofperiod"></span></th>
								   <th id="rate_header" class=""><!-- <span id="fixedtypeofperiodrate"></span> -->Rate<span id="slashspan">/</span><span id="typeofperiodrate"></span></th>
								   <th class="total_amt">Total&nbsp;(<span class="headamounttype rupyaINR WebRupee"></span>)</th>
								   <th class="last">Net&nbsp;Amount&nbsp;(<span class="headamounttype WebRupee rupyaINR"></span>)</th>
							   </tr>                                        
					   </table>
					</div>
					</div>
					<div class="clearWidth hidden" id="sub_total" style="margin: 10px 0;">
						<div class="clearTable rightElement MRGR5PX  sub_tot_div_view ">
							<div class="leftElement MRGL10PX BLDTEXT12PX">Sub Total</div>
							<div id="subtotalamount" class="rightElement BLDTEXT12PX"></div>
						</div>
					</div>
					<div class="clearWidth hidden " id="service_tax" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGR5PX  div_Width_view">
							<div class="leftElement BLDTEXT12PX" >Service Tax(<span id="serviceTaxPer"></span>%)</div>
							<div id="servicetax" class="rightElement BLDTEXT12PX"></div>
						</div>
					</div>
					
					<div id="totalamountunderline" class="clearWidth hidden  ">
						<div class="clearTable rightElement WDTH25PER underlinediv">
						</div>
					</div>
					<div class="clearWidth" id="total_amount" style="margin-bottom: 10px;">
						<div class="clearTable rightElement MRGR5PX tot_div_view">
							<div class="leftElement  BLDTEXT12PX">Total	</div>
							<div id="totalamount" class="rightElement BLDTEXT12PX">
							</div>
						</div>
					</div>
					<br/>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/invoice/viewinvoice" ><input type="button" value="Done" id="user" /></a>
				</div>
			</div> 
			<div id ="deletedsuccessful_fancybox" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id = "successful_msg_content"></div>
				<a href="<%=request.getContextPath() %>/invoice/viewinvoice" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
		</div>
		<div id="confirmMsgdate" class="hidden" >
			<h1><b class="saptaColor">Notification</b></h1>
			<div id="confirmationMsgContentDate" style= "margin-bottom: 6px;"></div>
			<!-- <input type="button" id="decline_no" class="rightElement graybtn" value="Done"> -->
			<input type="button" id="date_select" class="rightElement " value="Done" style = "margin-right: 7px;">&nbsp;
		</div>
		<%@include file="footer.jsp"%>
	</body>
	  <script>
	    var serviceTaxPercentage = 0;
		$(document).ready(function(){
			$("#pageTitle").html("Invoice<b class='saptaColor'> List</b>");
			$( "#invoicemonth" ).focus(function() {
				 if(!$("#ui-datepicker-div").hasClass("hide-calendar")){
					 $('#ui-datepicker-div').toggleClass('hide-calendar');
				 }
			});
			 
			 $( "#invoicedate" ).focus(function() {
				$("#ui-datepicker-div").removeClass("hide-calendar")
			 });
			 
			 $( "#receiveddate" ).focus(function() {
				$("#ui-datepicker-div").removeClass("hide-calendar")
			 });
			 
			 $( "#duedate" ).focus(function() {
				$("#ui-datepicker-div").removeClass("hide-calendar")
			 }); 

			$('#invoiceDataTable tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	 invoice(id);
		        }
		    });
			$("body").css("cursor", "default");
			$("#menu_payments").addClass("active");
			//$("#menu_paym").addClass("active");
			$(function() {
			 	$( "#duedate, #received_date, #receiveddate" ).datepicker({
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
					 onSelect: serviceTaxPercentage/* function(){
						 $(".perrateperiod").trigger("focusout");
					} */
				 });
			 });
			var url = "";
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
							
			$(function() {     
	            $( "#invoicemonth" ).datepicker({
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
			
			$("#invoicemonth").val("${fymonth}");
			var amount = 0;
			fymonthYear = monthConversion(fymonthYear);
			fymonthYear = fymonthYear.split('/').join('-');
			url = $("#contextpath").val()+"/invoice/getbymonth/"+fymonthYear;
			var resourceurl = $("#contextpath").val()+"/invoice/getbydateajax/"+fymonthYear;
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
							amount = parseInt(amount) + parseInt(result.receivedamount);
							amount = amount.toFixed(2);
						});
					}
		        },
		        error: function (xhr, ajaxOptions, thrownError) {
		   		}
		   });  
			$("#currenttotalamttd").html(amount);
			$("#invoiceList").removeClass("hidden");
			$("#norecords").addClass("hidden");
		}else {
				url = $("#contextpath").val()+"/invoice/getlist";
				$(function() {     
		            $( "#invoicemonth" ).datepicker({
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
			}
			var table = $("#invoiceDataTable").dataTable({
				"ajax":url,
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
		                .column( 2 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                },0 );
		            // Total over this page
		            pageTotal = api
		                .column( 2, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		            // Update footer
		            $( api.column( 2).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            		
		            );
		            pageTotal = pageTotal.toFixed(2);
		            $("#currenttotalamttd").html(numberWithCommas(pageTotal)); 
		        }, 
		        "aoColumns": [ 
                   {sClass: "alignleft"}, 
                   {sClass: "alignleft"},
                   {sClass: "alignright"}
                 ]
			});
			var invoiceSize = "${invoiceListSize}";
			if(invoiceSize != null && invoiceSize != 0){
				$("#invoiceList").addClass("hidden");
				$("#norecords").addClass("hidden");
				$("#headlist").removeClass("hidden");
			}else{
				$("#norecords").addClass("hidden");
				$("#invoiceList").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
				//$("#trdiv").addClass("hidden");
			} 
			
			function invoice(id){
				var projectid = "";
				$("#invoiceList").addClass("hidden");
				$("#invoicedetails").removeClass("hidden");
				$("#recieve").addClass("hidden");
				$("#totaldiv").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#pdf").removeClass("hidden");
				$("#totalhours").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#invoiceDataTable_wrapper").addClass("hidden");
				$(".ui-datepicker-trigger").addClass("hidden");
				
				var resourceURL = $("#contextpath").val()+"/invoice/getinvoicedetails/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								$(".total_amt").removeClass("hidden");
								$(".rate_td").removeClass("hidden");
								count=i+1;
								var invoicedynamic = $(document.createElement('tr')).attr({"id":'invoicecontenttablerow_' + count});
								if(result[i].noofdays != "null" && result[i].timeperiod == "null") {
									$("#totaldays").hide();
									$(".total_amt").show();
									invoicedynamic.html('<td><div style="margin: 0 auto;"><input name="reference_' + count +'" id="reference_' + count +'"  disabled="disabled" class="inputdisable" /></div></td><td><b class="datePicInput"><input name="service_from_' + count +'" id="service_from_' + count +'" readonly="readonly" type="text" style=" color: #777777;" class="datePcK datePicMob" /></b></td><td><b class="datePicInput"><input name="service_to_' + count +'" id="service_to_' + count +'" readonly="readonly" type="text" style="color: #777777;" class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "timeperiodtabledata"><div style=" margin: 0 auto;"><input name="time_period_' + count +'" id="time_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style="text-align: center;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="rate_td"><div style="margin: 0 auto;"><input name="rate_period_' + count +'" id="rate_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="rate_value"><div style="margin: 0 auto;"><input name="invoice_due_amount_' + count +'" id="invoice_due_amount_' + count +'"  disabled="disabled" class="inputdisable" style=" text-align: right;" /></div></td><td><div style="margin: 0 auto;"><input name="netamt_' + count +'" id="netamt_' + count +'"  disabled="disabled" class="inputdisable" style="text-align: right;"/></div><input name="invoice_details_id_' + count +'" class="hidden" id="invoice_details_id_' + count +'" type="text" /></td>');
								}
								if(result[i].noofdays == "null" && result[i].timeperiod != "null") {
									$("#totaldays").hide();
									$(".total_amt").hide();
									invoicedynamic.html('<td><div style="margin: 0 auto;"><input name="reference_' + count +'" id="reference_' + count +'"  disabled="disabled" class="inputdisable" /></div></td><td><b class="datePicInput"><input name="service_from_' + count +'" id="service_from_' + count +'" readonly="readonly" type="text" style=" color: #777777;" class="datePcK datePicMob" /></b></td><td><b class="datePicInput"><input name="service_to_' + count +'" id="service_to_' + count +'" readonly="readonly" type="text" style="color: #777777;" class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "timeperiodtabledata"><div style=" margin: 0 auto;"><input name="time_period_' + count +'" id="time_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style="text-align: center;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="rate_td"><div style="margin: 0 auto;"><input name="rate_period_' + count +'" id="rate_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="netamt_td"><div style="margin: 0 auto;"><input name="netamt_' + count +'" id="netamt_' + count +'"  disabled="disabled" class="inputdisable" style="text-align: right;"/></div><input name="invoice_details_id_' + count +'" class="hidden" id="invoice_details_id_' + count +'" type="text" /></td>');
								}
								if(result[i].noofdays != "null" && result[i].timeperiod != "null") {
									$(".total_amt").hide();
									$("#totaldays").show();
									invoicedynamic.html('<td><div style="margin: 0 auto;"><input name="reference_' + count +'" id="reference_' + count +'"  disabled="disabled" class="inputdisable" /></div></td><td><b class="datePicInput"><input name="service_from_' + count +'" id="service_from_' + count +'" readonly="readonly" type="text" style=" color: #777777;" class="datePcK datePicMob" /></b></td><td><b class="datePicInput"><input name="service_to_' + count +'" id="service_to_' + count +'" readonly="readonly" type="text" style="color: #777777;" class="datePcK datePicMob" style="float:left"/></b></div></td><td class = "totaldaysdata"><div style=" margin: 0 auto;"><input name="time_period_' + count +'" id="total_days_' + count +'"  disabled="disabled" class="inputdisable" style="text-align: center;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class = "timeperiodtabledata"><div style=" margin: 0 auto;"><input name="time_period_' + count +'" id="time_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style="text-align: center;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="rate_td"><div style="margin: 0 auto;"><input name="rate_period_' + count +'" id="rate_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style=" text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="margin: 0 auto;"><input name="netamt_' + count +'" id="netamt_' + count +'"  disabled="disabled" class="inputdisable" style="text-align: right;"/></div><input name="invoice_details_id_' + count +'" class="hidden" id="invoice_details_id_' + count +'" type="text" /></td>');
								}
								invoicedynamic.appendTo("#invoicetablecontent");
								$("#reference_"+count).val((result[i].reference == undefined || result[i].reference == null || result[i].reference == "null" || result[i].reference == 0 || result[i].reference.length <= 0) ? "-" : result[i].reference);
								$("#service_from_"+count).val((result[i].servicefrom == undefined || result[i].servicefrom == null || result[i].servicefrom == "null" || result[i].servicefrom == 0 || result[i].servicefrom.length <= 0) ? "-" : result[i].servicefrom);
								$("#optional_service_from_"+count).html((result[i].servicefrom == undefined || result[i].servicefrom == null || result[i].servicefrom == "null" || result[i].servicefrom == 0 || result[i].servicefrom.length <= 0) ? "-" : result[i].servicefrom);
								$("#service_to_"+count).val((result[i].serviceto == undefined || result[i].serviceto == null || result[i].serviceto == "null" || result[i].serviceto == 0 || result[i].serviceto.length <= 0) ? "-" : result[i].serviceto);
								$("#optional_service_to_"+count).html((result[i].serviceto == undefined || result[i].serviceto == null || result[i].serviceto == "null" || result[i].serviceto == 0 || result[i].serviceto.length <= 0) ? "-" : result[i].serviceto);
								$("#time_period_"+count).val((result[i].timeperiod == undefined || result[i].timeperiod == null || result[i].timeperiod == "null" || result[i].timeperiod == 0  || result[i].timeperiod.length <= 0) ? result[i].noofdays : result[i].timeperiod);
								$("#total_days_"+count).val((result[i].noofdays == undefined || result[i].noofdays == null || result[i].noofdays == "null" || result[i].noofdays == 0  || result[i].noofdays.length <= 0) ? "-" : result[i].noofdays);
								$("#rate_period_"+count).val((result[i].rateofperiod == undefined || result[i].rateofperiod == null || result[i].rateofperiod == "null" || result[i].rateofperiod == 0  || result[i].rateofperiod.length <= 0) ? "-" : result[i].rateofperiod);
								$("#invoice_details_id_"+count).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0  || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#invoice_due_amount_"+count).val((result[i].dueamount == undefined || result[i].dueamount == null || result[i].dueamount == "null" || result[i].dueamount == 0  || result[i].dueamount.length <= 0) ? "-" : result[i].dueamount);
								$("#netamt_"+count).val((result[i].dueamount == undefined || result[i].dueamount == null || result[i].dueamount == "null" || result[i].dueamount == 0  || result[i].dueamount.length <= 0) ? "-" : result[i].dueamount);
								if((result[i].timeperiod == undefined || result[i].timeperiod == null || result[i].timeperiod == "null" || result[i].timeperiod == 0  || result[i].timeperiod.length <= 0)){
									$(".total_amt").addClass("hidden");
									$(".total_amt").css("display",'none');
									$(".rate_td").addClass("hidden");
								}
								
								$(function() {
									 $( "#service_from_" + count + ", #service_to_" + count).datepicker({
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
								$(".ui-datepicker-trigger").addClass("hidden");
							}
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
				
				var resourceURL = $("#contextpath").val()+"/invoice/retrivebyid/"+id;
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
								projectid = result.projectid;
								$("#id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#invoiceno").val((result.invoiceno == undefined || result.invoiceno == null || result.invoiceno.length <= 0) ? "-" : result.invoiceno);
								$("#invoicedate").val((result.invoicedate == undefined || result.invoicedate == null || result.invoicedate.length <= 0) ? "-" : result.invoicedate);
								$("#optional_invoicedate").html((result.invoicedate == undefined || result.invoicedate == null || result.invoicedate.length <= 0) ? "-" : result.invoicedate);
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#optional_duedate").html((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : result.dueamount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "inr"){
									$("#optional_amounttype").html("INR");
									$(".headamounttype").html("&#x20B9;");
									$("#totalamount").removeClass("hidden");
									/*var subtotalamount = result.totalamount;  - result.servicetax; */
									$("#subtotalamount").html(result.totalamount);
									$("#sub_total").removeClass("hidden");
									$("#servicetax").html((result.servicetax == undefined || result.servicetax == null || result.servicetax.length <= 0) ? "-" : result.servicetax);
									$("#serviceTaxPer").html((result.servicetaxper == undefined || result.servicetaxper == null || result.servicetaxper.length <= 0) ? "-" : result.servicetaxper);
									$("#service_tax").removeClass("hidden");
									$("#totalamountunderline").removeClass("hidden");
									$(".headamounttype").addClass("WebRupee");
					 				$(".headamounttype").addClass("rupyaINR");
								}else if(result.amounttype == "usd"){
									$("#optional_amounttype").html("USD");
									$(".headamounttype").html("&#36;");
									$("#sub_total").removeClass("hidden");
									$("#subtotalamount").html(result.totalamount);
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").addClass("hidden");
									$(".headamounttype").removeClass("WebRupee");
					 				$(".headamounttype").removeClass("rupyaINR");
								}else if(result.amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
									$(".headamounttype").html("&#8364;");
									$("#sub_total").removeClass("hidden");
									$("#subtotalamount").html(result.totalamount);
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").addClass("hidden");
									$(".headamounttype").removeClass("WebRupee");
					 				$(".headamounttype").removeClass("rupyaINR");
								}else if(result.amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
									$(".headamounttype").html("&#163;");
									$("#subtotalamount").html(result.totalamount);
									$("#sub_total").removeClass("hidden");
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").addClass("hidden");
									$(".headamounttype").removeClass("WebRupee");
					 				$(".headamounttype").removeClass("rupyaINR");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								$("#typeofinvoice").val((result.invoicetype == undefined || result.invoicetype == null || result.invoicetype.length <= 0) ? "-" : result.invoicetype);
								$("#rate_header").removeClass("hidden");
								$(".rate_value").removeClass("hidden");
								$("#totalhours,.timeperiodtabledata").removeClass("hidden");
								if(result.invoicetype == "h"){
									$("#optional_typeofinvoice").html("Hourly");
									$("#typeofperiod").html("Hours");
									$("#typeofperiodrate").html("Hour");
									$("#slashspan,.netamt_td").removeClass("hidden");
								}else if(result.invoicetype == "d"){
									$("#optional_typeofinvoice").html("Daily");
									$("#typeofperiod").html("Days");
									$("#typeofperiodrate").html("Day");
									$("#slashspan,.netamt_td").removeClass("hidden");
									$("#totalhours,.timeperiodtabledata").addClass("hidden");
								}else if(result.invoicetype == "w"){
									$("#optional_typeofinvoice").html("Weekly");
									$("#typeofperiod").html("Weeks");
									$("#typeofperiodrate").html("Week");
									$("#slashspan,.netamt_td").removeClass("hidden");
								}else if(result.invoicetype == "m"){
									$("#optional_typeofinvoice").html("Monthly");
									$("#typeofperiod").html("Months");
									$("#typeofperiodrate").html("Month");
									$("#slashspan,.netamt_td").removeClass("hidden");
								}else if(result.invoicetype == "f"){
									$("#rate_header").addClass("hidden");
									$(".rate_value").addClass("hidden");
									$("#optional_typeofinvoice").html("Fixed");
									$("#typeofperiod").html("Days");
									$("#fixedtypeofperiodrate").html("Fixed");
									$("#slashspan").addClass("hidden");
									$(".netamt_td").addClass("hidden");
								}else if(result.invoicetype == undefined || result.invoicetype == null || result.invoicetype.length <= 0){
									$("#optional_typeofinvoice").html("-");
								}
								
								if(result.amounttype == "inr"){
									var totalamount = parseFloat(result.totalamount) + parseFloat(result.servicetax); 
								}else{
									var totalamount = parseFloat(result.totalamount); 
								}
								
								
								$("#totalamount").html((result.totalamount == undefined || result.totalamount == null || result.totalamount.length <= 0) ? "-" : totalamount.toFixed(2) );
								
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Pending");
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
									$("#recieve1").addClass("hidden");
									$("#recieve").addClass("hidden");
									$("#tablehead").addClass("hidden");
								}else if(result.status == "i"){
									$("#recieve").addClass("hidden");
									$("#tablehead").addClass("hidden");
									$("#recieve1").removeClass("hidden");
									$("#optional_status").html("Received");
									$("#receieveddate").val((result.received_date == undefined || result.received_date == null || result.received_date.length <= 0) ? "-" : result.received_date);
									var receievedamount = parseFloat(result.received_amount);
									$("#receievedamount").val((result.received_amount == undefined || result.received_amount == null || result.received_amount.length <= 0) ? "-" : receievedamount.toFixed(2));
									$("#receievedcomments").html((result.received_comments == undefined || result.received_comments == null || result.received_comments.length <= 0) ? "-" : result.received_comments);
									if(result.received_amounttype == "inr"){
										$("#receievedamounttype").val("INR");
									}else if(result.received_amounttype == "usd"){
										$("#receievedamounttype").val("USD");
									}else if(result.received_amounttype == "eur"){
										$("#receievedamounttype").val("EUR");
									}else if(result.received_amounttype == "gbp"){
										$("#receievedamounttype").val("GBP");
									}else if(result.received_amounttype == undefined || result.received_amounttype == null || result.received_amounttype.length <= 0){
										$("#receievedamounttype").val("-");
									}
									$("#invoicereceiveddetails").removeClass("hidden");
									
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
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
				
				var resourceURL = $("#contextpath").val()+"/invoice/retrivebyprojectid/"+projectid;
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
								if(result.customerid != undefined || result.customerid != null || result.customerid.length >= 0 ){
								<c:forEach items="${customerList}" var="custlist">
									if("${custlist.id}" == result.customerid){
										$("#customer_id").html("${custlist.name}")
									}
								</c:forEach>
								}
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
			
			$("#findByMonth").click(function() {
				if($("#invoicemonth").datepicker().val() == ""){
					 $("#confirmationMsgContentDate").html("Please select month...");
					$.fancybox.open('#confirmMsgdate');
				}else{
					$("#currenttotalamttd").html("");
					$("#totaldiv").addClass("hidden");
					var totalAmount = 0;
					url = "";
					var monthYear = null;
					$("#invoiceList").addClass("hidden");
					$("#invoicedetails").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					var month = $("#invoicemonth").datepicker().val();
					month =  monthConversion(month)
					month = month.split('/').join('-');
					url = $("#contextpath").val()+"/invoice/getbydateajax/"+month;
					if(url != null && url != ""){
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
								$.each(results, function (i, result) {
									totalAmount = parseInt(totalAmount) + parseInt(result.receivedamount);
									totalAmount = totalAmount.toFixed(2);
								});
								if(totalAmount != 0 && totalAmount != "" && totalAmount != undefined){
									$("#currenttotalamttd").html(totalAmount);
									$("#totaldiv").removeClass("hidden");
								}
								}
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					   		}
					   	});
					}
					var table = $('#invoiceDataTable').DataTable();
					table.destroy();
					var resourceURL = $("#contextpath").val()+"/invoice/getbymonth/"+month;
					$('#invoiceDataTable').dataTable({
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
				                .column( 2 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                },0 );
				            // Total over this page
				            pageTotal = api
				                .column( 2, { "filter" : "applied"} )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				            // Update footer
				            $( api.column(2).footer() ).html(
				            	 '$'+pageTotal +' ( $'+ total +' total)' 
				            );
				            $("#currenttotalamttd").html(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
				        },
				        "aoColumns": [ 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"},
	                      {sClass: "alignright"}
	                    ]
				    });
			  }
			});
			
			$("#pdf").click(function() {
				var invoicenum = $("#invoiceno").val();
				document.location.href =  $("#contextpath").val()+"/invoicepdf?invoicenum="+invoicenum;
			});
			
			
			
			
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#status").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				
				$("#typeofinvoice").removeClass("hidden");
				$("#optional_typeofinvoice").addClass("hidden");
				
				$("#pdf").addClass("hidden");
				
				$("#invoicedate_tabledata").removeClass("hidden");
				$("#invoicedate_tablediv").addClass("hidden");

				$("#duedate_tabledata").removeClass("hidden");
				$("#serviceto_tablediv").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$(".ui-datepicker-trigger").removeClass("hidden");
				
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				if($("#invoicedate").val() == "-"){
					$("#invoicedate").val("");
				}
				if($("#duedate").val() == "-"){
					$("#duedate").val("");
				}
				if($("#dueamount").val() == "-"){
					$("#dueamount").val("");
				}
				
				$("#amounttype").prop( "disabled", false );
				$("#typeofinvoice").prop( "disabled", false );
				$("#status").prop( "disabled", false );
				$("#invoicedate").prop( "disabled", false );
				$("#duedate").prop( "disabled", false );
				$("#dueamount").prop( "disabled", false );
				
				$("#invoicedate").removeClass("inputdisable");
				$("#duedate").removeClass("inputdisable");
				$("#status").removeClass("inputdisable");
				$("#amounttype").removeClass("inputdisable");
				$("#typeofinvoice").removeClass("inputdisable");
				
				$("#invoicedate").addClass("inputBorder");
				$("#duedate").addClass("inputBorder");
				
				
				 $('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						
						if($("#time_period_"+i).val() == "-"){
							$("#time_period_"+i).val("");
						}
						//if($("#typeofinvoice").val() != "f"){
						$("#time_period_"+i).prop( "disabled", false );
						$("#time_period_"+i).removeClass("inputdisable");
						$("#time_period_"+i).addClass("inputBorder");
						//}
						$("#reference_"+i).prop( "disabled", false );
						$("#rate_period_"+i).prop( "disabled", false );
						
						$("#reference_"+i).removeClass("inputdisable");
						$("#rate_period_"+i).removeClass("inputdisable");
						
						$("#reference_"+i).addClass("inputBorder");
						$("#rate_period_"+i).addClass("inputBorder");
				 });
				 
				$("body").css("cursor", "default");
			});
			
			$('#typeofinvoice').on('change', function (e){
			 	if($("#typeofinvoice").val() != ""){
			 		$("#rate_header").removeClass("hidden");
					$(".rate_value").removeClass("hidden");
					if($("#typeofinvoice").val() == "h"){
						$("#typeofperiod").html("Hours");
						$("#slashspan,.netamt_td").removeClass("hidden");
						$("#typeofperiodrate").html("Hour");
						$("#fixedtypeofperiodrate").html("");
						$("#totalhours").removeClass("hidden");
						$(".timeperiodtabledata").removeClass("hidden");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#time_period_"+i).val("");
							$("#rate_period_"+i).val("");
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
							$("#time_period_"+i).prop( "disabled", false );
							$("#time_period_"+i).removeClass("inputdisable");
							$("#time_period_"+i).addClass("inputBorder");
						});
						$("#servicetax").html("0.00");
						$("#subtotalamount").html("0.00");
						$("#totalamount").html("0.00");
					}
					if($("#typeofinvoice").val() == "d"){
						$("#typeofperiod").html("Days");
						$("#slashspan,.netamt_td").removeClass("hidden");
						$("#typeofperiodrate").html("Day");
						$("#fixedtypeofperiodrate").html("");
						$("#totalhours").removeClass("hidden");
						$(".timeperiodtabledata").removeClass("hidden");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#time_period_"+i).val("");
							$("#rate_period_"+i).val("");
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
							$("#time_period_"+i).prop( "disabled", false );
							$("#time_period_"+i).removeClass("inputdisable");
							$("#time_period_"+i).addClass("inputBorder");
						});
						$("#servicetax").html("0.00");
						$("#subtotalamount").html("0.00");
						$("#totalamount").html("0.00");
					}
					if($("#typeofinvoice").val() == "w"){
						$("#typeofperiod").html("Weeks");
						$("#slashspan,.netamt_td").removeClass("hidden");
						$("#typeofperiodrate").html("Week");
						$("#fixedtypeofperiodrate").html("");
						$("#totalhours").removeClass("hidden");
						$(".timeperiodtabledata").removeClass("hidden");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#time_period_"+i).val("");
							$("#rate_period_"+i).val("");
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
							$("#time_period_"+i).prop( "disabled", false );
							$("#time_period_"+i).removeClass("inputdisable");
							$("#time_period_"+i).addClass("inputBorder");
						});
						$("#servicetax").html("0.00");
						$("#subtotalamount").html("0.00");
						$("#totalamount").html("0.00");
					}
					if($("#typeofinvoice").val() == "m"){
						$("#typeofperiod").html("Months");
						$("#slashspan,.netamt_td").removeClass("hidden");
						$("#typeofperiodrate").html("Month");
						$("#fixedtypeofperiodrate").html("");
						$("#totalhours").removeClass("hidden");
						$(".timeperiodtabledata").removeClass("hidden");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#time_period_"+i).val("");
							$("#rate_period_"+i).val("");
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
							$("#time_period_"+i).prop( "disabled", false );
							$("#time_period_"+i).removeClass("inputdisable");
							$("#time_period_"+i).addClass("inputBorder");
						});
						$("#servicetax").html("0.00");
						$("#subtotalamount").html("0.00");
						$("#totalamount").html("0.00");
					}
					if($("#typeofinvoice").val() == "f"){
						$("#typeofperiodrate").html("");
						$("#rate_header,.netamt_td").addClass("hidden");
						$(".rate_value").addClass("hidden");
						$("#slashspan").addClass("hidden");
						$(".totalhrsrow").addClass("hidden");
						$("#fixedtypeofperiodrate").html("Fixed");
						$("#totalhours").removeClass("hidden");
						$(".timeperiodtabledata").removeClass("hidden");
						$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#time_period_"+i).val("");
							$("#rate_period_"+i).val("");
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
							/* $("#time_period_"+i).prop( "disabled", true );
							$("#time_period_"+i).addClass("inputdisable");
							$("#time_period_"+i).removeClass("inputBorder"); */
						});
						$("#servicetax").html("0.00");
						$("#subtotalamount").html("0.00");
						$("#totalamount").html("0.00");
					}
				 }
			});
			 $('#amounttype').on('change', function (e){
				 	if($("#amounttype").val() == "inr"){
				 		$(".headamounttype").html("&#x20B9;");
				 		var totalamount = $("#totalamount").html();
				 		var serviceTaxPer = $("#serviceTaxPer").html()
				 		$("#subtotalamount").html(totalamount);
				 		var servicetax = (parseFloat(totalamount) * parseFloat(serviceTaxPer))/100;
				 		
				 		var completetotalamount = parseFloat(totalamount) + parseFloat(servicetax.toFixed(2));
				 		$("#servicetax").html(servicetax.toFixed(2));
				 		$("#totalamount").html(completetotalamount.toFixed(2));
				 		$("#service_tax").removeClass("hidden");
				 		$("#sub_total").removeClass("hidden");
				 		$("#totalamountunderline").removeClass("hidden");
				 		$(".headamounttype").addClass("WebRupee");
				 		$(".headamounttype").addClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "usd"){
				 		var servicetax = 0;
				 		$(".headamounttype").html("&#36;");
				 		if($("#servicetax").html() != null && $("#servicetax").html() != ""){
				 			servicetax = $("#servicetax").html();
				 		}
				 		var totalamount = $("#totalamount").html();
				 		var total = parseFloat(totalamount) - parseFloat(servicetax);
				 		$("#service_tax").addClass("hidden");
				 		$("#subtotalamount").html(total.toFixed(2));
						$("#sub_total").removeClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#servicetax").html(0);
				 		$("#totalamount").html(total.toFixed(2));
				 		$(".headamounttype").removeClass("WebRupee");
				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "eur"){
				 		var servicetax = 0;
				 		$(".headamounttype").html("&#8364;");
				 		if($("#servicetax").html() != null && $("#servicetax").html() != ""){
				 			servicetax = $("#servicetax").html();
				 		}
				 		var totalamount = $("#totalamount").html();
				 		var total = parseFloat(totalamount) - parseFloat(servicetax);
				 		$("#service_tax").addClass("hidden");
				 		$("#subtotalamount").html(total.toFixed(2));
						$("#sub_total").removeClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#servicetax").html(0);
				 		$("#totalamount").html(total.toFixed(2));
				 		$(".headamounttype").removeClass("WebRupee");
				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
				 	if($("#amounttype").val() == "gbp"){
				 		var servicetax = 0;
				 		$(".headamounttype").html("&#163;");
				 		if($("#servicetax").html() != null && $("#servicetax").html() != ""){
				 			servicetax = $("#servicetax").html();
				 		}
				 		var totalamount = $("#totalamount").html();
				 		var total = parseFloat(totalamount) - parseFloat(servicetax);
				 		$("#service_tax").addClass("hidden");
				 		$("#subtotalamount").html(total.toFixed(2));
						$("#sub_total").removeClass("hidden");
				 		$("#totalamountunderline").addClass("hidden");
				 		$("#servicetax").html(0);
				 		$("#totalamount").html(total.toFixed(2));
				 		$(".headamounttype").removeClass("WebRupee");
				 		$(".headamounttype").removeClass("rupyaINR");
				 	}
			});
			
			$("#decline_yes").click(function() {
				$("#edit").removeClass("hidden");
				$(".ui-datepicker-trigger").addClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				
				$("#amounttype").addClass("hidden");
				$("#optional_amounttype").removeClass("hidden");
				
				$("#typeofinvoice").addClass("hidden");
				$("#optional_typeofinvoice").removeClass("hidden");
				$("#pdf").removeClass("hidden");
				$("#status").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					$("#reference_"+i).prop( "disabled", true );
					$("#time_period_"+i).prop( "disabled", true );
					$("#rate_period_"+i).prop( "disabled", true );
					$("#invoice_due_amount_"+i).prop( "disabled", true );
					$("#netamt_"+i).prop( "disabled", true );
					
					$("#reference_"+i).addClass("inputdisable");
					$("#service_from_"+i).addClass("inputdisable");
					$("#service_to_"+i).addClass("inputdisable");
					$("#time_period_"+i).addClass("inputdisable");
					$("#rate_period_"+i).addClass("inputdisable");
					$("#invoice_due_amount_"+i).addClass("inputdisable");
					$("#netamt_"+i).addClass("inputdisable");
					
					$("#reference_"+i).removeClass("inputBorder");
					$("#time_period_"+i).removeClass("inputBorder");
					$("#rate_period_"+i).removeClass("inputBorder");
					$("#invoice_due_amount_"+i).removeClass("inputBorder");
					$("#netamt_"+i).removeClass("inputBorder");
			 });
				
				declineInvoice();
				$("#invoicedate").prop( "disabled", true );
				$("#duedate").prop( "disabled", true );
				$("#dueamount").prop( "disabled", true );
				
				$("#invoicedate").removeClass("inputBorder");
				$("#duedate").removeClass("inputBorder");
				$("#dueamount").removeClass("inputBorder");
				
				$("#invoicedate").addClass("inputdisable");
				$("#duedate").addClass("inputdisable");
				$("#dueamount").addClass("inputdisable");
				$("#recieve").addClass("hidden");
				$("#tablehead").addClass("hidden");
				$.fancybox.close();
				$("#receiveddate").val('');
				$("#receivedamount").val('');
				$("#receivedcomments").val('');
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
			
			function declineInvoice(){
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					$("#invoicecontenttablerow_"+i).remove();
				});
				var id = $("#invoiceno").val();
				//var splitedinvoice = invoiceno.split('-');
				$("#totalhours").removeClass("hidden");
				var resourceURL = $("#contextpath").val()+"/invoice/getinvoicedetails/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								count=i+1;
								var invoicedynamic = $(document.createElement('tr')).attr({"id":'invoicecontenttablerow_' + count});
								invoicedynamic.html('<td><div style="width: 95%; margin: 0 auto;"><input name="reference_' + count +'" id="reference_' + count +'"  disabled="disabled" class="inputdisable" style="width: 110px;"/></div></td><td><div style="width: 95%; margin: 0 auto;"><b style="float:left"><input name="service_from_' + count +'" id="service_from_' + count +'" readonly="readonly" type="text" style="width: 215px; color: #777777;" class="datePcK" style="float:left"/></b></div></td><td><div style="width: 95%; margin: 0 auto;"><b style="float:left"><input name="service_to_' + count +'" id="service_to_' + count +'" readonly="readonly" type="text" style="width: 215px; color: #777777;" class="datePcK" style="float:left"/></b></div></td><td class = "timeperiodtabledata"><div style="width: 95%; margin: 0 auto;"><input name="time_period_' + count +'" id="time_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style="width: 75px; text-align: center;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td><div style="width: 95%; margin: 0 auto;"><input name="rate_period_' + count +'" id="rate_period_' + count +'"  disabled="disabled" class="inputdisable perrateperiod" style="width: 75px; text-align: right;" onkeypress="return validateNumericWithPrecision(event)"/></div></td><td class="rate_value"><div style="width: 100%; margin: 0 auto;"><input name="invoice_due_amount_' + count +'" id="invoice_due_amount_' + count +'"  disabled="disabled" class="inputdisable" style="width: 75px; text-align: right;" /></div></td><td><div style="width: 76%; margin: 0 auto;"><input name="netamt_' + count +'" id="netamt_' + count +'"  disabled="disabled" class="inputdisable" style="width: 119px; text-align: right;"/></div><input name="invoice_details_id_' + count +'" class="hidden" id="invoice_details_id_' + count +'" type="text" style="width: 100px;"/></td>');
								invoicedynamic.appendTo("#invoicetablecontent");
								$("#reference_"+count).val((result[i].reference == undefined || result[i].reference == null || result[i].reference == "null" || result[i].reference == 0 || result[i].reference.length <= 0) ? "-" : result[i].reference);
								$("#service_from_"+count).val((result[i].servicefrom == undefined || result[i].servicefrom == null || result[i].servicefrom == "null" || result[i].servicefrom == 0 || result[i].servicefrom.length <= 0) ? "-" : result[i].servicefrom);
								$("#optional_service_from_"+count).html((result[i].servicefrom == undefined || result[i].servicefrom == null || result[i].servicefrom == "null" || result[i].servicefrom == 0 || result[i].servicefrom.length <= 0) ? "-" : result[i].servicefrom);
								$("#service_to_"+count).val((result[i].serviceto == undefined || result[i].serviceto == null || result[i].serviceto == "null" || result[i].serviceto == 0 || result[i].serviceto.length <= 0) ? "-" : result[i].serviceto);
								$("#optional_service_to_"+count).html((result[i].serviceto == undefined || result[i].serviceto == null || result[i].serviceto == "null" || result[i].serviceto == 0 || result[i].serviceto.length <= 0) ? "-" : result[i].serviceto);
								$("#time_period_"+count).val((result[i].timeperiod == undefined || result[i].timeperiod == null || result[i].timeperiod == "null" || result[i].timeperiod == 0  || result[i].timeperiod.length <= 0) ? "-" : result[i].timeperiod);
								$("#rate_period_"+count).val((result[i].rateofperiod == undefined || result[i].rateofperiod == null || result[i].rateofperiod == "null" || result[i].rateofperiod == 0  || result[i].rateofperiod.length <= 0) ? "-" : result[i].rateofperiod);
								$("#invoice_details_id_"+count).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0  || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#invoice_due_amount_"+count).val((result[i].dueamount == undefined || result[i].dueamount == null || result[i].dueamount == "null" || result[i].dueamount == 0  || result[i].dueamount.length <= 0) ? "-" : result[i].dueamount);
								$("#netamt_"+count).val((result[i].dueamount == undefined || result[i].dueamount == null || result[i].dueamount == "null" || result[i].dueamount == 0  || result[i].dueamount.length <= 0) ? "-" : result[i].dueamount);
								
								$(function() {
									 $( "#service_from_" + count + ", #service_to_" + count).datepicker({
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
								$(".ui-datepicker-trigger").addClass("hidden");
							}
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
				
				var resourceURL = $("#contextpath").val()+"/invoice/retrivebyid/"+id;
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
								projectid = result.projectid;
								$("#id").val((result.id == undefined || result.id == null || result.id.length <= 0) ? "-" : result.id);
								$("#invoiceno").val((result.invoiceno == undefined || result.invoiceno == null || result.invoiceno.length <= 0) ? "-" : result.invoiceno);
								$("#invoicedate").val((result.invoicedate == undefined || result.invoicedate == null || result.invoicedate.length <= 0) ? "-" : result.invoicedate);
								$("#optional_invoicedate").html((result.invoicedate == undefined || result.invoicedate == null || result.invoicedate.length <= 0) ? "-" : result.invoicedate);
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#optional_duedate").html((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : result.dueamount);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "inr"){
									$("#optional_amounttype").html("INR");
									$(".headamounttype").html("&#x20B9;");
									$("#totalamount").removeClass("hidden");
									//var subtotalamount = result.totalamount - result.servicetax;
									$("#subtotalamount").html((result.totalamount));
									$("#sub_total").removeClass("hidden");
									$("#servicetax").html((result.servicetax == undefined || result.servicetax == null || result.servicetax.length <= 0) ? "-" : result.servicetax);
									$("#serviceTaxPer").html((result.servicetaxper == undefined || result.servicetaxper == null || result.servicetaxper.length <= 0) ? "-" : result.servicetaxper);
									$("#service_tax").removeClass("hidden");
									$("#totalamountunderline").removeClass("hidden");
								}else if(result.amounttype == "usd"){
									$("#optional_amounttype").html("USD");
									$(".headamounttype").html("&#36;");
									$("#subtotalamount").html(result.totalamount);
									$("#sub_total").removeClass("hidden");
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").removeClass("hidden");
								}else if(result.amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
									$(".headamounttype").html("&#8364;");
									$("#subtotalamount").html(result.totalamount);
									$("#sub_total").removeClass("hidden");
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").removeClass("hidden");
								}else if(result.amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
									$(".headamounttype").html("&#163;");
									$("#subtotalamount").html(result.totalamount);
									$("#sub_total").removeClass("hidden");
									$("#service_tax").addClass("hidden");
									$("#totalamountunderline").removeClass("hidden");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								$("#typeofinvoice").val((result.invoicetype == undefined || result.invoicetype == null || result.invoicetype.length <= 0) ? "-" : result.invoicetype);
								$("#rate_header").removeClass("hidden");
								$(".rate_value").removeClass("hidden");
								if(result.invoicetype == "h"){
									$("#optional_typeofinvoice").html("Hourly");
									$("#typeofperiod").html("Hours");
									$("#typeofperiodrate").html("Hour");
									$("#slashspan").removeClass("hidden");
								}else if(result.invoicetype == "d"){
									$("#optional_typeofinvoice").html("Daily");
									$("#typeofperiod").html("Days");
									$("#typeofperiodrate").html("Day");
									$("#slashspan").removeClass("hidden");
								}else if(result.invoicetype == "w"){
									$("#optional_typeofinvoice").html("Weekly");
									$("#typeofperiod").html("Weeks");
									$("#typeofperiodrate").html("Week");
									$("#slashspan").removeClass("hidden");
								}else if(result.invoicetype == "m"){
									$("#optional_typeofinvoice").html("Monthly");
									$("#typeofperiod").html("Months");
									$("#typeofperiodrate").html("Month");
									$("#slashspan").removeClass("hidden");
								}else if(result.invoicetype == "f"){
									$("#rate_header").addClass("hidden");
									$(".rate_value").addClass("hidden");
									$("#optional_typeofinvoice").html("Fixed");
									$("#typeofperiod").html("Days");
									$("#fixedtypeofperiodrate").html("Fixed");
									$("#slashspan").addClass("hidden");
								}else if(result.invoicetype == undefined || result.invoicetype == null || result.invoicetype.length <= 0){
									$("#optional_typeofinvoice").html("-");
								}
								
								if(result.amounttype == "inr"){
									var totalinramt = parseFloat(result.totalamount) + parseFloat(result.servicetax);
									$("#totalamount").html((result.totalamount == undefined || result.totalamount == null || result.totalamount.length <= 0) ? "-" : totalinramt.toFixed(2));
								}else{
									var totalamt = parseFloat(result.totalamount);
									$("#totalamount").html((result.totalamount == undefined || result.totalamount == null || result.totalamount.length <= 0) ? "-" : totalamt.toFixed(2));
								}
								
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Pending");
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
									$("#recieve1").addClass("hidden");
									$("#recieve").addClass("hidden");
									$("#tablehead").addClass("hidden");
								}else if(result.status == "i"){
									$("#recieve").addClass("hidden");
									$("#tablehead").addClass("hidden");
									$("#recieve1").removeClass("hidden");
									$("#optional_status").html("Received");
									$("#receieveddate").val((result.received_date == undefined || result.received_date == null || result.received_date.length <= 0) ? "-" : result.received_date);
									var receievedamount = parseFloat(result.received_amount);
									$("#receievedamount").val((result.received_amount == undefined || result.received_amount == null || result.received_amount.length <= 0) ? "-" : receievedamount.toFixed(2));
									$("#receievedcomments").html((result.received_comments == undefined || result.received_comments == null || result.received_comments.length <= 0) ? "-" : result.received_comments);
									if(result.received_amounttype == "inr"){
										$("#receievedamounttype").val("INR");
									}else if(result.received_amounttype == "usd"){
										$("#receievedamounttype").val("USD");
									}else if(result.received_amounttype == "eur"){
										$("#receievedamounttype").val("EUR");
									}else if(result.received_amounttype == "gbp"){
										$("#receievedamounttype").val("GBP");
									}else if(result.received_amounttype == undefined || result.received_amounttype == null || result.received_amounttype.length <= 0){
										$("#receievedamounttype").val("-");
									}
									$("#invoicereceiveddetails").removeClass("hidden");
									
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
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
				$("body").css("cursor", "default");
				var validation = true;
				var id = $("#id").val();
				var invoiceno = $("#invoiceno").val();
				var invoicedate = $("#invoicedate").datepicker().val();
				var duedate = $("#duedate").datepicker().val();
				var invoicetype = $("#typeofinvoice").val();
				if($("#amounttype").val() == "inr"){
					var totalamount = $("#totalamount").html() - $("#servicetax").html() ;
				}else{
					var totalamount = $("#totalamount").html()  ;
				}
				var amounttype = $("#amounttype").val();
				var status = $("#status").val();
				var servicetax = 0;
				var servicetaxper = 0;

				if($("#amounttype").val() == "inr"){
					servicetax = $("#servicetax").html();
					servicetaxper = $("#serviceTaxPer").html();
				}
				var customerid = "";
				<c:forEach items="${customerList}" var="customerlist">
				if("${customerlist.name}" == $("#customer_id").html()){
					customerid = "${customerlist.id}";
				}
		        </c:forEach>
				var projectid = "";
				<c:forEach items="${projectList}" var="projectlist">
				if("${projectlist.dispname}" == $("#pid").html()){
					projectid = "${projectlist.id}";
				}
		        </c:forEach>
		        
				//var splitedinvoice = invoiceno.split('-');
				if(invoiceno == "" || invoiceno.length == 0) validation = false;
				if(invoicedate == "" || invoicedate.length == 0) validation = false;
				if(duedate == "" || duedate.length == 0) validation = false;
				if(amounttype == "" || amounttype.length == 0) validation = false;
				if(invoicetype == "" || invoicetype.length == 0) validation = false;
				if(totalamount == "" || totalamount.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				var invoicedatevalidation = $.datepicker.parseDate('dd-mm-yy',invoicedate); 
				var duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
				if ((invoicedatevalidation) > (duedatevalidation))  validation = false; 
				var received_date = $("#receiveddate").datepicker().val();
				var received_amount = $("#receivedamount").val();
				var received_amounttype = $("#receivedamounttype").val();
				var received_comments = $("#receivedcomments").val();
				if(status == "i"){
					if(received_date == "" || received_date.length == 0) validation = false;
					if(received_amount == "" || received_amount.length == 0) validation = false;
					if(received_amounttype == "" || received_amounttype.length == 0) validation = false;
					if(received_comments == "" || received_comments.length == 0) validation = false;
				}else{
					received_date = "null";
					received_amount = 0;
					received_amounttype = "null";
					received_comments = "null";
				}
				
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					if(status == "" || status.length == 0) validation = false;
					
					var invoiceno = $("#invoiceno").val();
					var reference = $("#reference_"+i).val();
					var servicefrom = $("#service_from_"+i).val();
					var serviceto = $("#service_to_"+i).val();
					var timeperiod = $("#time_period_"+i).val();
					var rateperiod = $("#rate_period_"+i).val();
					var dueamount = $("#netamt_"+i).val();
					if(reference == "" || reference.length == 0) validation = false;
					if(servicefrom == "" || servicefrom.length == 0) validation = false;
					if(serviceto == "" || serviceto.length == 0) validation = false;
					//if($("#typeofinvoice").val() != "f"){
					if(timeperiod == "" || timeperiod.length == 0) validation = false;
					//}
					if(rateperiod == "" || rateperiod.length == 0) validation = false;
					if(dueamount == "" || dueamount.length == 0) validation = false;
					
					var servicefromvalidation = $.datepicker.parseDate('dd-mm-yy',servicefrom); 
					var servicetovalidation = $.datepicker.parseDate('dd-mm-yy',serviceto);
					if ((servicefromvalidation) > (servicetovalidation))  validation = false;
				});	
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(amounttype == "" || amounttype.length == 0) amounttype = "null";
					var resourceURL = $("#contextpath").val()+"/invoice/update/"+id+"/"+invoiceno+"/"+invoicedate+"/"+duedate+"/"+totalamount+"/"+servicetax+"/"+projectid+"/"+customerid+"/"+servicetaxper+"/"+amounttype+"/"+invoicetype+"/"+status+"/"+received_date+"/"+received_amount+"/"+received_amounttype+"/"+received_comments;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						async: false,
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								$("#pdf").removeClass("hidden");
								if(status == "a"){
									$("#optional_status").html("Pending");
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
									$("#recieve").addClass("hidden");
									$("#tablehead").addClass("hidden");
								}else if(status == "i"){
									$("#optional_status").html("Received");
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
									$("#recieve").addClass("hidden");
									$("#recieve1").removeClass("hidden");
									$("#tablehead").addClass("hidden");
									$("#invoicereceiveddetails").removeClass("hidden");
									$("#receieveddate").val(received_date);
									var receievedamount = 0;
									receievedamount = parseFloat(received_amount);
									receievedamount = receievedamount.toFixed(2);
									$("#receievedamount").val(receievedamount);
									if(received_amounttype = "inr"){
										$("#receievedamounttype").val("INR");
									} else if(received_amounttype = "usd"){
										$("#receievedamounttype").val("USD");
									} else if(received_amounttype = "eur"){
										$("#receievedamounttype").val("EUR");
									} else if(received_amounttype = "gbp"){
										$("#receievedamounttype").val("GBP");
									}
									$("#receievedcomments").html(received_comments);
								}
								$(".ui-datepicker-trigger").addClass("hidden");
								if(amounttype == "inr"){
									$("#optional_amounttype").html("INR");
								}else if(amounttype == "usd"){
									$("#optional_amounttype").html("USD");
								}else if(amounttype == "eur"){
									$("#optional_amounttype").html("EUR");
								}else if(amounttype == "gbp"){
									$("#optional_amounttype").html("GBP");
								}
								
								
								if(invoicetype == "h"){
									$("#optional_typeofinvoice").html("Hourly");
								}else if(invoicetype == "d"){
									$("#optional_typeofinvoice").html("Daily");
								}else if(invoicetype == "w"){
									$("#optional_typeofinvoice").html("Weekly");
								}else if(invoicetype == "m"){
									$("#optional_typeofinvoice").html("Monthly");
								}else if(invoicetype == "f"){
									$("#optional_typeofinvoice").html("Fixed");
								}
								
								if($("#invoiceno").val() == "" || $("#invoiceno").val() == "-"){
									$("#invoiceno").val("-");
								} 
								 if($("#invoicedate").val() == "" || $("#invoicedate").val() == "-"){
									$("#optional_invoicedate").val("-");
								} else{
									$("#optional_invoicedate").html(invoicedate);
								} 
								if($("#duedate").val() == "" || $("#duedate").val() == "-"){
									$("#optional_duedate").html("-");
								}else{
									$("#optional_duedate").html(duedate);
								}
								
								$("#invoicedate_tabledata").addClass("hidden");
								$("#invoicedate_tablediv").removeClass("hidden");
								
								if($("#receiveddate").val() == "" || $("#receiveddate").val() == "-"){
									$("#optional_received_date").html("-");
								}else{
									$("#optional_received_date").html(received_date);
								}
								
								if(received_amounttype == "inr"){
									$("#optional_received_amounttype").html("INR");
								}else if(received_amounttype == "usd"){
									$("#optional_received_amounttype").html("USD");
								}else if(received_amounttype == "eur"){
									$("#optional_received_amounttype").html("EUR");
								}else if(received_amounttype == "gbp"){
									$("#optional_received_amounttype").html("GBP");
								}
								if($("#received_amount").val() == "" || $("#received_amount").val() == "-"){
									$("#received_amount").val(received_amount);
								}
								if($("#received_comments").val() == "" || $("#received_comments").val() == "-"){
									$("#received_comments").val(received_comments);
								}
								
								$("#receiveddate").val("");
								$("#receivedamount").val("");
								$("#receivedamounttype").val("");
								$("#receivedcomments").val("");
								
								$("#duedate_tabledata").addClass("hidden");
								$("#serviceto_tablediv").removeClass("hidden");
								
								if($("#dueamount").val() == "" || $("#dueamount").val() == "-"){
									$("#dueamount").val("-");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								$("#typeofinvoice").addClass("hidden");
								$("#optional_typeofinvoice").removeClass("hidden");
								
								
								$("#status").addClass("hidden");
								if(status == "i"){
									$("#optional_status").html("Received");
									var amt = $("#currenttotalamttd").html();
									var completetotalamount = parseInt(amt) + parseInt(totalamount);
									$("#currenttotalamttd").html(completetotalamount);
									$("#received_date_tabledata").addClass("hidden");
									$("#received_date_tablediv").removeClass("hidden");
									
									$("#receivedamounttype").removeClass("hidden");
									$("#optional_received_amounttype").removeClass("hidden");
								}else if(status == "a"){
									$("#optional_status").html("Pending");
								}
								$("#optional_status").removeClass("hidden");
								
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								$("#id").prop( "disabled", true );
								$("#invoiceno").prop( "disabled", true );
								$("#invoicedate").prop( "disabled", true );
								$("#duedate").prop( "disabled", true );
								$("#amounttype").prop( "disabled", true );
								$("#typeofinvoice").prop( "disabled", true );
								$("#status").prop( "disabled", true );
								//$("#pid").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#invoiceno").removeClass("inputBorder");
								$("#invoicedate").removeClass("inputBorder");
								$("#duedate").removeClass("inputBorder");
								$("#amounttype").removeClass("inputBorder");
								$("#typeofinvoice").removeClass("inputBorder");
								$("#status").removeClass("inputBorder");
								//$("#pid").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#invoiceno").addClass("inputdisable");
								$("#invoicedate").addClass("inputdisable");
								$("#duedate").addClass("inputdisable");
								$("#amounttype").addClass("inputdisable");
								$("#typeofinvoice").addClass("inputdisable");
								$("#status").addClass("inputdisable");
								
								$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
									var id = $(this).attr("id");
									var i = id.substring(23, id.length);
									$("#reference_"+i).prop( "disabled", true );
									$("#time_period_"+i).prop( "disabled", true );
									$("#rate_period_"+i).prop( "disabled", true );
									$("#invoice_due_amount_"+i).prop( "disabled", true );
									$("#netamt_"+i).prop( "disabled", true );
									
									$("#reference_"+i).addClass("inputdisable");
									$("#time_period_"+i).addClass("inputdisable");
									$("#rate_period_"+i).addClass("inputdisable");
									$("#invoice_due_amount_"+i).addClass("inputdisable");
									$("#netamt_"+i).addClass("inputdisable");
									
									$("#reference_"+i).removeClass("inputBorder");
									$("#time_period_"+i).removeClass("inputBorder");
									$("#rate_period_"+i).removeClass("inputBorder");
									$("#invoice_due_amount_"+i).removeClass("inputBorder");
									$("#netamt_"+i).removeClass("inputBorder");
							 });
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
					updateinvoiceDetails();
				}	
				
			});
			
			function updateinvoiceDetails(){
				$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(23, id.length);
					var timeperiod = 0;
					var id = $("#invoice_details_id_"+i).val();
					var invoiceno = $("#invoiceno").val();
					var reference = $("#reference_"+i).val();
					var servicefrom = $("#service_from_"+i).val();
					var serviceto = $("#service_to_"+i).val();
					//if($("#typeofinvoice").val() != "f"){
						timeperiod = $("#time_period_"+i).val();
					//}
					var rateperiod = $("#rate_period_"+i).val();
					var dueamount = $("#netamt_"+i).val();
					
					var resourceURL = $("#contextpath").val()+"/invoice/updateinvoicedetails/"+id+"/"+invoiceno+"/"+reference+"/"+servicefrom+"/"+serviceto+"/"+timeperiod+"/"+rateperiod+"/"+dueamount;
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
								//clear Variables As Null
								reference = null;
								servicefrom = null;
								serviceto = null;
								totalhrs = null;
								rateperhr = null;
								dueamount = null;
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
				$("#alertMsgContent").html("Invoice Details Updated successfully ...");
				$.fancybox.open('#alertMsg');
			 });
			}
			$('#decline').click(function() {
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$('#decline_no').click(function() {
				$.fancybox.close();
			});
			
			$("#delete").click(function(){
				$("#confirmationMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#confirmMsg');
			});
			
			$("#delete_yes").click(function(){
				$("body").css("cursor", "progress");
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/invoice/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
								$("#successful_msg_content").html("Invoice deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
								//invoiceDeleteReloader();
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
			
			$('#status').on('change', function (e){
				if($("#status").val() == "a"){
					$("#recieve").addClass("hidden");
					$("#tablehead").addClass("hidden");
				}else if($("#status").val() == "i"){
					$("#recieve").removeClass("hidden");
					$("#tablehead").removeClass("hidden");
				}
			});
			
			$("#invocno").click(function() {
				$("body").css("cursor", "progress");
				var resourceURL = $("#contextpath").val()+"/invoice/viewinvoice/"+$("#invocno").val();
				$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
				
			function invoiceDeleteReloader(){
				var resourceURL = $("#contextpath").val()+"/invoice/getlist";
				$("#invoicegridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#invoicegridtable").trigger("reloadGrid");
				$("#invoiceList").removeClass("hidden");
				$("#invoicesearch").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#invoice").addClass("hidden");
			}
			$("#findByInvocNo").click(function() {
				$("body").css("cursor", "progress");
				
				$("#invoiceList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findbyinvocno();
				
				$("body").css("cursor", "default");
			});
			
			$('#invocno').keypress(function(event){
				$("body").css("cursor", "progress");
				if(event.keyCode == 13) {
					$("#invoiceList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbyinvocno();
				} 
				$("body").css("cursor", "default");
			});
			
			$("#show_showinvoiceList").click(function(){
				$("body").css("cursor", "progress");
				var amount = 0;
				var table = $('#invoiceDataTable').DataTable();
				table.destroy();
				var resourceURL = "";
				var url = "";
				$(".ui-datepicker-trigger").removeClass("hidden");
				if($("#invoicemonth").datepicker().val() != ""){
					var month = $("#invoicemonth").datepicker().val();
					month =  monthConversion(month)
					month = month.split('/').join('-');
					resourceURL = $("#contextpath").val()+"/invoice/getbymonth/"+month;
					url = $("#contextpath").val()+"/invoice/getbydateajax/"+month;
				}else{
					resourceURL = $("#contextpath").val()+"/invoice/getlist";
					url = $("#contextpath").val()+"/invoice/gettotalamount";
				}
				if(resourceURL != null && resourceURL != ""){
					$('#invoiceDataTable').dataTable({
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
				                .column( 2 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                },0 );
				            // Total over this page
				            pageTotal = api
				                .column( 2, { "filter" : "applied"} )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				            // Update footer
				            $( api.column(2).footer() ).html(
				            	 '$'+pageTotal +' ( $'+ total +' total)' 
				            );
				            $("#currenttotalamttd").html(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
				        }, 
				        "aoColumns": [ 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"},
	                      {sClass: "alignright"}
	                    ]
				    });
					$('[id^="invoicecontenttablerow_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(23, id.length);
						$("#invoicecontenttablerow_" + i).remove();
					 });
					$("#headlist").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#invoicereceiveddetails").addClass("hidden");
					$("#invoicedetails").addClass("hidden");
					$("#updatebutton").addClass("hidden");
					$("#id").prop( "disabled", true );
					$("#invoiceno").prop( "disabled", true );
					$("#invoicedate").prop( "disabled", true );
					$("#duedate").prop( "disabled", true );
					$("#amounttype").prop( "disabled", true );
					$("#typeofinvoice").prop( "disabled", true );
					$("#status").prop( "disabled", true );
					$("#optional_received_amounttype").html("");
					
					$("#id").removeClass("inputBorder");
					$("#invoiceno").removeClass("inputBorder");
					$("#invoicedate").removeClass("inputBorder");
					$("#duedate").removeClass("inputBorder");
					$("#amounttype").removeClass("inputBorder");
					$("#typeofinvoice").removeClass("inputBorder");
					$("#status").removeClass("inputBorder");
					
					$("#id").addClass("inputdisable");
					$("#invoiceno").addClass("inputdisable");
					$("#invoicedate").addClass("inputdisable");
					$("#duedate").addClass("inputdisable");
					$("#amounttype").addClass("inputdisable");
					$("#typeofinvoice").addClass("inputdisable");
					$("#status").addClass("inputdisable");
					
					$("#invoicedate_tabledata").addClass("hidden");
					$("#invoicedate_tablediv").removeClass("hidden");
					
					$("#duedate_tabledata").addClass("hidden");
					$("#serviceto_tablediv").removeClass("hidden");
					
					$("#status").addClass("hidden");
					$("#optional_status").removeClass("hidden");
					
					$("#amounttype").addClass("hidden");
					$("#optional_amounttype").removeClass("hidden");
					
					$("#typeofinvoice").addClass("hidden");
					$("#optional_typeofinvoice").removeClass("hidden");
					$("#optiondiv").removeClass("hidden");
					
					if($("#typeofinvoice").val() != "f"){
						$("#rate_header").removeClass("hidden");
						$(".rate_value").removeClass("hidden");
					}else{
						$("#rate_header").addClass("hidden");
						$(".rate_value").addClass("hidden");
					}
					
					
				}
				if(url != null && url != ""){
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
							$.each(results, function (i, result) {
								amount = parseFloat(amount) + parseFloat(result.received_amount);
								/* if(result.received_amount > 0 || result.received_amount != "" ){
									amount = parseFloat(amount) + parseFloat(result.received_amount);
								}else{
									amount = parseFloat(amount) + parseFloat(result.received_amount);
								} */
							});
								$("#currenttotalamttd").html(numberWithCommas(amount.toFixed(2)));
								$("#totaldiv").removeClass("hidden");
							}
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				   		}
				   	});
				}
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
		}).on('focusout', '.perrateperiod', function() {
			var id = $(this).attr("id");
			var i = id.substring(12, id.length);
			var invoicetypestatus = $("#typeofinvoice").val();
			var servicetaxper = $("#serviceTaxPer").html();
			//service tax effective date calculation STARTS
			var invoiceDate = $("#invoicedate").val().split("-");
			invoiceDate = invoiceDate[2]+"-"+invoiceDate[1]+"-"+invoiceDate[0];
			var invDate = new Date(invoiceDate);
			var june2016 = new Date("Jun 01 2016");
			if(invDate >= june2016){
				serviceTaxPercentage = 15;
				servicetaxper = serviceTaxPercentage;
			}else{
				serviceTaxPercentage = 14.5;
				servicetaxper = serviceTaxPercentage;
			}
			//service tax effective date percentage calculation ENDS
			if(invoicetypestatus != "f"){
				var totalperiod = $("#time_period_"+i).val();
				var periodperrate = $("#rate_period_"+i).val();
				if(totalperiod != "" && periodperrate != ""){
					totalamount = parseFloat(totalperiod) * parseFloat(periodperrate);
					var completetotalamount = totalamount.toFixed(2);
					$("#invoice_due_amount_"+i).val(completetotalamount);
					$("#netamt_"+i).val(completetotalamount);
					var lastTotal = 0;
					var netamount = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat(netamount);
							var completeLastTotal1 = lastTotal;
							if($("#amounttype").val() == "inr"){
								var servicetax = (parseFloat(completeLastTotal1)*parseFloat(servicetaxper))/100;
								$("#servicetax").html(servicetax.toFixed(2));
								
								completeLastTotal = parseFloat(completeLastTotal1) + parseFloat(servicetax);
								$("#subtotalamount").html(parseFloat(completeLastTotal1).toFixed(2));
								$("#totalamount").html(completeLastTotal.toFixed(2));
							}else{
								$("#subtotalamount").html(parseFloat(completeLastTotal1).toFixed(2));
								$("#totalamount").html(completeLastTotal.toFixed(2));
							}
						}
						
					});
				}else{
					var netamount = 0;
			    	var totalamount = 0;
			    	var completeLastTotal = 0;
			    	netamount = $("#netamt_"+i).val();
			    	if(netamount != "" && netamount != 0 && netamount != null){
			    		totalamount = $("#subtotalamount").html();
				    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
				    	if($("#amounttype").val() == "inr"){
							var servicetax = (parseFloat(lasttotal)*parseFloat(servicetaxper))/100;
							$("#servicetax").html(servicetax.toFixed(2));
							$("#subtotalamount").html(lasttotal.toFixed(2));
							var completeLastTotal = parseFloat(completeLastTotal) + parseFloat(servicetax);
							$("#totalamount").html(completeLastTotal.toFixed(2));
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
						}else{
							var netamount = 0;
			    			var totalamount = 0;
			    			netamount = $("#netamt_"+i).val();
			    			totalamount = $("#totalamount").html();
			    			$("#subtotalamount").html(lasttotal.toFixed(2));
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#totalamount").html(lasttotal.toFixed(2));
			    			$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
						}
			    	}
				}
			}
			if(invoicetypestatus == "f"){
				if($("#rate_period_"+i).val() != ""){
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						var periodperrate = $("#rate_period_"+i).val();
						if(periodperrate != ""){
							totalamount = parseFloat(periodperrate);
							var completetotalamount = totalamount.toFixed(2);
							$("#invoice_due_amount_"+i).val(completetotalamount);
							$("#netamt_"+i).val(completetotalamount);
						}
					});
					var lastTotal = 0;
					$('[id^="netamt_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(7, id.length);
						var netamount = 0;
						netamount = $("#netamt_"+i).val();
						if(netamount != "" && netamount != null && netamount != 0){
							lastTotal = parseFloat(lastTotal) + parseFloat($("#netamt_"+i).val());
							var completeLastTotal = lastTotal.toFixed(2);
							if($("#amounttype").val() == "inr"){
								var servicetax = (parseFloat(completeLastTotal)*parseFloat(servicetaxper))/100;
								$("#servicetax").html(servicetax.toFixed(2));
								$("#subtotalamount").html(completeLastTotal);
								completeLastTotal = parseFloat(completeLastTotal) + parseFloat(servicetax);
								$("#totalamount").html(parseFloat(completeLastTotal).toFixed(2));
							}else{
								$("#subtotalamount").html(completeLastTotal);
								$("#totalamount").html(parseFloat(completeLastTotal).toFixed(2));
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
			    			totalamount = $("#subtotalamount").html();
			    			var servicetax = 0;
					    	var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
					    	servicetax = (lasttotal*parseFloat(servicetaxper))/100;
					    	var totalamount = lasttotal + servicetax;
							$("#subtotalamount").html(lasttotal.toFixed(2));
							$("#servicetax").html(servicetax.toFixed(2));
							$("#totalamount").html(totalamount.toFixed(2));
							$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
			    		}else{
			    			var totalamount = 0;
			    			totalamount = $("#totalamount").html();
			    			var lasttotal = parseFloat(totalamount) - parseFloat(netamount);
			    			$("#subtotalamount").html(lasttotal.toFixed(2));
			    			$("#totalamount").html(lasttotal.toFixed(2));
			    			$("#invoice_due_amount_"+i).val("");
							$("#netamt_"+i).val("");
			    		}
			    		
			    	}
				}
			}
	    });;
		
		$("#date_select").click(function(){
			 $.fancybox.close();
		 }); 
	</script>
</html>
