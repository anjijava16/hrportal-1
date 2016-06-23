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
			.ui-datepicker-trigger{
				margin-top: 8px;
			}
		</style>
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		<!--Professionatltax List Starts-->
			<div id="contentArea">
				<div id="optiondiv" class="cmnTable">
					<div id="adddiv" class="cmnTable">
						<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>mandatory fields<br/></div>
					</div>
				</div>
				<div  align="center" style="width: 100%;" class="amount_table">
					<table id="pttable"  align ="center" class="optionTable" >
						<tr >
							<td  align="right" id="totalcounttd1"   style="margin-left:auto;margin-top:0px;">PT&nbsp;Amount&nbsp;Paid&nbsp;:</td>
						    <!-- <td class="WebRupee BLD rupyaINR" class="rupyaINR WebRupee" >&#x20B9;</td>   -->
							<%-- <td id="currenttotalamttd" class="PADDLFT1PX BLD"  >${totalamount}</td> --%>
							<td align="left"  class="fyBillsPaidTd PADDLFT1PX BLD" ><span style="margin-left: 10px;font-weight:bold;" class="rupyaINR WebRupee">&#x20B9;</span><input id="currenttotalamttd" disabled style="border: 0;background-color: white;font-weight:bold;width: 109px; padding: 0px;" /></td>
							<!-- <td id="choosentotalamttd"  class="PADDLFT1PX hidden BLD"></td> -->
						</tr>
					</table>
				</div>	
				<div class="responsive">
					<table class="data display" id="ptaxtable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="first">Employee&nbsp;Id  &nbsp</th>
								<th class="">Employee&nbsp;Name</th>
								<th class="">PT&nbsp;Month</th>
								<th class="">Amount(<span class="rupyaINR WebRupee">&#x20B9;</span>) &nbsp</th>
							</tr>
						</thead>	
						 			
					</table>
				</div>
				<div id="userMsg" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id="userMsgContent"></div>
					<div class="clearWidth MRGT10PX">
						<a href="<%=request.getContextPath() %>/professionaltax"><input type="button" value="Done" id="user" /></a>
					</div>
				</div>				
			</div>
			<div id="confirmMsgdate" class="hidden" >
				<h1><b class="saptaColor">Notification</b></h1>
				<div id="confirmationMsgContentDate" style= "margin-bottom: 6px;"></div>
				<!-- <input type="button" id="decline_no" class="rightElement graybtn" value="Done"> -->
				<input type="button" id="date_select" class="rightElement " value="Done" style = "margin-right: 7px;">&nbsp;
			</div>	
		</div>	
		<%@include file="footer.jsp"%>
	</body>
	<script>
		$(document).ready(function(){
			$("#pageTitle").html("Professional Tax<b class='saptaColor'> List</b>");
			$("#menu_payroll").addClass("active");
			$("body").css("cursor", "default");
			$("#block_overlay").removeClass("hidden");
			var fymonthYear = "${fymonth}";
			if(fymonthYear != "" && fymonthYear != null){
				$(function() {
		            $("#month_tax").datepicker({
		               changeMonth:true,
		               changeYear:true,
		               dateFormat :'MM yy',
		               showButtonPanel:true,
		               constrainInput: false,
		               duration: '',
		               showOn: "button",
					   buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
					   buttonImageOnly: true,
		               monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		               onClose: function(dateText, inst){
		            	   var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            	   var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            	   $(this).datepicker('setDate', new Date(year, month, 1));
		               },
		            gotoCurrent: true
		            })
				});
				
				$("#month_tax").val("${fymonth}");
					var amount = 0;
					var url = "";
					fymonthYear = monthConversion(fymonthYear);
					fymonthYear = fymonthYear.split('/').join('-');
					url = $("#contextpath").val()+"/professionaltax/getbymonth/"+fymonthYear;
					var resourceurl = $("#contextpath").val()+"/professionaltax/gettotal/"+fymonthYear;
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
								amount = parseInt(amount) + parseInt(result.amount);	
							});
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   }); 
				$("#norecords").addClass("hidden");
			}else {
				$("#block_overlay").addClass("hidden");
				url = $("#contextpath").val()+"/professionaltax/get";
				$(function() {     
		            $( "#month_tax" ).datepicker({
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
			 $('#ptaxtable').DataTable({
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
			                .column( 2 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                },0 );
			 
			            // Total over this page
			            pageTotal = api
			                .column( 2, { "filter": "applied"} )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			         
			             $("#currenttotalamttd").val(numberWithCommas(pageTotal));   
			           
			        },
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "center"}, 
                      {sClass: "center"}, 
                      {sClass: "alignright"}
                    ]
			 
		    }),
				
			 $("#findByMonth").click(function() {
				$("#taxList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				
				 if($("#month_tax").datepicker().val() == ""){
					 $("#confirmationMsgContentDate").html("Please select month...");
					$.fancybox.open('#confirmMsgdate');
					
				}else{
					findByMonth();
				}
			});
			 function findByMonth(){
				 $("#block_overlay").removeClass("hidden");
				var month = $("#month_tax").datepicker().val();
				month =  monthConversion(month);
				month = month.split('/').join('-');
				var resourceURL = $("#contextpath").val()+"/professionaltax/gettotal/"+month; 
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
								amount = parseInt(amount) + parseInt(result.amount);	
								
							});
							$("#block_overlay").addClass("hidden");
						}
			        },
			        error: function (xhr, ajaxOptions, thrownError) {
			   		}
			   });   
				var table = $('#ptaxtable').DataTable();
				table.destroy();
				
				var resourceURL = $("#contextpath").val()+"/professionaltax/getbymonth/"+month;
				$('#ptaxtable').dataTable({
			        "ajax": resourceURL,
			        "aaSorting": [],
			        "aoColumns": [ 
                      {sClass: "alignleft"}, 
                      {sClass: "center"}, 
                      {sClass: "alignleft"}, 
                      {sClass: "alignright"}
                    ]
			    });
				
			} 
			 
		});
		 $("#date_select").click(function(){
			 $.fancybox.close();
		 }); 
	</script>
</html>