<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<%@include file="head.jsp"%>
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
							<li class="active"><a href="<%=request.getContextPath() %>/employee" id="menu_employee">Employee</a></li>
							<li><a href="#" id="menu_project">Project</a>
								<ul class="sub_menu">
									<li><a href="<%=request.getContextPath() %>/project/addproject">Add Project</a></li>
									<li><a href="<%=request.getContextPath() %>/project/viewproject">View Project</a></li>
									<li><a href="<%=request.getContextPath() %>/customer" id="menu_customer">Customer</a></li>
									<li><a href="<%=request.getContextPath() %>/assignment" id="menu_assignment">Assignment</a> </li>
								</ul>
							</li>
							<li><a href="#" id="menu_asset">Payroll</a> 
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
			<!--Employee List Starts-->
				<div id="contentArea">
					<div align = "left" id="headlist"><h1>Employee<b class="saptaColor"> List</b></h1></div>
					<div align = "left" id="headdetail" class="hidden MRGT10PX"><h1>Employee<b class="saptaColor"> Detail</b></h1></div>
					<div id = "optiondiv" class="cmnTable">
						<table width = "443px" align ="center">
							<tr id="chooseoption">
								<td align="right" width = "150px">Choose Option</td>
								<td>:</td>
								<td align="left">						
									<select id="findoption" class="leftElement selectBox" tabindex="2" style="width: 200px; height:25px; margin:0; text-align:center">
										<option value="all" style="text-align:center">--- All ---</option>
										<option value="findbyid" style="text-align:left">Find By Employee Id</option>
									</select>
								</td>
							</tr>
						</table>
						<table width = "443px" align ="center"> 
							<tr id = "employeesearch" class = "hidden">
								<td align="right" width = "126px" style="padding-left: 85px;-webkit-padding-left: 79px;"><sup class="saptaColor">*</sup>Enter Employee Id</td>
								<td style=" padding-right: 6px;">:</td>
								<td align="left" colspan = "2" tabindex="2"style=" padding-left: 0px; ">
									<input name="empid" id="empid" type="text" style="width: 200px; height:22px; padding: 0px; margin-left: 7px;"/>
									<input type="button" value="Find" id="findByEmpId" style="float:none; padding-left: 6px; padding-right: 6px; padding-top: 6px; padding-bottom: 6px; margin-left: -4px;"/>
								</td>								
							</tr>
						</table>
						<div id = "mandatorycheck" class = "hidden" style="text-align: center;"><br/><b class="saptaColor">*</b>&nbsp;mandatory fields<br/></div>
					</div>
					<div id="employeeList" class="MRGT10PX">
						<table id="employeegridtable"></table>
						<div id="employeegridpager"></div>
					</div>
				</div>
				<div id="confirmMsgDecline" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline"></div>
					<input type="button" id="skillset_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="skillset_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline1" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline1"></div>
					<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline2" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline2"></div>
					<input type="button" id="empdetail_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="empdetail_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline3" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline3"></div>
					<input type="button" id="address_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="address_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline4" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline4"></div>
					<input type="button" id="familydetails_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="familydetails_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline5" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline5"></div>
					<input type="button" id="education_decline_no" class="rightElement graybtn" value="Cancel" style="; margin-top: 10px; ">
					<input type="button" id="education_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline6" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline6"></div>
					<input type="button" id="references_decline_no" class="rightElement graybtn" value="Cancel" style="; margin-top: 10px; ">
					<input type="button" id="references_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline7" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline7"></div>
					<input type="button" id="languageknown_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="languageknown_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline8" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline8"></div>
					<input type="button" id="employmenthistory_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="employmenthistory_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline9" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline9"></div>
					<input type="button" id="achievements_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="achievements_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline10" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline10"></div>
					<input type="button" id="culturals_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="culturals_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline11" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline11"></div>
					<input type="button" id="sports_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="sports_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline12" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline12"></div>
					<input type="button" id="emp_about_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="emp_about_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="confirmMsgDecline13" class="hidden" >
					<h1><b class="saptaColor">Confirmation</b></h1>
					<div id="confirmationMsgContentDecline13"></div>
					<input type="button" id="empbank_acc_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
					<input type="button" id="empbank_acc_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
				</div>
				<div id="norecords" class="hidden MRGT10PX">
					<h1 align="center" id="noListAvailable">Details<b class="saptaColor"> Not Available</b> </h1>
				</div>
			<!-- Employee List End -->
			<!-- Employee Details Over All Starts -->
				<div id="employeeDetail" class="hidden MRGT10PX">
					<div align = "left"  id="back_employeelist" class = ""><a href="#" onclick="decline()" id="show_employeelist">Employee List </a>/ Employee Details</div><br/>
					<div class = "content">
						<div class = "nav">
							Employee
						</div>
							<c:choose>
								<c:when test="${ session.groupname == 'ad'}">
									<td align = "right"><input type="button" value="Edit" id="edit"/></td>	
								</c:when>
							</c:choose>	
						<div id="updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="update"/>
							<input  id="decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>		
			<!-- Employee Starts -->
						<table class="tableContent">
							<tr class = "">
								<td class="lableContent">Employee Id</td>
								<td class="value"><input id="emp_id" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">First Name</td>
								<td class="value"><input id="firstname" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Middle Name</td>
								<td class="value"><input id="middlename" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Last Name</td>
								<td class="value"><input id="lastname" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Email</td>
								<td class="value"><input id="emailid" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Mobile</td>
								<td class="value"><input id="mobileno" disabled="disabled" class="inputdisable" maxlength="10" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Phone</td>
								<td class="value"><input id="phone" disabled="disabled" class="inputdisable" maxlength="10" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContentSelect">Status</td>
								<td class="valueContent">	
									<select id="status" class="selectBox hidden" style="margin:0px; text-align:center; width:217px;" class="inputdisable" >
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="a" style="text-align:center">Active</option>
										<option value="i" style="text-align:center">In-Active</option>
									</select>
									<div id="optional_status"></div>
								</td>
							</tr>
							<tr>
								<td class="lableContent">DL No</td>
								<td class="value"><input id="dlno" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">PAN</td>
								<td class="value"><input id="pan" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Passport</td>
								<td class="value"><input id="passport" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Place of Issued</td>
								<td class="value"><input id="pplaceofissued" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Valid Upto</td>
								<td class="value"><input id="pvalidupto" disabled="disabled" class="inputdisable"></input></td>
							</tr>
						</table>
					</div>
			<!-- Employee End -->
			<!-- Employee Details Starts-->
					<div class = "content">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="empdetail_edit"/></td>	
										
							</c:when>
						</c:choose>	
						<div id="empupdatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="empdetail_update"/>
							<input  id="empdetail_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>		
							<div class = "nav">
								Employee Details
							</div>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Date of Birth</td>
								<td class="value"><input id="dob" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Age</td>
								<td class="value"><input id="age" disabled="disabled" class="inputdisable" maxlength="2" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContentSelect">Gender</td>
								<td class="valueContent">	
									<select id="gender" class="selectBox hidden" style="margin:0px; text-align:center; width:217px;" class="inputdisable">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="m" style="text-align:center">Male</option>
										<option value="f" style="text-align:center">Female</option>
									</select>
									<div id="optional_gender" class="value"></div>
								</td>
							</tr>
							<tr>
								<td class="lableContent">Designation</td>
								<td class="value"><input id="postapplied" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Department</td>
								<td class="value"><input id="department" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Emergency No</td>
								<td class="value"><input id="emergencyno" disabled="disabled" class="inputdisable" maxlength="10" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Joining Date</td>
								<td class="value"><input id="jdate" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Releave Date</td>
								<td class="value"><input id="rdate" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContentSelect">Marital Status</td>
								<td class="valueContent">	
									<select id="marital" class="selectBox hidden" style="margin:0px; text-align:center; width:217px;" class="inputdisable">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="m" style="text-align:center">Married</option>
										<option value="u" style="text-align:center">Unmarried</option>
									</select>
									<div id="optional_marital" class="value"></div>
								</td>
							</tr>
							<tr>
								<td class="lableContent">Date Of Anniversary</td>
								<td class="value"><input id="doa" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Blood Group</td>
								<td class="value"><input id="b_group" disabled="disabled" class="inputdisable" maxlength="3"></input></td>
							</tr>
							<tr>
								<td class="lableContentSelect">Possess Vehicle</td>
								<td class="valueContent">	
									<select id="possessvehicle" class="selectBox hidden" style="margin:0px; text-align:center;width:217px;" class="inputdisable">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="y" style="text-align:center">Yes</option>
										<option value="n" style="text-align:center">No</option>
									</select>
									<div id="optional_possessvehicle" class="value"></div>
								</td>
							</tr>
							<tr>
								<td class="lableContentSelect">Illness / Accident</td>
								<td class="valueContent">	
									<select id="accidentillness" class="selectBox hidden" style="margin:0px; text-align:center;width:217px;" class="inputdisable">
										<option value="" style="text-align:center">--- Select ---</option>
										<option value="y" style="text-align:center">Yes</option>
										<option value="n" style="text-align:center">No</option>
									</select>
									<div id="optional_accidentillness" class="value"></div>
								</td>
							</tr>
							<tr>
								<td class="lableContent">Illness / Accident Description</td>
								<td class="value"><input id="illnessdescr" disabled="disabled" class="inputdisable"></input></td>
							</tr>
						</table>
					</div>
			<!-- Employee Details End -->
			<!-- Address details Starts-->
					<div class = "content">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="address_edit"/></td>	
										
							</c:when>
						</c:choose>	
						<div id="addrupdatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="addressUpdate"/>
							<input  id="address_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Address Details
						</div>
						<h1 align = "left" style="padding-top:25px;">Current Address</h1>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Street</td>
								<td class="value"><input id="cstreet" disabled="disabled" class="inputdisable"></input><input id="cid" disabled="disabled" class="hidden"></input></td>
							</tr>
							<tr>
								<td class="lableContent">City</td>
								<td class="value"><input id="ccity" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">State</td>
								<td class="value"><input id="cstate" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Country</td>
								<td class="value"><input id="ccountry" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Pincode</td>
								<td class="value"><input id="cpincode" maxlength="6" disabled="disabled" class="inputdisable"></input></td>
							</tr>
						</table>
						<h1 align = "left">Permanent Address</h1>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Street</td>
								<td class="value"><input id="pstreet" disabled="disabled" class="inputdisable"></input><input id="pid" disabled="disabled" class="hidden"></input></td>
							</tr>
							<tr>
								<td class="lableContent">City</td>
								<td class="value"><input id="pcity" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">State</td>
								<td class="value"><input id="pstate" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Country</td>
								<td class="value"><input id="pcountry" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Pincode</td>
								<td class="value"><input id="ppincode" maxlength="6" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"/></td>
							</tr>
						</table>
					</div>
			<!-- Address details End-->
			<!-- Employee Family Details Starts-->
					<div id="emp_family_background_details_div" class = "content">
					<div id="familydetails_edit_div">
						<c:choose>
							<c:when test="${session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="familydetails_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="familydetails_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="familydetails_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="familydetailsUpdate"/>
							<input  id="familydetails_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Family Background
						</div>
					</div>
			<!-- Employee Family Details End-->
			<!-- Employee Education Details Starts-->
					<div id="emp_education_details_div" class = "content">
					<div id="education_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="education_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="education_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="education_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="educationUpdate"/>
							<input  id="education_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Education Details
						</div>
					</div>
			<!-- Employee Education Details End-->
			<!-- Employee Skill Set Starts-->
					<div id="emp_skillset_details_div" class = "content">
					<div id="skillset_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="skillset_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="skillset_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="skillset_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="skillsetUpdate"/>
							<input  id="skillset_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Skill Set
						</div>
					</div>
			<!-- Employee Skill Set End-->
			<!-- Employee Reference Starts-->
					<div id="emp_references_details_div" class = "content">
					<div id="references_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="references_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="references_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="references_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="referenceUpdate"/>
							<input  id="references_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Reference Details
						</div>
					</div>
			<!-- Employee Reference End-->
			<!-- Employee Language Known Starts-->
					<div id="emp_languageknown_details_div" class = "content">
					<div id="languageknown_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="languageknown_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="languageknown_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="languageknown_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="languageknownUpdate"/>
							<input  id="languageknown_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Language Known
						</div>
					</div>
			<!-- Employee Language Known End-->
			<!-- Employee Employment History Starts-->
					<div id="emp_employmenthistory_details_div" class = "content">
					<div id="employmenthistory_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="employmenthistory_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="employmenthistory_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="employmenthistory_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="employmenthistoryUpdate"/>
							<input  id="employmenthistory_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Employment History
						</div>
					</div>
			<!-- Employee Employment History End-->
			<!-- Employee Achievements Starts-->
					<div id="emp_achievements_details_div" class = "content">
					<div id="achievements_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="achievements_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="achievements_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="achievements_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="achievementsUpdate"/>
							<input  id="achievements_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Achievement Activities
						</div>
					</div>
			<!-- Employee Achievements End-->
			<!-- Employee Culturals Starts-->
					<div id="emp_culturals_details_div" class = "content">
					<div id="culturals_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="culturals_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="culturals_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="culturals_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="culturalsUpdate"/>
							<input  id="culturals_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Cultural Activities
						</div>
					</div>
			<!-- Employee Culturals End-->
			<!-- Employee Sports Starts-->
					<div id="emp_sports_details_div" class = "content">
					<div id="sports_edit_div">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="sports_edit"/></td>	
								<td align = "right"><input class="rightElement MRGR10PX" type="button" value="Add More"  id="sports_addmore"/></td>		
							</c:when>
						</c:choose>
					</div>	
						<div id="sports_updatebutton" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="sportsUpdate"/>
							<input  id="sports_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>	
						<div class = "nav">
							Employee Sports Activity
						</div>
					</div>
			<!-- Employee Sports End-->
			<!-- Employee About details Starts -->
					<div class = "content">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="emp_about_edit"/></td>	
										
							</c:when>
						</c:choose>	
						<div id="emp_about_update_button" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="emp_about_update"/>
							<input  id="emp_about_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>		
						<div class = "nav">
							Employee About
						</div>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Strength</td>
								<td class="value"><input id="emp_strength" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Weakness</td>
								<td class="value"><input id="emp_weakness" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Total Experience</td>
								<td class="value"><input id="emp_totalexp" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Relevent Experience</td>
								<td class="value"><input id="emp_releventexp" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Present Salary</td>
								<td class="value"><input id="emp_presentsalary" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Expected Salary</td>
								<td class="value"><input id="emp_expectedsalary" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></input><input id="emp_abt_id" disabled="disabled" class="hidden"></input></td>
							</tr>
						</table>
					</div>
			<!-- Employee About details End -->
			<!-- Employee Bank Account details Starts -->
					<div class = "content">
						<c:choose>
							<c:when test="${ session.groupname == 'ad'}">
								<td align = "right"><input type="button" value="Edit" id="empbank_acc_edit"/></td>	
										
							</c:when>
						</c:choose>	
						<div id="empbank_acc_update_button" class="hidden" align="left">
							<input class="leftElement MRGL10PX" type="button" value="Update"  id="empbank_acc_update"/>
							<input  id="empbank_acc_decline" class="rightElement graybtn" type="button" value="Decline"   align="left"/>
						</div>		
						<div class = "nav">
							Employee Bank Details
						</div>
						<table class="tableContent">
							<tr>
								<td class="lableContent">Bank Name</td>
								<td class="value"><input id="bank_name" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Bank Acc No</td>
								<td class="value"><input id="bank_accno" disabled="disabled" class="inputdisable" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Branch</td>
								<td class="value"><input id="bank_branch" disabled="disabled" class="inputdisable"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Address</td>
								<td class="value"><input id="bank_address" disabled="disabled" class="inputdisable" ></input></td>
							</tr>
							<tr>
								<td class="lableContent">City</td>
								<td class="value"><input id="bank_city" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">State</td>
								<td class="value"><input id="bank_state" disabled="disabled" class="inputdisable" onkeypress="return ValidateAlpha(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">Pincode</td>
								<td class="value"><input id="bank_pincode" disabled="disabled" minlength="6" maxlength="6"class="inputdisable" onkeypress="return validateNumeric(event)"></input></td>
							</tr>
							<tr>
								<td class="lableContent">IFS Code </td>
								<td class="value"><input id="bank_ifsc" disabled="disabled" class="inputdisable"></input></td>
							</tr>
						</table>
					</div>
			<!-- Employee Bank Account details End -->
				</div>
			<!-- Employee Details Over All End -->
					<div id="emp_add_familybackground" class="hidden">
						<div class = "content">
							<div class = "nav">
								Family Background
							</div>
							<br>
							<div id ="familybackground_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Relationship :</td>
									<td><input name="familybackground_relationship" id="familybackground_relationship" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right"><sup class="saptaColor">*</sup>Name :</td>
									<td><input name="familybackground_name" id="familybackground_name" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Age :</td>
									<td><input name="familybackground_age" id="familybackground_age" type="text" style="width: 215px;" maxlength="2" onkeypress="return validateNumeric(event)"/></td>
									<td align="right">Education</td>
									<td><input name="familybackground_education" id="familybackground_education" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
								</tr>
								<tr>
									<td align="right">Occupation :</td>
									<td><input name="familybackground_occupation" id="familybackground_occupation" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right"></td>
									<td></td>	
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_familydetails_btn"/>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div id="emp_add_educationdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Education
							</div>
							<br>
							<div id ="education_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Degree :</td>
									<td><input name="education_degree" id="education_degree" type="text" style="width: 215px;"  /></td>
									<td align="right"><sup class="saptaColor">*</sup>Specialization :</td>
									<td><input name="education_specialization" id="education_specialization" type="text" style="width: 215px;" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Rank / Scholarship :</td>
									<td><input name="education_rankscholarship" id="education_rankscholarship" type="text" style="width: 215px; height:25px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Institution Name :</td>
									<td><input name="education_institutionname" id="education_institutionname" type="text" style="width: 215px;" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>From :</td>
									<td><input name="education_from" id="education_from" type="text" style="width: 215px;"/></td>
									<td align="right"><sup class="saptaColor">*</sup>To :</td>
									<td><input name="education_to" id="education_to" type="text" style="width: 215px;"/></td>	
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_education_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_skillsetdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Skill Set
							</div>
							<br>
							<div id ="skillset_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Name :</td>
									<td><input name="emp_skillset_name" id="emp_skillset_name" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Level :</td>
									<td>
										<select name="emp_skillset_level" id="emp_skillset_level">
											<option value="" style="text-align:center">Select</option>
											<option value="b" style="text-align:center">Basic</option>
											<option value="a" style="text-align:center">Advanced</option>
											<option value="e" style="text-align:center">Expert</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_skillset_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_referencesdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee References
							</div>
							<br>
							<div id ="reference_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<form id="myform" method="post" action="">
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Name :</td>
									<td><input name="emp_reference_name" id="emp_reference_name" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right">Address :</td>
									<td><input name="emp_reference_address" id="emp_reference_address" type="text" style="width: 215px;" /></td>
								</tr>
								<tr>
									<td align="right">Phone :</td>
									<td><input name="emp_reference_phone" id="emp_reference_phone" type="text" style="width: 215px;" maxlength="10" onkeypress="return validateNumeric(event)"/></td>
									<td align="right"><sup class="saptaColor">*</sup>Mobile :</td>
									<td><input name="emp_reference_mobile" id="emp_reference_mobile" type="text" style="width: 215px;" maxlength="10" onkeypress="return validateNumeric(event)"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Skill :</td>
									<td><input name="emp_reference_skill" id="emp_reference_skill" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Designation :</td>
									<td><input name="emp_reference_designation" id="emp_reference_designation" type="text" style="width: 215px;" /></td>
								</tr>
							</table>
							</form>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_references_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_languageknowndetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Language Known
							</div>
							<br>
							<div id ="language_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Name :</td>
									<td><input name="emp_languageknown_name" id="emp_languageknown_name" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Read :</td>
									<td>
										<select name="emp_languageknown_read" id="emp_languageknown_read">
											<option value="" style="text-align:center">Select</option>
											<option value="y" style="text-align:left">Yes</option>
											<option value="n" style="text-align:left">No</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Write :</td>
									<td><select name="emp_languageknown_write" id="emp_languageknown_write">
											<option value="" style="text-align:center">Select</option>
											<option value="y" style="text-align:center">Yes</option>
											<option value="n" style="text-align:center">No</option>
										</select>
									</td>
									<td align="right" style="height: 25px;"><sup class="saptaColor">*</sup>Speak :</td>
									<td>
										<select name="emp_languageknown_speak" id="emp_languageknown_speak" style="margin: 0px; width: 217px;">
											<option value="" style="text-align:center">Select</option>
											<option value="y" style="text-align:center">Yes</option>
											<option value="n" style="text-align:center">No</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_languageknown_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_employmenthistorydetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Employment History
							</div>
							<br>
							<div id ="employmenthistory_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Name :</td>
									<td><input name="emp_employmenthistory_name" id="emp_employmenthistory_name" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right"><sup class="saptaColor">*</sup>Address :</td>
									<td><input name="emp_employmenthistory_address" id="emp_employmenthistory_address" type="text" style="width: 215px;" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>From Date :</td>
									<td><input name="emp_employmenthistory_fromdate" id="emp_employmenthistory_fromdate" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>To Date :</td>
									<td><input name="emp_employmenthistory_todate" id="emp_employmenthistory_todate" type="text" style="width: 215px;"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Starting Salary :</td>
									<td><input name="emp_employmenthistory_startingsalary" id="emp_employmenthistory_startingsalary" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Last Salary :</td>
									<td><input name="emp_employmenthistory_lastsalary" id="emp_employmenthistory_lastsalary" type="text" style="width: 215px;" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Designation :</td>
									<td><input name="emp_employmenthistory_designation" id="emp_employmenthistory_designation" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Responsibility :</td>
									<td><input name="emp_employmenthistory_responsibility" id="emp_employmenthistory_responsibility" type="text" style="width: 215px;" onkeypress="return ValidateAlpha(event)"/></td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_employmenthistory_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_achievementsdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Achievements
							</div>
							<br>
							<div id ="achievements_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Company Name :</td>
									<td><input name="emp_achievements_companyname" id="emp_achievements_companyname" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Achievement :</td>
									<td><input name="emp_achievements_achievement" id="emp_achievements_achievement" type="text" style="width: 215px;" /></td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_achievements_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_culturalsdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Culturals
							</div>
							<br>
							<div id ="culturals_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Event Name :</td>
									<td><input name="emp_culturals_eventname" id="emp_culturals_eventname" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Event Achievement :</td>
									<td><input name="emp_culturals_achievement" id="emp_culturals_achievement" type="text" style="width: 215px;" /></td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_culturals_btn"/>
								</div>
							</div>
						</div>
					</div>
					<div id="emp_add_sportsdetails" class="hidden">
						<div class = "content">
							<div class = "nav">
								Employee Sports
							</div>
							<br>
							<div id ="sports_validation_error_msg" class="hidden" style="margin-top:5px;"><font class="saptaColor"><b>All necessary information has not been provided or it may be invalid data</b></font></div>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Event Name :</td>
									<td><input name="emp_sports_eventname" id="emp_sports_eventname" type="text" style="width: 215px;" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Event Achievement :</td>
									<td><input name="emp_sports_achievement" id="emp_sports_achievement" type="text" style="width: 215px;" /></td>
								</tr>
							</table>
						</div>
						<div style="text-align: center;"><b class="saptaColor">*</b>&nbsp;mandatory fields</div>
						<div class="clearWidth">
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Add" id="emp_sports_btn"/>
								</div>
							</div>
						</div>
					</div>
					
					<div id ="addsuccessful_fancybox" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id = "successful_msg_content"></div>
							<a href ="<%=request.getContextPath() %>/employee/viewemployee" style="text-decoration: none">
							<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
						</div>
					</div>
			<footer>powered by <b><a href="http://saptalabs.com" target="_blank">saptalabs.com</a></b><sup>TM</sup>,&nbsp;copyright@2015 </footer>
		</body>
		<script>
			$(document).ready(function(){
				var count=0;
				var eduCount=0;
				var skillsetCount=0;
				var referenceCount=0;
				var historyCount=0;
				var languageknownCount=0;
				var achievementsCount=0;
				var culturalsCount=0;
				var sportsCount=0;
				$("body").css("cursor", "default");
				$(function() {
		            $( "#jdate, #rdate, #pvalidupto, #doa, #education_from, #education_to, #emp_employmenthistory_fromdate, #emp_employmenthistory_todate" ).datepicker({
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
				$(function() {
		            $( "#dob" ).datepicker({
		            	yearRange: '1950:2100',
						defaultDate: new Date(),
			            changeMonth:true,
			            changeYear:true,
			            maxDate: new Date(),
			            showOn: "button",
		               	buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
		                buttonImageOnly: true,
			            dateFormat :"dd-mm-yy"
		            });
		         });
				//Dynamic Added Text Box Properties
				$('body').on('focus',".datepicking", function(){
				    $(this).datepicker({
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
				$("#familydetails_addmore").click(function(){
					$.fancybox.open('#emp_add_familybackground');
				});
				$("#education_addmore").click(function(){
					$.fancybox.open('#emp_add_educationdetails');
				});
				$("#skillset_addmore").click(function(){
					$.fancybox.open('#emp_add_skillsetdetails');
				});
				$("#references_addmore").click(function(){
					$.fancybox.open('#emp_add_referencesdetails');
				});
				$("#languageknown_addmore").click(function(){
					$.fancybox.open('#emp_add_languageknowndetails');
				});
				$("#employmenthistory_addmore").click(function(){
					$.fancybox.open('#emp_add_employmenthistorydetails');
				});
				$("#achievements_addmore").click(function(){
					$.fancybox.open('#emp_add_achievementsdetails');
				});
				$("#culturals_addmore").click(function(){
					$.fancybox.open('#emp_add_culturalsdetails');
				});
				$("#sports_addmore").click(function(){
					$.fancybox.open('#emp_add_sportsdetails');
				});
				var employeesSize = "${employeeListSize}";
				if(employeesSize != null && employeesSize != 0){
					$("#employeeList").removeClass("hidden");
					$("#norecords").addClass("hidden");
				}else{
					$("#norecords").removeClass("hidden");
					$("#employeeList").addClass("hidden");
					$("#optiondiv").addClass("hidden");
					$("#headlist").addClass("hidden");
				} 
				var id = "${id}";
				var url = "";
				if(id == undefined || id == null || id.length <= 0 || id == ""){
					url = $("#contextpath").val()+"/employee/get";
				}else{
					url = $("#contextpath").val()+"/employee/getbyid/"+id;
				}
				jQuery("#employeegridtable").jqGrid({
					url: url,
					mtype: 'GET',
					ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
					datatype: "json", 
					colNames:['Employee Id','First Name', 'Last Name', 'Mobile', 'Email'], 
					colModel:[{name:'id',index:'id', width:120, resizable :false},
							  {name:'fname',index:'fname', width:200, resizable :true},
							  {name:'lname',index:'lname', width:150, resizable :true},
							  {name:'mobile',index:'mobile', width:150, resizable :false},
							  {name:'email',index:'email', width:293, resizable :true}],
					pagination:true,
					loadonce:true,
					height:'312px',
					rowNum:10, 
					rowList:[10,50,100],
					pager: '#employeegridpager', 
					viewrecords: true, 
					hidegrid: false,
					width: null,
					shrinkToFit:false, 
					onSelectRow: function(id){
						$('.ui-datepicker-trigger').addClass("hidden");
						viewEmployeeDetail(id);
					}
				});
				jQuery("#employeegridtable").jqGrid('navGrid','#employeegridpager',{edit:false, add:false, del:false, search:false});
			});
			function viewEmployeeDetail(id) {
				$("#employeeList").addClass("hidden");
				$("#employeeDetail").removeClass("hidden");
				$("#headlist").addClass("hidden");
				$("#headdetail").removeClass("hidden");
				EmployeeDetail(id);
			}
			$('#findoption').on('change', function (e) {
				$("#empid").val("");
				var optionval = $("option:selected", this);
				if(optionval.val() == "all"){
					var resourceURL = $("#contextpath").val()+"/employee/get";
					$("#employeegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#employeegridtable").trigger("reloadGrid");
					$("#employeeList").removeClass("hidden");
					$("#employeesearch").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#employeeDetail").addClass("hidden");
					//Remove Dynamic Div and Data
					$('[id^="emp_familybackground_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(25, id.length);
						$("#emp_familybackground_div_"+i).remove();
					});
					$('[id^="emp_education_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_education_div_"+i).remove();
					});
					$('[id^="emp_reference_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_reference_div_"+i).remove();
					});
					$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(17, id.length);
						$("#emp_skillset_div_"+i).remove();
					});
					$('[id^="emp_languageknown_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(22, dynamicid.length);
						$("#emp_languageknown_div_"+i).remove();
					});
					$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(26, dynamicid.length);
						$("#emp_employmenthistory_div_"+i).remove();
					});
					$('[id^="emp_achievements_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(21, dynamicid.length);
						$("#emp_achievements_div_"+i).remove();
					});
					$('[id^="emp_culturals_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_culturals_div_"+i).remove();
					});
					$('[id^="emp_sports_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(15, dynamicid.length);
						$("#emp_sports_div_"+i).remove();
					});
				}else if(optionval.val() == "findbyid"){
					$("#employeeList").addClass("hidden");
					$("#employeeDetail").addClass("hidden");
					$("#employeesearch").removeClass("hidden");
					$("#mandatorycheck").removeClass("hidden");
					$('#empid').on('change', function (e) {
						 if($("#empid").val() != ""){
							//$("#employeeList").removeClass("hidden");
							$("#employeeDetail").addClass("hidden");
							$("#mandatorycheck").addClass("hidden");
							
							//Remove Dynamic Div and Data
							$('[id^="emp_familybackground_div_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(25, id.length);
								$("#emp_familybackground_div_"+i).remove();
							});
							$('[id^="emp_education_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_education_div_"+i).remove();
							});
							$('[id^="emp_reference_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_reference_div_"+i).remove();
							});
							$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(17, id.length);
								$("#emp_skillset_div_"+i).remove();
							});
							$('[id^="emp_languageknown_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(22, dynamicid.length);
								$("#emp_languageknown_div_"+i).remove();
							});
							$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(26, dynamicid.length);
								$("#emp_employmenthistory_div_"+i).remove();
							});
							$('[id^="emp_achievements_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(21, dynamicid.length);
								$("#emp_achievements_div_"+i).remove();
							});
							$('[id^="emp_culturals_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_culturals_div_"+i).remove();
							});
							$('[id^="emp_sports_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(15, dynamicid.length);
								$("#emp_sports_div_"+i).remove();
							});
						}else{
							$("#employeeList").addClass("hidden");
							$("#employeeDetail").addClass("hidden");
							$("#employeesearch").removeClass("hidden");
							$("#mandatorycheck").removeClass("hidden");
							
							//Remove Dynamic Div and Data
							$('[id^="emp_familybackground_div_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(25, id.length);
								$("#emp_familybackground_div_"+i).remove();
							});
							$('[id^="emp_education_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_education_div_"+i).remove();
							});
							$('[id^="emp_reference_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_reference_div_"+i).remove();
							});
							$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(17, id.length);
								$("#emp_skillset_div_"+i).remove();
							});
							$('[id^="emp_languageknown_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(22, dynamicid.length);
								$("#emp_languageknown_div_"+i).remove();
							});
							$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(26, dynamicid.length);
								$("#emp_employmenthistory_div_"+i).remove();
							});
							$('[id^="emp_achievements_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(21, dynamicid.length);
								$("#emp_achievements_div_"+i).remove();
							});
							$('[id^="emp_culturals_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(18, dynamicid.length);
								$("#emp_culturals_div_"+i).remove();
							});
							$('[id^="emp_sports_div_"]').each(function(i, item) {
								var dynamicid = $(this).attr("id");
								var i = dynamicid.substring(15, dynamicid.length);
								$("#emp_sports_div_"+i).remove();
							});
						}
					});
				}
			});
			$('#empid').keypress(function(event){
				if(event.keyCode == 13) {
					$("#employeeList").addClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					$("#employeeDetail").addClass("hidden");
					findbyempid(); 
				} 
			});
			$("#findByEmpId").click(function() {
				$("#employeeList").addClass("hidden");
				$("#mandatorycheck").addClass("hidden");
				$("#employeeDetail").addClass("hidden");
				findbyempid();
			});
			function findbyempid(){
				var count = 0;
				var empid = $("#empid").val().split(" ").join("");
				<c:forEach items="${employeeList}" var="employee">
					if("${employee.id}" == empid){
						var resourceURL = $("#contextpath").val()+"/employee/getbyid/"+empid;
						$("#employeegridtable").setGridParam({
							url:resourceURL,
							mtype: 'GET',
							ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
							datatype: "json"
						});
						$("#employeegridtable").trigger("reloadGrid");
						count++;
						$("#employeeList").removeClass("hidden");
					}
				</c:forEach>
				if(count == 0){
					document.getElementById("alertMsgContent").innerHTML = "Employee details not found for the given id " + empid.bold();
					$.fancybox.open('#alertMsg');
					/* var resourceURL = $("#contextpath").val()+"/employee/get";
					$("#employeegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#employeegridtable").trigger("reloadGrid"); */
				}
			}
			$("#show_employeelist").click(function(){
				$("body").css("cursor", "progress");
				$('[id^="emp_familybackground_div_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(25, id.length);
						$("#emp_familybackground_div_"+i).remove();
					});
				$('[id^="emp_education_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_education_div_"+i).remove();
					});
				$('[id^="emp_reference_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_reference_div_"+i).remove();
					});
					$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(17, id.length);
						$("#emp_skillset_div_"+i).remove();
					});
					$('[id^="emp_languageknown_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(22, dynamicid.length);
						$("#emp_languageknown_div_"+i).remove();
					});
					$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(26, dynamicid.length);
						$("#emp_employmenthistory_div_"+i).remove();
					});
					$('[id^="emp_achievements_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(21, dynamicid.length);
						$("#emp_achievements_div_"+i).remove();
					});
					$('[id^="emp_culturals_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						$("#emp_culturals_div_"+i).remove();
					});
					$('[id^="emp_sports_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(15, dynamicid.length);
						$("#emp_sports_div_"+i).remove();
					});
					var resourceURL = $("#contextpath").val()+"/employee/get";
					$("#employeegridtable").setGridParam({
						url:resourceURL,
						mtype: 'GET',
						ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },                      
						datatype: "json"
					});
					$("#employeegridtable").trigger("reloadGrid");
					$("#employeeDetail").addClass("hidden");
					$("#employeeList").removeClass("hidden");
					$("#chooseoption").removeClass("hidden");
					$("#findoption").val("all");
					$("#empid").val("");
					$("#employeesearch").addClass("hidden");
					$("#headdetail").addClass("hidden");
					$("#headlist").removeClass("hidden");
					$("#mandatorycheck").addClass("hidden");
				$("body").css("cursor", "default");
			});
			$("#edit").click(function(){
				$("body").css("cursor", "progress");
				//Select box Properties
					$('.ui-datepicker-trigger').removeClass("hidden");
					$("#status").removeClass("hidden");
					$("#optional_status").addClass("hidden");
					
					$("#updatebutton").removeClass("hidden");
					$("#findoption").prop( 'disabled', true );
					$("#empid").prop( 'disabled', true );
					$("#edit").addClass("hidden");
					if($("#firstname").val() == "-"){
						$("#firstname").val("");
					}
					if($("#middlename").val() == "-"){
						$("#middlename").val("");
					}
					if($("#lastname").val() == "-"){
						$("#lastname").val("");
					}
					if($("#mobileno").val() == "-"){
						$("#mobileno").val("");
					}
					if($("#phone").val() == "-"){
						$("#phone").val("");
					}
					if($("#emailid").val() == "-"){
						$("#emailid").val("");
					}
					if($("#passport").val() == "-"){
						$("#passport").val("");
					}
					if($("#pplaceofissued").val() == "-"){
						$("#pplaceofissued").val("");
					}
					if($("#pvalidupto").val() == "-"){
						$("#pvalidupto").val("");
					}
					if($("#dlno").val() == "-"){
						$("#dlno").val("");
					}
					if($("#pan").val() == "-"){
						$("#pan").val("");
					}
					$("#firstname").prop( "disabled", false );
					$("#middlename").prop( "disabled", false );
					$("#lastname").prop( "disabled", false );
					$("#mobileno").prop( "disabled", false );
					$("#phone").prop( "disabled", false );
					$("#emailid").prop( "disabled", false );
					$("#passport").prop( "disabled", false );
					$("#pplaceofissued").prop( "disabled", false );
					$("#pvalidupto").prop( "disabled", false );
					$("#dlno").prop( "disabled", false );
					$("#pan").prop( "disabled", false );
					
					$("#emp_id").removeClass("inputdisable");
					$("#firstname").removeClass("inputdisable");
					$("#middlename").removeClass("inputdisable");
					$("#lastname").removeClass("inputdisable");
					$("#mobileno").removeClass("inputdisable");
					$("#phone").removeClass("inputdisable");
					$("#emailid").removeClass("inputdisable");
					$("#passport").removeClass("inputdisable");
					$("#pplaceofissued").removeClass("inputdisable");
					$("#pvalidupto").removeClass("inputdisable");
					$("#dlno").removeClass("inputdisable");
					$("#pan").removeClass("inputdisable");
					
					$("#emp_id").addClass("inputBorder"); 
					$("#firstname").addClass("inputBorder");
					$("#middlename").addClass("inputBorder");
					$("#lastname").addClass("inputBorder");
					$("#mobileno").addClass("inputBorder");
					$("#phone").addClass("inputBorder");
					$("#emailid").addClass("inputBorder");
					$("#passport").addClass("inputBorder");
					$("#pplaceofissued").addClass("inputBorder");
					$("#pvalidupto").addClass("inputBorder");
					$("#dlno").addClass("inputBorder");
					$("#pan").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			$("#empdetail_edit").click(function(){
				$("body").css("cursor", "progress");
				//Select box Properties
					$('.ui-datepicker-trigger').removeClass("hidden");
					$("#gender").removeClass("hidden");
					$("#optional_gender").addClass("hidden");
					$("#marital").removeClass("hidden");
					$("#optional_marital").addClass("hidden");
					$("#possessvehicle").removeClass("hidden");
					$("#optional_possessvehicle").addClass("hidden");
					$("#accidentillness").removeClass("hidden");
					$("#optional_accidentillness").addClass("hidden");
					
					$("#empupdatebutton").removeClass("hidden");
					$("#findoption").prop( 'disabled', true );
					$("#empid").prop( 'disabled', true );
					$("#empdetail_edit").addClass("hidden");
					
					if($("#dob").val() == "-"){
						$("#dob").val("");
					}
					if($("#age").val() == "-"){
						$("#age").val("");
					}
					if($("#postapplied").val() == "-"){
						$("#postapplied").val("");
					}
					if($("#department").val() == "-"){
						$("#department").val("");
					}
					if($("#jdate").val() == "-"){
						$("#jdate").val("");
					}
					if($("#rdate").val() == "-"){
						$("#rdate").val("");
					}
					if($("#emergencyno").val() == "-"){
						$("#emergencyno").val("");
					}
					if($("#doa").val() == "-"){
						$("#doa").val("");
					}
					if($("#b_group").val() == "-"){
						$("#b_group").val("");
					}
					if($("#illnessdescr").val() == "-"){
						$("#illnessdescr").val("");
					}
					$("#dob").prop( "disabled", false );
					$("#age").prop( "disabled", false );
					$("#postapplied").prop( "disabled", false );
					$("#department").prop( "disabled", false );
					$("#jdate").prop( "disabled", false );
					$("#rdate").prop( "disabled", false );
					$("#emergencyno").prop( "disabled", false );
					$("#doa").prop( "disabled", false );
					$("#b_group").prop( "disabled", false );
					$("#illnessdescr").prop( "disabled", false );
					
					$("#dob").removeClass("inputdisable");
					$("#age").removeClass("inputdisable");
					$("#postapplied").removeClass("inputdisable");
					$("#department").removeClass("inputdisable");
					$("#jdate").removeClass("inputdisable");
					$("#rdate").removeClass("inputdisable");
					$("#emergencyno").removeClass("inputdisable");
					$("#doa").removeClass("inputdisable");
					$("#b_group").removeClass("inputdisable");
					$("#illnessdescr").removeClass("inputdisable");
					
					$("#dob").addClass("inputBorder");
					$("#age").addClass("inputBorder");
					$("#postapplied").addClass("inputBorder");
					$("#department").addClass("inputBorder");
					$("#jdate").addClass("inputBorder");
					$("#rdate").addClass("inputBorder");
					$("#emergencyno").addClass("inputBorder");
					$("#doa").addClass("inputBorder");
					$("#b_group").addClass("inputBorder");
					$("#illnessdescr").addClass("inputBorder");
					
				$("body").css("cursor", "default");
			});
			$("#address_edit").click(function(){
				$("body").css("cursor", "progress");
					$("#addrupdatebutton").removeClass("hidden");
					$("#findoption").prop( 'disabled', true );
					$("#empid").prop( 'disabled', true );
					$("#address_edit").addClass("hidden");
					
					if($("#cstreet").val() == "-"){
						$("#cstreet").val("");
					}
					if($("#ccity").val() == "-"){
						$("#ccity").val("");
					}
					if($("#cstate").val() == "-"){
						$("#cstate").val("");
					}
					if($("#ccountry").val() == "-"){
						$("#ccountry").val("");
					}
					if($("#cpincode").val() == "-"){
						$("#cpincode").val("");
					}
					if($("#caddress").val() == "-"){
						$("#caddress").val("");
					}
					if($("#pstreet").val() == "-"){
						$("#pstreet").val("");
					}
					if($("#pcity").val() == "-"){
						$("#pcity").val("");
					}
					if($("#pstate").val() == "-"){
						$("#pstate").val("");
					}
					if($("#pcountry").val() == "-"){
						$("#pcountry").val("");
					}
					if($("#ppincode").val() == "-"){
						$("#ppincode").val("");
					}
					if($("#paddress").val() == "-"){
						$("#paddress").val("");
					}
					
					$("#cstreet").prop( "disabled", false );
					$("#ccity").prop( "disabled", false );
					$("#cstate").prop( "disabled", false );
					$("#ccountry").prop( "disabled", false );
					$("#cpincode").prop( "disabled", false );
					$("#caddress").prop( "disabled", false );
					$("#pstreet").prop( "disabled", false );
					$("#pcity").prop( "disabled", false );
					$("#pstate").prop( "disabled", false );
					$("#pcountry").prop( "disabled", false );
					$("#ppincode").prop( "disabled", false );
					$("#paddress").prop( "disabled", false );
					
					$("#cstreet").removeClass("inputdisable");
					$("#ccity").removeClass("inputdisable");
					$("#cstate").removeClass("inputdisable");
					$("#ccountry").removeClass("inputdisable");
					$("#cpincode").removeClass("inputdisable");
					$("#caddress").removeClass("inputdisable");
					$("#pstreet").removeClass("inputdisable");
					$("#pcity").removeClass("inputdisable");
					$("#pstate").removeClass("inputdisable");
					$("#pcountry").removeClass("inputdisable");
					$("#ppincode").removeClass("inputdisable");
					$("#paddress").removeClass("inputdisable");
					
					$("#cstreet").addClass("inputBorder");
					$("#ccity").addClass("inputBorder");
					$("#cstate").addClass("inputBorder");
					$("#ccountry").addClass("inputBorder");
					$("#cpincode").addClass("inputBorder");
					$("#caddress").addClass("inputBorder");
					$("#pstreet").addClass("inputBorder");
					$("#pcity").addClass("inputBorder");
					$("#pstate").addClass("inputBorder");
					$("#pcountry").addClass("inputBorder");
					$("#ppincode").addClass("inputBorder");
					$("#paddress").addClass("inputBorder"); 
				$("body").css("cursor", "default");
			});
			$("#familydetails_edit").click(function(){
				$("#familydetails_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#familydetails_edit_div").addClass("hidden");
				$('[id^="emp_familybackground_div_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(25, id.length);
				if($("#fb_relationship_"+i).val() == "-"){
					$("#fb_relationship_"+i).val("")
				}
				if($("#fb_name_"+i).val() == "-"){
					$("#fb_name_"+i).val("")
				}
				if($("#fb_age_"+i).val() == "-"){
					$("#fb_age_"+i).val("")
				}
				if($("#fb_education_"+i).val() == "-"){
					$("#fb_education_"+i).val("")
				}
				if($("#fb_occupation_"+i).val() == "-"){
					$("#fb_occupation_"+i).val("")
				}
				$("#fb_relationship_"+i).prop( "disabled", false );
				$("#fb_name_"+i).prop( "disabled", false );
				$("#fb_age_"+i).prop( "disabled", false );
				$("#fb_education_"+i).prop( "disabled", false );
				$("#fb_occupation_"+i).prop( "disabled", false );
				
				$("#fb_relationship_"+i).removeClass("inputdisable");
				$("#fb_name_"+i).removeClass("inputdisable");
				$("#fb_age_"+i).removeClass("inputdisable");
				$("#fb_education_"+i).removeClass("inputdisable");
				$("#fb_occupation_"+i).removeClass("inputdisable");
				
				$("#fb_relationship_"+i).addClass("inputBorder");
				$("#fb_name_"+i).addClass("inputBorder");
				$("#fb_age_"+i).addClass("inputBorder");
				$("#fb_education_"+i).addClass("inputBorder");
				$("#fb_occupation_"+i).addClass("inputBorder");
				});
			});
			$("#education_edit").click(function(){
				$("#education_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#education_edit_div").addClass("hidden");
				$('[id^="emp_education_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(18, dynamicid.length);
				//selectbox Properties
				
				if($("#edu_institutionname_"+i).val() == "-"){
					$("#edu_institutionname_"+i).val("");
				}
				if($("#edu_degree_"+i).val() == "-"){
					$("#edu_degree_"+i).val("");
				}
				if($("#edu_specialization_"+i).val() == "-"){
					$("#edu_specialization_"+i).val("")
				}
				if($("#edu_rankscholarship_"+i).val() == "-"){
					$("#edu_rankscholarship_"+i).val("");
				}
				if($("#edu_from_"+i).val() == "-"){
					$("#edu_from_"+i).val("");
				}
				if($("#edu_to_"+i).val() == "-"){
					$("#edu_to_"+i).val("");
				}
				$("#edu_institutionname_"+i).prop( "disabled", false );
				$("#edu_degree_"+i).prop( "disabled", false );
				$("#edu_specialization_"+i).prop( "disabled", false );
				$("#edu_rankscholarship_"+i).prop( "disabled", false );
				$("#edu_from_"+i).prop( "disabled", false );
				$("#edu_to_"+i).prop( "disabled", false );
				
				$("#edu_institutionname_"+i).removeClass("inputdisable");
				$("#edu_degree_"+i).removeClass("inputdisable");
				$("#edu_specialization_"+i).removeClass("inputdisable");
				$("#edu_rankscholarship_"+i).removeClass("inputdisable");
				$("#edu_from_"+i).removeClass("inputdisable");
				$("#edu_to_"+i).removeClass("inputdisable");
				
				$("#edu_institutionname_"+i).addClass("inputBorder");
				$("#edu_degree_"+i).addClass("inputBorder");
				$("#edu_specialization_"+i).addClass("inputBorder");
				$("#edu_rankscholarship_"+i).addClass("inputBorder");
				$("#edu_from_"+i).addClass("inputBorder");
				$("#edu_to_"+i).addClass("inputBorder");
				});
			});
			$("#skillset_edit").click(function(){
				$("#skillset_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#skillset_edit_div").addClass("hidden");
				$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(17, id.length);
				//selectbox Properties
				$("#skillset_level_optional_"+i).addClass("hidden");
				$("#skillset_level_"+i).removeClass("hidden");
				if($("#skillset_name_"+i).val() == "-"){
					$("#skillset_name_"+i).val("")
				}
				$("#skillset_name_"+i).prop( "disabled", false );
				$("#skillset_name_"+i).removeClass("inputdisable");
				$("#skillset_name_"+i).addClass("inputBorder");
				});
			});
			$("#references_edit").click(function(){
				$("#references_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#references_edit_div").addClass("hidden");
				$('[id^="emp_reference_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(18, dynamicid.length);
				if($("#ref_name_"+i).val() == "-"){
					$("#ref_name_"+i).val("")
				}
				if($("#ref_address_"+i).val() == "-"){
					$("#ref_address_"+i).val("")
				}
				if($("#ref_phone_"+i).val() == "-"){
					$("#ref_phone_"+i).val("")
				}
				if($("#ref_mobile_"+i).val() == "-"){
					$("#ref_mobile_"+i).val("")
				}
				if($("#ref_skill_"+i).val() == "-"){
					$("#ref_skill_"+i).val("")
				}
				if($("#ref_designation_"+i).val() == "-"){
					$("#ref_designation_"+i).val("")
				}
				$("#ref_name_"+i).prop( "disabled", false );
				$("#ref_address_"+i).prop( "disabled", false );
				$("#ref_phone_"+i).prop( "disabled", false );
				$("#ref_mobile_"+i).prop( "disabled", false );
				$("#ref_skill_"+i).prop( "disabled", false );
				$("#ref_designation_"+i).prop( "disabled", false );
				
				$("#ref_name_"+i).removeClass("inputdisable");
				$("#ref_address_"+i).removeClass("inputdisable");
				$("#ref_phone_"+i).removeClass("inputdisable");
				$("#ref_mobile_"+i).removeClass("inputdisable");
				$("#ref_skill_"+i).removeClass("inputdisable");
				$("#ref_designation_"+i).removeClass("inputdisable");
				
				$("#ref_name_"+i).addClass("inputBorder");
				$("#ref_address_"+i).addClass("inputBorder");
				$("#ref_phone_"+i).addClass("inputBorder");
				$("#ref_mobile_"+i).addClass("inputBorder");
				$("#ref_skill_"+i).addClass("inputBorder");
				$("#ref_designation_"+i).addClass("inputBorder");
				});
			});
			$("#languageknown_edit").click(function(){
				$("#languageknown_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#languageknown_edit_div").addClass("hidden");
				$('[id^="emp_languageknown_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(22, dynamicid.length);
				//selectbox Properties
				$("#languageknown_read_optional_"+i).addClass("hidden");
				$("#languageknown_read_"+i).removeClass("hidden");
				
				$("#languageknown_write_optional_"+i).addClass("hidden");
				$("#languageknown_write_"+i).removeClass("hidden");
				
				$("#languageknown_speak_optional_"+i).addClass("hidden");
				$("#languageknown_speak_"+i).removeClass("hidden");
				
				if($("#languageknown_name_"+i).val() == "-"){
					$("#languageknown_name_"+i).val("")
				}
				$("#languageknown_name_"+i).prop( "disabled", false );
				$("#languageknown_name_"+i).removeClass("inputdisable");
				$("#languageknown_name_"+i).addClass("inputBorder");
				});
			});
			$("#employmenthistory_edit").click(function(){
				$("#employmenthistory_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#employmenthistory_edit_div").addClass("hidden");
				$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(26, dynamicid.length);
				if($("#history_name_"+i).val() == "-"){
					$("#history_name_"+i).val("")
				}
				if($("#history_address_"+i).val() == "-"){
					$("#history_address_"+i).val("")
				}
				if($("#history_fromdate_"+i).val() == "-"){
					$("#history_fromdate_"+i).val("")
				}
				if($("#history_todate_"+i).val() == "-"){
					$("#history_todate_"+i).val("")
				}
				if($("#history_startingsalary_"+i).val() == "-"){
					$("#history_startingsalary_"+i).val("")
				}
				if($("#history_lastsalary_"+i).val() == "-"){
					$("#history_lastsalary_"+i).val("")
				}
				if($("#history_designation_"+i).val() == "-"){
					$("#history_designation_"+i).val("")
				}
				if($("#history_responsibility_"+i).val() == "-"){
					$("#history_responsibility_"+i).val("")
				}
				$("#history_name_"+i).prop( "disabled", false );
				$("#history_address_"+i).prop( "disabled", false );
				$("#history_fromdate_"+i).prop( "disabled", false );
				$("#history_todate_"+i).prop( "disabled", false );
				$("#history_startingsalary_"+i).prop( "disabled", false );
				$("#history_lastsalary_"+i).prop( "disabled", false );
				$("#history_designation_"+i).prop( "disabled", false );
				$("#history_responsibility_"+i).prop( "disabled", false );
				
				$("#history_name_"+i).removeClass("inputdisable");
				$("#history_address_"+i).removeClass("inputdisable");
				$("#history_fromdate_"+i).removeClass("inputdisable");
				$("#history_todate_"+i).removeClass("inputdisable");
				$("#history_startingsalary_"+i).removeClass("inputdisable");
				$("#history_lastsalary_"+i).removeClass("inputdisable");
				$("#history_designation_"+i).removeClass("inputdisable");
				$("#history_responsibility_"+i).removeClass("inputdisable");
				
				$("#history_name_"+i).addClass("inputBorder");
				$("#history_address_"+i).addClass("inputBorder");
				$("#history_fromdate_"+i).addClass("inputBorder");
				$("#history_todate_"+i).addClass("inputBorder");
				$("#history_startingsalary_"+i).addClass("inputBorder");
				$("#history_lastsalary_"+i).addClass("inputBorder");
				$("#history_designation_"+i).addClass("inputBorder");
				$("#history_responsibility_"+i).addClass("inputBorder");
				});
			});
			
			$("#achievements_edit").click(function(){
				$("#achievements_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#achievements_edit_div").addClass("hidden");
				$('[id^="emp_achievements_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(21, dynamicid.length);
				$("#achievements_companyname_"+i).prop( "disabled", false );
				$("#achievements_eventname_"+i).prop( "disabled", false );
				
				if($("#achievements_companyname_"+i).val() == "-"){
					$("#achievements_companyname_"+i).val("")
				}
				if($("#achievements_eventname_"+i).val() == "-"){
					$("#achievements_eventname_"+i).val("")
				}
				
				$("#achievements_companyname_"+i).removeClass("inputdisable");
				$("#achievements_eventname_"+i).removeClass("inputdisable");
				
				$("#achievements_companyname_"+i).addClass("inputBorder");
				$("#achievements_eventname_"+i).addClass("inputBorder");
				});
			});
			
			$("#culturals_edit").click(function(){
				$("#culturals_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#culturals_edit_div").addClass("hidden");
				$('[id^="emp_culturals_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(18, dynamicid.length);
				if($("#culturals_name_"+i).val() == "-"){
					$("#culturals_name_"+i).val("")
				}
				if($("#culturals_achievements_"+i).val() == "-"){
					$("#culturals_achievements_"+i).val("")
				}
				$("#culturals_name_"+i).prop( "disabled", false );
				$("#culturals_achievements_"+i).prop( "disabled", false );
				
				$("#culturals_name_"+i).removeClass("inputdisable");
				$("#culturals_achievements_"+i).removeClass("inputdisable");
				
				$("#culturals_name_"+i).addClass("inputBorder");
				$("#culturals_achievements_"+i).addClass("inputBorder");
				});
			});
			
			$("#sports_edit").click(function(){
				$("#sports_updatebutton").removeClass("hidden");
				$("#findoption").prop( 'disabled', true );
				$("#empid").prop( 'disabled', true );
				$("#sports_edit_div").addClass("hidden");
				$('[id^="emp_sports_div_"]').each(function(i, item) {
					var dynamicid = $(this).attr("id");
					var i = dynamicid.substring(15, dynamicid.length);
				if($("#sports_name_"+i).val() == "-"){
					$("#sports_name_"+i).val("")
				}
				if($("#sports_eventname_"+i).val() == "-"){
					$("#sports_eventname_"+i).val("")
				}
				$("#sports_name_"+i).prop( "disabled", false );
				$("#sports_eventname_"+i).prop( "disabled", false );
				
				$("#sports_name_"+i).removeClass("inputdisable");
				$("#sports_eventname_"+i).removeClass("inputdisable");
				
				$("#sports_name_"+i).addClass("inputBorder");
				$("#sports_eventname_"+i).addClass("inputBorder");
				});
			});
			
			$("#emp_about_edit").click(function() {
				$("body").css("cursor", "progress");
					$("#emp_about_update_button").removeClass("hidden");
					$("#findoption").prop( 'disabled', true );
					$("#empid").prop( 'disabled', true );
					$("#emp_about_edit").addClass("hidden");
					
					if($("#emp_strength").val() == "-"){
						$("#emp_strength").val("")
					}
					if($("#emp_weakness").val() == "-"){
						$("#emp_weakness").val("")
					}
					if($("#emp_totalexp").val() == "-"){
						$("#emp_totalexp").val("")
					}
					if($("#emp_releventexp").val() == "-"){
						$("#emp_releventexp").val("")
					}
					if($("#emp_presentsalary").val() == "-"){
						$("#emp_presentsalary").val("")
					}
					if($("#emp_expectedsalary").val() == "-"){
						$("#emp_expectedsalary").val("")
					}
					
					$("#emp_strength").prop( "disabled", false );
					$("#emp_weakness").prop( "disabled", false );
					$("#emp_totalexp").prop( "disabled", false );
					$("#emp_releventexp").prop( "disabled", false );
					$("#emp_presentsalary").prop( "disabled", false );
					$("#emp_expectedsalary").prop( "disabled", false );
					
					$("#emp_strength").removeClass("inputdisable");
					$("#emp_weakness").removeClass("inputdisable");
					$("#emp_totalexp").removeClass("inputdisable");
					$("#emp_releventexp").removeClass("inputdisable");
					$("#emp_presentsalary").removeClass("inputdisable");
					$("#emp_expectedsalary").removeClass("inputdisable");
					
					$("#emp_strength").addClass("inputBorder");
					$("#emp_weakness").addClass("inputBorder");
					$("#emp_totalexp").addClass("inputBorder");
					$("#emp_releventexp").addClass("inputBorder");
					$("#emp_presentsalary").addClass("inputBorder");
					$("#emp_expectedsalary").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			
			$("#empbank_acc_edit").click(function() {
				$("body").css("cursor", "progress");
					$("#empbank_acc_update_button").removeClass("hidden");
					$("#findoption").prop( 'disabled', true );
					$("#empid").prop( 'disabled', true );
					$("#empbank_acc_edit").addClass("hidden");
					
					if($("#bank_name").val() == "-"){
						$("#bank_name").val("")
					}
					if($("#bank_accno").val() == "-"){
						$("#bank_accno").val("")
					}
					if($("#bank_branch").val() == "-"){
						$("#bank_branch").val("")
					}
					if($("#bank_address").val() == "-"){
						$("#bank_address").val("")
					}
					if($("#bank_city").val() == "-"){
						$("#bank_city").val("")
					}
					if($("#bank_state").val() == "-"){
						$("#bank_state").val("")
					}
					if($("#bank_pincode").val() == "-"){
						$("#bank_pincode").val("")
					}
					if($("#bank_ifsc").val() == "-"){
						$("#bank_ifsc").val("")
					}
					
					$("#bank_name").prop( "disabled", false );
					$("#bank_accno").prop( "disabled", false );
					$("#bank_branch").prop( "disabled", false );
					$("#bank_address").prop( "disabled", false );
					$("#bank_city").prop( "disabled", false );
					$("#bank_state").prop( "disabled", false );
					$("#bank_pincode").prop( "disabled", false );
					$("#bank_ifsc").prop( "disabled", false );
					
					$("#bank_name").removeClass("inputdisable");
					$("#bank_accno").removeClass("inputdisable");
					$("#bank_branch").removeClass("inputdisable");
					$("#bank_address").removeClass("inputdisable");
					$("#bank_city").removeClass("inputdisable");
					$("#bank_state").removeClass("inputdisable");
					$("#bank_pincode").removeClass("inputdisable");
					$("#bank_ifsc").removeClass("inputdisable");
					
					$("#bank_name").addClass("inputBorder");
					$("#bank_accno").addClass("inputBorder");
					$("#bank_branch").addClass("inputBorder");
					$("#bank_address").addClass("inputBorder");
					$("#bank_city").addClass("inputBorder");
					$("#bank_state").addClass("inputBorder");
					$("#bank_pincode").addClass("inputBorder");
					$("#bank_ifsc").addClass("inputBorder");
				$("body").css("cursor", "default");
			});
			//Employee Update Section 
			$("#update").click(function() {
				$("body").css("cursor", "progress");
				$('.ui-datepicker-trigger').addClass("hidden");
					var validation = true;
					var id = $("#emp_id").val();
					var fname = $("#firstname").val();
					var mname = $("#middlename").val();
					var lname = $("#lastname").val();
					var mobile = $("#mobileno").val();
					var status = $("#status").val();
					var phone = $("#phone").val();
					var email = $("#emailid").val();
					var passport = $("#passport").val();
					var pplaceofissued = $("#pplaceofissued").val();
					var validupto = $("#pvalidupto").datepicker().val();
					var pvalidupto = validupto.split('/').join('-');
					var dlno = $("#dlno").val();
					var pan = $("#pan").val();
					if(fname == "" || fname.length == 0) validation = false;
					if(lname == "" || lname.length == 0) validation = false;
					if(mobile == "" || mobile.length == 0) validation = false;
					if(status == "" || mobile.status == 0) validation = false;
					if(email == "" || email.length == 0) validation = false;
					if(isNaN(mobile)  || mobile.length != 10) validation = false;
					if(!validateEmail(email)) validation = false;
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						if(mname == "" ||mname == "-" || mname.length == 0) mname = "null";
						if(phone == "" ||phone == "-" || phone.length == 0) phone = "null";
						if(passport == "" ||passport == "-" || passport.length == 0) passport = "null";
						if(pplaceofissued == "" ||pplaceofissued == "-" || pplaceofissued.length == 0) pplaceofissued = "null";
						if(pvalidupto == "" ||pvalidupto == "-" || pvalidupto.length == 0) pvalidupto = "null";
						if(dlno == "" ||dlno == "-" || dlno.length == 0) dlno = "null";
						if(pan == "" ||pan == "-" || pan.length == 0) pan = "null";
						var resourceURL = $("#contextpath").val()+"/employee/update/"+id+"/"+fname+"/"+mname+"/"+lname+"/"+email+"/"+mobile+"/"+phone+"/"+passport+"/"+pplaceofissued+"/"+pvalidupto+"/"+dlno+"/"+status+"/"+pan;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								dataType : 'json',
								success: function(data){
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									if(successflag == "true"){
									//Status Selectbox Properties
										if(status == "a"){
											$("#optional_status").html("Active");
										}else if(marital == "i"){
											$("#optional_status").html("In-Active");
										}
										$("#status").addClass("hidden");
										$("#optional_status").removeClass("hidden");
										
										$("#edit").removeClass("hidden");
										$("#updatebutton").addClass("hidden");
										$("#findoption").prop( 'disabled', false );
										$("#empid").prop( 'disabled', false );
										
										if($("#firstname").val() == "" || $("#firstname").val() == "-"){
											$("#firstname").val("-");
										}
										if($("#middlename").val() == "" || $("#middlename").val() == "-"){
											$("#middlename").val("-");
										}
										if($("#lastname").val() == "" || $("#lastname").val() == "-"){
											$("#lastname").val("-");
										}
										if($("#mobileno").val() == "" || $("#mobileno").val() == "-"){
											$("#mobileno").val("-");
										}
										if($("#phone").val() == "" || $("#phone").val() == "-"){
											$("#phone").val("-");
										}
										if($("#emailid").val() == "" || $("#emailid").val() == "-"){
											$("#emailid").val("-");
										}
										if($("#passport").val() == "" || $("#passport").val() == "-"){
											$("#passport").val("-");
										}
										if($("#pplaceofissued").val() == "" || $("#pplaceofissued").val() == "-"){
											$("#pplaceofissued").val("-");
										}
										if($("#pvalidupto").val() == "" || $("#pvalidupto").val() == "-"){
											$("#pvalidupto").val("-");
										}
										if($("#dlno").val() == "" || $("#dlno").val() == "-"){
											$("#dlno").val("-");
										}
										if($("#pan").val() == "" || $("#pan").val() == "-"){
											$("#pan").val("-");
										}
										
										$("#emp_id").prop( "disabled", true );
										$("#firstname").prop( "disabled", true );
										$("#middlename").prop( "disabled", true );
										$("#lastname").prop( "disabled", true );
										$("#mobileno").prop( "disabled", true );
										$("#phone").prop( "disabled", true );
										$("#emailid").prop( "disabled", true );
										$("#passport").prop( "disabled", true );
										$("#pplaceofissued").prop( "disabled", true );
										$("#pvalidupto").prop( "disabled", true );
										$("#dlno").prop( "disabled", true );
										$("#pan").prop( "disabled", true );
										 
										$("#emp_id").removeClass("inputBorder");
										$("#firstname").removeClass("inputBorder");
										$("#middlename").removeClass("inputBorder");
										$("#lastname").removeClass("inputBorder");
										$("#mobileno").removeClass("inputBorder");
										$("#phone").removeClass("inputBorder");
										$("#emailid").removeClass("inputBorder");
										$("#passport").removeClass("inputBorder");
										$("#pplaceofissued").removeClass("inputBorder");
										$("#pvalidupto").removeClass("inputBorder");
										$("#dlno").removeClass("inputBorder");
										$("#pan").removeClass("inputBorder");
										 
										$("#emp_id").addClass("inputdisable");
										$("#firstname").addClass("inputdisable");
										$("#middlename").addClass("inputdisable");
										$("#lastname").addClass("inputdisable");
										$("#mobileno").addClass("inputdisable");
										$("#phone").addClass("inputdisable");
										$("#emailid").addClass("inputdisable");
										$("#passport").addClass("inputdisable");
										$("#pplaceofissued").addClass("inputdisable");
										$("#pvalidupto").addClass("inputdisable");
										$("#dlno").addClass("inputdisable");
										$("#pan").addClass("inputdisable");
										$("#alertMsgContent").html("Employee updated successfully ...");
											$.fancybox.open('#alertMsg');
									}else{
										$("#edit").addClass("hidden");
										$("#updatebutton").removeClass("hidden");
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
			$("#empdetail_update").click(function(){
				$("body").css("cursor", "progress");
				$('.ui-datepicker-trigger').addClass("hidden");
					var validation = true;
					var id = $("#emp_id").val();
					var dob = $("#dob").datepicker().val();
					var dateofbirth = dob.split('/').join('-');
					var age = $("#age").val();
					var gender = $("#gender").val();
					var postapplied = $("#postapplied").val();
					var department = $("#department").val();
					var jdate = $("#jdate").datepicker().val();
					jdate = jdate.split('/').join('-');
					var rdate = $("#rdate").datepicker().val();
					rdate = rdate.split('/').join('-');
					var emergencyno = $("#emergencyno").val();
					var marital = $("#marital").val();
					var doa = $("#doa").datepicker().val();
					doa = doa.split('/').join('-');
					var bgroup = $("#b_group").val();
					var possessvehicle = $("#possessvehicle").val();
					var accidentillness = $("#accidentillness").val();
					var illnessdescr = $("#illnessdescr").val();
					if(accidentillness == "y"){
						if(illnessdescr == "" || illnessdescr.length == 0) validation = false;
					}
					if(dateofbirth == "" || dateofbirth.length == 0) validation = false;
					if(age == "" || age.length == 0) validation = false;
					if(gender == "" || gender.length == 0) validation = false;
					if(postapplied == "" || postapplied.length == 0) validation = false;
					if(jdate == "" || jdate.length == 0) validation = false;
					if(emergencyno == "" || emergencyno.length == 0 ) validation = false;
					if(marital == "" || marital.length == 0) validation = false;
					if(possessvehicle == "" || possessvehicle.length == 0) validation = false;
					if(accidentillness == "" || accidentillness.length == 0) validation = false;
					if(!(rdate == "") && !(rdate.length == 0) ){			 				 			
						var jdatevalidation = $.datepicker.parseDate('dd-mm-yy',jdate);
						var rdatevalidation = $.datepicker.parseDate('dd-mm-yy',rdate);
						if ((jdatevalidation) >= (rdatevalidation))  validation = false; 
					}
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						if(rdate == "" || rdate.length == 0 || rdate == "-") rdate = "null";
						if(department == "" || department.length == 0 || department == "-") department = "null";
						if(doa == "" || doa.length == 0 || doa == "-") doa = "null";
						if(bgroup == "" || bgroup.length == 0 || bgroup == "-") bgroup = "null";
						if(illnessdescr == "" || illnessdescr.length == 0 || illnessdescr == "-") illnessdescr = "null";
						
						var resourceURL = $("#contextpath").val()+"/employee/empdetailupdate/"+id+"/"+dob+"/"+age+"/"+gender+"/"+postapplied+"/"+department+"/"+jdate+"/"+rdate+"/"+emergencyno+"/"+marital+"/"+doa+"/"+bgroup+"/"+possessvehicle+"/"+accidentillness+"/"+illnessdescr;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data) {
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									//Gender select box Properties
									if(gender == "m"){
										$("#optional_gender").html("Male");
									}else if(gender == "f"){
										$("#optional_gender").html("Female");
									}
									$("#gender").addClass("hidden");
									$("#optional_gender").removeClass("hidden");
									//Marital Status Selectbox Properties
									if(marital == "m"){
										$("#optional_marital").html("Married");
									}else if(marital == "u"){
										$("#optional_marital").html("Unmarried");
									}
									$("#marital").addClass("hidden");
									$("#optional_marital").removeClass("hidden");
									//Posses Vehicle select box Properties
									if(possessvehicle == "y"){
										$("#optional_possessvehicle").html("Yes");
									}else if(possessvehicle == "n"){
										$("#optional_possessvehicle").html("No");
									}
									$("#possessvehicle").addClass("hidden");
									$("#optional_possessvehicle").removeClass("hidden");
									//Accident/Illness select box Properties
									if(accidentillness == "y"){
										$("#optional_accidentillness").html("Yes");
									}else if(gender == "n"){
										$("#optional_accidentillness").html("No");
									}
									$("#accidentillness").addClass("hidden");
									$("#optional_accidentillness").removeClass("hidden");

									$("#empdetail_edit").removeClass("hidden");
									$("#empupdatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									
									if($("#dob").val() == "" || $("#dob").val() == "-"){
										$("#dob").val("-");
									}
									if($("#age").val() == "" || $("#age").val() == "-"){
										$("#age").val("-");
									}
									if($("#postapplied").val() == "" || $("#postapplied").val() == "-"){
										$("#postapplied").val("-");
									}
									if($("#department").val() == "" || $("#department").val() == "-"){
										$("#department").val("-");
									}
									if($("#jdate").val() == "" || $("#jdate").val() == "-"){
										$("#jdate").val("-");
									}
									if($("#rdate").val() == "" || $("#rdate").val() == "-"){
										$("#rdate").val("-");
									}
									if($("#emergencyno").val() == "" || $("#emergencyno").val() == "-"){
										$("#emergencyno").val("-");
									}
									if($("#doa").val() == "" || $("#doa").val() == "-"){
										$("#doa").val("-");
									}
									if($("#b_group").val() == "" || $("#b_group").val() == "-"){
										$("#b_group").val("-");
									}
									if($("#illnessdescr").val() == "" || $("#illnessdescr").val() == "-"){
										$("#illnessdescr").val("-");
									}
									$("#empid").prop( 'disabled', false );
									$("#dob").prop( "disabled", true );
									$("#age").prop( "disabled", true );
									$("#postapplied").prop( "disabled", true );
									$("#department").prop( "disabled", true );
									$("#jdate").prop( "disabled", true );
									$("#rdate").prop( "disabled", true );
									$("#emergencyno").prop( "disabled", true );
									$("#doa").prop( "disabled", true );
									$("#b_group").prop( "disabled", true );
									$("#illnessdescr").prop( "disabled", true );
									
									$("#dob").removeClass("inputBorder");
									$("#age").removeClass("inputBorder");
									$("#postapplied").removeClass("inputBorder");
									$("#department").removeClass("inputBorder");
									$("#jdate").removeClass("inputBorder");
									$("#rdate").removeClass("inputBorder");
									$("#emergencyno").removeClass("inputBorder");
									$("#doa").removeClass("inputBorder");
									$("#b_group").removeClass("inputBorder");
									$("#illnessdescr").removeClass("inputBorder");
									
									$("#dob").addClass("inputdisable");
									$("#age").addClass("inputdisable");
									$("#postapplied").addClass("inputdisable");
									$("#department").addClass("inputdisable");
									$("#jdate").addClass("inputdisable");
									$("#rdate").addClass("inputdisable");
									$("#emergencyno").addClass("inputdisable");
									$("#doa").addClass("inputdisable");
									$("#b_group").addClass("inputdisable");
									$("#illnessdescr").addClass("inputdisable");
									$("#alertMsgContent").html("Employee Detail updated successfully ...");
										$.fancybox.open('#alertMsg');
									}else{
										$("#empdetail_edit").addClass("hidden");
										$("#empupdatebutton").removeClass("hidden");
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
			$("#addressUpdate").click(function() {
				$("body").css("cursor", "progress");
					var street = null;	
					var validation = true;
					var id = $("#emp_id").val();
					var cid = $("#cid").val();
					var cstreet = $("#cstreet").val();
					street = cstreet.split('/').join('-');
					street = cstreet.split('#').join(' ');
					var ccity = $("#ccity").val();
					var cstate = $("#cstate").val();
					var ccountry = $("#ccountry").val();
					var cpincode = $("#cpincode").val();
					if(street == "" || street == "-" || street.length == 0 || street == null) validation = false;
					if(ccity == "" ||  ccity == "-" || ccity.length == 0) validation = false;
					if(cstate == "" || cstate == "-" || cstate.length == 0) validation = false;
					if(ccountry == "" || ccountry == "-" || ccountry.length == 0) validation = false;
					if(cpincode == "" || cpincode == "-" || cpincode.length == 0) validation = false;
					//Permanent Address
					var pid = $("#pid").val();
					var pstreet = $("#pstreet").val();
					street = pstreet.split('/').join('-');
					street = pstreet.split('#').join(' ');
					var pcity = $("#pcity").val();
					var pstate = $("#pstate").val();
					var pcountry = $("#pcountry").val();
					var ppincode = $("#ppincode").val();
					if(pstreet == "" || pstreet == "-" || pstreet.length == 0) validation = false;
					if(pcity == "" || pcity == "-" || pcity.length == 0) validation = false;
					if(pstate == "" || pstate == "-" || pstate.length == 0) validation = false;
					if(pcountry == "" || pcountry == "-" || pcountry.length == 0) validation = false;
					if(ppincode == "" || ppincode == "-" || ppincode.length == 0) validation = false;
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						var resourceURL = $("#contextpath").val()+"/employee/addressupdate/"+id+"/"+cid+"/"+cstreet+"/"+ccity+"/"+cstate+"/"+ccountry+"/"+cpincode+"/"+pid+"/"+pstreet+"/"+pcity+"/"+pstate+"/"+pcountry+"/"+ppincode;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#address_edit").removeClass("hidden");
									$("#addrupdatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									
									if($("#cstreet").val() == "" || $("#cstreet").val() == "-"){
										$("#cstreet").val("-");
									}
									if($("#ccity").val() == "" || $("#ccity").val() == "-"){
										$("#ccity").val("-");
									}
									if($("#cstate").val() == "" || $("#cstate").val() == "-"){
										$("#cstate").val("-");
									}
									if($("#ccountry").val() == "" || $("#ccountry").val() == "-"){
										$("#ccountry").val("-");
									}
									if($("#cpincode").val() == "" || $("#cpincode").val() == "-"){
										$("#cpincode").val("-");
									}
									if($("#pstreet").val() == "" || $("#pstreet").val() == "-"){
										$("#pstreet").val("-");
									}
									if($("#pcity").val() == "" || $("#pcity").val() == "-"){
										$("#pcity").val("-");
									}
									if($("#pstreet").val() == "" || $("#pstreet").val() == "-"){
										$("#pstreet").val("-");
									}
									if($("#pcountry").val() == "" || $("#pcountry").val() == "-"){
										$("#pcountry").val("-");
									}
									if($("#ppincode").val() == "" || $("#ppincode").val() == "-"){
										$("#ppincode").val("-");
									}
									
									$("#cstreet").prop( "disabled", true );
									$("#ccity").prop( "disabled", true );
									$("#cstate").prop( "disabled", true );
									$("#ccountry").prop( "disabled", true );
									$("#cpincode").prop( "disabled", true );
									$("#pstreet").prop( "disabled", true );
									$("#pcity").prop( "disabled", true );
									$("#pstate").prop( "disabled", true );
									$("#pcountry").prop( "disabled", true );
									$("#ppincode").prop( "disabled", true );
									
									$("#cstreet").removeClass("inputBorder");
									$("#ccity").removeClass("inputBorder");
									$("#cstate").removeClass("inputBorder");
									$("#ccountry").removeClass("inputBorder");
									$("#cpincode").removeClass("inputBorder");
									$("#pstreet").removeClass("inputBorder");
									$("#pcity").removeClass("inputBorder");
									$("#pstate").removeClass("inputBorder");
									$("#pcountry").removeClass("inputBorder");
									$("#ppincode").removeClass("inputBorder");
									
									$("#cstreet").addClass("inputdisable");
									$("#ccity").addClass("inputdisable");
									$("#cstate").addClass("inputdisable");
									$("#ccountry").addClass("inputdisable");
									$("#cpincode").addClass("inputdisable");
									$("#pstreet").addClass("inputdisable");
									$("#pcity").addClass("inputdisable");
									$("#pstate").addClass("inputdisable");
									$("#pcountry").addClass("inputdisable");
									$("#ppincode").addClass("inputdisable");
									$("#alertMsgContent").html("Address updated successfully ...");
									$.fancybox.open('#alertMsg');
								}else{
									$("#address_edit").addClass("hidden");
									$("#addrupdatebutton").removeClass("hidden");
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
			$("#empbank_acc_update").click(function() {
				$("body").css("cursor", "progress");
					var street = null;	
					var validation = true;
					var id = $("#emp_id").val();
					var bank_name = $("#bank_name").val();
					var bank_accno = $("#bank_accno").val();
					var bank_branch = $("#bank_branch").val();
					var bank_address = $("#bank_address").val();
					var bank_city = $("#bank_city").val();
					var bank_state = $("#bank_state").val();
					var bank_pincode = $("#bank_pincode").val();
					var bank_ifsc = $("#bank_ifsc").val();
					
					if(bank_name == "" || bank_name == "-" || bank_name.length == 0) validation = false;
					if(bank_accno == "" || bank_accno == "-" || bank_accno.length == 0) validation = false;
					if(bank_branch == "" || bank_branch == "-" || bank_branch.length == 0) validation = false;
					if(bank_address == "" || bank_address == "-" || bank_address.length == 0) validation = false;
					if(bank_city == "" || bank_city == "-" || bank_city.length == 0) validation = false;
					if(bank_state == "" || bank_state == "-" || bank_state.length == 0) validation = false;
					if(bank_pincode == "" || bank_pincode == "-" || bank_pincode.length == 0) validation = false;
					if(bank_ifsc == "" || bank_ifsc == "-" || bank_ifsc.length == 0) validation = false;
					if(isNaN(bank_pincode)  || bank_pincode.length != 6) validation = false;
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						var resourceURL = $("#contextpath").val()+"/employee/empbankdetailupdate/"+id+"/"+bank_name+"/"+bank_accno+"/"+bank_branch+"/"+bank_address+"/"+bank_city+"/"+bank_state+"/"+bank_pincode+"/"+bank_ifsc;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#empbank_acc_edit").removeClass("hidden");
									$("#empbank_acc_update_button").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									
									if($("#bank_name").val() == "" || $("#bank_name").val() == "-"){
										$("#bank_name").val("-");
									}
									if($("#bank_accno").val() == "" || $("#bank_accno").val() == "-"){
										$("#bank_accno").val("-");
									}
									if($("#bank_branch").val() == "" || $("#bank_branch").val() == "-"){
										$("#bank_branch").val("-");
									}
									if($("#bank_address").val() == "" || $("#bank_address").val() == "-"){
										$("#bank_address").val("-");
									}
									if($("#bank_city").val() == "" || $("#bank_city").val() == "-"){
										$("#bank_city").val("-");
									}
									if($("#bank_state").val() == "" || $("#bank_state").val() == "-"){
										$("#bank_state").val("-");
									}
									if($("#bank_pincode").val() == "" || $("#bank_pincode").val() == "-"){
										$("#bank_pincode").val("-");
									}
									if($("#bank_ifsc").val() == "" || $("#bank_ifsc").val() == "-"){
										$("#bank_ifsc").val("-");
									}
									
									$("#bank_name").prop( "disabled", true );
									$("#bank_accno").prop( "disabled", true );
									$("#bank_branch").prop( "disabled", true );
									$("#bank_address").prop( "disabled", true );
									$("#bank_city").prop( "disabled", true );
									$("#bank_state").prop( "disabled", true );
									$("#bank_pincode").prop( "disabled", true );
									$("#bank_ifsc").prop( "disabled", true );
									
									$("#bank_name").removeClass("inputBorder");
									$("#bank_accno").removeClass("inputBorder");
									$("#bank_branch").removeClass("inputBorder");
									$("#bank_address").removeClass("inputBorder");
									$("#bank_city").removeClass("inputBorder");
									$("#bank_state").removeClass("inputBorder");
									$("#bank_pincode").removeClass("inputBorder");
									$("#bank_ifsc").removeClass("inputBorder");
									
									$("#bank_name").addClass("inputdisable");
									$("#bank_accno").addClass("inputdisable");
									$("#bank_branch").addClass("inputdisable");
									$("#bank_address").addClass("inputdisable");
									$("#bank_city").addClass("inputdisable");
									$("#bank_state").addClass("inputdisable");
									$("#bank_pincode").addClass("inputdisable");
									$("#bank_ifsc").addClass("inputdisable");
									$("#alertMsgContent").html("Employee Account Details updated successfully ...");
										$.fancybox.open('#alertMsg');
								}else{
									$("#empbank_acc_edit").addClass("hidden");
									$("#empbank_acc_update_button").removeClass("hidden");
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
			$("#emp_about_update").click(function() {
				$("body").css("cursor", "progress");
					var street = null;	
					var validation = true;
					var id = $("#emp_abt_id").val();
					var empid = $("#emp_id").val();
					var strength = $("#emp_strength").val();
					var weakness = $("#emp_weakness").val();
					var totalexp = $("#emp_totalexp").val();
					var releventexp = $("#emp_releventexp").val();
					var presentsalary = $("#emp_presentsalary").val();
					var expectedsalary = $("#emp_expectedsalary").val();
					
					if(strength == "" || strength == "-" || strength.length == 0) validation = false;
					if(weakness == "" || weakness == "-" || weakness.length == 0) validation = false;
					
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						if(totalexp == "" || totalexp.length == 0 || totalexp == "-") totalexp = "null";
						if(releventexp == "" || releventexp.length == 0 || releventexp == "-") releventexp = "null";
						if(presentsalary == "" || presentsalary.length == 0 || presentsalary == "-") presentsalary = "null";
						if(expectedsalary == "" || expectedsalary.length == 0 || expectedsalary == "-") expectedsalary = "null";
						
						var resourceURL = $("#contextpath").val()+"/employee/empaboutupdate/"+id+"/"+empid+"/"+strength+"/"+weakness+"/"+totalexp+"/"+releventexp+"/"+presentsalary+"/"+expectedsalary;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#emp_about_edit").removeClass("hidden");
									$("#emp_about_update_button").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									
									if($("#emp_strength").val() == "" || $("#emp_strength").val() == "-"){
										$("#emp_strength").val("-");
									}
									if($("#emp_weakness").val() == "" || $("#emp_weakness").val() == "-"){
										$("#emp_weakness").val("-");
									}
									if($("#emp_totalexp").val() == "" || $("#emp_totalexp").val() == "-"){
										$("#emp_totalexp").val("-");
									}
									if($("#emp_releventexp").val() == "" || $("#emp_releventexp").val() == "-"){
										$("#emp_releventexp").val("-");
									}
									if($("#emp_presentsalary").val() == "" || $("#emp_presentsalary").val() == "-"){
										$("#emp_presentsalary").val("-");
									}
									if($("#emp_expectedsalary").val() == "" || $("#emp_expectedsalary").val() == "-"){
										$("#emp_expectedsalary").val("-");
									}
									$("#emp_strength").prop( "disabled", true );
									$("#emp_weakness").prop( "disabled", true );
									$("#emp_totalexp").prop( "disabled", true );
									$("#emp_releventexp").prop( "disabled", true );
									$("#emp_presentsalary").prop( "disabled", true );
									$("#emp_expectedsalary").prop( "disabled", true );
									
									$("#emp_strength").removeClass("inputBorder");
									$("#emp_weakness").removeClass("inputBorder");
									$("#emp_totalexp").removeClass("inputBorder");
									$("#emp_releventexp").removeClass("inputBorder");
									$("#emp_presentsalary").removeClass("inputBorder");
									$("#emp_expectedsalary").removeClass("inputBorder");
									
									$("#emp_strength").addClass("inputdisable");
									$("#emp_weakness").addClass("inputdisable");
									$("#emp_totalexp").addClass("inputdisable");
									$("#emp_releventexp").addClass("inputdisable");
									$("#emp_presentsalary").addClass("inputdisable");
									$("#emp_expectedsalary").addClass("inputdisable");
									$("#alertMsgContent").html("Employee Personal Details updated successfully ...");
										$.fancybox.open('#alertMsg');
								}else{
									$("#emp_about_edit").addClass("hidden");
									$("#emp_about_update_button").removeClass("hidden");
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
			$("#familydetailsUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_familybackground_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(25, id.length);
						var relationship = $("#fb_relationship_"+i).val();
						var name = $("#fb_name_"+i).val();
						var age = $("#fb_age_"+i).val();
						var education = $("#fb_education_"+i).val();
						var occupation = $("#fb_occupation_"+i).val();
						if(relationship == "" || relationship == "-" || relationship.length == 0) validation = false;
						if(name == "" || name == "-" || name.length == 0) validation = false;
						if(age == "" || age == "-" || age.length == 0) validation = false;
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_familybackground_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(25, dynamicid.length);
							var id = $("#fb_id_"+i).val();
							var empid = $("#emp_id").val();
							var relationship = $("#fb_relationship_"+i).val();
							var name = $("#fb_name_"+i).val();
							var age = $("#fb_age_"+i).val();
							var education = $("#fb_education_"+i).val();
							var occupation = $("#fb_occupation_"+i).val();
							if(education == "" || education.length == 0 || education == "-") education = "null";
							if(occupation == "" || occupation.length == 0 || occupation == "-") occupation = "null";
						var resourceURL = $("#contextpath").val()+"/employee/familybackgroundupdate/"+id+"/"+empid+"/"+relationship+"/"+name+"/"+age+"/"+education+"/"+occupation;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#familydetails_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#familydetails_edit_div").removeClass("hidden");
									
									if($("#fb_relationship_"+i).val() == "" || $("#fb_relationship_"+i).val() == "-"){
										$("#fb_relationship_"+i).val("-");
									}
									if($("#fb_name_"+i).val() == "" || $("#fb_name_"+i).val() == "-"){
										$("#fb_name_"+i).val("-");
									}
									if($("#fb_age_"+i).val() == "" || $("#fb_age_"+i).val() == "-"){
										$("#fb_age_"+i).val("-");
									}
									if($("#fb_education_"+i).val() == "" || $("#fb_education_"+i).val() == "-"){
										$("#fb_education_"+i).val("-");
									}
									if($("#fb_occupation_"+i).val() == "" || $("#fb_occupation_"+i).val() == "-"){
										$("#fb_occupation_"+i).val("-");
									}
									$("#fb_relationship_"+i).prop( "disabled", true );
									$("#fb_name_"+i).prop( "disabled", true );
									$("#fb_age_"+i).prop( "disabled", true );
									$("#fb_education_"+i).prop( "disabled", true );
									$("#fb_occupation_"+i).prop( "disabled", true );
									
									$("#fb_relationship_"+i).addClass("inputdisable");
									$("#fb_name_"+i).addClass("inputdisable");
									$("#fb_age_"+i).addClass("inputdisable");
									$("#fb_education_"+i).addClass("inputdisable");
									$("#fb_occupation_"+i).addClass("inputdisable");
									
									$("#fb_relationship_"+i).removeClass("inputBorder");
									$("#fb_name_"+i).removeClass("inputBorder");
									$("#fb_age_"+i).removeClass("inputBorder");
									$("#fb_education_"+i).removeClass("inputBorder");
									$("#fb_occupation_"+i).removeClass("inputBorder");
									id = null;
									empid = null;
									relationship = null;
									name = null;
									age = null;
									education = null;
									occupation = null;
								}else{
									$("#familydetails_edit_div").addClass("hidden");
									$("#familydetails_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Employee Family Details updated successfully ...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			$("#educationUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_education_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						var institutionname = $("#edu_institutionname_"+i).val();
						var degree = $("#edu_degree_"+i).val();
						var specialization = $("#edu_specialization_"+i).val();
						var rankscholarship = $("#edu_rankscholarship_"+i).val();
						var edufrom = $("#edu_from_"+i).datepicker().val();
						var eduto = $("#edu_to_"+i).datepicker().val();
						
						if(institutionname == "" || institutionname == "-" || institutionname.length == 0) validation = false;
						if(degree == "" || degree == "-" || degree.length == 0) validation = false;
						if(specialization == "" || specialization == "-" || specialization.length == 0) validation = false;
						if(rankscholarship == "" || rankscholarship == "-" || rankscholarship.length == 0) validation = false;
						if(edufrom == "" || edufrom == "-" || edufrom.length == 0) validation = false;
						if(eduto == "" || eduto == "-" || eduto.length == 0) validation = false;
						var edufromvalidation = $.datepicker.parseDate('dd-mm-yy',edufrom);
						var edutovalidation = $.datepicker.parseDate('dd-mm-yy',eduto);
						if ((edufromvalidation) >= (edutovalidation))  validation = false; 
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_education_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(18, dynamicid.length);
							var id = $("#edu_id_"+i).val();
							var empid = $("#emp_id").val();
							var institutionname = $("#edu_institutionname_"+i).val();
							var degree = $("#edu_degree_"+i).val();
							var specialization = $("#edu_specialization_"+i).val();
							var rankscholarship = $("#edu_rankscholarship_"+i).val();
							var edufrom = $("#edu_from_"+i).datepicker().val();
							var eduto = $("#edu_to_"+i).datepicker().val();
						var resourceURL = $("#contextpath").val()+"/employee/educationdetailsupdate/"+id+"/"+empid+"/"+institutionname+"/"+degree+"/"+specialization+"/"+rankscholarship+"/"+edufrom+"/"+eduto;	
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#education_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#education_edit_div").removeClass("hidden");
									
									if($("#edu_institutionname_"+i).val() == "" || $("#edu_institutionname_"+i).val() == "-"){
										$("#edu_institutionname_"+i).val("-");
									}
									if($("#edu_degree_"+i).val() == "" || $("#edu_degree_"+i).val() == "-"){
										$("#edu_degree_"+i).val("-");
									}
									if($("#edu_specialization_"+i).val() == "" || $("#edu_specialization_"+i).val() == "-"){
										$("#edu_specialization_"+i).val("-");
									}
									if($("#edu_from_"+i).val() == "" || $("#edu_from_"+i).val() == "-"){
										$("#edu_from_"+i).val("-");
									}
									if($("#edu_to_"+i).val() == "" || $("#edu_to_"+i).val() == "-"){
										$("#edu_to_"+i).val("-");
									}
									
									$("#edu_institutionname_"+i).prop( "disabled", true );
									$("#edu_degree_"+i).prop( "disabled", true );
									$("#edu_specialization_"+i).prop( "disabled", true );
									$("#edu_rankscholarship_"+i).prop( "disabled", true );
									$("#edu_from_"+i).prop( "disabled", true );
									$("#edu_to_"+i).prop( "disabled", true );
									
									$("#edu_institutionname_"+i).addClass("inputdisable");
									$("#edu_degree_"+i).addClass("inputdisable");
									$("#edu_specialization_"+i).addClass("inputdisable");
									$("#edu_rankscholarship_"+i).addClass("inputdisable");
									$("#edu_from_"+i).addClass("inputdisable");
									$("#edu_to_"+i).addClass("inputdisable");
									
									$("#edu_institutionname_"+i).removeClass("inputBorder");
									$("#edu_degree_"+i).removeClass("inputBorder");
									$("#edu_specialization_"+i).removeClass("inputBorder");
									$("#edu_rankscholarship_"+i).removeClass("inputBorder");
									$("#edu_from_"+i).removeClass("inputBorder");
									$("#edu_to_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									institutionname = null;
									degree = null;
									specialization = null;
									rankscholarship = null;
									edufrom = null;
									eduto = null;
								}else{
									$("#education_edit_div").addClass("hidden");
									$("#education_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Education details updated successfully ...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			$("#skillsetUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(17, id.length);
						var skillsetname = $("#skillset_name_"+i).val();
						var skillsetlevel = $("#skillset_level_"+i).val();
						if(skillsetname == "" || skillsetname == "-" || skillsetname.length == 0) validation = false;
						if(skillsetlevel == "" || skillsetlevel == "-" || skillsetlevel.length == 0) validation = false;
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(17, dynamicid.length);
							var id = $("#skillset_id_"+i).val();
							var empid = $("#emp_id").val();
							var skillsetname = $("#skillset_name_"+i).val();
							var skillsetlevel = $("#skillset_level_"+i).val();
						var resourceURL = $("#contextpath").val()+"/employee/skillsetupdate/"+id+"/"+empid+"/"+skillsetname+"/"+skillsetlevel;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#skillset_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#skillset_edit_div").removeClass("hidden");
									
									if(skillsetlevel == "b"){
										$("#skillset_level_optional_"+i).html("Basic");
									} else if(skillsetlevel == "a"){
										$("#skillset_level_optional_"+i).html("Advanced");
									} else if(skillsetlevel == "e"){
										$("#skillset_level_optional_"+i).html("Expert");
									}
									$("#skillset_level_"+i).addClass("hidden");
									$("#skillset_level_optional_"+i).removeClass("hidden");
									
									if($("#skillset_name_"+i).val() == "" || $("#skillset_name_"+i).val() == "-"){
										$("#skillset_name_"+i).val("-");
									}
									$("#skillset_name_"+i).prop( "disabled", true );
									$("#skillset_name_"+i).addClass("inputdisable");
									$("#skillset_name_"+i).removeClass("inputBorder");
									id = null;
									empid = null;
									skillsetname = null;
									skillsetlevel = null;
								}else{
									$("#skillset_edit_div").addClass("hidden");
									$("#skillset_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Skillset details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			
			$("#referenceUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_reference_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						var name = $("#ref_name_"+i).val();
						var address = $("#ref_address_"+i).val();
						var phone = $("#ref_phone_"+i).val();
						var mobile = $("#ref_mobile_"+i).val();
						var skill = $("#ref_skill_"+i).val();
						var designation = $("#ref_designation_"+i).val();
						
						if(name == "" || name == "-" || name.length == 0) validation = false;
						if(address == "" || address == "-" || address.length == 0) validation = false;
						if(mobile == "" || mobile == "-" || mobile.length == 0) validation = false;
						if(skill == "" || skill == "-" || skill.length == 0) validation = false;
						if(designation == "" || designation == "-" || designation.length == 0) validation = false;
						if(isNaN(mobile)  || mobile.length != 10) validation = false;
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_reference_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(18, dynamicid.length);
							var id = $("#ref_id_"+i).val();
							var empid = $("#emp_id").val();
							var name = $("#ref_name_"+i).val();
							var address = $("#ref_address_"+i).val();
							var phone = $("#ref_phone_"+i).val();
							var mobile = $("#ref_mobile_"+i).val();
							var skill = $("#ref_skill_"+i).val();
							var designation = $("#ref_designation_"+i).val();
							
							if(phone == "" || phone.length == 0 || phone == "-") phone = "null";

						var resourceURL = $("#contextpath").val()+"/employee/referencesupdate/"+id+"/"+empid+"/"+name+"/"+address+"/"+phone+"/"+mobile+"/"+skill+"/"+designation;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#references_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#references_edit_div").removeClass("hidden");
									$("#references_addmore").prop("disabled", false);
									$("#references_addmore").removeClass("graybtn");
									
									if($("#ref_name_"+i).val() == "" || $("#ref_name_"+i).val() == "-"){
										$("#ref_name_"+i).val("-");
									}
									if($("#ref_address_"+i).val() == "" || $("#ref_address_"+i).val() == "-"){
										$("#ref_address_"+i).val("-");
									}
									if($("#ref_phone_"+i).val() == "" || $("#ref_phone_"+i).val() == "-"){
										$("#ref_phone_"+i).val("-");
									}
									if($("#ref_mobile_"+i).val() == "" || $("#ref_mobile_"+i).val() == "-"){
										$("#ref_mobile_"+i).val("-");
									}
									if($("#ref_skill_"+i).val() == "" || $("#ref_skill_"+i).val() == "-"){
										$("#ref_skill_"+i).val("-");
									}
									if($("#ref_designation_"+i).val() == "" || $("#ref_designation_"+i).val() == "-"){
										$("#ref_designation_"+i).val("-");
									}
									
									$("#ref_name_"+i).prop( "disabled", true );
									$("#ref_address_"+i).prop( "disabled", true );
									$("#ref_phone_"+i).prop( "disabled", true );
									$("#ref_mobile_"+i).prop( "disabled", true );
									$("#ref_skill_"+i).prop( "disabled", true );
									$("#ref_designation_"+i).prop( "disabled", true );
									
									$("#ref_name_"+i).addClass("inputdisable");
									$("#ref_address_"+i).addClass("inputdisable");
									$("#ref_phone_"+i).addClass("inputdisable");
									$("#ref_mobile_"+i).addClass("inputdisable");
									$("#ref_skill_"+i).addClass("inputdisable");
									$("#ref_designation_"+i).addClass("inputdisable");
									
									$("#ref_name_"+i).removeClass("inputBorder");
									$("#ref_address_"+i).removeClass("inputBorder");
									$("#ref_phone_"+i).removeClass("inputBorder");
									$("#ref_mobile_"+i).removeClass("inputBorder");
									$("#ref_skill_"+i).removeClass("inputBorder");
									$("#ref_designation_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									name = null;
									address = null;
									phone = null;
									mobile = null;
									skill = null;
									designation = null;
								}else{
									$("#references_edit_div").addClass("hidden");
									$("#references_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("References details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			$("#languageknownUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_languageknown_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(22, dynamicid.length);
						var name = $("#languageknown_name_"+i).val();
						var read = $("#languageknown_read_"+i).val();
						var write = $("#languageknown_write_"+i).val();
						var speak = $("#languageknown_speak_"+i).val();
					if(name == "" || name == "-" || name.length == 0) validation = false;
					if(read == "" || read == "-" || read.length == 0) validation = false;
					if(write == "" || write == "-" || write.length == 0) validation = false;
					if(speak == "" || speak == "-" || speak.length == 0) validation = false;
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_languageknown_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(22, dynamicid.length);
							var id = $("#languageknown_id_"+i).val();
							var empid = $("#emp_id").val();
							var name = $("#languageknown_name_"+i).val();
							var read = $("#languageknown_read_"+i).val();
							var write = $("#languageknown_write_"+i).val();
							var speak = $("#languageknown_speak_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/languageknownupdate/"+id+"/"+empid+"/"+name+"/"+read+"/"+write+"/"+speak;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#languageknown_updatebutton").addClass("hidden");
									$("#empid").prop( 'disabled', false );
									$("#findoption").prop( 'disabled', false );
									$("#languageknown_edit_div").removeClass("hidden");
									if(read == "y"){
										$("#languageknown_read_optional_"+i).html("Yes");
									} else if(read == "n"){
										$("#languageknown_read_optional_"+i).html("No");
									}
									$("#languageknown_read_"+i).addClass("hidden");
									$("#languageknown_read_optional_"+i).removeClass("hidden");
									
									if(write == "y"){
										$("#languageknown_write_optional_"+i).html("Yes");
									} else if(write == "n"){
										$("#languageknown_write_optional_"+i).html("No");
									}
									$("#languageknown_write_"+i).addClass("hidden");
									$("#languageknown_write_optional_"+i).removeClass("hidden");
									
									if(speak == "y"){
										$("#languageknown_speak_optional_"+i).html("Yes");
									} else if(speak == "n"){
										$("#languageknown_speak_optional_"+i).html("No");
									}
									$("#languageknown_speak_"+i).addClass("hidden");
									$("#languageknown_speak_optional_"+i).removeClass("hidden");
									
									if($("#languageknown_name_"+i).val() == "" || $("#languageknown_name_"+i).val() == "-"){
										$("#languageknown_name_"+i).val("-");
									}
									
									$("#languageknown_name_"+i).prop( "disabled", true );
									$("#languageknown_name_"+i).addClass("inputdisable");
									$("#languageknown_name_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									name = null;
									read = null;
									write = null;
								}else{
									$("#languageknown_edit_div").addClass("hidden");
									$("#languageknown_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Language Known details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			
			$("#employmenthistoryUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(26, dynamicid.length);
						var name = $("#history_name_"+i).val();
						var address = $("#history_address_"+i).val();
						var fromdate = $("#history_fromdate_"+i).datepicker().val();
						var todate = $("#history_todate_"+i).datepicker().val();
						var startingsalary = $("#history_startingsalary_"+i).val();
						var lastsalary = $("#history_lastsalary_"+i).val();
						var designation = $("#history_designation_"+i).val();
						var responsibility = $("#history_responsibility_"+i).val();
						
						var fromdatevalidation = $.datepicker.parseDate('dd-mm-yy',fromdate);
						var todatevalidation = $.datepicker.parseDate('dd-mm-yy',todate);
						if ((fromdatevalidation) >= (todatevalidation))  validation = false; 	
						if(name == "" || name == "-" || name.length == 0) validation = false;
						if(address == "" || address == "-" || address.length == 0) validation = false;
						if(fromdate == "" || fromdate == "-" || fromdate.length == 0) validation = false;
						if(todate == "" || todate == "-" || todate.length == 0) validation = false;
						if(startingsalary == "" || startingsalary == "-" || startingsalary.length == 0) validation = false;
						if(lastsalary == "" || lastsalary == "-" || lastsalary.length == 0) validation = false;
						if(designation == "" || designation == "-" || designation.length == 0) validation = false;
						if(responsibility == "" || responsibility == "-" || responsibility.length == 0) validation = false;
					});
					
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(26, dynamicid.length);
							var id = $("#history_id_"+i).val();
							var empid = $("#emp_id").val();
							var name = $("#history_name_"+i).val();
							var address = $("#history_address_"+i).val();
							var fromdate = $("#history_fromdate_"+i).datepicker().val();
							var todate = $("#history_todate_"+i).datepicker().val();
							var startingsalary = $("#history_startingsalary_"+i).val();
							var lastsalary = $("#history_lastsalary_"+i).val();
							var designation = $("#history_designation_"+i).val();
							var responsibility = $("#history_responsibility_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/employmenthistoryupdate/"+id+"/"+empid+"/"+name+"/"+address+"/"+fromdate+"/"+todate+"/"+startingsalary+"/"+lastsalary+"/"+designation+"/"+responsibility;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#employmenthistory_updatebutton").addClass("hidden");
									$("#empid").prop( 'disabled', false );
									$("#employmenthistory_edit_div").removeClass("hidden");
									$("#employmenthistory_addmore").prop("disabled", false);
									$("#employmenthistory_addmore").removeClass("graybtn");
									$("#findoption").prop( 'disabled', false );
									
									if($("#history_name_"+i).val() == "" || $("#history_name_"+i).val() == "-"){
										$("#history_name_"+i).val("-");
									}
									if($("#history_address_"+i).val() == "" || $("#history_address_"+i).val() == "-"){
										$("#history_address_"+i).val("-");
									}
									if($("#history_fromdate_"+i).val() == "" || $("#history_fromdate_"+i).val() == "-"){
										$("#history_fromdate_"+i).val("-");
									}
									if($("#history_todate_"+i).val() == "" || $("#history_todate_"+i).val() == "-"){
										$("#history_todate_"+i).val("-");
									}
									if($("#history_startingsalary_"+i).val() == "" || $("#history_startingsalary_"+i).val() == "-"){
										$("#history_startingsalary_"+i).val("-");
									}
									if($("#history_lastsalary_"+i).val() == "" || $("#history_lastsalary_"+i).val() == "-"){
										$("#history_lastsalary_"+i).val("-");
									}
									if($("#history_designation_"+i).val() == "" || $("#history_designation_"+i).val() == "-"){
										$("#history_designation_"+i).val("-");
									}
									if($("#history_responsibility_"+i).val() == "" || $("#history_responsibility_"+i).val() == "-"){
										$("#history_responsibility_"+i).val("-");
									}
									
									$("#history_name_"+i).prop( "disabled", true );
									$("#history_address_"+i).prop( "disabled", true );
									$("#history_fromdate_"+i).prop( "disabled", true );
									$("#history_todate_"+i).prop( "disabled", true );
									$("#history_startingsalary_"+i).prop( "disabled", true );
									$("#history_lastsalary_"+i).prop( "disabled", true );
									$("#history_designation_"+i).prop( "disabled", true );
									$("#history_responsibility_"+i).prop( "disabled", true );
									
									$("#history_name_"+i).addClass("inputdisable");
									$("#history_address_"+i).addClass("inputdisable");
									$("#history_fromdate_"+i).addClass("inputdisable");
									$("#history_todate_"+i).addClass("inputdisable");
									$("#history_startingsalary_"+i).addClass("inputdisable");
									$("#history_lastsalary_"+i).addClass("inputdisable");
									$("#history_designation_"+i).addClass("inputdisable");
									$("#history_responsibility_"+i).addClass("inputdisable");
									
									$("#history_name_"+i).removeClass("inputBorder");
									$("#history_address_"+i).removeClass("inputBorder");
									$("#history_fromdate_"+i).removeClass("inputBorder");
									$("#history_todate_"+i).removeClass("inputBorder");
									$("#history_startingsalary_"+i).removeClass("inputBorder");
									$("#history_lastsalary_"+i).removeClass("inputBorder");
									$("#history_designation_"+i).removeClass("inputBorder");
									$("#history_responsibility_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									address = null;
									fromdate = null;
									todate = null;
									startingsalary = null;
									lastsalary = null;
									designation = null;
									responsibility = null;
									
								}else{
									$("#employmenthistory_edit_div").addClass("hidden");
									$("#employmenthistory_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Employment History details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			$("#achievementsUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_achievements_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(21, dynamicid.length);
						var companyname = $("#achievements_companyname_"+i).val();
						var achievements = $("#achievements_eventname_"+i).val();
						if(companyname == "" || companyname == "-" || companyname.length == 0) validation = false;
						if(achievements == "" || achievements == "-" || achievements.length == 0) validation = false;
					});
					
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_achievements_div_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(21, id.length);
							var id = $("#achievements_id_"+i).val();
							var empid = $("#emp_id").val();
							var companyname = $("#achievements_companyname_"+i).val();
							var achievements = $("#achievements_eventname_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/achievementsupdate/"+id+"/"+empid+"/"+companyname+"/"+achievements;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#achievements_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#achievements_edit_div").removeClass("hidden");
									$("#achievements_addmore").prop("disabled", false);
									$("#achievements_addmore").removeClass("graybtn");
									
									if($("#achievements_companyname_"+i).val() == "" || $("#achievements_companyname_"+i).val() == "-"){
										$("#achievements_companyname_"+i).val("-");
									}
									if($("#achievements_eventname_"+i).val() == "" || $("#achievements_eventname_"+i).val() == "-"){
										$("#achievements_eventname_"+i).val("-");
									}
									
									$("#achievements_companyname_"+i).prop( "disabled", true );
									$("#achievements_eventname_"+i).prop( "disabled", true );
									
									$("#achievements_companyname_"+i).addClass("inputdisable");
									$("#achievements_eventname_"+i).addClass("inputdisable");
									
									$("#achievements_companyname_"+i).removeClass("inputBorder");
									$("#achievements_eventname_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									companyname = null;
									achievements = null;
								}else{
									$("#achievements_edit_div").addClass("hidden");
									$("#achievements_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Achievements details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			
			$("#culturalsUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_culturals_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(18, dynamicid.length);
						var name = $("#culturals_name_"+i).val();
						var achievements = $("#culturals_achievements_"+i).val();
						if(name == "" || name == "-" || name.length == 0) validation = false;
						if(achievements == "" || achievements == "-" || achievements.length == 0) validation = false;
					});
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_culturals_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(18, dynamicid.length);
							var id = $("#culturals_id_"+i).val();
							var empid = $("#emp_id").val();
							var name = $("#culturals_name_"+i).val();
							var achievements = $("#culturals_achievements_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/culturalsupdate/"+id+"/"+empid+"/"+name+"/"+achievements;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#culturals_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#culturals_edit_div").removeClass("hidden");
									$("#culturals_addmore").prop("disabled", false);
									$("#culturals_addmore").removeClass("graybtn");
									
									if($("#culturals_name_"+i).val() == "" || $("#culturals_name_"+i).val() == "-"){
										$("#culturals_name_"+i).val("-");
									}
									if($("#culturals_achievements_"+i).val() == "" || $("#culturals_achievements_"+i).val() == "-"){
										$("#culturals_achievements_"+i).val("-");
									}
									$("#culturals_name_"+i).prop( "disabled", true );
									$("#culturals_achievements_"+i).prop( "disabled", true );
									
									$("#culturals_name_"+i).addClass("inputdisable");
									$("#culturals_achievements_"+i).addClass("inputdisable");
									
									$("#culturals_name_"+i).removeClass("inputBorder");
									$("#culturals_achievements_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									name = null;
									achievements = null;
								}else{
									$("#culturals_edit_div").addClass("hidden");
									$("#culturals_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Culturals details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			
			$("#sportsUpdate").click(function() {
				$("body").css("cursor", "progress");
					var validation = true;
					$('[id^="emp_sports_div_"]').each(function(i, item) {
						var dynamicid = $(this).attr("id");
						var i = dynamicid.substring(15, dynamicid.length);
						var name = $("#sports_name_"+i).val();
						var achievements = $("#sports_eventname_"+i).val();
						if(name == "" || name == "-" || name.length == 0) validation = false;
						if(achievements == "" || achievements == "-" || achievements.length == 0) validation = false;
					});
					
					if(validation == false){
						$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
						$.fancybox.open('#errorMsg');
					}else{
						$('[id^="emp_sports_div_"]').each(function(i, item) {
							var dynamicid = $(this).attr("id");
							var i = dynamicid.substring(15, dynamicid.length);
							var id = $("#sports_id_"+i).val();
							var empid = $("#emp_id").val();
							var name = $("#sports_name_"+i).val();
							var achievements = $("#sports_eventname_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/sportsupdate/"+id+"/"+empid+"/"+name+"/"+achievements;
						$.ajax({
							url : resourceURL,
							type : 'GET',
							dataType : 'json',
							async : false,
							success: function(data){
								var successflag = data.response.successflag;
								var errors = data.response.errors;
								if(successflag == "true"){
									$("#sports_updatebutton").addClass("hidden");
									$("#findoption").prop( 'disabled', false );
									$("#empid").prop( 'disabled', false );
									$("#sports_edit_div").removeClass("hidden");
									$("#sports_addmore").prop("disabled", false);
									$("#sports_addmore").removeClass("graybtn");
									
									if($("#sports_name_"+i).val() == "" || $("#sports_name_"+i).val() == "-"){
										$("#sports_name_"+i).val("-");
									}
									if($("#sports_eventname_"+i).val() == "" || $("#sports_eventname_"+i).val() == "-"){
										$("#sports_eventname_"+i).val("-");
									}
									$("#sports_name_"+i).prop( "disabled", true );
									$("#sports_eventname_"+i).prop( "disabled", true );
									
									$("#sports_name_"+i).addClass("inputdisable");
									$("#sports_eventname_"+i).addClass("inputdisable");
									
									$("#sports_name_"+i).removeClass("inputBorder");
									$("#sports_eventname_"+i).removeClass("inputBorder");
									
									id = null;
									empid = null;
									name = null;
									achievements = null;
								}else{
									$("#sports_edit_div").addClass("hidden");
									$("#sports_updatebutton").removeClass("hidden");
									$("#errorMsgContent").html(errors);
									$.fancybox.open('#errorMsg');
								} 
							},
							error: function (xhr, ajaxOptions, thrownError) {
								$("#errorMsgContent").html(thrownError);
								$.fancybox.open('#errorMsg');
							}
						});
					});
					$("#alertMsgContent").html("Sports details updated successfully...");
					$.fancybox.open('#alertMsg');
				}		
				$("body").css("cursor", "default");
			});
			
			$("#decline").click(function(){
				$("#confirmationMsgContentDecline1").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline1');
			});
			$("#decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#decline_yes").click(function(){
			//Select Box Properties
			$('.ui-datepicker-trigger').addClass("hidden");
			
				$("#status").addClass("hidden");
				$("#optional_status").removeClass("hidden");
				$("#edit").removeClass("hidden");
				$("#updatebutton").addClass("hidden");
				$("#findoption").prop( 'disabled', false );
				$("#empid").prop( 'disabled', false );
				//Function Call For Decline Employee
				declineEmployee();
				$("#emp_id").prop( "disabled", true );
				$("#firstname").prop( "disabled", true );
				$("#middlename").prop( "disabled", true );
				$("#lastname").prop( "disabled", true );
				$("#mobileno").prop( "disabled", true );
				$("#phone").prop( "disabled", true );
				$("#emailid").prop( "disabled", true );
				$("#passport").prop( "disabled", true );
				$("#pplaceofissued").prop( "disabled", true );
				$("#pvalidupto").prop( "disabled", true );
				$("#dlno").prop( "disabled", true );
				$("#pan").prop( "disabled", true );
				
				$("#emp_id").removeClass("inputBorder");
				$("#firstname").removeClass("inputBorder");
				$("#middlename").removeClass("inputBorder");
				$("#lastname").removeClass("inputBorder");
				$("#mobileno").removeClass("inputBorder");
				$("#phone").removeClass("inputBorder");
				$("#emailid").removeClass("inputBorder");
				$("#passport").removeClass("inputBorder");
				$("#pplaceofissued").removeClass("inputBorder");
				$("#pvalidupto").removeClass("inputBorder");
				$("#dlno").removeClass("inputBorder");
				$("#pan").removeClass("inputBorder");
				
				$("#emp_id").addClass("inputdisable");
				$("#firstname").addClass("inputdisable");
				$("#middlename").addClass("inputdisable");
				$("#lastname").addClass("inputdisable");
				$("#mobileno").addClass("inputdisable");
				$("#phone").addClass("inputdisable");
				$("#emailid").addClass("inputdisable");
				$("#passport").addClass("inputdisable");
				$("#pplaceofissued").addClass("inputdisable");
				$("#pvalidupto").addClass("inputdisable");
				$("#dlno").addClass("inputdisable");
				$("#pan").addClass("inputdisable");
				$.fancybox.close();
			});
			
			$("#empdetail_decline").click(function(){
				$("#confirmationMsgContentDecline2").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline2');
			});
			$("#empdetail_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#empdetail_decline_yes").click(function() {
				$("body").css("cursor", "progress");
				$('.ui-datepicker-trigger').addClass("hidden");
					$("#gender").addClass("hidden");
					$("#optional_gender").removeClass("hidden");
					$("#marital").addClass("hidden");
					$("#optional_marital").removeClass("hidden");
					$("#possessvehicle").addClass("hidden");
					$("#optional_possessvehicle").removeClass("hidden");
					$("#accidentillness").addClass("hidden");
					$("#optional_accidentillness").removeClass("hidden");
					//Function Call For Decline Employee Details
					declineEmployeeDetsils();
					$("#empupdatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#empdetail_edit").removeClass("hidden");
					$("#dob").prop( "disabled", true );
					$("#age").prop( "disabled", true );
					$("#postapplied").prop( "disabled", true );
					$("#department").prop( "disabled", true );
					$("#jdate").prop( "disabled", true );
					$("#rdate").prop( "disabled", true );
					$("#emergencyno").prop( "disabled", true );
					$("#doa").prop( "disabled", true );
					$("#b_group").prop( "disabled", true );
					$("#illnessdescr").prop( "disabled", true );
					
					$("#dob").removeClass("inputBorder");
					$("#age").removeClass("inputBorder");
					$("#postapplied").removeClass("inputBorder");
					$("#department").removeClass("inputBorder");
					$("#jdate").removeClass("inputBorder");
					$("#rdate").removeClass("inputBorder");
					$("#emergencyno").removeClass("inputBorder");
					$("#doa").removeClass("inputBorder");
					$("#b_group").removeClass("inputBorder");
					$("#illnessdescr").removeClass("inputBorder");
					
					$("#dob").addClass("inputdisable");
					$("#age").addClass("inputdisable");
					$("#postapplied").addClass("inputdisable");
					$("#department").addClass("inputdisable");
					$("#jdate").addClass("inputdisable");
					$("#rdate").addClass("inputdisable");
					$("#emergencyno").addClass("inputdisable");
					$("#doa").addClass("inputdisable");
					$("#b_group").addClass("inputdisable");
					$("#illnessdescr").addClass("inputdisable");
					 $.fancybox.close();
				    $("body").css("cursor", "default");
			});
			
			$("#address_decline").click(function(){
				$("#confirmationMsgContentDecline3").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline3');
			});
			$("#address_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#address_decline_yes").click(function() {
				$("body").css("cursor", "progress");
					$("#address_edit").removeClass("hidden");
					$("#addrupdatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					//Function Call For Decline Employee Address
					declineEmployeeAddress();
					$("#cstreet").prop( "disabled", true );
					$("#ccity").prop( "disabled", true );
					$("#cstate").prop( "disabled", true );
					$("#ccountry").prop( "disabled", true );
					$("#cpincode").prop( "disabled", true );
					$("#caddress").prop( "disabled", true );
					$("#pstreet").prop( "disabled", true );
					$("#pcity").prop( "disabled", true );
					$("#pstate").prop( "disabled", true );
					$("#pcountry").prop( "disabled", true );
					$("#ppincode").prop( "disabled", true );
					$("#paddress").prop( "disabled", true );
					
					$("#cstreet").removeClass("inputBorder");
					$("#ccity").removeClass("inputBorder");
					$("#cstate").removeClass("inputBorder");
					$("#ccountry").removeClass("inputBorder");
					$("#cpincode").removeClass("inputBorder");
					$("#caddress").removeClass("inputBorder");
					$("#pstreet").removeClass("inputBorder");
					$("#pcity").removeClass("inputBorder");
					$("#pstate").removeClass("inputBorder");
					$("#pcountry").removeClass("inputBorder");
					$("#ppincode").removeClass("inputBorder");
					$("#paddress").removeClass("inputBorder");
					
					$("#cstreet").addClass("inputdisable");
					$("#ccity").addClass("inputdisable");
					$("#cstate").addClass("inputdisable");
					$("#ccountry").addClass("inputdisable");
					$("#cpincode").addClass("inputdisable");
					$("#caddress").addClass("inputdisable");
					$("#pstreet").addClass("inputdisable");
					$("#pcity").addClass("inputdisable");
					$("#pstate").addClass("inputdisable");
					$("#pcountry").addClass("inputdisable");
					$("#ppincode").addClass("inputdisable");
					$("#paddress").addClass("inputdisable"); 
					 $.fancybox.close();
				$("body").css("cursor", "default");
			 });
			
			$("#familydetails_decline").click(function(){
				$("#confirmationMsgContentDecline4").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline4');
			});
			$("#familydetails_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#familydetails_decline_yes").click(function() {
				$("body").css("cursor", "progress");
					$("#familydetails_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#familydetails_edit_div").removeClass("hidden");
					$('[id^="emp_familybackground_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(25, id.length);
						$("#emp_familybackground_div_"+i).remove();
					});
					//Function Call For Decline Employee Address
					declineEmployeeFamilyBackground();
					$('[id^="emp_familybackground_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(25, id.length);
						$("#fb_relationship_"+i).prop( "disabled", true );
						$("#fb_name_"+i).prop( "disabled", true );
						$("#fb_age_"+i).prop( "disabled", true );
						$("#fb_education_"+i).prop( "disabled", true );
						$("#fb_occupation_"+i).prop( "disabled", true );
						
						$("#fb_relationship_"+i).addClass("inputdisable");
						$("#fb_name_"+i).addClass("inputdisable");
						$("#fb_age_"+i).addClass("inputdisable");
						$("#fb_education_"+i).addClass("inputdisable");
						$("#fb_occupation_"+i).addClass("inputdisable");
						
						$("#fb_relationship_"+i).removeClass("inputBorder");
						$("#fb_name_"+i).removeClass("inputBorder");
						$("#fb_age_"+i).removeClass("inputBorder");
						$("#fb_education_"+i).removeClass("inputBorder");
						$("#fb_occupation_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#education_decline").click(function(){
				$("#confirmationMsgContentDecline5").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline5');
			});
			$("#education_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#education_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#education_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#education_edit_div").removeClass("hidden");
					//Function Call For Decline Employee Address
					$('[id^="emp_education_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(18, id.length);
						$("#emp_education_div_"+i).remove();
					});
						declineEmployeeEducation();
					$('[id^="emp_education_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(18, id.length);
						$("#edu_institutionname_"+i).prop( "disabled", true );
						$("#edu_degree_"+i).prop( "disabled", true );
						$("#edu_specialization_"+i).prop( "disabled", true );
						$("#edu_rankscholarship_"+i).prop( "disabled", true );
						$("#edu_from_"+i).prop( "disabled", true );
						$("#edu_to_"+i).prop( "disabled", true );
						
						$("#edu_institutionname_"+i).addClass("inputdisable");
						$("#edu_degree_"+i).addClass("inputdisable");
						$("#edu_specialization_"+i).addClass("inputdisable");
						$("#edu_rankscholarship_"+i).addClass("inputdisable");
						$("#edu_from_"+i).addClass("inputdisable");
						$("#edu_to_"+i).addClass("inputdisable");
						
						$("#edu_institutionname_"+i).removeClass("inputBorder");
						$("#edu_degree_"+i).removeClass("inputBorder");
						$("#edu_specialization_"+i).removeClass("inputBorder");
						$("#edu_rankscholarship_"+i).removeClass("inputBorder");
						$("#edu_from_"+i).removeClass("inputBorder");
						$("#edu_to_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#references_decline").click(function(){
				$("#confirmationMsgContentDecline6").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline6');
			});
			$("#references_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#references_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#references_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#references_edit_div").removeClass("hidden");
					$('[id^="emp_reference_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(18, id.length);
						$("#emp_reference_div_"+i).remove();
					});
						declineEmployeeReferences();
					$('[id^="emp_reference_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(18, id.length);
						$("#ref_name_"+i).prop( "disabled", true );
						$("#ref_address_"+i).prop( "disabled", true );
						$("#ref_phone_"+i).prop( "disabled", true );
						$("#ref_mobile_"+i).prop( "disabled", true );
						$("#ref_skill_"+i).prop( "disabled", true );
						$("#ref_designation_"+i).prop( "disabled", true );
						
						$("#ref_name_"+i).addClass("inputdisable");
						$("#ref_address_"+i).addClass("inputdisable");
						$("#ref_phone_"+i).addClass("inputdisable");
						$("#ref_mobile_"+i).addClass("inputdisable");
						$("#ref_skill_"+i).addClass("inputdisable");
						$("#ref_designation_"+i).addClass("inputdisable");
						
						$("#ref_name_"+i).removeClass("inputBorder");
						$("#ref_address_"+i).removeClass("inputBorder");
						$("#ref_phone_"+i).removeClass("inputBorder");
						$("#ref_mobile_"+i).removeClass("inputBorder");
						$("#ref_skill_"+i).removeClass("inputBorder");
						$("#ref_designation_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			$("#skillset_decline").click(function(){
				$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline');
			});
			$("#skillset_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#skillset_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#skillset_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#skillset_edit_div").removeClass("hidden");
						$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(17, id.length);
							$("#emp_skillset_div_"+i).remove();
						});
						declineEmployeeSkillset();
						$('[id^="emp_skillset_tbl_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(17, id.length);
						$("#skillset_level_"+i).addClass("hidden");
						$("#skillset_level_optional_"+i).removeClass("hidden");
						
						$("#skillset_name_"+i).prop( "disabled", true );
						$("#skillset_name_"+i).addClass("inputdisable");
						$("#skillset_name_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#languageknown_decline").click(function(){
				$("#confirmationMsgContentDecline7").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline7');
			});
			$("#languageknown_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#languageknown_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#languageknown_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#languageknown_edit_div").removeClass("hidden");
					$('[id^="emp_languageknown_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(22, id.length);
						$("#emp_languageknown_div_"+i).remove();
					});
						declineEmployeeLanguageKnown();
						$('[id^="emp_languageknown_div_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(22, id.length);
						$("#languageknown_read_"+i).addClass("hidden");
						$("#languageknown_read_optional_"+i).removeClass("hidden");
						
						$("#languageknown_write_"+i).addClass("hidden");
						$("#languageknown_write_optional_"+i).removeClass("hidden");
						
						$("#languageknown_speak_"+i).addClass("hidden");
						$("#languageknown_speak_optional_"+i).removeClass("hidden");
						
						$("#languageknown_name_"+i).prop( "disabled", true );
						$("#languageknown_name_"+i).addClass("inputdisable");
						$("#languageknown_name_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#employmenthistory_decline").click(function(){
				$("#confirmationMsgContentDecline8").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline8');
			});
			$("#employmenthistory_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#employmenthistory_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#employmenthistory_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#employmenthistory_edit_div").removeClass("hidden");
					$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(26, id.length);
						$("#emp_employmenthistory_div_"+i).remove();
					});
						declineEmploymentHistory();
				$('[id^="emp_employmenthistory_div_"]').each(function(i, item) {
					var id = $(this).attr("id");
					var i = id.substring(26, id.length);
					$("#history_name_"+i).prop( "disabled", true );
					$("#history_address_"+i).prop( "disabled", true );
					$("#history_fromdate_"+i).prop( "disabled", true );
					$("#history_todate_"+i).prop( "disabled", true );
					$("#history_startingsalary_"+i).prop( "disabled", true );
					$("#history_lastsalary_"+i).prop( "disabled", true );
					$("#history_designation_"+i).prop( "disabled", true );
					$("#history_responsibility_"+i).prop( "disabled", true );
					
					$("#history_name_"+i).addClass("inputdisable");
					$("#history_address_"+i).addClass("inputdisable");
					$("#history_fromdate_"+i).addClass("inputdisable");
					$("#history_todate_"+i).addClass("inputdisable");
					$("#history_startingsalary_"+i).addClass("inputdisable");
					$("#history_lastsalary_"+i).addClass("inputdisable");
					$("#history_designation_"+i).addClass("inputdisable");
					$("#history_responsibility_"+i).addClass("inputdisable");
					
					$("#history_name_"+i).removeClass("inputBorder");
					$("#history_address_"+i).removeClass("inputBorder");
					$("#history_fromdate_"+i).removeClass("inputBorder");
					$("#history_todate_"+i).removeClass("inputBorder");
					$("#history_startingsalary_"+i).removeClass("inputBorder");
					$("#history_lastsalary_"+i).removeClass("inputBorder");
					$("#history_designation_"+i).removeClass("inputBorder");
					$("#history_responsibility_"+i).removeClass("inputBorder");
					 $.fancybox.close();
				});
				$("body").css("cursor", "default");
			 });
			
			$("#achievements_decline").click(function(){
				$("#confirmationMsgContentDecline9").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline9');
			});
			$("#achievements_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#achievements_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#achievements_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#achievements_edit_div").removeClass("hidden");
					$('[id^="emp_achievements_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(21, id.length);
						$("#emp_achievements_div_"+i).remove();
					});
						declineEmployeeAchievements();
					$('[id^="emp_achievements_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(21, id.length);
						$("#achievements_companyname_"+i).prop( "disabled", true );
						$("#achievements_eventname_"+i).prop( "disabled", true );
						
						$("#achievements_companyname_"+i).addClass("inputdisable");
						$("#achievements_eventname_"+i).addClass("inputdisable");
						
						$("#achievements_companyname_"+i).removeClass("inputBorder");
						$("#achievements_eventname_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#culturals_decline").click(function(){
				$("#confirmationMsgContentDecline10").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline10');
			});
			$("#culturals_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#culturals_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#culturals_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#culturals_edit_div").removeClass("hidden");
					$('[id^="emp_culturals_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(18, id.length);
						$("#emp_culturals_div_"+i).remove();
					});
						declineEmployeeCulturals();
						$('[id^="emp_culturals_div_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(18, id.length);
						$("#culturals_name_"+i).prop( "disabled", true );
						$("#culturals_achievements_"+i).prop( "disabled", true );
						
						$("#culturals_name_"+i).addClass("inputdisable");
						$("#culturals_achievements_"+i).addClass("inputdisable");
						
						$("#culturals_name_"+i).removeClass("inputBorder");
						$("#culturals_achievements_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#sports_decline").click(function(){
				$("#confirmationMsgContentDecline11").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline11');
			});
			$("#sports_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#sports_decline_yes").click(function() {
				$("body").css("cursor", "default");
					$("#sports_updatebutton").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					$("#sports_edit_div").removeClass("hidden");
					$('[id^="emp_sports_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(15, id.length);
						$("#emp_sports_div_"+i).remove();
					});
					declineEmployeeSports();
					$('[id^="emp_sports_div_"]').each(function(i, item) {
						var id = $(this).attr("id");
						var i = id.substring(15, id.length);
						$("#sports_name_"+i).prop( "disabled", true );
						$("#sports_eventname_"+i).prop( "disabled", true );
						
						$("#sports_name_"+i).addClass("inputdisable");
						$("#sports_eventname_"+i).addClass("inputdisable");
						
						$("#sports_name_"+i).removeClass("inputBorder");
						$("#sports_eventname_"+i).removeClass("inputBorder");
						 $.fancybox.close();
					});
				$("body").css("cursor", "default");
			 });
			
			$("#emp_about_decline").click(function(){
				$("#confirmationMsgContentDecline12").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline12');
			});
			$("#emp_about_decline_no").click(function(){
				 $.fancybox.close();
			 });
			$("#emp_about_decline_yes").click(function() {
				$("body").css("cursor", "progress");
					$("#emp_about_edit").removeClass("hidden");
					$("#emp_about_update_button").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					//Function Call For Decline Employee About Details
						declineEmployeeAbout();
					$("#emp_strength").prop( "disabled", true );
					$("#emp_weakness").prop( "disabled", true );
					$("#emp_totalexp").prop( "disabled", true );
					$("#emp_releventexp").prop( "disabled", true );
					$("#emp_presentsalary").prop( "disabled", true );
					$("#emp_expectedsalary").prop( "disabled", true );
					
					$("#emp_strength").removeClass("inputBorder");
					$("#emp_weakness").removeClass("inputBorder");
					$("#emp_totalexp").removeClass("inputBorderSelect");
					$("#emp_releventexp").removeClass("inputBorder");
					$("#emp_presentsalary").removeClass("inputBorder");
					$("#emp_expectedsalary").removeClass("inputBorder");
					
					$("#emp_strength").addClass("inputdisable");
					$("#emp_weakness").addClass("inputdisable");
					$("#emp_totalexp").addClass("inputdisable");
					$("#emp_releventexp").addClass("inputdisable");
					$("#emp_presentsalary").addClass("inputdisable");
					$("#emp_expectedsalary").addClass("inputdisable");
					 $.fancybox.close();
			 });
			 
			$("#empbank_acc_decline").click(function(){
				$("#confirmationMsgContentDecline13").html("Are you sure want to decline...?");
				$.fancybox.open('#confirmMsgDecline13');
			});
			$("#empbank_acc_decline_no").click(function(){
				 $.fancybox.close();
			 });
			 $("#empbank_acc_decline_yes").click(function() {
				$("body").css("cursor", "progress");
					$("#empbank_acc_edit").removeClass("hidden");
					$("#empbank_acc_update_button").addClass("hidden");
					$("#findoption").prop( 'disabled', false );
					$("#empid").prop( 'disabled', false );
					//Function Call For Decline Employee Bank Details
					declineEmployeeBankDetails();
					$("#bank_name").prop( "disabled", true );
					$("#bank_accno").prop( "disabled", true );
					$("#bank_branch").prop( "disabled", true );
					$("#bank_address").prop( "disabled", true );
					$("#bank_city").prop( "disabled", true );
					$("#bank_state").prop( "disabled", true );
					$("#bank_pincode").prop( "disabled", true );
					$("#bank_ifsc").prop( "disabled", true );
					
					$("#bank_name").removeClass("inputBorder");
					$("#bank_accno").removeClass("inputBorder");
					$("#bank_branch").removeClass("inputBorderSelect");
					$("#bank_address").removeClass("inputBorder");
					$("#bank_city").removeClass("inputBorder");
					$("#bank_state").removeClass("inputBorder");
					$("#bank_pincode").removeClass("inputBorder");
					$("#bank_ifsc").removeClass("inputBorder");
					
					$("#bank_name").addClass("inputdisable");
					$("#bank_accno").addClass("inputdisable");
					$("#bank_branch").addClass("inputdisable");
					$("#bank_address").addClass("inputdisable");
					$("#bank_city").addClass("inputdisable");
					$("#bank_state").addClass("inputdisable");
					$("#bank_pincode").addClass("inputdisable");
					$("#bank_ifsc").addClass("inputdisable");
					 $.fancybox.close();
			 });
			function EmployeeDetail(id) {
				$("body").css("cursor", "progress");
					$("#employeeList").addClass("hidden");
					$("#employeeDetail").removeClass("hidden");
					$("#headlist").addClass("hidden");
					$("#headdetail").removeClass("hidden");
					$("#mandatorycheck").addClass("hidden");
					//Employee
					var resourceURL = $("#contextpath").val()+"/employee/retrivebyid/"+id;
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
								$.each(results, function (i, result){
									$("#emp_id").val((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
									$("#firstname").val((result.firstname == undefined || result.firstname == null || result.firstname.length <= 0) ? "-" : result.firstname);
									$("#middlename").val((result.middlename == undefined || result.middlename == null || result.middlename.length <= 0) ? "-" : result.middlename);
									$("#lastname").val((result.lastname == undefined || result.lastname == null || result.lastname.length <= 0) ? "-" : result.lastname);
									$("#emailid").val((result.email == undefined || result.email == null || result.email.legnth <= 0) ? "-" : result.email);
									$("#mobileno").val((result.mobile == undefined || result.mobile == null || result.mobile.length <= 0) ? "-" : result.mobile);
									$("#phone").val((result.phone == undefined || result.phone == null || result.phone.length <= 0) ? "-" : result.phone);
									$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
									if(result.status == "a"){
										$("#optional_status").html("Active");
									}else if(result.status == "i"){
										$("#optional_status").html("In-Active");
									}else if(result.status == undefined || result.status == null || result.status.length <= 0){
										$("#optional_status").html("-");
									}
									$("#passport").val((result.passport == undefined || result.passport == null || result.passport.length <= 0) ? "-" : result.passport);
									$("#pplaceofissued").val((result.pplaceofissued == undefined || result.pplaceofissued == null || result.pplaceofissued.length <= 0) ? "-" : result.pplaceofissued);
									$("#pvalidupto").val((result.pvalidupto == undefined || result.pvalidupto == null || result.pvalidupto.length <= 0) ? "-" : result.pvalidupto);
									$("#dlno").val((result.dlno == undefined || result.dlno == null || result.dlno.length <= 0) ? "-" : result.dlno);
									$("#pan").val((result.pan == undefined || result.pan == null || result.pan.length <= 0) ? "-" : result.pan);
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
					
					//Employee Details
					var resourceURL = $("#contextpath").val()+"/employee/details/"+id;
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
									$("#dob").val((result.dob == undefined || result.dob == null || result.dob.length <= 0) ? "-" : result.dob);
									$("#age").val((result.age == undefined || result.age == null || result.age.length <= 0) ? "-" : result.age);
									$("#gender").val((result.gender == undefined || result.gender == null || result.gender.length <= 0) ? "-" : result.gender);
									if(result.gender =="m"){
										$("#optional_gender").html("Male");
									}else if(result.gender =="f"){
										$("#optional_gender").html("Female");
									}else if(result.gender == undefined || result.gender == null || result.gender.length <= 0){
										$("#optional_gender").html("-");
									}
									$("#postapplied").val((result.postapplied == undefined || result.postapplied == null || result.postapplied.length <= 0) ? "-" : result.postapplied);
									$("#department").val((result.department == undefined || result.department == null || result.department.length <= 0) ? "-" : result.department);
									$("#jdate").val((result.jdate == undefined || result.jdate == null || result.jdate.length <= 0) ? "-" : result.jdate);
									$("#rdate").val((result.rdate == undefined || result.rdate == null || result.rdate.length <= 0) ? "-" : result.rdate);
									$("#emergencyno").val((result.emergencyno == undefined || result.emergencyno == null || result.emergencyno.length <= 0) ? "-" : result.emergencyno);
									$("#marital").val((result.maritalstatus == undefined || result.maritalstatus == null || result.maritalstatus.length <= 0) ? "-" : result.maritalstatus);
									if(result.maritalstatus =="m"){
										$("#optional_marital").html("Married");
									}else if(result.maritalstatus =="u"){
										$("#optional_marital").html("Unmarried");
									}else if(result.maritalstatus == undefined || result.maritalstatus == null || result.maritalstatus.length <= 0){
										$("#optional_marital").html("-");
									}
									$("#doa").val((result.doa == undefined || result.doa == null || result.doa.length <= 0) ? "-" : result.doa);
									$("#b_group").val((result.bgroup == undefined || result.bgroup == null || result.bgroup.length <= 0) ? "-" : result.bgroup);
									$("#possessvehicle").val((result.possessvehicle == undefined || result.possessvehicle == null || result.possessvehicle.length <= 0) ? "-" : result.possessvehicle);
									if(result.possessvehicle =="y"){
										$("#optional_possessvehicle").html("Yes");
									}else if(result.possessvehicle =="n"){
										$("#optional_possessvehicle").html("No");
									}else if(result.possessvehicle == undefined || result.possessvehicle == null || result.possessvehicle.length <= 0){
										$("#optional_possessvehicle").html("-");
									}
									$("#accidentillness").val((result.accidentillness == undefined || result.accidentillness == null || result.accidentillness.length <= 0) ? "-" : result.accidentillness);
									if(result.accidentillness =="y"){
										$("#optional_accidentillness").html("Yes");
									}else if(result.accidentillness =="n"){
										$("#optional_accidentillness").html("No");
									}else if(result.accidentillness == undefined || result.accidentillness == null || result.accidentillness.length <= 0){
										$("#optional_accidentillness").html("-");
									}
									$("#illnessdescr").val((result.illnessdescr == undefined || result.illnessdescr == null || result.illnessdescr.length <= 0) ? "-" : result.illnessdescr);
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
					//Address Details
					var resourceURL = $("#contextpath").val()+"/employee/address/"+id;
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
									if(result.addresstype != null && result.addresstype == "c"){
										$("#cid").val((result.cid == undefined || result.cid == null || result.cid.length <= 0) ? "-" : result.cid);
										$("#cstreet").val((result.cstreet == undefined || result.cstreet == null || result.cstreet.length <= 0) ? "-" : result.cstreet);
										$("#ccity").val((result.ccity == undefined || result.ccity == null || result.ccity.length <= 0) ? "-" : result.ccity);
										$("#cstate").val((result.cstate == undefined || result.cstate == null || result.cstate.length <= 0) ? "-" : result.cstate);
										$("#ccountry").val((result.ccountry == undefined || result.ccountry == null || result.ccountry.length <= 0) ? "-" : result.ccountry);
										$("#cpincode").val((result.cpincode == undefined || result.cpincode == null || result.cpincode.length <= 0) ? "-" : result.cpincode);
									}else if(result.addresstype != null && result.addresstype == "p"){
										$("#pid").val((result.pid == undefined || result.pid == null || result.pid.length <= 0) ? "-" : result.pid);
										$("#pstreet").val((result.pstreet == undefined || result.pstreet == null || result.pstreet.length <= 0) ? "-" : result.pstreet);
										$("#pcity").val((result.pcity == undefined || result.pcity == null || result.pcity.length <= 0) ? "-" : result.pcity);
										$("#pstate").val((result.pstate == undefined || result.pstate == null || result.pstate.length <= 0) ? "-" : result.pstate);
										$("#pcountry").val((result.pcountry == undefined || result.pcountry == null || result.pcountry.length <= 0) ? "-" : result.pcountry);
										$("#ppincode").val((result.ppincode == undefined || result.ppincode == null || result.ppincode.length <= 0) ? "-" : result.ppincode);
									}
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
					//employee family background details
					var resourceURL = $("#contextpath").val()+"/employee/getfamilybackgrounddetails/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									count=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_familybackground_div_' + count});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_familybackground_tbl_' + count +'"><tr><td class="lableContent">Relationship</td><td class="value"><input id="fb_relationship_' + count +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input></td></tr><tr><td class="lableContent">Name</td><td class="value"><input id="fb_name_' + count +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input></td></tr><tr><td class="lableContent">Age</td><td class="value"><input id="fb_age_' + count +'" disabled="disabled" class="inputdisable"maxlength="2" onkeypress="return validateNumeric(event)"></input></td></tr><tr><td class="lableContent">Education</td><td class="value"><input id="fb_education_' + count +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input></td></tr><tr><td class="lableContent">Occupation</td><td class="value"><input id="fb_occupation_' + count +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input><input type="text" name="fb_id_' + count +'" id="fb_id_' + count +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_family_background_details_div");
									$("#fb_id_"+count).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#fb_relationship_"+count).val((result[i].reletionship == undefined || result[i].reletionship == null || result[i].reletionship == "null" || result[i].reletionship == 0 || result[i].reletionship.length <= 0) ? "-" : result[i].reletionship);
									$("#fb_name_"+count).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0  || result[i].name.length <= 0) ? "-" : result[i].name);
									$("#fb_age_"+count).val((result[i].age == undefined || result[i].age == null || result[i].age == "null" || result[i].age == 0  || result[i].age.length <= 0) ? "-" : result[i].age);
									$("#fb_education_"+count).val((result[i].education == undefined || result[i].education == null || result[i].education == "null" || result[i].education == 0  || result[i].education.length <= 0) ? "-" : result[i].education);
									$("#fb_occupation_"+count).val((result[i].occupation == undefined || result[i].occupation == null || result[i].occupation == "null" || result[i].occupation == 0  || result[i].occupation.length <= 0) ? "-" : result[i].occupation);
								}
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
					//employee education details
					var resourceURL = $("#contextpath").val()+"/employee/getempeducationdetails/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									eduCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_education_div_' + eduCount});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_education_tbl_' + eduCount +'"><tr><td class="lableContent">Degree</td><td class="value"><input id="edu_degree_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Specialization</td><td class="value"><input id="edu_specialization_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Rank / Scholarship</td><td class="valueContent"><input id="edu_rankscholarship_' + eduCount +'" disabled="disabled" class="inputdisable"></td></tr><tr><td class="lableContent">Institution Name</td><td class="value"><input id="edu_institutionname_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">From</td><td class="value"><input id="edu_from_' + eduCount +'" disabled="disabled" class="datepicking inputdisable"></td></tr><tr><td class="lableContent">To</td><td class="value"><input id="edu_to_' + eduCount +'" disabled="disabled" class="datepicking inputdisable"></input><input type="text" name="edu_id_' + eduCount +'" id="edu_id_' + eduCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_education_details_div");
									$("#edu_id_"+eduCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#edu_institutionname_"+eduCount).val((result[i].institutionname == undefined || result[i].institutionname == null || result[i].institutionname == "null" || result[i].institutionname == 0 || result[i].institutionname.length <= 0) ? "-" : result[i].institutionname);
									$("#edu_degree_"+eduCount).val((result[i].degree == undefined || result[i].degree == null || result[i].degree == "null" || result[i].degree == 0  || result[i].degree.length <= 0) ? "-" : result[i].degree);
									$("#edu_specialization_"+eduCount).val((result[i].specialization == undefined || result[i].specialization == null || result[i].specialization == "null" || result[i].specialization == 0  || result[i].specialization.length <= 0) ? "-" : result[i].specialization);
									$("#edu_rankscholarship_"+eduCount).val((result[i].rankscholarship == undefined || result[i].rankscholarship == null || result[i].rankscholarship == "null" || result[i].rankscholarship == 0  || result[i].rankscholarship.length <= 0) ? "-" : result[i].rankscholarship);
									$("#edu_from_"+eduCount).val((result[i].edufrom == undefined || result[i].edufrom == null || result[i].edufrom == "null" || result[i].edufrom == 0  || result[i].edufrom.length <= 0) ? "-" : result[i].edufrom);
									$("#edu_to_"+eduCount).val((result[i].eduto == undefined || result[i].eduto == null || result[i].eduto == "null" || result[i].eduto == 0  || result[i].eduto.length <= 0) ? "-" : result[i].eduto);
								}
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
					//Employee Skill Set
					var resourceURL = $("#contextpath").val()+"/employee/getemployeeskillset/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									skillsetCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_skillset_div_' + skillsetCount});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_skillset_tbl_' + skillsetCount +'"><tr><td class="lableContent">Name</td><td class="value"><input id="skillset_name_' + skillsetCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContentSelect" style="height: 25px;">Level</td><td class="valueContent"><select id="skillset_level_' + skillsetCount +'" class="selectBox hidden" style="margin-left:0px; width:217px;" class="inputdisable"><option value="">Select</option><option value="b">Basic</option><option value="a">Advanced</option><option value="e">Expert</option></select><div id="skillset_level_optional_' + skillsetCount +'" class="value"></div><input type="text" name="skillset_id_' + skillsetCount +'" id="skillset_id_' + skillsetCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_skillset_details_div");
									$("#skillset_id_"+skillsetCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#skillset_name_"+skillsetCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
									$("#skillset_level_"+skillsetCount).val((result[i].level == undefined || result[i].level == null || result[i].level == "null" || result[i].level == 0  || result[i].level.length <= 0) ? "-" : result[i].level);
									if(result[i].level == "b"){
										$("#skillset_level_optional_"+skillsetCount).html("Basic");
									} else if(result[i].level == "a"){
										$("#skillset_level_optional_"+skillsetCount).html("Advanced");
									} else if(result[i].level == "e"){
										$("#skillset_level_optional_"+skillsetCount).html("Expert");
									} else {
										$("#skillset_level_optional_"+skillsetCount).html("-");
									}
								}
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
					//Employee Reference Details
					var resourceURL = $("#contextpath").val()+"/employee/getemployeereference/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									referenceCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_reference_div_' + referenceCount});
									newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="ref_name_' + referenceCount +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input></td></tr><tr><td class="lableContent">Address</td><td class="value"><input id="ref_address_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Phone</td><td class="value"><input id="ref_phone_' + referenceCount +'" disabled="disabled" class="inputdisable" maxlength="10" onkeypress="return validateNumeric(event)"></input></td></tr><tr><td class="lableContent">Mobile</td><td class="value"><input id="ref_mobile_' + referenceCount +'" disabled="disabled" class="inputdisable" maxlength="10" onkeypress="return validateNumeric(event)"></input></td></tr><tr><td class="lableContent">Skill</td><td class="value"><input id="ref_skill_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Designation</td><td class="value"><input id="ref_designation_' + referenceCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="ref_id_' + referenceCount +'" id="ref_id_' + referenceCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_references_details_div");
									$("#ref_id_"+referenceCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#ref_name_"+referenceCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
									$("#ref_address_"+referenceCount).val((result[i].address == undefined || result[i].address == null || result[i].address == "null" || result[i].address == 0  || result[i].address.length <= 0) ? "-" : result[i].address);
									$("#ref_phone_"+referenceCount).val((result[i].phone == undefined || result[i].phone == null || result[i].phone == "null" || result[i].phone == 0  || result[i].phone.length <= 0) ? "-" : result[i].phone);
									$("#ref_mobile_"+referenceCount).val((result[i].mobile == undefined || result[i].mobile == null || result[i].mobile == "null" || result[i].mobile == 0  || result[i].mobile.length <= 0) ? "-" : result[i].mobile);
									$("#ref_skill_"+referenceCount).val((result[i].skill == undefined || result[i].skill == null || result[i].skill == "null" || result[i].skill == 0  || result[i].skill.length <= 0) ? "-" : result[i].skill);
									$("#ref_designation_"+referenceCount).val((result[i].designation == undefined || result[i].designation == null || result[i].designation == "null" || result[i].designation == 0  || result[i].designation.length <= 0) ? "-" : result[i].designation);
									if(result.length == 1 && result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0){
										$("#references_addmore").prop("disabled", true);
										$("#references_addmore").addClass("graybtn");
									} else{
										$("#references_addmore").prop("disabled", false);
										$("#references_addmore").removeClass("graybtn");
									}
								}
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
					//Employee Language Known
					var resourceURL = $("#contextpath").val()+"/employee/getemployeelanguageknown/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									languageknownCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_languageknown_div_' + languageknownCount});
									newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="languageknown_name_'+ languageknownCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContentSelect">Read</td><td class="valueContent"><select id="languageknown_read_' + languageknownCount +'" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable"onkeypress="return ValidateAlpha(event)"><option value="" style="text-align:center">--- Select ---</option><option value="y" style="text-align:center">Yes</option><option value="n" style="text-align:center">No</option></select><div id="languageknown_read_optional_' + languageknownCount +'" class="value"></div></td><tr><td class="lableContentSelect">Write</td><td class="valueContent"><select id="languageknown_write_' + languageknownCount +'" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable"><option value="" style="text-align:center">--- Select ---</option><option value="y" style="text-align:center">Yes</option><option value="n" style="text-align:center">No</option></select><div id="languageknown_write_optional_' + languageknownCount +'" class="value"></div></td></tr><tr><td class="lableContentSelect">Speak</td><td class="valueContent"><select id="languageknown_speak_' + languageknownCount +'" class="selectBox hidden" style="margin:0px; width:217px;" class="inputdisable"><option value="" style="text-align:center">--- Select ---</option><option value="y" style="text-align:center">Yes</option><option value="n" style="text-align:center">No</option></select><div id="languageknown_speak_optional_' + languageknownCount +'" class="value"></div></input><input type="text" name="languageknown_id_' + languageknownCount +'" id="languageknown_id_' + languageknownCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_languageknown_details_div");
									$("#languageknown_id_"+languageknownCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#languageknown_name_"+languageknownCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
									$("#languageknown_read_"+languageknownCount).val((result[i].read == undefined || result[i].read == null || result[i].read == "null" || result[i].read == 0  || result[i].read.length <= 0) ? "-" : result[i].read);
									if(result[i].read == "y"){
										$("#languageknown_read_optional_"+languageknownCount).html("Yes");
									} else if(result[i].read == "n"){
										$("#languageknown_read_optional_"+languageknownCount).html("No");
									} else {
										$("#languageknown_read_optional_"+languageknownCount).html("-");
									}
									$("#languageknown_write_"+languageknownCount).val((result[i].write == undefined || result[i].write == null || result[i].write == "null" || result[i].write == 0  || result[i].write.length <= 0) ? "-" : result[i].write);
									if(result[i].write == "y"){
										$("#languageknown_write_optional_"+languageknownCount).html("Yes");
									} else if(result[i].write == "n"){
										$("#languageknown_write_optional_"+languageknownCount).html("No");
									} else {
										$("#languageknown_write_optional_"+languageknownCount).html("-");
									}
									$("#languageknown_speak_"+languageknownCount).val((result[i].speak == undefined || result[i].speak == null || result[i].speak == "null" || result[i].speak == 0  || result[i].speak.length <= 0) ? "-" : result[i].speak);
									if(result[i].speak == "y"){
										$("#languageknown_speak_optional_"+languageknownCount).html("Yes");
									} else if(result[i].speak == "n"){
										$("#languageknown_speak_optional_"+languageknownCount).html("No");
									}
								}
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
					//Employee Employment History
					var resourceURL = $("#contextpath").val()+"/employee/getemploymenthistory/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									historyCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_employmenthistory_div_' + historyCount});
									newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="history_name_'+ historyCount +'" disabled="disabled" class="inputdisable"onkeypress="return ValidateAlpha(event)"></input></td></tr><tr><td class="lableContent">Address</td><td class="value"><input id="history_address_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">From Date</td><td class="value"><input id="history_fromdate_'+ historyCount +'" disabled="disabled" class="datepicking inputdisable"></input></td></tr><tr><td class="lableContent">To Date</td><td class="value"><input id="history_todate_'+ historyCount +'" disabled="disabled" class="datepicking inputdisable"></input></td></tr><tr><td class="lableContent">Starting Salary</td><td class="value"><input id="history_startingsalary_'+ historyCount +'" disabled="disabled" class="inputdisable"onkeypress="return validateNumeric(event)"></input></td></tr><tr><td class="lableContent">Last Salary</td><td class="value"><input id="history_lastsalary_'+ historyCount +'" disabled="disabled" class="inputdisable"onkeypress="return validateNumeric(event)"></input></td></tr><tr><td class="lableContent">Designation</td><td class="value"><input id="history_designation_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Responsibility</td><td class="value"><input id="history_responsibility_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></input><input type="text" name="history_id_'+ historyCount +'" id="history_id_'+ historyCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_employmenthistory_details_div");
									$("#history_id_"+historyCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#history_name_"+historyCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
									$("#history_address_"+historyCount).val((result[i].address == undefined || result[i].address == null || result[i].address == "null" || result[i].address == 0  || result[i].address.length <= 0) ? "-" : result[i].address);
									$("#history_fromdate_"+historyCount).val((result[i].fromdate == undefined || result[i].fromdate == null || result[i].fromdate == "null" || result[i].fromdate == 0  || result[i].fromdate.length <= 0) ? "-" : result[i].fromdate);
									$("#history_todate_"+historyCount).val((result[i].todate == undefined || result[i].todate == null || result[i].todate == "null" || result[i].todate == 0  || result[i].todate.length <= 0) ? "-" : result[i].todate);
									$("#history_startingsalary_"+historyCount).val((result[i].startingsalary == undefined || result[i].startingsalary == null || result[i].startingsalary == "null" || result[i].startingsalary == 0  || result[i].startingsalary.length <= 0) ? "-" : result[i].startingsalary);
									$("#history_lastsalary_"+historyCount).val((result[i].lastsalary == undefined || result[i].lastsalary == null || result[i].lastsalary == "null" || result[i].lastsalary == 0  || result[i].lastsalary.length <= 0) ? "-" : result[i].lastsalary);
									$("#history_designation_"+historyCount).val((result[i].designation == undefined || result[i].designation == null || result[i].designation == "null" || result[i].designation == 0  || result[i].designation.length <= 0) ? "-" : result[i].designation);
									$("#history_responsibility_"+historyCount).val((result[i].responsibility == undefined || result[i].responsibility == null || result[i].responsibility == "null" || result[i].responsibility == 0  || result[i].responsibility.length <= 0) ? "-" : result[i].responsibility);
									if(result.length == 1 && result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0){
										$("#employmenthistory_addmore").prop("disabled", true);
										$("#employmenthistory_addmore").addClass("graybtn");
									} else{
										$("#employmenthistory_addmore").prop("disabled", false);
										$("#employmenthistory_addmore").removeClass("graybtn");
									}
								}
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
					//Employee Achievements
					var resourceURL = $("#contextpath").val()+"/employee/getemployeeachievements/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									achievementsCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_achievements_div_' + achievementsCount});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_achievements_tbl_' + achievementsCount +'"><tr><td class="lableContent">Company Name</td><td class="value"><input id="achievements_companyname_' + achievementsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Achievement</td><td class="value"><input id="achievements_eventname_' + achievementsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="achievements_id_' + achievementsCount +'" id="achievements_id_' + achievementsCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_achievements_details_div");
									$("#achievements_id_"+achievementsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#achievements_companyname_"+achievementsCount).val((result[i].companyname == undefined || result[i].companyname == null || result[i].companyname == "null" || result[i].companyname == 0 || result[i].companyname.length <= 0) ? "-" : result[i].companyname);
									$("#achievements_eventname_"+achievementsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
									if(result.length == 1 && result[i].companyname == undefined || result[i].companyname == null || result[i].companyname == "null" || result[i].companyname == 0 || result[i].companyname.length <= 0){
										$("#achievements_addmore").prop("disabled", true);
										$("#achievements_addmore").addClass("graybtn");
									} else{
										$("#achievements_addmore").prop("disabled", false);
										$("#achievements_addmore").removeClass("graybtn");
									}
								}
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
					//Employee Cultutals
					var resourceURL = $("#contextpath").val()+"/employee/getemployeeculturals/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									culturalsCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_culturals_div_' + culturalsCount});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_culturals_tbl_' + culturalsCount +'"><tr><td class="lableContent">Event Name</td><td class="value"><input id="culturals_name_' + culturalsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Event Achievement</td><td class="value"><input id="culturals_achievements_' + culturalsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="culturals_id_' + culturalsCount +'" id="culturals_id_' + culturalsCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_culturals_details_div");
									$("#culturals_id_"+culturalsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#culturals_name_"+culturalsCount).val((result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0) ? "-" : result[i].eventname);
									$("#culturals_achievements_"+culturalsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
									if(result.length == 1 && result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0){
										$("#culturals_addmore").prop("disabled", true);
										$("#culturals_addmore").addClass("graybtn");
									} else{
										$("#culturals_addmore").prop("disabled", false);
										$("#culturals_addmore").removeClass("graybtn");
									}
								}
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
					//Employee Sports
					var resourceURL = $("#contextpath").val()+"/employee/getemployeesports/"+id;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						async : false,
						success: function(data) {
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var result = data.response.result;
							
							if(successflag == "true"){
								for(var i=0;i<result.length;i++){
									sportsCount=i+1;
									var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_sports_div_' + sportsCount});
									newemp_dynamic.html('<br><table class="tableContent" id="emp_sports_tbl_' + sportsCount +'"><tr><td class="lableContent">Event Name</td><td class="value"><input id="sports_name_' + sportsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Event Achievement</td><td class="value"><input id="sports_eventname_' + sportsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="sports_id_' + sportsCount +'" id="sports_id_' + sportsCount +'" class="hidden"></td></tr></table>');
									newemp_dynamic.appendTo("#emp_sports_details_div");
									$("#sports_id_"+sportsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
									$("#sports_name_"+sportsCount).val((result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0) ? "-" : result[i].eventname);
									$("#sports_eventname_"+sportsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
									if(result.length == 1 && result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0){
										$("#sports_addmore").prop("disabled", true);
										$("#sports_addmore").addClass("graybtn");
									} else{
										$("#sports_addmore").prop("disabled", false);
										$("#sports_addmore").removeClass("graybtn");
									}
								}
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
					//Employee Account
					var resourceURL = $("#contextpath").val()+"/employee/empaboutdetails/"+id;
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
											$("#emp_abt_id").val((result.id == undefined || result.id == null || result.id == "null" || result.id == 0 || result.id.length <= 0) ? "-" : result.id);
											$("#emp_strength").val((result.strength == undefined || result.strength == null || result.strength == "null" || result.strength == 0  || result.strength.length <= 0) ? "-" : result.strength);
											$("#emp_weakness").val((result.weakness == undefined || result.weakness == null || result.weakness == "null" || result.weakness == 0  || result.weakness.length <= 0) ? "-" : result.weakness);
											$("#emp_totalexp").val((result.totalexp == undefined || result.totalexp == null || result.totalexp == "null" || result.totalexp == 0  || result.totalexp.length <= 0) ? "-" : result.totalexp);
											$("#emp_releventexp").val((result.releventexp == undefined || result.releventexp == null || result.releventexp == "null" || result.releventexp == 0  || result.releventexp.length <= 0) ? "-" : result.releventexp);
											$("#emp_presentsalary").val((result.presentsalary == undefined || result.presentsalary == null || result.presentsalary == "null" || result.presentsalary == 0  || result.presentsalary.length <= 0) ? "-" : result.presentsalary);	
											$("#emp_expectedsalary").val((result.expectedsalary == undefined || result.expectedsalary == null || result.expectedsalary == "null" || result.expectedsalary == 0  || result.expectedsalary.length <= 0) ? "-" : result.expectedsalary);
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
					//Employee Account
					var resourceURL = $("#contextpath").val()+"/employee/empbankdetail/"+id;
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
											$("#bank_name").val((result.bankname == undefined || result.bankname == null || result.bankname == "null" || result.bankname == 0 || result.bankname.length <= 0) ? "-" : result.bankname);
											$("#bank_accno").val((result.accountno == undefined || result.accountno == null || result.accountno == "null" || result.accountno == 0  || result.accountno.length <= 0) ? "-" : result.accountno);
											$("#bank_branch").val((result.branch == undefined || result.branch == null || result.branch == "null" || result.branch == 0  || result.branch.length <= 0) ? "-" : result.branch);
											$("#bank_address").val((result.address == undefined || result.address == null || result.address == "null" || result.address == 0  || result.address.length <= 0) ? "-" : result.address);
											$("#bank_city").val((result.city == undefined || result.city == null || result.city == "null" || result.city == 0  || result.city.length <= 0) ? "-" : result.city);
											$("#bank_state").val((result.state == undefined || result.state == null || result.state == "null" || result.state == 0  || result.state.length <= 0) ? "-" : result.state);	
											$("#bank_pincode").val((result.pincode == undefined || result.pincode == null || result.pincode == "null" || result.pincode == 0  || result.pincode.length <= 0) ? "-" : result.pincode);
											$("#bank_ifsc").val((result.ifsc == undefined || result.ifsc == null || result.ifsc == "null" || result.ifsc == 0  || result.ifsc <= 0) ? "-" : result.ifsc);
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
				$("body").css("cursor", "default");
			}
			$('#emp_familydetails_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Family Details
				var employeeid = $("#emp_id").val();
				var addrelationship = $("#familybackground_relationship").val();
				var addname = $("#familybackground_name").val();
				var addage = $("#familybackground_age").val();
				var addeducation = $("#familybackground_education").val();
				var addoccupation = $("#familybackground_occupation").val();
				
				if(addrelationship == "" || addrelationship.length == 0) validation = false;
				if(addname == "" || addname.length == 0) validation = false;
				if(addage == "" || addage.length == 0) validation = false;
				 
				if(validation == false){
					$("#familybackground_validation_error_msg").removeClass("hidden");
				}else{
					if(addeducation == "" || addeducation.length == 0) addeducation = "null";
					if(addoccupation == "" || addoccupation.length == 0) addoccupation = "null";
					var resourceURL = $("#contextpath").val()+"/employee/addmoreemployeefamilydetails/"+employeeid+"/"+addrelationship+"/"+addname+"/"+addage+"/"+addeducation+"/"+addoccupation;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Family Background Details
							$("#familybackground_relationship").val("");
							$("#familybackground_name").val("");
							$("#familybackground_age").val("");
							$("#familybackground_education").val("");
							$("#familybackground_occupation").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Family details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			
			$('#emp_education_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Family Details
				var employeeid = $("#emp_id").val();
				var institutionname = $("#education_institutionname").val();
				var degree = $("#education_degree").val();
				var specialization = $("#education_specialization").val();
				var rankscholarship = $("#education_rankscholarship").val();
				var edufrom = $("#education_from").datepicker().val();
				var eduto = $("#education_to").datepicker().val();
				
				if(institutionname == "" || institutionname.length == 0) validation = false;
				if(degree == "" || degree.length == 0) validation = false;
				if(specialization == "" || specialization.length == 0) validation = false;
				if(rankscholarship == "" || rankscholarship.length == 0) validation = false;
				if(edufrom == "" || edufrom.length == 0) validation = false;
				if(eduto == "" || eduto.length == 0) validation = false;
				var edufromvalidation = $.datepicker.parseDate('dd-mm-yy',edufrom);
				var edutovalidation = $.datepicker.parseDate('dd-mm-yy',eduto);
				if ((edufromvalidation) >= (edutovalidation))  validation = false; 
				 
				if(validation == false){
					$("#education_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreemployeeeducation/"+employeeid+"/"+institutionname+"/"+degree+"/"+specialization+"/"+rankscholarship+"/"+edufrom+"/"+eduto;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#education_institutionname").val("");
							$("#education_degree").val("");
							$("#education_specialization").val("");
							$("#education_rankscholarship").val("");
							$("#education_from").val("");
							$("#education_to").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Education details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			$('#emp_skillset_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var name = $("#emp_skillset_name").val();
				var level = $("#emp_skillset_level").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(level == "" || level.length == 0) validation = false;
				if(validation == false){
					$("#skillset_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreemployeeskillset/"+empid+"/"+name+"/"+level;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_skillset_name").val("");
							$("#emp_skillset_level").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Skillset details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			$('#emp_references_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var name = $("#emp_reference_name").val();
				var address = $("#emp_reference_address").val();
				var phone = $("#emp_reference_phone").val();
				var mobile = $("#emp_reference_mobile").val();
				var skill = $("#emp_reference_skill").val();
				var designation = $("#emp_reference_designation").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(mobile == "" || mobile.length == 0) validation = false;
				if(skill == "" || skill.length == 0) validation = false;
				if(designation == "" || designation.length == 0) validation = false;
				if(address == "" || address.length == 0 || address == "-") address = "null";
				if(phone == "" || phone.length == 0 || phone == "-") phone = "null";
				 
				if(validation == false){
					$("#reference_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreemployeereferences/"+empid+"/"+name+"/"+address+"/"+phone+"/"+mobile+"/"+skill+"/"+designation;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_reference_name").val("");
							$("#emp_reference_address").val("");
							$("#emp_reference_phone").val("");
							$("#emp_reference_mobile").val("");
							$("#emp_reference_skill").val("");
							$("#emp_reference_designation").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("References details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			
			$('#emp_languageknown_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var name = $("#emp_languageknown_name").val();
				var read = $("#emp_languageknown_read").val();
				var write = $("#emp_languageknown_write").val();
				var speak = $("#emp_languageknown_speak").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(read == "" || read.length == 0) validation = false;
				if(write == "" || write.length == 0) validation = false;
				if(speak == "" || speak.length == 0) validation = false;
				
				if(validation == false){
					$("#language_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmorelanguageknown/"+empid+"/"+name+"/"+read+"/"+write+"/"+speak;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_languageknown_name").val("");
							$("#emp_languageknown_read").val("");
							$("#emp_languageknown_write").val("");
							$("#emp_languageknown_speak").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Language known details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			$('#emp_employmenthistory_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var name = $("#emp_employmenthistory_name").val();
				var address = $("#emp_employmenthistory_address").val();
				var fromdate = $("#emp_employmenthistory_fromdate").datepicker().val();
				var todate = $("#emp_employmenthistory_todate").datepicker().val();
				var startingsalary = $("#emp_employmenthistory_startingsalary").val();
				var lastsalary = $("#emp_employmenthistory_lastsalary").val();
				var designation = $("#emp_employmenthistory_designation").val();
				var responsibility = $("#emp_employmenthistory_responsibility").val();
				
				if(name == "" || name.length == 0) validation = false;
				if(address == "" || address.length == 0) validation = false;
				if(fromdate == "" || fromdate.length == 0) validation = false;
				if(todate == "" || todate.length == 0) validation = false;
				if(startingsalary == "" || startingsalary.length == 0) validation = false;
				if(lastsalary == "" || lastsalary.length == 0) validation = false;
				if(designation == "" || designation.length == 0) validation = false;
				if(responsibility == "" || responsibility.length == 0) validation = false;
				var fromdatevalidation = $.datepicker.parseDate('dd-mm-yy',fromdate);
				var todatevalidation = $.datepicker.parseDate('dd-mm-yy',todate);
				if ((fromdatevalidation) >= (todatevalidation))  validation = false; 
				
				
				if(validation == false){
					$("#employmenthistory_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreemploymenthistory/"+empid+"/"+name+"/"+address+"/"+fromdate+"/"+todate+"/"+startingsalary+"/"+lastsalary+"/"+designation+"/"+responsibility;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_employmenthistory_name").val("");
							$("#emp_employmenthistory_address").val("");
							$("#emp_employmenthistory_fromdate").val("");
							$("#emp_employmenthistory_todate").val("");
							$("#emp_employmenthistory_startingsalary").val("");
							$("#emp_employmenthistory_lastsalary").val("");
							$("#emp_employmenthistory_designation").val("");
							$("#emp_employmenthistory_responsibility").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Employment history details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			
			$('#emp_achievements_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var companyname = $("#emp_achievements_companyname").val();
				var achievement = $("#emp_achievements_achievement").val();
				
				if(companyname == "" || companyname.length == 0) validation = false;
				if(achievement == "" || achievement.length == 0) validation = false;
				
				if(validation == false){
					$("#achievements_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreachievements/"+empid+"/"+companyname+"/"+achievement;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_achievements_companyname").val("");
							$("#emp_achievements_achievement").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Achievements details added successfully...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			
			$('#emp_culturals_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var eventname = $("#emp_culturals_eventname").val();
				var achievement = $("#emp_culturals_achievement").val();
				
				if(eventname == "" || eventname.length == 0) validation = false;
				if(achievement == "" || achievement.length == 0) validation = false;
				
				if(validation == false){
					$("#culturals_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoreculturals/"+empid+"/"+eventname+"/"+achievement;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_culturals_eventname").val("");
							$("#emp_culturals_achievement").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Cultural details added successfully...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			$('#emp_sports_btn').click(function(){
				$("body").css("cursor", "default");
				var validation = true;
				//Employee Skill Set Details
				var empid = $("#emp_id").val();
				var eventname = $("#emp_sports_eventname").val();
				var achievement = $("#emp_sports_achievement").val();
				
				if(eventname == "" || eventname.length == 0) validation = false;
				if(achievement == "" || achievement.length == 0) validation = false;
				
				if(validation == false){
					$("#sports_validation_error_msg").removeClass("hidden");
				}else{
					var resourceURL = $("#contextpath").val()+"/employee/addmoresports/"+empid+"/"+eventname+"/"+achievement;
					$.ajax({
						url : resourceURL,
						type : 'GET',
						dataType : 'json',
						success: function(data){
							// Clearing Employee Education Details
							$("#emp_sports_eventname").val("");
							$("#emp_sports_achievement").val("");
							
							var successflag = data.response.successflag;
							var errors = data.response.errors;
							var results = data.response.result;
							if(successflag == "true"){
								$("#successful_msg_content").html("Sports details added successfully ...");
								$.fancybox.open('#addsuccessful_fancybox');
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
			function declineEmployee(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/retrivebyid/"+id;
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
							$.each(results, function (i, result){
								$("#emp_id").val((result.empid == undefined || result.empid == null || result.empid.length <= 0) ? "-" : result.empid);
								$("#firstname").val((result.firstname == undefined || result.firstname == null || result.firstname.length <= 0) ? "-" : result.firstname);
								$("#middlename").val((result.middlename == undefined || result.middlename == null || result.middlename.length <= 0) ? "-" : result.middlename);
								$("#lastname").val((result.lastname == undefined || result.lastname == null || result.lastname.length <= 0) ? "-" : result.lastname);
								$("#emailid").val((result.email == undefined || result.email == null || result.email.legnth <= 0) ? "-" : result.email);
								$("#mobileno").val((result.mobile == undefined || result.mobile == null || result.mobile.length <= 0) ? "-" : result.mobile);
								$("#phone").val((result.phone == undefined || result.phone == null || result.phone.length <= 0) ? "-" : result.phone);
								$("#status").val((result.status == undefined || result.status == null || result.status.length <= 0) ? "-" : result.status);
								if(result.status == "a"){
									$("#optional_status").html("Active");
								}else if(result.status == "i"){
									$("#optional_status").html("In-Active");
								}else if(result.status == undefined || result.status == null || result.status.length <= 0){
									$("#optional_status").html("-");
								}
								$("#passport").val((result.passport == undefined || result.passport == null || result.passport.length <= 0) ? "-" : result.passport);
								$("#pplaceofissued").val((result.pplaceofissued == undefined || result.pplaceofissued == null || result.pplaceofissued.length <= 0) ? "-" : result.pplaceofissued);
								$("#pvalidupto").val((result.pvalidupto == undefined || result.pvalidupto == null || result.pvalidupto.length <= 0) ? "-" : result.pvalidupto);
								$("#dlno").val((result.dlno == undefined || result.dlno == null || result.dlno.length <= 0) ? "-" : result.dlno);
								$("#pan").val((result.pan == undefined || result.pan == null || result.pan.length <= 0) ? "-" : result.pan);
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
			
			function declineEmployeeDetsils(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/details/"+id;
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
								$("#dob").val((result.dob == undefined || result.dob == null || result.dob.length <= 0) ? "-" : result.dob);
								$("#age").val((result.age == undefined || result.age == null || result.age.length <= 0) ? "-" : result.age);
								$("#gender").val((result.gender == undefined || result.gender == null || result.gender.length <= 0) ? "-" : result.gender);
								if(result.gender =="m"){
									$("#optional_gender").html("Male");
								}else if(result.gender =="f"){
									$("#optional_gender").html("Female");
								}else if(result.gender == undefined || result.gender == null || result.gender.length <= 0){
									$("#optional_gender").html("-");
								}
								$("#postapplied").val((result.postapplied == undefined || result.postapplied == null || result.postapplied.length <= 0) ? "-" : result.postapplied);
								$("#department").val((result.department == undefined || result.department == null || result.department.length <= 0) ? "-" : result.department);
								$("#jdate").val((result.jdate == undefined || result.jdate == null || result.jdate.length <= 0) ? "-" : result.jdate);
								$("#rdate").val((result.rdate == undefined || result.rdate == null || result.rdate.length <= 0) ? "-" : result.rdate);
								$("#emergencyno").val((result.emergencyno == undefined || result.emergencyno == null || result.emergencyno.length <= 0) ? "-" : result.emergencyno);
								$("#marital").val((result.maritalstatus == undefined || result.maritalstatus == null || result.maritalstatus.length <= 0) ? "-" : result.maritalstatus);
								if(result.maritalstatus =="m"){
									$("#optional_marital").html("Married");
								}else if(result.maritalstatus =="u"){
									$("#optional_marital").html("Unmarried");
								}else if(result.maritalstatus == undefined || result.maritalstatus == null || result.maritalstatus.length <= 0){
									$("#optional_marital").html("-");
								}
								$("#doa").val((result.doa == undefined || result.doa == null || result.doa.length <= 0) ? "-" : result.doa);
								$("#b_group").val((result.bgroup == undefined || result.bgroup == null || result.bgroup.length <= 0) ? "-" : result.bgroup);
								$("#possessvehicle").val((result.possessvehicle == undefined || result.possessvehicle == null || result.possessvehicle.length <= 0) ? "-" : result.possessvehicle);
								if(result.possessvehicle =="y"){
									$("#optional_possessvehicle").html("Yes");
								}else if(result.possessvehicle =="n"){
									$("#optional_possessvehicle").html("No");
								}else if(result.possessvehicle == undefined || result.possessvehicle == null || result.possessvehicle.length <= 0){
									$("#optional_possessvehicle").html("-");
								}
								$("#accidentillness").val((result.accidentillness == undefined || result.accidentillness == null || result.accidentillness.length <= 0) ? "-" : result.accidentillness);
								if(result.accidentillness =="y"){
									$("#optional_accidentillness").html("Yes");
								}else if(result.accidentillness =="n"){
									$("#optional_accidentillness").html("No");
								}else if(result.accidentillness == undefined || result.accidentillness == null || result.accidentillness.length <= 0){
									$("#optional_accidentillness").html("-");
								}
								$("#illnessdescr").val((result.illnessdescr == undefined || result.illnessdescr == null || result.illnessdescr.length <= 0) ? "-" : result.illnessdescr);
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
			function declineEmployeeAddress(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/address/"+id;
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
								if(result.addresstype != null && result.addresstype == "c"){
									$("#cstreet").val((result.cstreet == undefined || result.cstreet == null || result.cstreet.length <= 0) ? "-" : result.cstreet);
									$("#ccity").val((result.ccity == undefined || result.ccity == null || result.ccity.length <= 0) ? "-" : result.ccity);
									$("#cstate").val((result.cstate == undefined || result.cstate == null || result.cstate.length <= 0) ? "-" : result.cstate);
									$("#ccountry").val((result.ccountry == undefined || result.ccountry == null || result.ccountry.length <= 0) ? "-" : result.ccountry);
									$("#cpincode").val((result.cpincode == undefined || result.cpincode == null || result.cpincode.length <= 0) ? "-" : result.cpincode);
								}else if(result.addresstype != null && result.addresstype == "p"){
									$("#pstreet").val((result.pstreet == undefined || result.pstreet == null || result.pstreet.length <= 0) ? "-" : result.pstreet);
									$("#pcity").val((result.pcity == undefined || result.pcity == null || result.pcity.length <= 0) ? "-" : result.pcity);
									$("#pstate").val((result.pstate == undefined || result.pstate == null || result.pstate.length <= 0) ? "-" : result.pstate);
									$("#pcountry").val((result.pcountry == undefined || result.pcountry == null || result.pcountry.length <= 0) ? "-" : result.pcountry);
									$("#ppincode").val((result.ppincode == undefined || result.ppincode == null || result.ppincode.length <= 0) ? "-" : result.ppincode);
								}
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
			
			function declineEmployeeFamilyBackground(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getfamilybackgrounddetails/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								count=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_familybackground_div_' + count});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_familybackground_tbl_' + count +'"><tr><td class="lableContent">Relationship</td><td class="value"><input id="fb_relationship_' + count +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Name</td><td class="value"><input id="fb_name_' + count +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Age</td><td class="value"><input id="fb_age_' + count +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Education</td><td class="value"><input id="fb_education_' + count +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Occupation</td><td class="value"><input id="fb_occupation_' + count +'" disabled="disabled" class="inputdisable"></input><input type="text" name="fb_id_' + count +'" id="fb_id_' + count +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_family_background_details_div");
								$("#fb_id_"+count).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#fb_relationship_"+count).val((result[i].reletionship == undefined || result[i].reletionship == null || result[i].reletionship == "null" || result[i].reletionship == 0 || result[i].reletionship.length <= 0) ? "-" : result[i].reletionship);
								$("#fb_name_"+count).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0  || result[i].name.length <= 0) ? "-" : result[i].name);
								$("#fb_age_"+count).val((result[i].age == undefined || result[i].age == null || result[i].age == "null" || result[i].age == 0  || result[i].age.length <= 0) ? "-" : result[i].age);
								$("#fb_education_"+count).val((result[i].education == undefined || result[i].education == null || result[i].education == "null" || result[i].education == 0  || result[i].education.length <= 0) ? "-" : result[i].education);
								$("#fb_occupation_"+count).val((result[i].occupation == undefined || result[i].occupation == null || result[i].occupation == "null" || result[i].occupation == 0  || result[i].occupation.length <= 0) ? "-" : result[i].occupation);
							}
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
			
			function declineEmployeeEducation(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getempeducationdetails/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								eduCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_education_div_' + eduCount});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_education_tbl_' + eduCount +'"><tr><td class="lableContent">Institution Name</td><td class="value"><input id="edu_institutionname_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Degree</td><td class="value"><input id="edu_degree_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Specialization</td><td class="value"><input id="edu_specialization_' + eduCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContentSelect">Rank / Scholarship</td><td class="valueContent"><input id="edu_rankscholarship_' + eduCount +'" disabled="disabled" class="inputdisable"></td></tr><tr><td class="lableContent">From</td><td class="value"><input id="edu_from_' + eduCount +'" disabled="disabled" class="datepicking inputdisable"></td></tr><tr><td class="lableContent">To</td><td class="value"><input id="edu_to_' + eduCount +'" disabled="disabled" class="datepicking inputdisable"></input><input type="text" name="edu_id_' + eduCount +'" id="edu_id_' + eduCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_education_details_div");
								$("#edu_id_"+eduCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#edu_institutionname_"+eduCount).val((result[i].institutionname == undefined || result[i].institutionname == null || result[i].institutionname == "null" || result[i].institutionname == 0 || result[i].institutionname.length <= 0) ? "-" : result[i].institutionname);
								$("#edu_degree_"+eduCount).val((result[i].degree == undefined || result[i].degree == null || result[i].degree == "null" || result[i].degree == 0  || result[i].degree.length <= 0) ? "-" : result[i].degree);
								$("#edu_specialization_"+eduCount).val((result[i].specialization == undefined || result[i].specialization == null || result[i].specialization == "null" || result[i].specialization == 0  || result[i].specialization.length <= 0) ? "-" : result[i].specialization);
								$("#edu_rankscholarship_"+eduCount).val((result[i].rankscholarship == undefined || result[i].rankscholarship == null || result[i].rankscholarship == "null" || result[i].rankscholarship == 0  || result[i].rankscholarship.length <= 0) ? "-" : result[i].rankscholarship);
								$("#edu_from_"+eduCount).val((result[i].edufrom == undefined || result[i].edufrom == null || result[i].edufrom == "null" || result[i].edufrom == 0  || result[i].edufrom.length <= 0) ? "-" : result[i].edufrom);
								$("#edu_to_"+eduCount).val((result[i].eduto == undefined || result[i].eduto == null || result[i].eduto == "null" || result[i].eduto == 0  || result[i].eduto.length <= 0) ? "-" : result[i].eduto);
							}
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
			
			function declineEmployeeSkillset(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeeskillset/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								skillsetCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_skillset_div_' + skillsetCount});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_skillset_tbl_' + skillsetCount +'"><tr><td class="lableContent">Name</td><td class="value"><input id="skillset_name_' + skillsetCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContentSelect">Level</td><td class="valueContent"><select id="skillset_level_' + skillsetCount +'" class="selectBox hidden" style="margin-left:0px; width:217px;" class="inputdisable"><option value="">Select</option><option value="b">Basic</option><option value="a">Advanced</option><option value="e">Expert</option></select><div id="skillset_level_optional_' + skillsetCount +'" class="value"></div><input type="text" name="skillset_id_' + skillsetCount +'" id="skillset_id_' + skillsetCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_skillset_details_div");
								$("#skillset_id_"+skillsetCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#skillset_name_"+skillsetCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
								$("#skillset_level_"+skillsetCount).val((result[i].level == undefined || result[i].level == null || result[i].level == "null" || result[i].level == 0  || result[i].level.length <= 0) ? "-" : result[i].level);
								if(result[i].level == "b"){
									$("#skillset_level_optional_"+skillsetCount).html("Basic");
								} else if(result[i].level == "a"){
									$("#skillset_level_optional_"+skillsetCount).html("Advanced");
								} else if(result[i].level == "e"){
									$("#skillset_level_optional_"+skillsetCount).html("Expert");
								} else {
									$("#skillset_level_optional_"+skillsetCount).html("-");
								}
							}
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
			function declineEmployeeReferences(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeereference/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								referenceCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_reference_div_' + referenceCount});
								newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="ref_name_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Address</td><td class="value"><input id="ref_address_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Phone</td><td class="value"><input id="ref_phone_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Mobile</td><td class="value"><input id="ref_mobile_' + referenceCount +'" disabled="disabled" class="inputdisable" maxlength="10"></input></td></tr><tr><td class="lableContent">Skill</td><td class="value"><input id="ref_skill_' + referenceCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Designation</td><td class="value"><input id="ref_designation_' + referenceCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="ref_id_' + referenceCount +'" id="ref_id_' + referenceCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_references_details_div");
								$("#ref_id_"+referenceCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#ref_name_"+referenceCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
								$("#ref_address_"+referenceCount).val((result[i].address == undefined || result[i].address == null || result[i].address == "null" || result[i].address == 0  || result[i].address.length <= 0) ? "-" : result[i].address);
								$("#ref_phone_"+referenceCount).val((result[i].phone == undefined || result[i].phone == null || result[i].phone == "null" || result[i].phone == 0  || result[i].phone.length <= 0) ? "-" : result[i].phone);
								$("#ref_mobile_"+referenceCount).val((result[i].mobile == undefined || result[i].mobile == null || result[i].mobile == "null" || result[i].mobile == 0  || result[i].mobile.length <= 0) ? "-" : result[i].mobile);
								$("#ref_skill_"+referenceCount).val((result[i].skill == undefined || result[i].skill == null || result[i].skill == "null" || result[i].skill == 0  || result[i].skill.length <= 0) ? "-" : result[i].skill);
								$("#ref_designation_"+referenceCount).val((result[i].designation == undefined || result[i].designation == null || result[i].designation == "null" || result[i].designation == 0  || result[i].designation.length <= 0) ? "-" : result[i].designation);
							}
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
			
			function declineEmployeeLanguageKnown(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeelanguageknown/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								languageknownCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_languageknown_div_' + languageknownCount});
								newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="languageknown_name_'+ languageknownCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContentSelect">Read</td><td class="valueContent"><select id="languageknown_read_' + languageknownCount +'" class="selectBox hidden" style="margin-left:0px; width:217px;" class="inputdisable"><option value="">Select</option><option value="y">Yes</option><option value="n">No</option></select><div id="languageknown_read_optional_' + languageknownCount +'" class="value"></div></td><tr><td class="lableContentSelect">Write</td><td class="valueContent"><select id="languageknown_write_' + languageknownCount +'" class="selectBox hidden" style="margin-left:0px; width:217px;" class="inputdisable"><option value="">Select</option><option value="y">Yes</option><option value="n">No</option></select><div id="languageknown_write_optional_' + languageknownCount +'" class="value"></div></td></tr><tr><td class="lableContentSelect">Speak</td><td class="valueContent"><select id="languageknown_speak_' + languageknownCount +'" class="selectBox hidden" style="margin-left:0px; width:217px;" class="inputdisable"><option value="">Select</option><option value="y">Yes</option><option value="n">No</option></select><div id="languageknown_speak_optional_' + languageknownCount +'" class="value"></div></input><input type="text" name="languageknown_id_' + languageknownCount +'" id="languageknown_id_' + languageknownCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_languageknown_details_div");
								$("#languageknown_id_"+languageknownCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#languageknown_name_"+languageknownCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
								$("#languageknown_read_"+languageknownCount).val((result[i].read == undefined || result[i].read == null || result[i].read == "null" || result[i].read == 0  || result[i].read.length <= 0) ? "-" : result[i].read);
								if(result[i].read == "y"){
									$("#languageknown_read_optional_"+languageknownCount).html("Yes");
								} else if(result[i].read == "n"){
									$("#languageknown_read_optional_"+languageknownCount).html("No");
								} else {
									$("#languageknown_read_optional_"+languageknownCount).html("-");
								}
								$("#languageknown_write_"+languageknownCount).val((result[i].write == undefined || result[i].write == null || result[i].write == "null" || result[i].write == 0  || result[i].write.length <= 0) ? "-" : result[i].write);
								if(result[i].write == "y"){
									$("#languageknown_write_optional_"+languageknownCount).html("Yes");
								} else if(result[i].write == "n"){
									$("#languageknown_write_optional_"+languageknownCount).html("No");
								} else {
									$("#languageknown_write_optional_"+languageknownCount).html("-");
								}
								$("#languageknown_speak_"+languageknownCount).val((result[i].speak == undefined || result[i].speak == null || result[i].speak == "null" || result[i].speak == 0  || result[i].speak.length <= 0) ? "-" : result[i].speak);
								if(result[i].speak == "y"){
									$("#languageknown_speak_optional_"+languageknownCount).html("Yes");
								} else if(result[i].speak == "n"){
									$("#languageknown_speak_optional_"+languageknownCount).html("No");
								}
							}
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
			
			function declineEmploymentHistory(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemploymenthistory/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								historyCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_employmenthistory_div_' + historyCount});
								newemp_dynamic.html('<br><table class="tableContent"><tr><td class="lableContent">Name</td><td class="value"><input id="history_name_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Address</td><td class="value"><input id="history_address_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">From Date</td><td class="value"><input id="history_fromdate_'+ historyCount +'" disabled="disabled" class="datepicking inputdisable"></input></td></tr><tr><td class="lableContent">To Date</td><td class="value"><input id="history_todate_'+ historyCount +'" disabled="disabled" class="datepicking inputdisable"></input></td></tr><tr><td class="lableContent">Starting Salary</td><td class="value"><input id="history_startingsalary_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Last Salary</td><td class="value"><input id="history_lastsalary_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Designation</td><td class="value"><input id="history_designation_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Responsibility</td><td class="value"><input id="history_responsibility_'+ historyCount +'" disabled="disabled" class="inputdisable"></input></input><input type="text" name="history_id_'+ historyCount +'" id="history_id_'+ historyCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_employmenthistory_details_div");
								$("#history_id_"+historyCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#history_name_"+historyCount).val((result[i].name == undefined || result[i].name == null || result[i].name == "null" || result[i].name == 0 || result[i].name.length <= 0) ? "-" : result[i].name);
								$("#history_address_"+historyCount).val((result[i].address == undefined || result[i].address == null || result[i].address == "null" || result[i].address == 0  || result[i].address.length <= 0) ? "-" : result[i].address);
								$("#history_fromdate_"+historyCount).val((result[i].fromdate == undefined || result[i].fromdate == null || result[i].fromdate == "null" || result[i].fromdate == 0  || result[i].fromdate.length <= 0) ? "-" : result[i].fromdate);
								$("#history_todate_"+historyCount).val((result[i].todate == undefined || result[i].todate == null || result[i].todate == "null" || result[i].todate == 0  || result[i].todate.length <= 0) ? "-" : result[i].todate);
								$("#history_startingsalary_"+historyCount).val((result[i].startingsalary == undefined || result[i].startingsalary == null || result[i].startingsalary == "null" || result[i].startingsalary == 0  || result[i].startingsalary.length <= 0) ? "-" : result[i].startingsalary);
								$("#history_lastsalary_"+historyCount).val((result[i].lastsalary == undefined || result[i].lastsalary == null || result[i].lastsalary == "null" || result[i].lastsalary == 0  || result[i].lastsalary.length <= 0) ? "-" : result[i].lastsalary);
								$("#history_designation_"+historyCount).val((result[i].designation == undefined || result[i].designation == null || result[i].designation == "null" || result[i].designation == 0  || result[i].designation.length <= 0) ? "-" : result[i].designation);
								$("#history_responsibility_"+historyCount).val((result[i].responsibility == undefined || result[i].responsibility == null || result[i].responsibility == "null" || result[i].responsibility == 0  || result[i].responsibility.length <= 0) ? "-" : result[i].responsibility);
							}
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
			
			function declineEmployeeAchievements(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeeachievements/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								achievementsCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_achievements_div_' + achievementsCount});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_achievements_tbl_' + achievementsCount +'"><tr><td class="lableContent">Company Name</td><td class="value"><input id="achievements_companyname_' + achievementsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Achievement</td><td class="value"><input id="achievements_eventname_' + achievementsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="achievements_id_' + achievementsCount +'" id="achievements_id_' + achievementsCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_achievements_details_div");
								$("#achievements_id_"+achievementsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#achievements_companyname_"+achievementsCount).val((result[i].companyname == undefined || result[i].companyname == null || result[i].companyname == "null" || result[i].companyname == 0 || result[i].companyname.length <= 0) ? "-" : result[i].companyname);
								$("#achievements_eventname_"+achievementsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
							}
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
			
			function declineEmployeeCulturals(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeeculturals/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								culturalsCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_culturals_div_' + culturalsCount});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_culturals_tbl_' + culturalsCount +'"><tr><td class="lableContent">Event Name</td><td class="value"><input id="culturals_name_' + culturalsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Event Achievement</td><td class="value"><input id="culturals_achievements_' + culturalsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="culturals_id_' + culturalsCount +'" id="culturals_id_' + culturalsCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_culturals_details_div");
								$("#culturals_id_"+culturalsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#culturals_name_"+culturalsCount).val((result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0) ? "-" : result[i].eventname);
								$("#culturals_achievements_"+culturalsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
							}
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
			
			function declineEmployeeSports(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/getemployeesports/"+id;
				$.ajax({
					url : resourceURL,
					type : 'GET',
					dataType : 'json',
					async : false,
					success: function(data) {
						var successflag = data.response.successflag;
						var errors = data.response.errors;
						var result = data.response.result;
						
						if(successflag == "true"){
							for(var i=0;i<result.length;i++){
								sportsCount=i+1;
								var newemp_dynamic = $(document.createElement('div')).attr({"id":'emp_sports_div_' + sportsCount});
								newemp_dynamic.html('<br><table class="tableContent" id="emp_sports_tbl_' + sportsCount +'"><tr><td class="lableContent">Event Name</td><td class="value"><input id="sports_name_' + sportsCount +'" disabled="disabled" class="inputdisable"></input></td></tr><tr><td class="lableContent">Event Achievement</td><td class="value"><input id="sports_eventname_' + sportsCount +'" disabled="disabled" class="inputdisable"></input><input type="text" name="sports_id_' + sportsCount +'" id="sports_id_' + sportsCount +'" class="hidden"></td></tr></table>');
								newemp_dynamic.appendTo("#emp_sports_details_div");
								$("#sports_id_"+sportsCount).val((result[i].id == undefined || result[i].id == null || result[i].id == "null" || result[i].id == 0 || result[i].id.length <= 0) ? "-" : result[i].id);
								$("#sports_name_"+sportsCount).val((result[i].eventname == undefined || result[i].eventname == null || result[i].eventname == "null" || result[i].eventname == 0 || result[i].eventname.length <= 0) ? "-" : result[i].eventname);
								$("#sports_eventname_"+sportsCount).val((result[i].achievement == undefined || result[i].achievement == null || result[i].achievement == "null" || result[i].achievement == 0  || result[i].achievement.length <= 0) ? "-" : result[i].achievement);
							}
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
			
			function declineEmployeeAbout(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/empaboutdetails/"+id;
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
									$("#emp_abt_id").val((result.id == undefined || result.id == null || result.id == "null" || result.id == 0 || result.id.length <= 0) ? "-" : result.id);
									$("#emp_strength").val((result.strength == undefined || result.strength == null || result.strength == "null" || result.strength == 0  || result.strength.length <= 0) ? "-" : result.strength);
									$("#emp_weakness").val((result.weakness == undefined || result.weakness == null || result.weakness == "null" || result.weakness == 0  || result.weakness.length <= 0) ? "-" : result.weakness);
									$("#emp_totalexp").val((result.totalexp == undefined || result.totalexp == null || result.totalexp == "null" || result.totalexp == 0  || result.totalexp.length <= 0) ? "-" : result.totalexp);
									$("#emp_releventexp").val((result.releventexp == undefined || result.releventexp == null || result.releventexp == "null" || result.releventexp == 0  || result.releventexp.length <= 0) ? "-" : result.releventexp);
									$("#emp_presentsalary").val((result.presentsalary == undefined || result.presentsalary == null || result.presentsalary == "null" || result.presentsalary == 0  || result.presentsalary.length <= 0) ? "-" : result.presentsalary);	
									$("#emp_expectedsalary").val((result.expectedsalary == undefined || result.expectedsalary == null || result.expectedsalary == "null" || result.expectedsalary == 0  || result.expectedsalary.length <= 0) ? "-" : result.expectedsalary);
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
			
			function declineEmployeeBankDetails(){
				var id = $("#emp_id").val();
				var resourceURL = $("#contextpath").val()+"/employee/empbankdetail/"+id;
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
									$("#bank_name").val((result.bankname == undefined || result.bankname == null || result.bankname == "null" || result.bankname == 0 || result.bankname.length <= 0) ? "-" : result.bankname);
									$("#bank_accno").val((result.accountno == undefined || result.accountno == null || result.accountno == "null" || result.accountno == 0  || result.accountno.length <= 0) ? "-" : result.accountno);
									$("#bank_branch").val((result.branch == undefined || result.branch == null || result.branch == "null" || result.branch == 0  || result.branch.length <= 0) ? "-" : result.branch);
									$("#bank_address").val((result.address == undefined || result.address == null || result.address == "null" || result.address == 0  || result.address.length <= 0) ? "-" : result.address);
									$("#bank_city").val((result.city == undefined || result.city == null || result.city == "null" || result.city == 0  || result.city.length <= 0) ? "-" : result.city);
									$("#bank_state").val((result.state == undefined || result.state == null || result.state == "null" || result.state == 0  || result.state.length <= 0) ? "-" : result.state);	
									$("#bank_pincode").val((result.pincode == undefined || result.pincode == null || result.pincode == "null" || result.pincode == 0  || result.pincode.length <= 0) ? "-" : result.pincode);
									$("#bank_ifsc").val((result.ifsc == undefined || result.ifsc == null || result.ifsc == "null" || result.ifsc == 0  || result.ifsc <= 0) ? "-" : result.ifsc);
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
			 
