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
			
				<div id="servicetax" class="hidden">
					<h1>
						Service <b class="saptaColor">Tax</b>
					</h1>
					<b class="saptaColor"><div id="tds_mandatory"></div></b>
					<table id="tdsearch">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Tax Month&nbsp;:</td>
							<td><b style="float:left;margin-left: 11px;"><input name="add_tdm" id="add_tdm" type="text" class="datePcK" readonly="readonly" style="font-weight: bold;"/></b></td>
							<td align="right">Invoice No&nbsp;:</td>
							<td><input type="text"  id="Invoice_no" name="Invoice_no"></input></td>
						</tr>
						<tr>
						    <td align="right"><sup class="saptaColor">*</sup>Amount&nbsp;:</td>
							<td><input name="add_amount" id="add_amount" type="text" onkeypress="return validateNumericWithPrecision(event)"/></td>
							<td align="right"><!-- <sup class="saptaColor">*</sup> -->Comments&nbsp;:</td>
							<td><textarea style="height: 100px; resize:none;" id="add_comments" name="add_comments"></textarea></td>
						</tr>
					</table>
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="serviceTax"/>
							</div>
						 </div>
				   </div>
				   <div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
				</div>
				
				<div id="paytds"
					style="cursor: pointer; margin-top: 0px; float: right"
					class="rightElement MRGR10PX MRGT10PX MRGB10PX"> 
					<img src="<%=request.getContextPath()%>/resources/images/add.png"
						alt="Add More" title="Pay Service Tax" />
				</div>
				<div id="paytdstextid" class="addbutntext"><b class="saptaColor">Add</b> Service Tax </div>
				
				<div id = "optiondiv" style="width: 100%;">
					<table  align ="center" class="optionTable">
						<tr>
							<td align="right"  >Choose&nbsp;Month&nbsp;:</td>
							<td align="left" colspan = "2"  class="classMob"   style="padding-left:10px;">
								<b style="float:left"><input name="tdsid" id="tdsid" type="text" class="datePcKview dateInput" readonly="readonly"/></b>
								<input type="button" value="Find" style="float:left;margin-top: 4px;" id="findByMonth"/>
							</td>
						</tr>
						<tr>
							<td class="currenttotalamtrupyatd1 mobMART0PX"  align="right" id="totalcounttd1">Total&nbsp;Amount&nbsp;Paid&nbsp;:</td>
							<!-- <td class="currenttotalamtrupyatd " style="margin-left:auto;" class="rupyaINR WebRupee">&#x20B9;</td>
							<td id="currenttotalamttd" class="fyBillsPaidTd PADDLFT1PX BLD" style="margin-left:auto;"></td> -->
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight:bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight:bold; width: 109px;" /></td>
						</tr>
					</table>
				</div>
				<!-- <div id="totaldiv" align="center" >
					<table id="totalcount"  align ="center">
						
					</table>
				</div> -->
					<!-- Project -->
					<div class="responsive">
						<table class="data display" id="servicetaxtable" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="first">Id</th>
									<!-- <th class="">Employee&nbsp;Id</th> -->
									 <th class="">Invoice No</th>
									<th class="">Tax&nbsp;Month</th>
									<th class="">Amount&nbsp;(<span class="rupyaINR WebRupee">&#x20B9;</span>)</th>
									 <th class="">Comments</th>
								</tr>
							</thead>
							
							<tbody></tbody>
						</table>
					</div>
					<div id="tdsDetails" class="MRGT10PX hidden">
						<div align="left" id="back_tdsList" class=""><a href="#" id="show_showtdsList">Tax List </a>/ Tax Details</div><br/> 
							<c:choose>
								<c:when test="${ session.groupname == 'ad'}">
									<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
									<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
								</c:when>
							</c:choose>	
							<div id="updatebutton" class="hidden" align="left">
						<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
						<input  id="Edit_decline" class="rightElement graybtn" type="button" value="Decline" style="background-color:grey"  align="left"/>
					</div> 
							<table class="tableContent ">
								<tr class="">
									<td class="lableContent">Id</td>
									<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
								</tr>
								<tr class="">
									<td class="lableContent">Invoice No</td>
									<td class="value">
										<div id="invoiceno" class="value"></div>
									</td>
								</tr>
								<tr class="">
									<td class="lableContent">Tax Month</td>
									<td id="date_tabledata" class="value hidden">
										<b style="float:left; height: 20px;"><input id="taxmonth" readonly="readonly" disabled="disabled" type="text" class="inputdisable datePcKview" ></b>

									</td>
										 <td  id="date_tablediv" class="value">
											<div id="optional_date"></div>
										</td> 
									<!-- <td class="value" id="date_tablediv"><input id="taxmonth" disabled="disabled" class="inputdisable" ></td> -->
								</tr>
								<tr class="">
									<td class="lableContent">Amount</td>
									<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return validateNumericWithPrecision(event)"></td>
								</tr>
								<!-- <tr class="">
									<td class="lableContent">References</td>
									<td class="value">
										<input id="refers" disabled="disabled" class="inputdisable">
										<div id="optional_refers" class="value"></div>
									</td>
								</tr> -->
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
							<a href="<%=request.getContextPath() %>/servicetax" style="text-decoration: none"><input type="button" value="Done" id="user" /></a>
						</div>
				   </div>
				<div id ="deletedsuccessful_fancybox" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id = "successful_msg_content"></div>
					<a href="<%=request.getContextPath() %>/servicetax" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
				
			</div>
			<div id="confirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentDecline"></div>
				<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
				<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
			</div>
			<div id="confirmMsgdate" class="hidden" >
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmationMsgContentDate" style= "margin-bottom: 6px;"></div>
				<!-- <input type="button" id="decline_no" class="rightElement graybtn" value="Done"> -->
				<input type="button" id="date_select" class="rightElement " value="Done" style = "margin-right: 7px;">&nbsp;
			</div>
			<div id="deletconfirmMsg" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContent"></div>
				<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
			<div id="confirmMsgEditDecline" class="hidden" >
				<h1><b class="saptaColor">Confirmation</b></h1>
				<div id="confirmationMsgContentEditDecline"></div>
				<input type="button" id="edit_decline_no" class="rightElement graybtn" value="Cancel" style="background-color:grey; margin-top: 10px; ">
				<input type="button" id="edit_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
			</div>
		<!--Project List End-->
		</div>
		<%@include file="footer.jsp"%>
	</body>
	<script>
		
		$(document).ready(function(){
			$("#pageTitle").html("Service Tax<b class='saptaColor'> List</b>");
			$("#menu_payroll").addClass("active");
			$("body").css("cursor", "default");
			$("#paytds").removeClass("hidden");
			$("#paytdstextid").removeClass("hidden");
			
		
			$(function() {
	            $( "#add_tdm,#taxmonth" ).datepicker({
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
	        
	        $('#serviceTax').click(function(){
	        	$("#block_overlay").removeClass("hidden");
				var validation = true;
				//servicetax
				var taxmonth = $("#add_tdm").datepicker().val();
				if(taxmonth != ""){
					taxmonth = monthConversion(taxmonth);
					taxmonth = taxmonth.split('/').join('-'); 
				}
				var amount = $("#add_amount").val();
				var Invoiceno = $("#Invoice_no").val();
				var comments = $("#add_comments").val();
				if(taxmonth == "" || taxmonth.length == 0) validation = false;
				if(amount == "" || amount.length == 0) validation = false;
				//if(refer == "" || refer.length == 0) validation = false;
				/* if(comments == "" || comments.length == 0) validation = false; */
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#tds_mandatory").html("All necessary information has not been provided or it may be invalid data");
				}else{
					if(comments == "" || comments == null || comments.length == 0) comments = null;
					if(Invoiceno == "" || Invoiceno == null || Invoiceno.length == 0) Invoiceno = null;
					var resourceURL = $("#contextpath").val()+"/servicetax/add/"+taxmonth+"/"+amount+"/"+comments+"/"+Invoiceno;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#add_tdm").val("");
							$("#add_amount").val("");
							$("#Invoice_no").val("");
							$("#add_comments").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Service Tax added successfully ...");
								$.fancybox.open('#userMsg');
								$("#tds_mandatory").html("");
							}else{
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
				url = $("#contextpath").val()+"/servicetax/getbytaxmonth/"+fymonthYear;
				$("#tdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else {
				url = $("#contextpath").val()+"/servicetax/get";
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
			
			$('#servicetaxtable').dataTable({
			      "ajax": url,
			      "aaSorting": [],
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
			                .column( 3, { "filter": "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			             $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2)));   
			        },
			        "aoColumns": [ 
                      {sClass: "center"}, 
                      {sClass: "center"}, 
                      {sClass: "center"},
                      {sClass: "alignright"},
                      {sClass: "center"}
                    ]
					
		    });
			
			$('#servicetaxtable tbody').on('click', 'tr', function(){
				$(".responsive").addClass("hidden");
		        var id = $('td', this).eq(0).text();
		        if(id != "No data available in table"){
		        	$("#empid").prop( "disabled", true );
					$("#taxmonth").prop( "disabled", true );
					$("#invoiceno").prop( "disabled", true );
					$("#comments").prop( "disabled", true );
					$("#amount").prop( "disabled", true );
					
					$("#empid").removeClass("inputBorder");
					$("#taxmonth").removeClass("inputBorder");
					$("#invoiceno").removeClass("inputBorder");
					$("#comments").removeClass("inputBorder");
					$("#amount").removeClass("inputBorder");
					
					$("#empid").addClass("inputdisable");
					$("#taxmonth").addClass("inputdisable");
					$("#invoiceno").addClass("inputdisable");
					$("#comments").addClass("inputdisable");
					$("#amount").addClass("inputdisable");
					$("#date_tabledata").addClass("hidden");
					$("#date_tablediv").removeClass("hidden");
		        	servicetax(id);	
		        	$("#delete").removeClass("hidden");
					$("#edit").removeClass("hidden");
		        	$("#paytds").addClass("hidden");
		        	$("#paytdstextid").addClass("hidden");
		        }
		    });
		    
		    
			var tdsSize = "${tdsListSize}";
			if(tdsSize != null && tdsSize != 0){
			}else{
				$("#optiondiv").removeClass("hidden");
				$("#headlist").removeClass("hidden");
			} 
			
			$("#findByMonth").click(function() {
				$("#block_overlay").removeClass("hidden");
				var month = $("#tdsid").datepicker().val();
				if(month != "" && month != null){
					month =  monthConversion(month);
				month = month.split('/').join('-');
				var resourceURL = $("#contextpath").val()+"/servicetax/getbytaxmonthajax/"+month;
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
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			        	$("#block_overlay").addClass("hidden");
			   		}
			   }); 
				var table = $('#servicetaxtable').DataTable();
				table.destroy();
				var resourceURL = $("#contextpath").val()+"/servicetax/getbytaxmonth/"+month;
				$('#servicetaxtable').dataTable({
			        "ajax": resourceURL,
			        "aaSorting": [],
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
			                .column( 3, { "filter": "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			         
			             $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2)));   
			        },
			        "aoColumns": [ 
                      {sClass: "center"}, 
                      {sClass: "center"}, 
                      {sClass: "center"},
                      {sClass: "alignright"},
                      {sClass: "center"}
                    ]
			    });
				$("#currenttotalamttd").val(numberWithCommas(amount.toFixed(2)));
				}else{
					$("#block_overlay").addClass("hidden");
					$("#confirmationMsgContentDate").html("Please select valid month ...");
					$.fancybox.open('#confirmMsgdate');
				}
			  });
			
			 $("#show_showtdsList").click(function(){
				    $(".responsive").removeClass("hidden");
			 		$("#paytds").removeClass("hidden");
			 		$("#paytdstextid").removeClass("hidden");
					$("#tdsDetails").addClass("hidden");
					$("#tdsList").removeClass("hidden");
					$("#norecords").addClass("hidden");
					$("#optiondiv").removeClass("hidden");
					$("#headlist").removeClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#totaldiv").removeClass("hidden");
					$("#Edit_decline").addClass("hidden");
					$("#update").addClass("hidden");
					
					$("#currenttotalamttd").removeClass("hidden");
					var table = $('#servicetaxtable').DataTable();
					table.destroy();
					var month = $("#tdsid").datepicker().val();
					if($("#tdsid").datepicker().val() != ""){
						month =  monthConversion(month);
						month = month.split('/').join('-');
						var resourceURL = $("#contextpath").val()+"/servicetax/getbytaxmonth/"+month;
					}else{
						var resourceURL = $("#contextpath").val()+"/servicetax/get"
					}
					$('#servicetaxtable').dataTable({
				        "ajax": resourceURL,
				        "aaSorting": [],
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
				                .column( 3, { "filter": "applied"} )
				                .data()
				                .reduce( function (a, b) {
				                    return intVal(a) + intVal(b);
				                }, 0 );
				 
				         
				             $("#currenttotalamttd").val(numberWithCommas(parseFloat(pageTotal).toFixed(2)));   
				        },
				        "aoColumns": [ 
	                      {sClass: "center"}, 
	                      {sClass: "center"}, 
	                      {sClass: "center"},
	                      {sClass: "center"},
	                      {sClass: "alignright"}
	                    ]
				    });
			 });
		});
	
			function servicetax(id){ 
				$("#block_overlay").removeClass("hidden");
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
				
				var resourceURL = $("#contextpath").val()+"/servicetax/retrivebyid/"+id;
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
								$("#taxmonth").val((result.taxmonth == undefined || result.taxmonth == null || result.taxmonth.length <= 0) ? "-" : result.taxmonth);
								$("#optional_date").html((result.taxmonth == undefined || result.taxmonth == null || result.taxmonth.length <= 0) ? "-" : result.taxmonth);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#optional_comments").html((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
								$("#comments").addClass("hidden");
								$("#optional_comments").removeClass("hidden");
								$("#invoiceno").html((result.invoiceno == undefined || result.invoiceno== 'null' || result.invoiceno == null || result.invoiceno.length <= 0) ? "-" : result.invoiceno);
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
			$("#date_select").click(function(){
				 $.fancybox.close();
			 }); 
			 
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			$("#decline_no").click(function(){
				 $.fancybox.close();
				 $.fancybox.open('#servicetax');
			 });
			$('#paytds').click(function() {
				$("#add_tdm").val("");
				$("#add_amount").val("");
				$("#Invoice_no").val("");
				$("#add_comments").val("");
				$("#tds_mandatory").html("");
				$.fancybox.open('#servicetax');
				$("body").css("cursor", "default");
			});
			
			
			$("#delete").click(function(){
				$("#confirmationMsgContent").html("Are you sure want to delete...?");
				$.fancybox.open('#deletconfirmMsg');
			});
			$("#delete_yes").click(function(){
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var id = $("#id").val();
				var resourceURL = $("#contextpath").val()+"/servicetax/delete/"+id;	
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						if(successflag == "true"){
							$("#block_overlay").addClass("hidden");
							$("#successful_msg_content").html("Deleted successfully...");
							$.fancybox.open('#deletedsuccessful_fancybox');
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
			$("#Edit_decline").click(function(){ 
				$("#confirmationMsgContentEditDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgEditDecline');
			});
			 $("#edit_decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $("#edit_decline_yes").click(function() {
					
					//Select box Properties
					
					$("#edit").removeClass("hidden");
					$("#delete").removeClass("hidden");
					$("#updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					var id= $("#id").val();
					servicetax(id)
					
					
					$("#invoiceno").prop( "disabled", true );
					$("#comments").prop( "disabled", true );
					$("#empid").prop( "disabled", true );
					$("#date").prop( "disabled", true );
					$("#amount").prop( "disabled", true );
					
					$("#invoiceno").removeClass("inputBorder");
					$("#comments").removeClass("inputBorder");
					$("#empid").removeClass("inputBorder");
					$("#date").removeClass("inputBorder");
					$("#amount").removeClass("inputBorder");
					
					$("#invoiceno").addClass("inputdisable");
					$("#comments").addClass("inputdisable");
					$("#empid").addClass("inputdisable");
					$("#date").addClass("inputdisable");
					$("#amount").addClass("inputdisable");
					$.fancybox.close();
				}); 
			 
			 
			$("#edit").click(function() { 
				$("body").css("cursor", "progress");
				$("#delete").addClass("hidden");
				$("#edit").addClass("hidden");
				$("#update").removeClass("hidden");
				$("#Edit_decline").removeClass("hidden");
				 $("#date_tabledata").removeClass("hidden");
				$("#date_tablediv").addClass("hidden"); 
					//Select box Properties
				/* $("#empid").removeClass("hidden");
				$("#empid").prop( 'disabled', false );
				$("#empid").addClass("inputBorder");
				$("#empid").removeClass("inputdisable"); */
					
				/* $("#taxmonth").addClass("hidden");
				$("#date").removeClass("hidden"); */
				
					
				//$("#optional_refers").addClass("hidden");
		//		$("#refers").removeClass("hidden");
				if($("#invoiceno").html() == "-")$("#invoiceno").html("");
				if($("#comments").val() == "-")$("#comments").val("");
				
				$("#invoiceno").prop( 'contenteditable', true );
				$("#invoiceno").prop( 'disabled', false );
				$("#invoiceno").addClass("inputBorder");
				$("#invoiceno").removeClass("inputdisable");
				
				$("#optional_comments").addClass("hidden");
				$("#comments").removeClass("hidden");
				$("#comments").prop( 'disabled', false );
				$("#comments").addClass("inputBorder");
				$("#comments").removeClass("inputdisable");
							
				//Select box Properties
				
				
				$("#updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#edit").addClass("hidden");
				$("#delete").addClass("hidden");
				
				$("#amount").prop( "disabled", false );
				$("#amount").removeClass("inputdisable");
				$("#amount").addClass("inputBorder");
				
				$("body").css("cursor", "default");
			});
			$("#update").click(function(){ 
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var id = $("#id").val();
				/* var empid = $("#empid").val(); */
				var date = $("#taxmonth").datepicker().val();
				if(date != ""){
					date = monthConversion(date);
					var taxmonth = date.split('/').join('-'); 
				}
				var amount = $("#amount").val();
				var invoiceno = $("#invoiceno").html();
				var comment = $("#comments").val();
				if(taxmonth == "" || taxmonth.length == 0) validation = false;
				if(amount == "" || amount.length == 0) validation = false;
			//	if(refrence == "" || refrence.length == 0) validation = false;
				/* if(comment == "" || comment.length == 0) validation = false; */
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(invoiceno == "" || invoiceno.length == 0 || invoiceno == "-") invoiceno  = null;
					if(comment == null || comment == "" || comment.length == 0 || comment == "-") comment = null;
				var resourceURL = $("#contextpath").val()+"/servicetax/update/"+id+"/"+taxmonth+"/"+amount+"/"+comment+"/"+invoiceno;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							if(successflag == "true"){
								   /* if($("#empid").val() == "" || $("#empid").val() == "-"){
										$("#empid").val("-");
									} */
								$("#empid").prop( "disabled", true );
								$("#taxmonth").prop( "disabled", true );
								$("#invoiceno").prop( "disabled", true );
								$("#comments").prop( "disabled", true );
								$("#amount").prop( "disabled", true );
								
								$("#empid").removeClass("inputBorder");
								$("#taxmonth").removeClass("inputBorder");
								$("#invoiceno").removeClass("inputBorder");
								$("#comments").removeClass("inputBorder");
								$("#amount").removeClass("inputBorder");
								
								$("#empid").addClass("inputdisable");
								$("#taxmonth").addClass("inputdisable");
								$("#invoiceno").addClass("inputdisable");
								$("#comments").addClass("inputdisable");
								$("#amount").addClass("inputdisable");
								
								$("#delete").removeClass("hidden");
								$("#edit").removeClass("hidden");
								$("#update").addClass("hidden");
								$("#Edit_decline").addClass("hidden");
								$("#date_tabledata").addClass("hidden");
								$("#date_tablediv").removeClass("hidden");
								$("#block_overlay").addClass("hidden");
								$("#alertMsgContent").html("Service Tax details updated successfully...");
								$.fancybox.open('#alertMsg');
							}else{ 
								$("#block_overlay").addClass("hidden");
								$("#edit").addClass("hidden");
								$("#delete").addClass("hidden");
								$("#updatebutton").removeClass("hidden");
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
			
			
	</script>
</html>
