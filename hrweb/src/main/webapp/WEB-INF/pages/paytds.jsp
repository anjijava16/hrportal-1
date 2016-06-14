<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<style>
			.ui-datepicker-trigger{
				margin-top: 13px;
				margin-left: 11px;
			}
			.ui-datepicker-calendar{
					display:none;
			}
		</style> 
	</head>
	<body>
		<%@include file="menucomponents.jsp"%>
		 <div id="innerContainer">
			<!--Content Area START-->
			<div id="contentArea">
				<div id="tds">
					<table id="tdsearch">
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>TDS Month&nbsp;:</td>
							<td><b style="float:left"><input name="tdm" id="tdm" type="text" class="datePcK" readonly="readonly" style="font-weight: bold;"/></b></td>
							<td align="right"><sup class="saptaColor">*</sup>Amount&nbsp;:</td>
							<td><input name="amount" id="amount" type="text" style="onkeypress="return validateNumericWithPrecision(event)"/></td>
						</tr>
						<tr>
							<td align="right"><sup class="saptaColor">*</sup>References&nbsp;:</td>
							<td><textarea style="height: 100px; resize:none;" id="references" name="references"></textarea></td>
							<td align="right"><!-- <sup class="saptaColor">*</sup> -->Comments&nbsp;:</td>
							<td><textarea style="height: 100px; resize:none;" id="comments" name="comments"></textarea></td>
						</tr>
					</table>
					<div class="clearWidth">
						<div class="clearTable rightElement">
							<div class="leftElement MRGL10PX">
								<a href ="#" style="text-decoration: none"><input id="decline" type="button" value="Decline" class="graybtn" />&nbsp;</a>
							</div>
							<div class="rightElement MRGL10PX">
								<input type="button" value="Submit" id="payTds"/>
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
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none"><input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">&nbsp;</a>
					</div>
				</div>
			</div>
			<div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
		<!--Content Area END-->
		</div>   
		<%@include file="footer.jsp"%>
	</body>
	  <script type="text/javascript">
	 		$(document).ready(function(){
	 			$("#pageTitle").html("<b class='saptaColor'>Pay</b> TDS");
		  		$("#menu_payroll").addClass("active");
			
			
			$(function() {
	            $( "#tdm" ).datepicker({
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
			
			$('#payTds').click(function(){
				$("#block_overlay").removeClass("hidden");
				var validation = true;
				//tds
				var tdsmonth = $("#tdm").datepicker().val();
				if(tdsmonth != ""){
					tdsmonth = monthConversion(tdsmonth);
					tdsmonth = tdsmonth.split('/').join('-'); 
				}
				var amount = $("#amount").val();
				var refer = $("#references").val();
				var comments = $("#comments").val();
				if(tdsmonth == "" || tdsmonth.length == 0) validation = false;
				if(amount == "" || amount.length == 0) validation = false;
				if(refer == "" || refer.length == 0) validation = false;
				/* if(comments == "" || comments.length == 0) validation = false; */
				 
				if(validation == false){
					$("#block_overlay").addClass("hidden");
					$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
					$.fancybox.open('#errorMsg');
				}else{
					if(comments == "" || comments.length == 0) comments == "null";
					var resourceURL = $("#contextpath").val()+"/tds/add/"+tdsmonth+"/"+amount+"/"+refer+"/"+comments;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Project
							$("#tdm").val("");
							$("#amount").val("");
							$("#references").val("");
							$("#comments").val("");
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							$("#block_overlay").addClass("hidden");
							if(successflag == "true"){
								$("#userMsgContent").html("TDS added successfully ...");
								$.fancybox.open('#userMsg');
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

			
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsg');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			
			$('#user').click(function() {
			});
			
		});
	</script>
</html>