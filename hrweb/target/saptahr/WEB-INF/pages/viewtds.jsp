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
		</style>
	</head>
	<body>
		<div id="innerContainer">
		<!--Header Start-->
			<header>
				<div class="clearBlock">
					<div class="leftElement">
						<a href="http://saptalabs.com" target="_blank"><img src="<%=request.getContextPath() %>/resources/images/logo.png" alt="Sapta Labs" /></a>
					</div>
					<div class="rightElement MRGR10PX">
						<a href="<%=request.getContextPath() %>/logout" id="logout" style="padding:10px;" title ="Logout"><img src="<%=request.getContextPath() %>/resources/images/logout.png" alt="Logout"/></a>
					</div>		
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
										<li><a href="<%=request.getContextPath() %>/invoice/addviewinvoice">View Invoice</a></li>
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

		<!--Tds List Starts-->
			<div id="contentArea">
				<div align="left" id="headlist"><h1>TDS<b class="saptaColor"> List</b></h1> </div>
				<div align="left" id="headdetail" class="hidden MRGT10PX"> <h1>TDS<b class="saptaColor"> Detail</b></h1></div>
				<div id="optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center;">
									<option value="all" style="text-align: center;">--- All ---</option>
									<option value="findbymonth" style="text-align: left;">Find By TDS Month</option>
								</select>
							</td>
						</tr>
						<tr id = "tdssearch" class = "hidden">
							<td align="right" width = "167px"><sup class="saptaColor">*</sup>Enter TDS Month</td>
							<td>:</td>
							<td align="left" colspan = "2">
								<input name="tdsid" id="tdsid" type="text" class="datePcK" readonly="readonly"style="width: 200px; padding: 0px; margin-left: 1px; height: 25px;font-weight: bold;"/>
								<input type="button" value="Find" id="findbyTdmonth" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: 0px;"/>
							</td>								
						</tr>
					</table> 
					<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
				</div>
				
				<div id="totaldiv" class="cmnTable">
					<table id="pttable" width = "443px" align ="center">
						<tr id="trdiv">
							<td align="right" width = "139px">Total TDS</td>
							<td>:</td>
							<!-- <td class="WebRupee PADDRGT1PX BLD" width="11px"></td> -->
							<td id="currenttotalamttd" class="PADDLFT1PX BLD"  width="189px">&#x20B9;${totalamount}</td>
						</tr>
					</table>
				</div>	
				<div id="totaldiv2" class="cmnTable hidden">
					<table id="pttable" width = "443px" align ="center">
						<tr>
							<td align="right" width = "154px">Total TDS</td>
							<td>:</td>
							<!-- <td class="WebRupee PADDRGT1PX BLD" width="11px"></td> -->
						<%-- 	<td id="currenttotalamttd" class="" width="201px"><b>${totalamount}</b></td> --%>
							<td id="choosentotalamttd"  class="PADDLFT1PX hidden BLD" width="189px"></td>
						</tr>
					</table>
				</div>	
				<div id="tdsList" class="MRGT10PX">
					<table id="tdsgridtable"></table>
					<div id="tdsgridpager"></div>
				</div>
				<div id="norecords" class="hidden MRGT10PX"> 
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
				<div id="tdsDetails" class="MRGT10PX hidden">
					<div align="left" id="back_tdsList" class=""><a href="#" id="show_showtdsList">TDS List </a>/ TDS Details</div><br/>
					<!-- Project -->
					<table class="tableContent">
						<tr class="">
							<td class="lableContent">Id</td>
							<td class="value"><input id="id" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Employee Id</td>
							<td class="value"><input id="empid" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">TDS Month</td>
							<td class="value"><input id="tdsmonth" disabled="disabled" class="inputdisable" ></td>
						</tr>
						<tr class="">
							<td class="lableContent">Amount</td>
							<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></td>
						</tr>
						<tr class="">
							<td class="lableContent">References</td>
							<td class="value"><input id="refers" disabled="disabled" class="inputdisable"></td>
						</tr>
						<tr class="">
							<td class="lableContent">Comments</td>
							<td class="value"><input id="comments" disabled="disabled" class="inputdisable"></td>
						</tr>
					</table>
				</div>
				<div id="confirmMsg" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContent"></div>
					<input type="button" id="delete_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="delete_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<<%-- div id="userMsg" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id="userMsgContent"></div>
					<div class="clearWidth MRGT10PX">
						<a href="<%=request.getContextPath() %>/tds/viewtds"><input type="button" value="Ok" id="user" /></a>
					</div>
				</div> --%>
				<div id ="deletedsuccessful_fancybox" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id = "successful_msg_content"></div>
					<a href="<%=request.getContextPath() %>/tds/viewtds" style="text-decoration: none">
					<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
				</div>
			</div>
		<!--Project List End-->
		</div>
		<footer>powered by <b><a href="http://saptalabs.com"target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
	</body>
	<script>
	
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
	            }).datepicker('setDate',"0");
			});
			var tdsSize = "${tdsListSize}";
			if(tdsSize != null && tdsSize != 0){
				$("#tdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#tdsList").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#trdiv").addClass("hidden");
			} 
			
			$('#findoption').on('change', function (e) {
				$("#tdsid").val("");
				
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/tds/get";
					$("#tdsgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#tdsgridtable").trigger("reloadGrid");
					$("#currenttotalamttd").removeClass("hidden");
					$("#choosentotalamttd").addClass("hidden");
					$("#tdsList").removeClass("hidden");
					$("#totaldiv").removeClass("hidden");
					$("#totaldiv2").addClass("hidden");
					$("#trdiv").removeClass("hidden");
					$("#pttable").removeClass("hidden");
					$("#tdssearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#tdsDetails").addClass("hidden");
				}else if(optionval.val() == "findbymonth"){
					$("#pttable").addClass("hidden");
					$("#tdssearch").removeClass("hidden");
					$("#tdsList").addClass("hidden");
					$("#totaldiv").addClass("hidden");
					$("#totaldiv2").addClass("hidden");
					$("#tdsDetails").addClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					 $('#tdsid').on('change', function (e) {
						if($("#tdsid").val() != ""){
							var id =	$("#tdsid").val();
							var resourceURL = $("#contextpath").val()+"/tds/getbytdsmonth/"+tdsmonth;
							$("#tdsgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#tdsgridtable").trigger("reloadGrid");
							$("#tdsList").removeClass("hidden");
							$("#tdsDetails").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else{
							$("#tdsList").addClass("hidden");
							$("#tdsDetails").addClass("hidden");
						}
				  });
				}
			});
			
			$('#tdsid').keypress(function(event){
				if(event.which == 13) {
					$("#tdsList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findbytdsid();
				}
			}); 

			$("#findbyTdmonth").click(function() {
				$("#tdsList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#totaldiv").addClass("hidden");
			    $("#totaldiv2").removeClass("hidden");
			    $("#trdiv").addClass("hidden");	     	
				findbytdsid();
			});
			
			$("#show_showtdsList").click(function(){
				$("#tdsDetails").addClass("hidden");
				$("#tdsList").removeClass("hidden");
				$("#norecords").addClass("hidden");
				$("#optiondiv").removeClass("hidden");
				$("#tdssearch").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				
			});
		
			var tdsid = $("#tdsid").val();
			var amount = "${totalamount}";
			if(tdsid == undefined || tdsid == null || tdsid.length <= 0 || tdsid == ""){
				var url = $("#contextpath").val()+"/tds/get";
			}else{
				var url = $("#contextpath").val()+"/tds/getbytdsmonth/"+ tdsid;
			}
			jQuery("#tdsgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:['Employee Id','References','TDS Month','Amount(&#x20B9;)'], 
				colModel:[{name:'id',index:'id', width:150, resizable :false},
				          {name:'refers',index:'refers', width:250, resizable :false},
						  {name:'tdsmonth',index:'tdsmonth', width:250, resizable :true},
						  {name:'amount',index:'amount', width:268, resizable :true},
						  ],
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#tdsgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					tds(id);
				}
			});
			
			jQuery("#tdsgridtable").jqGrid('navGrid','#tdsgridpager',{edit:false, add:false, del:false, search:false});
		
		}); 
		
		function findbytdsid(){
				$("body").css("cursor", "progress");
				$("#totaldiv").addClass("hidden");
				$("#totaldiv2").addClass("hidden");
				$("#trdiv").addClass("hidden");	
				var count = 0;
				var totalamount = 0;
				$("#pttable").removeClass("hidden");
				var month = $("#tdsid").datepicker().val();
				month =  monthConversion(month)
				month = month.split('/').join('-');
				var splitedmonth = month.split("-");
				<c:forEach items = "${tdsList}" var = "td" >
				<fmt:formatDate value="${td.tdsmonth}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
					var splitdate = "${formattedDate}";
					var splitdateformat = splitdate.split("-");
					if( splitedmonth[1] == splitdateformat[1] && splitedmonth[2]==splitdateformat[2]){
						totalamount = totalamount + ${td.amount};
						count++;
					}
				</c:forEach>
				
				if(count > 0){
					var resourceURL = $("#contextpath").val()+"/tds/getbytdsmonth/"+month;
					$("#tdsgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#tdsgridtable").trigger("reloadGrid");
					$("#pttable").removeClass("hidden");
					$("#totalamtdiv").html(totalamount);
					$("#currenttotalamttd").addClass("hidden");
					$("#choosentotalamttd").removeClass("hidden");
					$("#choosentotalamttd").html("&#x20B9;"+totalamount);
					$("#tdsList").removeClass("hidden");
					$("#totaldiv2").removeClass("hidden");
					$("#trdiv").removeClass("hidden");	
				}
				if(count == 0){
					$("#totaldiv").addClass("hidden");
					$("#totaldiv2").addClass("hidden");
					$("#trdiv").addClass("hidden");	
					document.getElementById("userMsgContent").innerHTML = "Tds details not found for the given Month " +month;
					$.fancybox.open('#userMsg');
				}
				$("body").css("cursor", "default");
			} 
		
	
			function tds(id){
				$("#tdsList").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#tdsDetails").removeClass("hidden");
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
								$("#empid").val((result.empid == 0 || result.empid == null) ? "-" : result.empid);
								$("#tdsmonth").val((result.tdsmonth == undefined || result.tdsmonth == null || result.tdsmonth.length <= 0) ? "-" : result.tdsmonth);
								$("#amount").val((result.amount == undefined || result.amount == null || result.amount.length <= 0) ? "-" : result.amount);
								$("#refers").val((result.refer == undefined || result.refer == null || result.refer.length <= 0) ? "-" : result.refer);
								$("#comments").val((result.comments == undefined || result.comments == null || result.comments.length <= 0) ? "-" : result.comments);
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
	</script>
</html>
