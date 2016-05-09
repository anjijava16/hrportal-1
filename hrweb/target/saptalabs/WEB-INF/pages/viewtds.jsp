<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style type="text/css">
			.ui-datepicker-calendar{
				display:none;
			}
			.ui-datepicker-trigger {
			    margin-top: 13px;
			}
		</style>
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		<!--Tds List Starts-->
			<div id="contentArea">
				<div id = "optiondiv" style="width: 100%;">
					<table  align ="center" class="optionTable">
						<tr>
							<td align="right" style=" width: 40%;" >Choose&nbsp;Month&nbsp;:</td>
							<td align="left" colspan = "2"  class="classMob"   style="padding-left:10px;">
								<b style="float:left"><input name="tdsid" id="tdsid" type="text" class="datePcKview dateInput" readonly="readonly"/></b>
								<input type="button" value="Find" style="float:left;margin-top: 4px;" id="findByMonth"/>
							</td>
						</tr>
						<tr>
							<td class="currenttotalamtrupyatd1 mobMART0PX"  align="right" id="totalcounttd1">Total&nbsp;Amount&nbsp;Paid&nbsp;:</td>
							<!-- <td class="currenttotalamtrupyatd " style="margin-left:auto;">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style="margin-left:auto;"></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight:bold;">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight:bold; width: 100px;" /></td>
						</tr>
					</table>
				</div>
				<!-- <div id="totaldiv" align="center" >
					<table id="totalcount"  align ="center">
						
					</table>
				</div> -->
					<!-- Project -->
					<div class="responsive">
						<table class="data display" id="tdstable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Id</th>
									<th class="">Employee&nbsp;Id</th>
									 <th class="">References</th>
									<th class="">TDS&nbsp;Month</th>
									<th class="">Amount&nbsp;(<span class="rupyaINR">&#x20B9;</span>)</th>
								</tr>
							</thead>
							
							<tbody></tbody>
						</table>
					</div>
					<div id="tdsDetails" class="MRGT10PX hidden">
						<div align="left" id="back_tdsList" class=""><a href="#" id="show_showtdsList">TDS List </a>/ TDS Details</div><br/>  
							<table class="tableContent ">
								<tr class="">
									<td class="lableContent">Id</td>
									<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
								</tr>
								<tr class="">
									<td class="lableContent">Employee Id</td>
									<td class="value"><a href="#" id="show_employee" style="cursor: pointer;"><input id="empid"   class="inputdisable" style="cursor: pointer;"></a></td>
								</tr>
								<tr class="">
									<td class="lableContent">TDS Month</td>
									<td class="value"><input id="tdsmonth" disabled="disabled" class="inputdisable" ></td>
								</tr>
								<tr class="">
									<td class="lableContent">Amount</td>
									<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return validateNumericWithPrecision(event)"></td>
								</tr>
								<tr class="">
									<td class="lableContent">References</td>
									<td class="value">
										<input id="refers" disabled="disabled" class="inputdisable">
										<div id="optional_refers" class="value"></div>
									</td>
								</tr>
								<tr class="">
									<td class="lableContent">Comments</td>
									<td class="value">
										<input id="comments" disabled="disabled" class="inputdisable">
										<div id="optional_comments" class="value"></div>
									</td>
								</tr>
							</table> 
					</div>
				</div>
				<div id="userMsg" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id="userMsgContent"></div>
					<div class="clearWidth MRGT10PX">
						<a href="<%=request.getContextPath() %>/tds/viewtds"><input type="button" value="Done" id="user" /></a>
					</div>
				</div> 
				<div id ="deletedsuccessful_fancybox" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id = "successful_msg_content"></div>
					<a href="<%=request.getContextPath() %>/tds/viewtds" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
					<%@include file="footer.jsp"%>
			</div>
			<div id="confirmMsgdate" class="hidden" >
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmationMsgContentDate" style= "margin-bottom: 6px;"></div>
				<!-- <input type="button" id="decline_no" class="rightElement graybtn" value="Done"> -->
				<input type="button" id="date_select" class="rightElement " value="Done" style = "margin-right: 7px;">&nbsp;
			</div>
		<!--Project List End-->
		</div>
	</body>
	<script>
		
		$(document).ready(function(){
			$("#pageTitle").html("TDS<b class='saptaColor'> List</b>");
			$("#menu_payroll").addClass("active");
			$("body").css("cursor", "default");
			
			
			$("#show_employee").click(function() {
				$("body").css("cursor", "POINTER");
				if($("#empid").val() == "-" ){
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/viewemployee/"+$("#empid").val();
					$(this).attr("href", resourceURL);
				}
					
				$("body").css("cursor", "default");
			});	
			
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
				$(function() {
		            $("#tdsid").datepicker({
		               changeMonth:true,
		               changeYear:true,
		               dateFormat :'MM yy',
		               showButtonPanel:true,
		               constrainInput: false,
		               showOn: "button",
					   buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
					   buttonImageOnly: true,
		               monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		               duration: '',
		               onClose: function(dateText, inst){
		            	   var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            	   var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            	   $(this).datepicker('setDate', new Date(year, month, 1));
		               },
		            gotoCurrent: true
		            })
				})
				
				$("#tdsid").val("${fymonth}");
				var amount = 0;
				var url = "";
				fymonthYear = monthConversion(fymonthYear);
				fymonthYear = fymonthYear.split('/').join('-');
				url = $("#contextpath").val()+"/tds/getbytdsmonth/"+fymonthYear;
				var resourceurl = $("#contextpath").val()+"/tds/getbytdsmonthajax/"+fymonthYear;
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
								amount = parseFloat(amount) + parseFloat(result.amount);	
							});
							
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   }); 
				$("#currenttotalamttd").val(amount.toFixed(2));
				$("#tdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else {
				url = $("#contextpath").val()+"/tds/get";
				$(function() {     
		            $( "#tdsid" ).datepicker({
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
			$('#tdstable').dataTable({
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
			                .column( 4 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                },0 );
			 
			            // Total over this page
			            pageTotal = api
			                .column( 4, { "filter": "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			         
			             $("#currenttotalamttd").val(parseFloat(pageTotal).toFixed(2));   
			           
			        },
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "center"},
                      {sClass: "alignright"}
                    ]
					
		    });
			
			$('#tdstable tbody').on('click', 'tr', function(){
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	tds(id);	
		        }
		    });
		    
		    
			var tdsSize = "${tdsListSize}";
			if(tdsSize != null && tdsSize != 0){
			}else{
				$("#optiondiv").removeClass("hidden");
				$("#headlist").removeClass("hidden");
			} 
			
			$("#findByMonth").click(function() {
				var month = $("#tdsid").datepicker().val();
				if(month != "" && month != null){
					month =  monthConversion(month);
				month = month.split('/').join('-');
				var resourceURL = $("#contextpath").val()+"/tds/getbytdsmonthajax/"+month;
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
								amount = parseFloat(amount) + parseFloat(result.amount);	
								
							});
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   }); 
				var table = $('#tdstable').DataTable();
				table.destroy();
				var resourceURL = $("#contextpath").val()+"/tds/getbytdsmonth/"+month;
				$('#tdstable').dataTable({
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
			                .column( 4 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                },0 );
			 
			            // Total over this page
			            pageTotal = api
			                .column( 4, { "filter": "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			         
			             $("#currenttotalamttd").val(parseFloat(pageTotal).toFixed(2));   
			        },
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignleft"},
                      {sClass: "alignright"}
                    ]
			    });
				$("#currenttotalamttd").val(amount.toFixed(2));
				}else{
					$("#confirmationMsgContentDate").html("Please select valid month ...");
					$.fancybox.open('#confirmMsgdate');
				}
			  });
			
			 $("#show_showtdsList").click(function(){
					$("#tdsDetails").addClass("hidden");
					$("#tdsList").removeClass("hidden");
					$("#norecords").addClass("hidden");
					$("#optiondiv").removeClass("hidden");
					$("#headlist").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#totaldiv").removeClass("hidden");
					$("#currenttotalamttd").removeClass("hidden");
					var table = $('#tdstable').DataTable();
					table.destroy();
					var month = $("#tdsid").datepicker().val();
					if($("#tdsid").datepicker().val() != ""){
						month =  monthConversion(month);
						month = month.split('/').join('-');
						var resourceURL = $("#contextpath").val()+"/tds/getbytdsmonth/"+month;
					}else{
						var resourceURL = $("#contextpath").val()+"/tds/get"
					}
					$('#tdstable').dataTable({
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
				                .column( 4 )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                },0 );
				 
				            // Total over this page
				            pageTotal = api
				                .column( 4, { "filter": "applied"} )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				         
				             $("#currenttotalamttd").val(parseFloat(pageTotal).toFixed(2));   
				        },
				        "aoColumns": [ 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"}, 
	                      {sClass: "alignleft"},
	                      {sClass: "alignright"}
	                    ]
				    });
			 });
		});
	
			function tds(id){
				$("#data display").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#tdstable_wrapper").addClass("hidden");
				$("#tdsList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#tdsDetails").removeClass("hidden");
				$("#totaldiv").addClass("hidden");
				$("#totaldiv2").addClass("hidden");
				var resourceURL = $("#contextpath").val()+"/tds/retrivebyid/"+id;
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
								if(result.empid == 0 || result.empid == null || result.empid == "null"){
									$("#empid").val("-");
									$("#empid").css( ' color' ,'rgb(84, 84, 84)');
									 $("#empid").css('text-decoration', 'none');
								}else{
									$("#empid").val(result.empid);
									$("#empid").css( ' color' ,'#000000');
								    $("#empid").css('text-decoration', 'underline');
								}
								$("#tdsmonth").val((result.tdsmonth == undefined || result.tdsmonth == null || result.tdsmonth.length <= 0) ? "-" : result.tdsmonth);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								$("#refers").val((result.refer == undefined || result.refer == null || result.refer.length <= 0) ? "-" : result.refer);
								$("#optional_refers").html((result.refer == undefined || result.refer == null || result.refer.length <= 0) ? "-" : result.refer);
								$("#refers").addClass("hidden");
								$("#optional_refers").removeClass("hidden");
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#optional_comments").html((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#comments").addClass("hidden");
								$("#optional_comments").removeClass("hidden");
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
			$("#date_select").click(function(){
				 $.fancybox.close();
			 }); 
	</script>
</html>
