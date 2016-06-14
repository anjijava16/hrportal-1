<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="head.jsp"%>
<body>
	<!--Header Start-->
	<%@include file="menucomponents.jsp"%>
	<!--Header End-->
	<div id="innerContainer">

		<!--Expense Type List-->
		<div id="expenseTypeDetails" class="hidden">
			<h1>
				<b class="saptaColor">Add</b> New
			</h1>
			<b class="saptaColor"><div id="notify_error1"></div></b>
			<table id="expenseTypeTable">
				<tr>
					<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
					<td><input name="name" id="name" type="text"
						onkeypress="return ValidateAlpha(event)" /></td>
					<td align="right"><sup class="saptaColor">*</sup>Display
						Name&nbsp;:</td>
					<td><input name="dispname" id="dispname" type="text"
						onkeypress="return ValidateAlpha(event)" /></td>
				</tr>
			</table>
			<div class="addNewBtn">
				<div class="rightElement">
					<a href="#" style="text-decoration: none"><input id="decline"
						type="button" value="Decline" class="graybtn"
						style="margin-left: 3px;" /></a>
				</div>
				<div class="rightElement">
					<input type="button" value="Submit" id="addExpenseTypeDetails" />
				</div>
			</div>
			<br/><br/><br/>
			<div style="text-align: center;">
				<b class="saptaColor">*</b>mandatory fields
			</div>
		</div>
		<div id="expenseTypeList" style="padding: 10px;">
			<div id="expenseType">
				<div id="addexpnse"
					style="cursor: pointer; margin-top: 0px; float: right"
					class="rightElement MRGR10PX MRGT10PX MRGB10PX">
					<img src="<%=request.getContextPath()%>/resources/images/add.png"
						alt="Add More" title="Add new expense type" />
				</div>
				<div id="addpftextid" class="addbutntext"><b class="saptaColor">New</b> Expense Type </div>

				<div class="responsive">
					<table class="data display" id="expensetypetable" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th class="first">Name</th>
								<th class="">Display&nbsp;Name</th>
								<th class="">Operation</th>
							</tr>
						</thead>
						<c:forEach items="${expenseTypeList}" var="expenseType">
							<tr>
								<td id="name_${expenseType.id}">${expenseType.name}</td>
								<td id="number_${expenseType.id}">${expenseType.dispname}</td>
								<td style="text-align: center"><a href='#'
									id="edit_${expenseType.id}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
									href='#' id="delete_${expenseType.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div width="100%" style="margin-bottom: 10px;">&nbsp;</div>
			</div>
		</div>
		<div id="editdetail" class="hidden">
			<h1>
				Update <b class="saptaColor">Expense Details</b>
			</h1>
			<b class="saptaColor"><div id="notify_error"></div></b>
			<table>
				<tr>
					<td align="right"><sup class="saptaColor">*</sup>Name&nbsp;:</td>
					<td><input name="editname" id="editname" type="text"
						onkeypress="return ValidateAlpha(event)" /></td>
				</tr>
				<tr>
					<td align="right"><sup class="saptaColor">*</sup>Display
						Name&nbsp;:</td>
					<td><input name="editdispname" id="editdispname" type="text"
						onkeypress="return ValidateAlpha(event)" /></td>
				</tr>
				<tr class="hidden">
					<td colspan="2" align="left"><input name="editid" id="editid"
						type="text" /></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2" align="left">
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="leftElement">
									<input type="button" value="Update" id="updateDetails"
										style="margin-right: 10px;" />
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div style="text-align: center;">
				<b class="saptaColor">*</b>mandatory fields
			</div>
		</div>
		<div id="expenseMsg" class="hidden">
			<h1>
				<b class="saptaColor">Notification</b>
			</h1>
			<div id="expenseMsgContent"></div>
			<div class="clearWidth MRGT10PX">
				<a href="<%=request.getContextPath()%>/expensetype"
					id="menu_miscellaneous"><input type="button" value="Done"
					id="expense" /></a>
			</div>
		</div>
		<div id="userMsg" class="hidden">
			<h1>
				<b class="saptaColor">Notification</b>
			</h1>
			<div id="userMsgContent"></div>
			<div class="clearWidth MRGT10PX">
				<a href="<%=request.getContextPath()%>/expensetype"
					id="menu_miscellaneous"><input type="button" value="Done"
					id="user" /></a>
			</div>
		</div>
		<div id="confirmMsg" class="hidden">
			<h1>
				<b class="saptaColor">Notification</b>
			</h1>
			<div id="confirmMsgContent"></div>
			<div class="clearTable rightElement MRGT10PX">
				<div class="leftElement">
					<a href="#" id="confirmation"><input type="button"
						value="Yes I'm" id="user" /></a>
				</div>
				<div class="rightElement MRGL10PX">
					<a href="<%=request.getContextPath()%>/expensetype"
						style="text-decoration: none"><input type="button"
						value="Cancel" class="graybtn" id="decline" />&nbsp;</a>
				</div>
			</div>
		</div>
		<div id="confirmMsgDecline" class="hidden">
			<h1>
				<b class="saptaColor">Confirmation</b>
			</h1>
			<div id="confirmationMsgContentDecline"></div>
			<input type="button" id="decline_no" class="rightElement graybtn"
				value="Cancel" style="margin-top: 10px;"> <a
				href="<%=request.getContextPath()%>/home"
				style="text-decoration: none"><input type="button"
				id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm"
				style="margin-top: 10px">&nbsp;</a>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
