<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@ include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">
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
		<!--Professionatltax List Starts-->
			<div id="contentArea">
				<div align="left" id="headlist"> <h1>Professional Tax<b class="saptaColor"> List</b></h1> </div>
				<div align="left" id="headdetail" class="hidden MRGT10PX"> <h1>Professional Tax<b class="saptaColor"> Detail</b></h1></div>
				<div id="optiondiv" class="cmnTable">
					<table width = "443px" align ="center">
						<tr>
							<td align="right" width = "150px">Choose Option</td>
							<td>:</td>
							<td align="left">						
								<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; margin:0; text-align: center">
									<option value="all" style="text-align: center;">--- All ---</option>
									<option value="findbymonth" style="text-align: left;">Find By Month</option>
								</select>
							</td>
						</tr>
					</table>
					<div id="adddiv" class="cmnTable">
						<table width = "443px" align ="center">
							<tr id = "taxsearch" class = "hidden">
								<td align="right" width="121px"><sup class="saptaColor">*</sup>Enter Month</td>
								<td>:</td>
								<td align="left" colspan = "2">
									<input name="month_tax" id="month_tax" type="text" class="datePcK" readonly="readonly" style="width: 200px;margin:0;  font-weight: bold;"/>
									<input type="button" value="Find" id="findByMonth" style="float:none;"/>
								</td>								
							</tr>
						</table>
						<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
					</div>
				</div>
					<div id="totaldiv" class="cmnTable">
						<table id="pttable" width = "443px" align ="center">
							<tr>
								<td align="right" width = "138px">Total Professional Tax</td>
								<td>:</td>
								<!-- <td class="WebRupee PADDRGT1PX BLD" width="11px">&#x20B9;</td> -->
								<td id="currenttotalamttd" class="PADDLFT1PX BLD"  width="189px">&#x20B9;${totalamount}</td>
								<td id="choosentotalamttd"  class="PADDLFT1PX hidden BLD" width="189px"></td>
							</tr>
						</table>
					</div>			
					<div id="taxList" class="MRGT10PX">
						<table id="taxgridtable"></table>
						<div id="taxgridpager"></div>
					</div>
					<div id="norecords" class="MRGT10PX hidden"> 
						<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
					</div>
					<div id="taxDetail" class="hidden MRGT10PX">
						<div align="left" id="back_taxlist" class=""><a href="#" id="show_showtaxlist">Tax List </a>/ Tax Details</div><br/>
							<c:choose>
								<c:when test="${ session.groupname == 'ad'}">
									<td align = "right"><input type="button" value="Edit" class="leftElement MRGL10PX" id="edit"/></td>
									<td align = "right"><input type="button" value="Delete" class="rightElement graybtn" id="delete"/></td>	
								</c:when>
							</c:choose>
						<table class="tableContent">
							<tr class="">
								<td class="lableContent">Employee Id</td>
								<td class="value"><input id="empid" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
							</tr>
							<tr class="">
								<td class="lableContent">PT Month</td>
								<td class="value"><input id="ptmonth" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
							</tr>
							<tr class="">
								<td class="lableContent">Amount</td>
								<td class="value"><input id="amount" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></td>
							</tr>
						</table>
					</div>	
					<%-- <div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/professionaltax"><input type="button" value="Ok" id="user" /></a>
						</div>
					</div> --%>				
			</div>		
		<!--Professionatltax List End-->
		</div>	
		<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
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
	            }).datepicker('setDate',"0");
			});
			var taxSize = "${taxListSize}";
			if(taxSize != null && taxSize != 0){
				$("#taxList").removeClass("hidden");
				$("#norecords").addClass("hidden");
			}else{
				$("#norecords").removeClass("hidden");
				$("#taxList").addClass("hidden");
				$("#optiondiv").addClass("hidden");
				$("#headlist").addClass("hidden");
				$("#totaldiv").addClass("hidden");
			}
    	
			$('#findoption').on('change', function (e){
				$("#month_tax").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/professionaltax/get";
					$("#taxgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#taxgridtable").trigger("reloadGrid");
					$("#currenttotalamttd").removeClass("hidden");
					$("#choosentotalamttd").addClass("hidden");
					$("#taxList").removeClass("hidden");
					$("#pttable").removeClass("hidden");
					$("#taxsearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#taxDetail").addClass("hidden");		
				}else if(optionval.val() == "findbymonth"){
					$("#pttable").addClass("hidden");
					$("#taxList").addClass("hidden");
					$("#taxDetail").addClass("hidden");
					$("#taxsearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					
					$('#month_tax').on('change', function (e){
						if($("#month_tax").val() != ""){
							var month_tax =	$("#month_tax").val();
							month_tax = monthConversion(month_tax);
							month_tax = month_tax.split('/').join('-');
							var resourceURL = $("#contextpath").val()+"/professionaltax/getbymonth" + month_tax;
							$("#taxgridtable").setGridParam({
								url:resourceURL,
								mtype: 'GET',
								ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
								datatype: "json"
							});
							$("#taxgridtable").trigger("reloadGrid");
							$("#taxList").removeClass("hidden");
							$("#taxDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
						}else {
							$("#taxList").addClass("hidden");
							$("#taxDetail").addClass("hidden");
						}
						
					});
				}
			});
			$('#month_tax').keypress(function(event){
				if(event.which == 13) {
					$("#taxList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					findByMonth();
				}
			});
			$("#findByMonth").click(function() {
				$("#taxList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				findByMonth();
			});
			
			var url = $("#contextpath").val()+"/professionaltax/get";
			jQuery("#taxgridtable").jqGrid({
				url: url,
				mtype: 'GET',
				ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
				datatype: "json", 
				colNames:[' Employee Id', 'PT Month', 'Amount(&#x20B9;)'], 
				colModel:[{name:'Employee Id',index:'Employee Id', width:307, resizable :true},
						  {name:'PT Month',index:'PT Month', width:307, resizable :true},
						  {name:'Amount',index:'Amount', width:309, resizable :true}],
				pagination:true,
				loadonce:true,
				height:'312px',
				rowNum:10, 
				rowList:[10,50,100],
				pager: '#taxgridpager', 
				viewrecords: true, 
				hidegrid: false,
				width: null,
				shrinkToFit:false, 
				onSelectRow: function(id){
					taxDetails(id)
				}
			});
			jQuery("#taxgridtable").jqGrid('navGrid','#taxgridpager',{edit:false, add:false, del:false, search:false});
			$("#show_showtaxlist").click(function() {
				$("body").css("cursor", "progress");
				$("#taxDetail").addClass("hidden");
				$("#taxList").removeClass("hidden");
				$("#headdetail").addClass("hidden");
				$("#headlist").removeClass("hidden");
				$("body").css("cursor", "default");
			});
			/* $("#findByMonth").click(function() {
				var month = $("#ptmonth").datepicker().val();
				
				var resourceURL = $("#contextpath").val()+"/professionaltax/getbymonth/" + ptmonth;
				 $("#taxgridtable").setGridParam({
					url:resourceURL,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json"
				});
				$("#taxgridtable").trigger("reloadGrid");
			}); */
	
			function findByMonth(){
				$("body").css("cursor", "progress");
				var count = 0;
				var totalamount = 0;
				var month_tax = $("#month_tax").datepicker().val();
				month_tax = monthConversion(month_tax);
				month_tax = month_tax.split('/').join('-');
				<c:forEach items = "${taxList}" var = "tax" >
				<fmt:formatDate value="${tax.ptmonth}" var="formattedDate" type="date" pattern="dd-MM-yyyy" />
					if("${formattedDate}" == month_tax){
						totalamount = totalamount + ${tax.amount};
						count++;
					}
				</c:forEach>
				if(count > 0){
					var resourceURL = $("#contextpath").val()+"/professionaltax/getbymonth/"+month_tax;
					$("#taxgridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#pttable").removeClass("hidden");
					$("#choosentotalamttd").html("&#x20B9;"+totalamount);
					$("#currenttotalamttd").addClass("hidden");
					$("#choosentotalamttd").removeClass("hidden");
					$("#taxgridtable").trigger("reloadGrid");
					$("#taxList").removeClass("hidden");
				}
				
				if(count == 0){
					document.getElementById("userMsgContent").innerHTML = " Tax details not found for the given Month " + month_tax.bold();
					$.fancybox.open('#userMsg');
					
					//$("#pttable").addClass("hidden");
				}
				$("body").css("cursor", "default");
			}
			$("body").css("cursor", "default");
		});
	</script>
</html>