<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
	</head>
	<body>
		<!--Header Start-->
	     <%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
			<div id="contentArea">
				<div id = "optiondiv" style="width: 100%;">
					<table  align ="center" class="optionTable">
						<tr>
							<td align="right" >Choose&nbsp;Month&nbsp;:</td>
							<td align="left" colspan = "2" class="classMob"  style="padding-left:10px;" >
								<b style="float:left;" class="WDT90PX"><input name="billmonth" id="billmonth" type="text" class="WDT67PX datePcKview" readonly="readonly"/></b>
								<input type="button" value="Find" id="findByMonth" style="float:left; margin-top: 5px;"/>
							</td>
						</tr>
						<tr>
							<td class="currenttotalamtrupyatd1 mobMART0PX" align="right">Bill&nbsp;Amount&nbsp;:</td>
							<!-- <td class="currenttotalamtrupyatd" style="margin-left: auto" class="rupyaINR WebRupee">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style=" margin-left: auto"></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px; font-weight:bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight:bold;width: 109px;" /></td>
						</tr>
					</table>
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
			<!-- 	<div id="totaldiv" align ="center">
					<table id="totalcount" align ="center">
						<tr>
							<td class="currenttotalamtrupyatd1" align="right">Bill&nbsp;Amount&nbsp;:</td>
							<td class="currenttotalamtrupyatd" style="margin-left: auto" class="rupyaINR WebRupee">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style=" margin-left: auto"></td>
						</tr>
					</table>
				</div> -->
				<div class="responsive">
					<table class="data display" id="billDataTable" cellspacing="0">
						<thead>
							<tr>
								<th class="first">Bill&nbsp;Id</th>
								<th class="">Bill&nbsp;No</th>
								<th class="">Amount&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
								<th class="">Due&nbsp;Date</th>
								<th class="">Comments</th>
								<th class="">Status</th>
							
							</tr>	
						</thead>				
						<tbody></tbody>
					</table>
				</div>
				<div id="norecords" class="hidden MRGT10PX"><h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1></div> 
				<div id="billsdetails" class="hidden MRGT10PX">
					<div align="left" id="back_billsList" class=""><a href="#" id="show_showbillsList">Bills List </a>/ Bill</div><br/>
					<c:choose>
						<c:when test="${ session.groupname == 'ad' || session.groupname == 'fi'}">
							<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
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
							<td class="lableContent"> Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Bill No</td>
							<td class="value"><input id="billno" disabled="disabled" class="inputdisabletxtbold" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Vendor Name</td>
							<td class="value"><a href="#" id="show_vendor"><div id="vid"></div></a></td>
						</tr>
						<tr>
							<td class="lableContent">Bill Date</td>
							<td class="value"><input id="billdate" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr>
							<td class="lableContent">Due Date</td>
							<td id="duedate_tabledata" class="value hidden">
								<b style="float:left; height: 20px;"><input id="duedate" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 10px;"></b>
							</td>
							<td id="duedate_tablediv" class="value"><div id="optional_duedate"></div></td>
						</tr>
						<tr>
							<td class="lableContent">Amount</td>
							<td class="value"><input id="dueamount" disabled="disabled" class="inputdisable" onkeypress="return validateNumericWithPrecision(event)"></td>
						</tr>
						<tr>
							<td class="lableContentSelect">Amount Type</td>
							<td class="valueContent">
							<select id="amounttype" class="selectBox hidden" style="margin:0px;text-align: center;" class="inputdisable">
									<option value="" style="text-align: center;">--- Select ---</option>
									<option value="i" style="text-align: left;">INR</option>
									<option value="u" style="text-align: left;">USD</option>
									<option value="e" style="text-align: left;">EUR</option>
									<option value="g" style="text-align: left;">GBP</option>
							</select>
							<div id="optional_amounttype" class="value"></div>
						</tr>
						<tr class="">
							<td class="lableContentSelect">Status</td>
							<td class="valueContent">	
								<select id="status" class="selectBox hidden" style="margin:0px; text-align: center;" class="inputdisable">
									<option value="" style="text-align: center;">--- Select ---</option>
									<option value="a" style="text-align: left;">Pending</option>
									<option value="i" style="text-align: left;">Paid</option>
								</select>
								<div id="optional_status" class="value"></div>
							</td>
						</tr>
						<tr id="paidOn_tabledata_tr">
							<td class="lableContent">Paid On</td>
							<td id="paidOn_tabledata" class="value hidden">
								<b style="float:left; height: 20px;"><input id="paidOn" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" style="margin: 10px;"></b>
							</td>
							<td id="paidOn_tablediv" class="value"><div id="optional_paidOn"></div></td>
						</tr>
						<tr class="">
							<td class="lableContent">Comments</td>
							<td class="value"><input id="comments" disabled="disabled" class="inputdisable"></td>
						</tr>
					</table>
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
			<div id ="deletedsuccessful_fancybox" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id = "successful_msg_content"></div>
				<a href="<%=request.getContextPath() %>/bills/viewbills" style="text-decoration: none">
				<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
			</div>
			<div id="userMsg" class="hidden">
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="userMsgContent"></div>
				<div class="clearWidth MRGT10PX">
					<a href="<%=request.getContextPath() %>/bills/viewbills" ><input type="button" value="Done" id="user" /></a>
				</div>
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
		$(document).ready(function(){
			$("#pageTitle").html("Bill<b class='saptaColor'> List</b>");
			$("body").css("cursor", "default");
			$("#menu_payments").addClass("active");
			$('#paidOn_tabledata_tr').hide();
			var billsSize = "${billsListSize}";
			if(billsSize != null && billsSize != 0){
				$("#billsList").addClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").addClass("hidden");
				$("#billsList").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
			}
			
			$(function() {
			 	$( "#billdate" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 dateFormat :"dd-mm-yy"
				 });
			 	$( "#duedate" ).datepicker({
					 yearRange: '1950:2100',
					 defaultDate: new Date(),
					 changeMonth: true,
					 changeYear: true,
					 showOn: "button",
	               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	                 buttonImageOnly: true,
					 dateFormat :"dd-mm-yy"
				 });
			 	$( "#paidOn" ).datepicker({
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
			 
			$('#status').on('click', function(){
		       var status = $('#status').val();
				if(status == 'i'){
					$('#paidOn_tabledata_tr').show();
					var date = new Date();
					var n = date.getDate()+'-'+(1+date.getMonth())+'-'+date.getFullYear();
					$('#paidOn').val(n);
				}else{
					$('#paidOn').val('')
					$('#paidOn_tabledata_tr').hide();
				}
		    });
			
			
			var url = "";
			var fymonthYear = "${fymonth}";
			
			$("#billmonth").focus(function() {
                $('.ui-datepicker-calendar').hide();
            });
			
			$("#billmonth").blur(function() {
                $('.ui-datepicker-calendar').hide();
            });
        	
			if(fymonthYear != "" && fymonthYear != null){
				$(function() {     
		            $( "#billmonth" ).datepicker({
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
				$("#block_overlay").removeClass("hidden");
				$("#billmonth").val("${fymonth}");
				var amount = 0;
				fymonthYear = monthConversion(fymonthYear);
				fymonthYear = fymonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/bills/getbymonth/"+fymonthYear;
				var resourceurl = $("#contextpath").val()+"/bills/getbydateajax/"+fymonthYear;
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
								if(result.status == "i"){
									amount = parseFloat(amount) + parseFloat(result.dueamount);	
								}
								
							});
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   }); 
				$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
				$("#billsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
				
			}else {
				$("#block_overlay").removeClass("hidden");
				url = $("#contextpath").val()+"/bills/getlist";
				$(function() {     
		            $( "#billmonth" ).datepicker({
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
				$("#block_overlay").addClass("hidden");
			}
			
			var table = $("#billDataTable").dataTable({
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
		                .column(2, { "filter" : "applied"} )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		            // Update footer
		            $( api.column(2).footer() ).html(
		            	 '$'+pageTotal +' ( $'+ total +' total)' 
		            );
		            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
		        },
		        "aoColumns": [ 
                  {sClass: "alignleft"}, 
                  {sClass: "alignleft"}, 
                  {sClass: "alignright"}, 
                  {sClass: "center"},
                  {sClass: "alignleft"},
                  {sClass: "alignleft"}
                ]
			});
			$('#billDataTable tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	 bills(id);
		        }
		    });
			$('#findoption').on('change', function (e) {
				$("#bilno").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/bills/getlist";
					$("#billsgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#billsgridtable").trigger("reloadGrid");
					$("#billsList").removeClass("hidden");
					$("#billsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#billsdetails").addClass("hidden");
				}else if(optionval.val() == "findbyid"){
					$("#billsearch").removeClass("hidden");
					$("#billsList").addClass("hidden");
					$("#billsdetails").addClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
				}
			});
			
			 $("#findByMonth").click(function() {
				 $("#block_overlay").removeClass("hidden");
				$("#billsList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#billsdetails").addClass("hidden");
				$("#billsdetails").addClass("hidden");
				$("#totaldiv").removeClass("hidden");
				 if($("#billmonth").datepicker().val() == ""){
					 $("#confirmationMsgContentDate").html("Please select month...");
					$.fancybox.open('#confirmMsgdate');
				}else{
				var month = $("#billmonth").datepicker().val();
				month =  monthConversion(month);
				month = month.split('/').join('-');
				var resourceURL = $("#contextpath").val()+"/bills/getbydateajax/"+month;
				var amount = 0;
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
								if(result.status == "i"){
									amount = parseInt(amount) + parseInt(result.dueamount);	
								}
							});
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   }); 
				var table = $('#billDataTable').DataTable();
				table.destroy();
				var resourceURL = $("#contextpath").val()+"/bills/getbymonth/"+month;
				$('#billDataTable').dataTable({
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
			                .column(2 )
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
			            $("#currenttotalamttd").val(parseFloat(pageTotal).toFixed(2)); 
			        },
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignright"}, 
                  	  {sClass: "center"},
                      {sClass: "alignleft"},
                      {sClass: "alignright"}
                    ]
			    });
				$("#currenttotalamttd").val(numberWithCommas(parseFloat(amount).toFixed(2)));
				}
				 
			  });
			
			 $("#show_vendor").click(function() {
				$("body").css("cursor", "progress");
				var id = null;
				<c:forEach items="${vendorList}" var="vendorlist">
					if("${vendorlist.name}" == $("#vid").html()){
						id = "${vendorlist.id}";
					}
				</c:forEach>
					var resourceURL = $("#contextpath").val()+"/vendordetails/viewvendor/"+id;
					$(this).attr("href", resourceURL);
				$("body").css("cursor", "default");
			});
			 
			function bills(id){
				$("#block_overlay").removeClass("hidden");
				$("#billsList").addClass("hidden");
				$("#billsdetails").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#totaldiv").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#billDataTable_wrapper").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				var resourceURL = $("#contextpath").val()+"/bills/retrivebyid/"+id;
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
								$("#billno").val((result.billno == undefined || result.billno == null || result.billno.length <= 0) ? "-" : result.billno);
								$("#billdate").val((result.billdate == undefined || result.billdate == null || result.billdate.length <= 0) ? "-" : result.billdate);
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#optional_duedate").html((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : parseFloat(result.dueamount).toFixed(2));
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								$("#paidOn").val((result.paidOn == undefined || result.paidOn == null || result.paidOn.length <= 0) ? "-" : result.paidOn);
								$("#optional_paidOn").html((result.paidOn == undefined || result.paidOn == null || result.paidOn.length <= 0) ? "-" : result.paidOn);
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								if(result.amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Pending");
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
								}else if(result.status == "i"){
									$("#optional_status").html("Paid");
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
									$('#paidOn_tabledata_tr').show();
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								
								<c:forEach items="${vendorList}" var="vendorlist">
									if("${vendorlist.id}" == result.vendorid){
										$("#vid").html("${vendorlist.name}");
									}
								</c:forEach>
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
			
			$("#edit").click(function() {
				$("body").css("cursor", "progress");
				$("#status").removeClass("hidden");
				$("#optional_status").addClass("hidden");
				
				$("#duedate_tabledata").removeClass("hidden");
				$("#duedate_tablediv").addClass("hidden");
				
				$("#paidOn_tabledata").removeClass("hidden");
				$("#paidOn_tablediv").addClass("hidden");
				
				$("#amounttype").removeClass("hidden");
				$("#optional_amounttype").addClass("hidden");
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				if($("#duedate").val() == "-"){
					$("#duedate").val("");
				}
				if($("#paidOn").val() == "-"){
					$("#paidOn").val("");
				}
				if($("#dueamount").val() == "-"){
					$("#dueamount").val("");
				} 
				if($("#comments").val() == "-"){
					$("#comments").val("");
				}
				$("#amounttype").prop( "disabled", false );
				$("#comments").prop( "disabled", false )
				$("#status").prop( "disabled", false );
				$("#duedate").prop( "disabled", false );
				$("#paidOn").prop( "disabled", false );
				$("#dueamount").prop( "disabled", false );
				
				$("#duedate").removeClass("inputdisable");
				$("#paidOn").removeClass("inputdisable");
				$("#dueamount").removeClass("inputdisable");
				$("#status").removeClass("inputdisable");
				$("#amounttype").removeClass("inputdisable");
				$("#comments").removeClass("inputdisable");
				
				$("#duedate").addClass("inputBorder");
				$("#paidOn").addClass("inputBorder");
				$("#dueamount").addClass("inputBorder");
				$("#comments").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			
			$("#decline_yes").click(function() {
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				
				declineBill();
				$("#billdate").prop( "disabled", true );
				$("#duedate").prop( "disabled", true );
				$("#paidOn").prop( "disabled", true );
				$("#dueamount").prop( "disabled", true );
				$("#comments").prop( "disabled", true );
				
				$("#billdate").removeClass("inputBorder");
				$("#duedate").removeClass("inputBorder");
				$("#paidOn").removeClass("inputBorder");
				$("#dueamount").removeClass("inputBorder");
				$("#comments").removeClass("inputBorder");
				
				$("#duedate").addClass("inputdisable");
				$("#paidOn").addClass("inputdisable");
				$("#dueamount").addClass("inputdisable");
				$("#comments").addClass("inputdisable");
				$.fancybox.close();
			});
			
			function declineBill(){
				$("#block_overlay").removeClass("hidden");
				var id = $("#id").val();
				//var splitedinvoice = invoiceno.split('-');
				var resourceURL = $("#contextpath").val()+"/bills/retrivebyid/"+id;
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
								$("#duedate").val((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								$("#optional_duedate").html((result.duedate == undefined || result.duedate == null || result.duedate.length <= 0) ? "-" : result.duedate);
								
								$("#duedate_tabledata").addClass("hidden");
								$("#duedate_tablediv").removeClass("hidden");
								
								$("#paidOn").val((result.paidOn == undefined || result.paidOn == null || result.paidOn.length <= 0) ? "-" : result.paidOn);
								$("#optional_paidOn").html((result.paidOn == undefined || result.paidOn == null || result.paidOn.length <= 0) ? "-" : result.paidOn);
								$("#paidOn_tabledata").addClass("hidden");
								$("#paidOn_tablediv").removeClass("hidden");
								
								
								$("#dueamount").val((result.dueamount == undefined || result.dueamount == null || result.dueamount.length <= 0) ? "-" : result.dueamount);
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#amounttype").val((result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0) ? "-" : result.amounttype);
								if(result.amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(result.amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(result.amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(result.amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}else if(result.amounttype == undefined || result.amounttype == null || result.amounttype.length <= 0){
									$("#optional_amounttype").html("-");
								}
								
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Pending");
									$('#paidOn_tabledata_tr').hide();
								}else if(result.status == "i"){
									$("#optional_status").html("Paid");
									$('#paidOn_tabledata_tr').show();
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								$("#status").addClass("hidden");
								$("#optional_status").removeClass("hidden");
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
				var billno = $("#billno").val();
				var billdate = $("#billdate").datepicker().val();
				var duedate = $("#duedate").datepicker().val();
				var dueamount = $("#dueamount").val();
				var comments = $("#comments").val();
				var amounttype = $("#amounttype").val();
				var paidOn = $("#paidOn").datepicker().val();
				var status = $("#status").val();
				var duedatevalidation = "";
				if(billno == "" || billno.length == 0) validation = false;
				if(billdate == "" || billdate.length == 0) validation = false;
				if(dueamount == "" || dueamount.length == 0) validation = false;
				if(amounttype == "" || amounttype.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				if(status == "i"){
					if(duedate == "" || duedate.length == 0) validation = false;
				}
				var billdatevalidation = $.datepicker.parseDate('dd-mm-yy',billdate);
				if(duedate != ""){
					duedatevalidation = $.datepicker.parseDate('dd-mm-yy',duedate);
					if ((billdatevalidation) > (duedatevalidation)) validation = false; 
				}
				if(paidOn == "" || paidOn.length == 0){
					paidOn = new Date();
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(duedate == "" || duedate.length == 0) duedate = "null";
					if(amounttype == "" || amounttype.length == 0) amounttype = "null";
					if(comments == "" || comments.length == 0) comments = "null";
					var resourceURL = $("#contextpath").val()+"/bills/update/"+id+"/"+billno+"/"+billdate+"/"+duedate+"/"+dueamount+"/"+amounttype+"/"+status+"/"+paidOn+"/"+comments;	
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								if(status == "a"){
									$("#optional_status").html("Pending");
								}else if(status == "i"){
									$("#optional_status").html("Paid");
									var amt = $("#currenttotalamttd").val();
									var totalamount = parseFloat(amt) + parseFloat(dueamount);
									$("#currenttotalamttd").val(totalamount.toFixed());
									$("#optional_paidOn").html(paidOn);
								}
								if(status == "a"){
									$("#edit").removeClass("hidden");
									$("#delete").removeClass("hidden");
								}else if(status == "i"){
									$("#edit").addClass("hidden");
									$("#delete").addClass("hidden");
								}
								if(amounttype == "i"){
									$("#optional_amounttype").html("INR");
								}else if(amounttype == "u"){
									$("#optional_amounttype").html("USD");
								}else if(amounttype == "e"){
									$("#optional_amounttype").html("EUR");
								}else if(amounttype == "g"){
									$("#optional_amounttype").html("GBP");
								}	
								  if($("#billno").val() == "" || $("#billno").val() == "-"){
									$("#billno").val("-");
								} 
								 if($("#billdate").val() == "" || $("#billdate").val() == "-"){
									$("#billdate").val("-");
								}  
								if($("#duedate").val() == "" || $("#duedate").val() == "-"){
									$("#duedate").val("-");
									$("#optional_duedate").html("-");
								} else {
									$("#optional_duedate").html(duedate);
								}
								if($("#dueamount").val() == "" || $("#dueamount").val() == "-"){
									$("#dueamount").val("-");
								}
								if($("#comments").val() == "" || $("#comments").val() == "-"){
									$("#comments").val("-");
								}
								$("#amounttype").addClass("hidden");
								$("#optional_amounttype").removeClass("hidden");
								
								$("#duedate_tabledata").addClass("hidden");
								$("#duedate_tablediv").removeClass("hidden");
								
								$("#paidOn_tabledata").addClass("hidden");
								$("#paidOn_tablediv").removeClass("hidden");
								
								$("#status").addClass("hidden");
								$("#optional_status").removeClass("hidden");
								
								$("#updatebutton").addClass("hidden");
								$("#findoption").prop( 'disabled', false );
								$("#id").prop( 'disabled', false );
								
								$("#id").prop( "disabled", true );
								$("#billno").prop( "disabled", true );
								$("#billdate").prop( "disabled", true );
								$("#duedate").prop( "disabled", true );
								$("#paidOn").prop( "disabled", true );
								$("#dueamount").prop( "disabled", true );
								$("#comments").prop( "disabled", true );
								$("#amounttype").prop( "disabled", true );
								$("#status").prop( "disabled", true );
								
								$("#id").removeClass("inputBorder");
								$("#billno").removeClass("inputBorder");
								$("#billdate").removeClass("inputBorder");
								$("#duedate").removeClass("inputBorder");
								$("#paidOn").removeClass("inputBorder");
								$("#dueamount").removeClass("inputBorder");
								$("#comments").removeClass("inputBorder");
								$("#amounttype").removeClass("inputBorder");
								$("#status").removeClass("inputBorder");
								
								$("#id").addClass("inputdisable");
								$("#billno").addClass("inputdisable");
								$("#billdate").addClass("inputdisable");
								$("#duedate").addClass("inputdisable");
								$("#paidOn").addClass("inputdisable");
								$("#dueamount").addClass("inputdisable");
								$("#comments").addClass("inputdisable");
								$("#amounttype").addClass("inputdisable");
								$("#status").addClass("inputdisable");
								$("#alertMsgContent").html("Bill details updated successfully ...");
								$.fancybox.open('#alertMsg');
							}else{
								$("#edit").addClass("hidden");
								$("#delete").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
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
				$("body").css("cursor", "default");
			});
			
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
				$("#block_overlay").removeClass("hidden");
				var resourceURL = $("#contextpath").val()+"/bills/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						$("#block_overlay").addClass("hidden");
						if(successflag == "true"){
								$("#successful_msg_content").html("Bill deleted successfully...");
								$.fancybox.open('#deletedsuccessful_fancybox');
								//invoiceDeleteReloader();
						}else{
							$("#errorMsgContent").html("Parent row cant be deleted.....");
							$.fancybox.open('#errorMsg');
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
			
			$("#show_showbillsList").click(function(){
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var amount = 0;
				var table = $('#billDataTable').DataTable();
				table.destroy();
				var resourceURL = "";
				var url = "";
				if($("#billmonth").datepicker().val() != ""){
					var month = $("#billmonth").datepicker().val();
					month =  monthConversion(month)
					month = month.split('/').join('-');
					resourceURL = $("#contextpath").val()+"/bills/getbymonth/"+month;
					url = $("#contextpath").val()+"/bills/getbydateajax/"+month;
				}else{
					resourceURL = $("#contextpath").val()+"/bills/getlist";
					url = $("#contextpath").val()+"/bills/gettotalamount";
				}
				if(resourceURL != null && resourceURL != ""){
					$('#billDataTable').dataTable({
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
				            $( api.column( 2).footer() ).html(
				            	 '$'+pageTotal +' ( $'+ total +' total)' 
				            );
				            $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2))); 
				        },
				        "aoColumns": [ 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignright"}, 
                  		  {sClass: "center"},
	                      {sClass: "alignleft"},
	                      {sClass: "alignright"}
	                    ]
				    });
					$("#billsdetails").addClass("hidden");
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
								if(result.status == "i"){
									amount = parseFloat(amount) + parseFloat(result.dueamount);	
								}
							});
								$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
								$("#totaldiv").removeClass("hidden");
								$("#block_overlay").addClass("hidden");
							}
				        },
				        error: function (xhr, ajaxOptions, thrownError) {
				   		}
				   	});
				}
				
				$("#findoption").val("all");
				$("#billsearch").addClass("hidden");
				$("#billsdetails").addClass("hidden");
				$("#billsgridtable").removeClass("hidden");
				$("#billsList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#edit").removeClass("hidden");
				$("#delete").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				
				$("#billdate").prop( "disabled", true );
				$("#duedate").prop( "disabled", true );
				$("#paidOn").prop( "disabled", true );
				$("#dueamount").prop( "disabled", true );
				$("#comments").prop( "disabled", true );
				
				$("#billdate").removeClass("inputBorder");
				$("#duedate").removeClass("inputBorder");
				$("#paidOn").removeClass("inputBorder");
				$("#dueamount").removeClass("inputBorder");
				$("#comments").removeClass("inputBorder");
				
				$("#duedate").addClass("inputdisable");
				$("#paidOn").addClass("inputdisable");
				$("#dueamount").addClass("inputdisable");
				$("#comments").addClass("inputdisable");
				
				$("#amounttype").addClass("hidden");
				$("#optional_amounttype").removeClass("hidden");
				
				$("#duedate_tabledata").addClass("hidden");
				$("#duedate_tablediv").removeClass("hidden");
				
				$("#paidOn_tabledata").addClass("hidden");
				$("#paidOn_tablediv").removeClass("hidden");
				
				$("#status").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				
				$("body").css("cursor", "default");
				
			});
		});
		
		$("#date_select").click(function(){
			 $.fancybox.close();
		 }); 
	</script>
</html>
