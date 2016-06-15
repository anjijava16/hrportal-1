<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%@include file="head.jsp"%>
	<head>
		<style type="text/css">
			.ui-datepicker-trigger {
			    margin-left: 11px;
			    margin-top: 15px;
			}
		</style>
	</head>
	<body>
		<!--Header Start-->
			<%@include file="menucomponents.jsp"%>
		<!--Header End-->
		<div id="innerContainer">
			<!--Header Start-->
		
			<!--Header End--> 
			<!--Content Area START-->
			<div id="contentArea">
				<div id="project">
					<div id = "projectselect"  style="width:100%" >
						<table align ="center" >
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
						</table>
					</div>	
					<div id ="addprojectdetail" class="hidden">	
					<table id="project">
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
								<td><input name="name" id="name" type="text" style="height: 25px" /></td>
								<td align="right"><sup class="saptaColor">*</sup>Display Name&nbsp;:</td>
								<td><input name="dispname" id="dispname" type="text" style=" height: 25px" /></td>
							</tr>
						    <tr>
								<td align="right"><sup class="saptaColor">*</sup>Project Code&nbsp;:</td>
								<td><input name="prjctcode" id="prjctcode" type="text" style="height: 25px" /></td>
								<td align="right"><sup class="saptaColor">*</sup>Type&nbsp;:</td>
								<td><input name="type" id="type" type="text" style=" height: 25px" onkeypress="return ValidateAlpha(event)"/></td>
							</tr>
							<tr>
								<td align="right"><sup class="saptaColor">*</sup>Start Date&nbsp;:</td>
								<td><b style="float:left"><input name="startdate" id="startdate" readonly="readonly" type="text" style=" height: 25px" class="datePcK"/></b></td>
								<td align="right">End Date&nbsp;:</td>
								<td><b style="float:left"><input name="enddate" id="enddate" type="text" readonly="readonly" style=" height: 25px" class="datePcK"/></b></td>
							</tr>
							<tr>
								<td align="right">Status&nbsp;:</td>
								<td>
									<select name="status" id="status" style=" height: 25px; text-align:center;">
										<!-- <option value="" style="text-align:center"> --- Select --- </option> -->
										<option value="a" style="text-align:left">Active</option>
										<option value="i" style="text-align:left">Closed</option>
								    </select>
							    </td>
								<td align="right">Description&nbsp;:</td>
								<td><textarea style="height: 100px; resize:none;" id="description" name="description"></textarea></td>
							</tr>	
						</table>
						
						<div class="clearWidth">
							<div class="clearTable rightElement">
								
								<div class="rightElement MRGL10PX">
									<input type="button" value="Submit" id="addProject"/>	
								</div>
								<div class="leftElement">
									<input id="decline" type="button" value="Decline" class="graybtn" />
								</div>
							</div>
						</div>
						 <div style="text-align: center;" class="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					  </div>
					 
				  	<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
							<div class="clearWidth MRGT10PX">
								<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
							</div>
					</div>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style="margin-top: 10px; ">
					<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
						<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
					</a>	
				</div>	
			</div>
			<!--Content Area END-->
		</div>   
		<%@include file="footer.jsp"%>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("body").css("cursor", "progress");
			$("#menu_project").addClass("active");
			$("#pageTitle").html("<b class='saptaColor'>New</b> Project");
			$(function() {
				 $( "#startdate, #enddate" ).datepicker({
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
			
			$('#customerid').on('change', function (e){
				if($("#customerid").val() != "")
					 $("#addprojectdetail").removeClass("hidden");
				 else
					 $("#addprojectdetail").addClass("hidden");
		    });
			
			$('#addProject').click(function() {
				$("#block_overlay").removeClass("hidden");
				$("body").css("cursor", "progress");
				var validation = true;
				//project
				var customerid = $("#customerid").val();
				var prjctcode = $("#prjctcode").val(); 
				var name = $("#name").val();
				var dispname = $("#dispname").val();
				var type = $("#type").val();
				var status = $("#status").val();
				var description = $("#description").val();
				var startdate = $("#startdate").datepicker().val();
				startdate = startdate.split('/').join('-');
				var enddate = $("#enddate").datepicker().val();
				enddate = enddate.split('/').join('-');
				var edatevalidation = "";
				
				if(customerid == "" || customerid.length == 0) validation = false;
				if(name == "" || name.length == 0) validation = false;
				if(prjctcode == "" || prjctcode.length == 0) validation = false;
				if(dispname == "" || dispname.length == 0) validation = false;
				if(status == "" || status.length == 0) validation = false;
				if(type == "" || type.length == 0) validation = false;
				if(startdate == "" || startdate.length == 0) validation = false;
				var startdatevalidation = $.datepicker.parseDate('dd-mm-yy',startdate);
				if(enddate != ""){
					enddatevalidation = $.datepicker.parseDate('dd-mm-yy',enddate);
					if ((startdatevalidation) > (enddatevalidation))  validation = false;
				}else{
					enddate = "null";
				}
				if(validation == false){
					$("#block_overlay").addClass("hidden");
		    		$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
		    		$.fancybox.open('#errorMsg');
				}else{
					if( description == "" ||  description.length == 0)  description = "null";
					if( enddate == "" ||  enddate.length == 0)  enddate = "null";
					
					 var resourceURL = $("#contextpath").val()+"/project/add/"+customerid+"/"+name+"/"+dispname+"/"+type+"/"+status+"/"+description+"/"+startdate+"/"+enddate+"/"+prjctcode;
						$.ajax({
				        url : resourceURL,
				        type : 'GET',
				        dataType : 'json',
				        success: function(data) {
				        	$("#customerid").val("");
				        	$("#name").val("");
							$("#dispname").val("");
							$("#type").val("");
							$("#status").val("a");
							$("#description").val("");
							$("#startdate").val("");
							$("#enddate").val("");
							$("#prjctcode").val("");
				        	var successflag = data.response.successflag;
				        	var errors = data.response.errors;
				        	var results = data.response.result;
				        	$("#block_overlay").addClass("hidden");
				        	if(successflag == "true"){
							    $("#userMsgContent").html("Project added successfully ...");
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
				$.fancybox.open('#confirmMsgDecline');
			});
			 $("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $('#decline_yes').click(function() {
				$("body").css("cursor", "default");
			}); 
			 
			$('#user').click(function() {
				$("body").css("cursor", "progress");
			});
			$("body").css("cursor", "default");
		});
	</script>
</html>