<script type="text/javascript">
	$(document).ready(function() {
						$("body").css("cursor", "progress");
						$("#pageTitle").html(
								"Expense Type <b class='saptaColor'>List</b> ");
						$(function() {
							$("#expensetypetable").dataTable({
								 "aaSorting" : []
							});
						})
						$("#menu_misc").addClass("active");
						var expenseTypeListSize = "${expenseTypeListSize}";
						$("a[id^='edit_']").click(function() {
							$("body").css("cursor", "progress");
							var id = $(this).attr('id');
							var recordid = id.substring(5);
							$("#notify_error").html("");
							<c:forEach items="${expenseTypeList}" var="expense">
							if ("${expense.id}" == recordid) {
								$("#editname").val("${expense.name}");
								$("#editdispname").val("${expense.dispname}");
								$("#editid").val("${expense.id}");
							}
							</c:forEach>
							$.fancybox.open('#editdetail');
							$("body").css("cursor", "default");
						});

						$('#updateDetails').click(function() {
							$("#block_overlay").removeClass("hidden");
											$("body").css("cursor", "progress");
											var validation = true;
											var name = $("#editname").val();
											var dispname = $("#editdispname")
													.val();
											var id = $("#editid").val();
											if (name == "" || name.length == 0)
												validation = false;
											if (dispname == ""
													|| dispname.length == 0)
												validation = false;
											if (id == "none" || id.length == 0)
												validation = false;
											if (validation == false) {
												$("#block_overlay").addClass("hidden");
												$("#notify_error").html("All necessary information has not been provided or it may be invalid data");
											} else {
												var resourceURL = $(
														"#contextpath").val()
														+ "/expensetype/update/"
														+ id
														+ "/"
														+ name
														+ "/"
														+ dispname;
												$.ajax({
															url : resourceURL,
															type : 'GET',
															dataType : 'json',
															success : function(
																	data) {
																var successflag = data.response.successflag;
																var errors = data.response.errors;
																$("#block_overlay").addClass("hidden");
																if (successflag == "true") {
																	$(
																			"#editname")
																			.val(
																					'');
																	$(
																			"#editdispname")
																			.val(
																					'');
																	$("#editid")
																			.val(
																					'');
																	$(
																			"#userMsgContent")
																			.html(
																					"Details updated successfully...");
																	$.fancybox
																			.open(
																					'#userMsg',
																					{
																						closeBtn : false
																					});

																} else {
																	$(
																			"#errorMsgContent")
																			.html(
																					errors);
																	$.fancybox
																			.open('#errorMsg');
																}

															},
															error : function(
																	xhr,
																	ajaxOptions,
																	thrownError) {
																$("#block_overlay").addClass("hidden");
																$(
																		"#errorMsgContent")
																		.html(
																				thrownError);
																$.fancybox
																		.open('#errorMsg');
															}
														});
											}
											$("body").css("cursor", "default");
										});

						$("a[id^='delete_']").click(function() {
											$("body").css("cursor", "progress");
											$("#confirmMsgContent")
													.html(
															"Are you sure want to delete...?");
											$.fancybox.open('#confirmMsg', {
												hideOnOverlayClick : false
											});
											$("#block_overlay").removeClass("hidden");
											var id = $(this).attr('id');
											var recordid = id.substring(7);
											$("#confirmation").click(function() {
																var resourceURL = $(
																		"#contextpath")
																		.val()
																		+ "/expensetype/delete/"
																		+ recordid;
																$.ajax({
																			url : resourceURL,
																			type : 'GET',
																			dataType : 'json',
																			success : function(
																					data) {
																				var successflag = data.response.successflag;
																				var errors = data.response.errors;
																				$("#block_overlay").addClass("hidden");
																				if (successflag == "true") {
																					$(
																							"#userMsgContent")
																							.html(
																									"Deleted successfully...");
																					$.fancybox
																							.open(
																									'#userMsg',
																									{
																										closeBtn : false
																									});

																				} else {
																					$(
																							"#errorMsgContent")
																							.html(
																									"Parent row cant be deleted...");
																					$.fancybox
																							.open('#errorMsg');
																				}

																			},

																			error : function(
																					xhr,
																					ajaxOptions,
																					thrownError) {
																			}
																		});
															});
											$("body").css("cursor", "default");
										});

						$('#addExpenseTypeDetails').click(function() {
										$("#block_overlay").removeClass("hidden");
											$("body").css("cursor", "progress");
											var validation = true;
											var name = $("#name").val();
											var dispname = $("#dispname").val();
											if (name == "" || name.length == 0)
												validation = false;
											if (dispname == ""
													|| dispname.length == 0)
												validation = false;
											if (validation == false) {
												$("#block_overlay").addClass("hidden");
												$("#notify_error1")
														.html(
																"All necessary information has not been provided or it may be invalid data");
											} else {
												var resourceURL = $(
														"#contextpath").val()
														+ "/expensetype/add/"
														+ name + "/" + dispname;

												$.ajax({
															url : resourceURL,
															type : 'GET',
															dataType : 'json',
															success : function(
																	data) {
																var successflag = data.response.successflag;
																var errors = data.response.errors;
																$("#block_overlay").addClass("hidden");
																if (successflag == "true") {
																	$("#name")
																			.val(
																					'');
																	$(
																			"#dispname")
																			.val(
																					'');
																	$(
																			"#expenseMsgContent")
																			.html(
																					"Expense Type added successfully...");
																	$.fancybox
																			.open(
																					'#expenseMsg',
																					{
																						closeBtn : false
																					});
																} else {
																	$(
																			"#errorMsgContent")
																			.html(
																					errors);
																	$.fancybox
																			.open('#errorMsg');
																}
															},
															error : function(
																	xhr,
																	ajaxOptions,
																	thrownError) {
																$("#block_overlay").addClass("hidden");
																$(
																		"#errorMsgContent")
																		.html(
																				thrownError);
																$.fancybox
																		.open('#errorMsg');
															}
														});
											}
											$("body").css("cursor", "default");
										});

						$("#decline").click(function() {
											$("#confirmationMsgContentDecline")
													.html(
															"Are you sure want to decline...?");
											$.fancybox
													.open('#confirmMsgDecline');
										});
						$("#decline_no").click(function() {
							$.fancybox.open('#expenseTypeDetails');
						});
						$('#user').click(function() {
							$("body").css("cursor", "progress");
						});

						$('#addexpnse').click(function() {
							$("#name").val('');
							$("#dispname").val('');
							$.fancybox.open('#expenseTypeDetails');
							$("body").css("cursor", "default");
						});
						$("body").css("cursor", "default");
					});
</script>
</html>