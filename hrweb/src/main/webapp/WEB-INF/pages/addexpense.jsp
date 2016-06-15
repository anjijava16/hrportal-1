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
		<%@include file="menucomponents.jsp"%>
		<div id="innerContainer">
		<!--Header Start-->
	
		<!--Header End-->
		<!--Content Area START-->
			<div id="contentArea">
				<div id="expense" >
					
					<div id = "optiondiv" style="width:100% " align="center" >
						<table align="center" class="optionTable">
							<tr style="width:100% ">
								<td align="right" class = ""><sup class="saptaColor">*</sup>Choose Category&nbsp;:</td>
								<td align="left">						
									<select id="category" class="leftElement " tabindex="2"  margin=0;">
										<option value="I">Internal</option>
										<option value="E">External</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
					<table id="expenseTable">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Date&nbsp;:</td>
							<td><b style="float:left"><input name="date" readonly="readonly" id="date" type="text"  class="datePcK"/></b></td>
							<td align="right"><sup class="saptaColor">*</sup>Expense Type&nbsp;:</td>
							<td>
								<select id="expensetype"  style=" text-align: center;">
										<option value="" style="text-align: center;">--- Expense Type ---</option> 
										<c:forEach items="${expenseTypeList}" var="expType">
											<option value="${expType.id}" style="text-align: left;">${expType.dispname} </option>
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>Amount&nbsp;:</td>
							<td><input name="amount" id="amount" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Mode of Payment&nbsp;:</td>
							<td>
								<select id="paymode" name = "paymode" style="text-align: center;">
									<option value="" style="text-align: center;">--- Payment Type ---</option>
									<option value="c" style="text-align: left;">Cash</option>
									<option value="a" style="text-align: left;">Card</option>
									<option value="q" style="text-align: left;">Cheque</option>
									<option value="o" style="text-align: left;">Online Payment</option>
								</select>
							</td>
						</tr>
						<tr id = "payDetails" class="hidden MRGT10PX">
							<td align="right" ><sup class="saptaColor">*</sup>Bank Name&nbsp;:</td>
							<td><input name="bankname" id="bankname" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
							<td align="right"><sup class="saptaColor">*</sup>Card/Cheque No&nbsp;:</td>
							<td><input class ="card" name="cardno" id="cardno" type="text"  onkeypress="return validateNumeric(event)"/></td>
						</tr>
						<tr>
							<td align="right">Bill No&nbsp;:</td>
							<td><input name="billno" id="billno" type="text" /></td>
							<td align="right"><sup class="saptaColor">*</sup>Description&nbsp;:</td>
							<td><textarea style="height: 100px; resize:none;" id="desc" name="desc"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="clearWidth">
					<div class="clearTable rightElement">
						<div class="leftElement MRGL10PX">
							<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
						</div>
						<div class="rightElement MRGL10PX">
							<input type="button" value="Submit" id="addExpense"/>
						</div>
					</div>
				</div>
				<div id="userMsg" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id="userMsgContent"></div>
					<div class="clearWidth MRGT10PX">
						<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
					</div>
				</div> 
				<div id="confirmMsg" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
				</div>
			</div>
			<div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
		<!--Content Area END-->
		</div> 
		<%@include file="footer.jsp"%>  
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_misc").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Expense");
			
			$(function() {
	            $( "#date" ).datepicker({
	               yearRange: '1950:2100',
				   defaultDate: new Date(),
	               changeMonth:true,
	               changeYear:true,
	               showOn: "button",
	               buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
	               buttonImageOnly: true,
	               dateFormat :"dd-mm-yy"
	            });
	         });
			$('#paymode').on('change', function (e){
				var optionval = $("option:selected", this);
				if(optionval.val() != "c" && optionval.val() != "o" ){
					$("#payDetails").removeClass("hidden");
				}
				else{
					$("#payDetails").addClass("hidden");
				}
			});
			$('#addExpense').click(function(){
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				var date = $("#date").datepicker().val();
				date = date.split('/').join('-');
				var category = $("#category").val();
				var exptypeid = $("#expensetype").val();
				var desc = $("#desc").val();
				var billno = $("#billno").val();
				var amount = $("#amount").val();
				var mode = $("#paymode").val();
				var cardno = $("#cardno").val();
				var bankname = $("#bankname").val();
				if(date == "" || date.length == 0) validation = false;
				if(exptypeid == "" || exptypeid.length == 0) validation = false;
				if(desc == "" || desc.length == 0) validation = false;
				if(mode == "" || mode.length == 0) validation = false;
				if(amount == "" || amount.length == 0) validation = false;
				if (mode != "c" && mode != "o"){
					if(cardno == "" || cardno.length == 0) validation = false;
					if(bankname == "" || bankname.length == 0) validation = false;
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(billno == "" || billno.length == 0) billno = "null";
					if (mode == "c" || mode == "o"){
						if(cardno == "" || cardno.length == 0) cardno = "null";
						if(bankname == "" || bankname.length == 0) bankname = "null";
					} 
					var resourceURL = $("#contextpath").val()+"/expense/add/"+category+"/"+date+"/"+exptypeid+"/"+desc+"/"+billno+"/"+mode+"/"+cardno+"/"+amount+"/"+bankname;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data) {  
							$("#date").val("");
							$("#expensetype").val("");
							$("#desc").val("");
							$("#billno").val("");
							$("#paymode").val("");
							$("#cardno").val("");
							$("#bankname").val("");
							$("#amount").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("Expense added successfully...");
								$.fancybox.open('#userMsg');
							}else{
								$("#errorMsgContent").html(errors);
								$.fancybox.open('#errorMsg');
							} 
							
						},
						error: function (xhr, ajaxOptions, thrownError){
							$("#block_overlay").addClass("hidden");
							$("#errorMsgContent").html(thrownError);
							$.fancybox.open('#errorMsg');
						}
				   });
				}
				$("body").css("cursor", "default");
			});
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>
		