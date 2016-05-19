<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style type="text/css">
			.ui-datepicker-trigger {
			    margin-left: 11px;
			    margin-top: 13px;
			}
		</style> 
	</head>
	<body>
		<!--Header Start-->
			<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
		<!--Content Area START-->
			<div id="contentArea">
				<div id="assignment">
					<div id = "empselect" style="width:100%">
						<table  align ="center"  class="optionTable">
							<tr>
								<td align="right" ><sup class="saptaColor">*</sup>Employee Id&nbsp;:</td>
								<td align="left">	
									<input type="text" id="sempid" onkeypress="return validateNumeric(event)"/>					
									<%-- <select id="sempid" >
										<option value=""style="text-align:center">--- Select  Employee ---</option> 
										<c:forEach items="${employeeList}" var="employee">
											<option value="${employee.id}" style="text-align:left">${employee.id} - ${employee.fname} </option>
										</c:forEach>
									</select> --%>
								</td>
							</tr>
							<tr>
								<td align="right" class="resChooser"><sup class="saptaColor">*</sup>Choose&nbsp;Customer&nbsp;:</td>
								<td align="left" class="resChooser" >						
									<select id="customerid" class="leftElement" tabindex="2" onmousedown="if(this.options.size>3){this.size=3};">
									   	<option value="" style="text-align:center">--- Select  Customer ---</option> 
									  	<c:forEach items="${customerList}" var="customer">
					 						<option value="${customer.id}" style="text-align:left">${customer.id} - ${customer.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr id = "projselect"  class="hidden">
								<td align="right" ><sup class="saptaColor">*</sup>Choose Project&nbsp;:</td>
								<td align="left">						
									<select id="sprojid">
									
									<!-- old width value of select is width: 200px; -->
									
									<%-- <option value="" style="text-align:center">--- Select  Project ---</option> 
										<c:forEach items="${projectList}" var="project">
											<option value="${project.id}" style="text-align:left">${project.id} - ${project.name}</option>
										</c:forEach> --%>
									</select>
								</td>
							</tr>
							
							
							<tr  class="hidden addassignmentdetailtr">
								<td align="right" ><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
								<td><b style="float:left"><input name="sdate" id="sdate" readonly="readonly" type="text" class="datePcK"/></b></td>
								
							</tr>
							<tr  class="hidden addassignmentdetailtr">
								<td align="right">End Date&nbsp;:</td>
								<td><b style="float:left"><input name="edate" id="edate" readonly="readonly" type="text"  class="datePcK"/></b></td>
							</tr>
							
							<tr  class="hidden addassignmentdetailtr">
								<td align="right">PO / WO&nbsp;:</td>
								<td><input name="powo" id="powo" type="text"  /></td>
							</tr>
							
							<tr  class="hidden addassignmentdetailtr">
								<td align="right">Amount&nbsp;:</td>
								<td><input name="amount" id="amount" type="text"  /></td>
							</tr>
							
							<tr  class="hidden addassignmentdetailtr">
								<td align="right" style="float:none" >Choose&nbsp;Amount&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="amounttype" >
										<option value="" style="text-align: center;">--- Amount Type ---</option>
										<option value="inr" style="text-align: left;">INR</option>
										<option value="usd" style="text-align: left;">USD</option>
										<option value="eur" style="text-align: left;">EUR</option>
										<option value="gbp" style="text-align: left;">GBP</option> 
									</select>
								</td>
							</tr>
							
							<tr class="hidden addassignmentdetailtr">
								<td align="right" style="float:none">Choose&nbsp;Project&nbsp;Type&nbsp;:</td>
								<td align="left" style="float:none">						
									<select id="billtype" >
										<option value="" style="text-align: center;">--- Project Type ---</option>
										<option value="h" style="text-align: left;">Hourly</option>
										<option value="d" style="text-align: left;">Daily</option>
										<option value="w" style="text-align: left;">Weekly</option>
										<option value="m" style="text-align: left;">Monthly</option>
										<option value="f" style="text-align: left;">Fixed</option> 
									</select>
								</td>
							</tr>
							
							<tr  class="hidden addassignmentdetailtr">
								<td align="right">Status&nbsp;:</td>
								<td>
									<select name="status" id="status" style="text-align:center">
										<!-- <option value="" style="text-align:center">--- Select ---</option> -->
										<option value="a" style="text-align:left">Active</option>
										<option value="i" style="text-align:left">Closed</option>
									</select>
								</td>
							</tr>
							<tr  class="hidden addassignmentdetailtr">
								<td align="right">Comments&nbsp;:</td>
								<td><textarea style="height: 100px; resize:none;" id="comment" class="comment" name="comment"></textarea></td>
							</tr>
						</table>
					</div>	
					<%-- <div id = "projselect" class=" hidden" style="width:100%">
						<table  align ="center" class="optionTable">
							<tr id = "projselect">
								<td align="right" ><sup class="saptaColor">*</sup>Choose Project&nbsp;:</td>
								<td align="left">						
									<select id="sprojid">
									
									<!-- old width value of select is width: 200px; -->
									
									<option value="" style="text-align:center">--- Select  Project ---</option> 
										<c:forEach items="${projectList}" var="project">
											<option value="${project.id}" style="text-align:left">${project.id} - ${project.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							
						</table>
					</div> --%>
		<!--Assignment Detals Adding Starts-->
					<div id ="addassignmentdetail" class =" hidden addassignmentdetailtr" >	
						<!-- <table id="employeeTable" align ="center" >
							<tr>
								<td align="right" ><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
								<td><b style="float:left"><input name="sdate" id="sdate" readonly="readonly" type="text" class="datePcK"/></b></td>
								
							</tr>
							<tr>
								<td align="right">End Date&nbsp;:</td>
								<td><b style="float:left"><input name="edate" id="edate" readonly="readonly" type="text"  class="datePcK"/></b></td>
							</tr>
							<tr>
								<td align="right">Status&nbsp;:</td>
								<td>
									<select name="status" id="status" style="text-align:center">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="a" style="text-align:left">Active</option>
										<option value="i" style="text-align:left">Inactive</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">Comments&nbsp;:</td>
								<td><textarea style="height: 100px; resize:none;" id="comment" name="comment"></textarea></td>
							</tr>
						</table> -->
						
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Submit" id="addassignment" />
								</div>
								<div class="leftElement"><input id="decline"  type="button" value="Decline" class="graybtn" /></div>
								
							</div>
						</div>
						<div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
		<!--Assignment Detals Adding End-->
					<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX"><a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a></div>
					</div>
				</div>
			</div>
			<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
						<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
					</a>	
				</div>	
		<!--Content Area END-->
		</div>
		<%@include file="footer.jsp"%>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_project").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Assignment");
			$(function() {
				 $( "#sdate, #edate" ).datepicker({
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
			
			$('#sprojid').on('change', function (e){
				if($("#sprojid").val() != ""){
					$(".addassignmentdetailtr").removeClass("hidden");
				}else{
					$(".addassignmentdetailtr").addClass("hidden");
				}
			});
			
			/* $('#sempid').on('change', function (e){
				if($("#sempid").val() != "")
					 $("#projselect").removeClass("hidden");
				else{
					 $("#projselect").addClass("hidden");
					  $(".addassignmentdetailtr").addClass("hidden");
				}
			}); */
			
			$('#customerid').on('change', function (e){
				if($("#customerid").val() != ""){
					 $("#projselect").removeClass("hidden");
					var resourceURL = $("#contextpath").val()+"/project/retrivebycustid/"+$("#customerid").val();
					 $.ajax({
					        url : resourceURL,
					        type : 'GET',
					        dataType : 'json',
					        success: function(data) {
					        	var successflag = data.response.successflag;
					        	var errors = data.response.errors;
					        	var results = data.response.result;
					        	
					        	if(successflag == "true"){
					        		$('#sprojid').find('option').remove();
					        		var optionTag = "<option value='null' style='text-align: center;'>--- Select Project ---</option>";
					        		$('#sprojid').append(optionTag);
					        		 for(var i = 0; i < results.length; i++){
					        			$('#sprojid').append($('<option>', { 
								            value: results[i].id,
								            text : results[i].dispname,
								            style: "text-align: left;"
								        }));
					        		}
					        	}else{
					        		$("#projselect").addClass("hidden");
					        	} 
					        },
					        error: function (xhr, ajaxOptions, thrownError) {
					        	$("#errorMsgContent").html(thrownError);
					    		$.fancybox.open('#errorMsg');
					   		}
					   });
				} else {
					$("#projselect").addClass("hidden");
				}
		    });
			
			$('#addassignment').click(function(){
				$("body").css("cursor", "progress");
				var validation = true;
				var sdate = $("#sdate").datepicker().val();
				sdate = sdate.split("/").join("-");
				var edate = $("#edate").datepicker().val();
				edate = edate.split("/").join("-");
				var comment = $("#comment").val();
				var status = $("#status").val();
				var eid = $("#sempid").val();
				var projid = $("#sprojid").val();
				var powo = $("#powo").val();
				var amount = $("#amount").val();
				var amounttype = $("#amounttype").val();
				var billtype = $("#billtype").val();
				if(sdate == "" || sdate.length == 0) validation = false;
				//if(edate == "" || edate.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				var sdatevalidation = $.datepicker.parseDate('dd-mm-yy', sdate);
				var edatevalidation = $.datepicker.parseDate('dd-mm-yy', edate);
				if(edate != "" || edate.length != 0){
					if ((sdatevalidation) >= (edatevalidation))  validation = false; 	
				}
						
				if(validation == false){
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(comment == "" || comment.length == 0) comment = "null";
					if(edate == "" || edate.length == 0) edate = "null";
					/* if(eid == "" || eid.length == 0) eid = "null"; */
					if(powo == "" || powo.length == 0) powo = "null";
					if(amount == "" || amount.length == 0) amount = "null";
					if(amounttype == "" || amounttype.length == 0) amounttype = "null";
					if(billtype == "" || billtype.length == 0) billtype = "null";
					var resourceURL = $("#contextpath").val()+"/assignment/add/"+sdate+"/"+edate+"/"+powo+"/"+comment+"/"+status+"/"+eid+"/"+projid+"/"+amount+"/"+amounttype+"/"+billtype;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {
							// Clearing Employee
							$("#sdate").val("");
							$("#edate").val("");
							$("#comment").val("");
							$("#status").val("");
							$("#sempid").val("");
							$("#sprojid").val("");
							$("#powo").val("");
							$("#amount").val("");
							$("#amounttype").val("");
							$("#billtype").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							
							if(successflag == "true"){
								$("#userMsgContent").html("Assignment added successfully ...");
								$.fancybox.open('#userMsg');
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
				$("body").css("cursor", "default");
			 });
				
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		});
		
	function	optionSize()
	{
		if(this.options.length>4)
		{this.length=4;}
	};
		
	</script>
</html>