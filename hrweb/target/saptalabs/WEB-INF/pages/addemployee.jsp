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
			#employmenthistory_dynamictr_1 td b input .datePck .ui-datepicker-trigger {
			    margin-left: 0px;
			    margin-top: 13px;
			}
		</style>
		</head>
		<body>
		<!--Header Start-->
			 <%@include file="menucomponents.jsp"%> 
			<!--Header End-->
			<div id="innerContainer" class="">
			
			<!--Content Area START-->
				<div id="contentArea" class="login_container1"> 
					<div id="employee"  >
						<div class="content" class="login_container2">
							<div class = "nav">Employee</div>
							<table id="employeeTable" class="oddTd50P">
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>First Name&nbsp;:</td>
									<td><input name="fname" id="fname" type="text"  onkeypress="return ValidateAlpha(event)" onKeyPress="white_space(text)"/></td>
									<td align="right">Middle Name&nbsp;:</td>
									<td><input name="mname" id="mname" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Last Name&nbsp;:</td>
									<td><input name="lname" id="lname" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right">PF No&nbsp;:</td>
									<td><input name="pfno" id="pfno" type="text" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Email&nbsp;:</td>
									<td><input name="emailid" id="emailid" type="text" /></td>
									<td align="right"><sup class="saptaColor">*</sup>Personal Email&nbsp;:</td>
									<td><input name="personalemailid" id="personalemailid" type="text" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Mobile&nbsp;:</td>
									<td><input name="mobilenumber" id="mobilenumber" type="text"  maxlength="10" onkeypress="return validateNumeric(event)"/></td>
									<td align="right">Phone&nbsp;:</td>
									<td><input name="phone" id="phone" type="text"  onkeypress="return validateNumeric(event)"/></td>
								</tr>
								<tr>
									<td align="right">PAN&nbsp;:</td>
									<td><input name="pan" id="pan" type="text" /></td>
									<td align="right">DL No&nbsp;:</td>
									<td><input name="dlno" id="dlno" type="text" /></td>
								</tr>
								<tr>
									<td align="right">Aadhar No&nbsp;:</td>
									<td><input name="aadharno" id="aadharno" type="text" /></td>
									<td align="right">Passport&nbsp;:</td>
									<td><input name="passport" id="passport" type="text"  /></td>
								</tr>
								<tr>
									<td align="right">Place Of Issued&nbsp;:</td>
									<td><input name="pplaceofissued" id="pplaceofissued" type="text"  onkeypress="return ValidateAlpha(event)" /></td>
									<td align="right">Valid Upto&nbsp;:</td>
									<td><b style="float:left"><input name="pvalidupto" id="pvalidupto" readonly="readonly" type="text"  class="datePcK" /></b></td>
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="rightElement">
								<div class="leftElement ">
									<input id="emp_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class ="mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="employeedetail" class="hidden">
						<div class="content">
							<div class = "nav"> Employee Details</div>
								<table class="oddTd50P">
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>DOB&nbsp;:</td>
										<td><b style="float:left"><input name="dob" id="dob" type="text"  class="datePcK"/></b></td>
										<td align="right">Date of Anniversary&nbsp;:</td>
										<td><b style="float:left"><input name="doa" id="doa" readonly="readonly" type="text"  class="datePcK"/></b></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Joining Date&nbsp;:</td>
										<td><b style="float:left"><input name="jdate" readonly="readonly" id="jdate" type="text"  class="datePcK"/></b></td>
										<td align="right">Relieve Date&nbsp;:</td>
										<td><b style="float:left"><input name="rdate" readonly="readonly" id="rdate" type="text"  class="datePcK"/></b></td>
									</tr>
									<tr>
										<td align="right">Department&nbsp;:</td>
										<td><input name="depart" id="depart" type="text"  /></td>
										<td align="right"><sup class="saptaColor">*</sup>Designation&nbsp;:</td>
										<td><input name="postapplied" id="postapplied" type="text" /></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Gender&nbsp;:</td>
										<td>
											<select name="gender" id="gender" style="text-align:left">
												<option value="" style="text-align:left"> --- Select --- </option>
												<option value="m" style="text-align:left">Male</option>
												<option value="f" style="text-align:left">Female</option>
											</select>
										</td>
										<td align="right"><sup class="saptaColor">*</sup>Age&nbsp;:</td>
										<td><input name="age" id="age" type="text"  maxlength="2" onkeypress="return validateNumeric(event)"/></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Marital Status&nbsp;:</td>
										<td>
											<select name="marital" id="marital" style="text-align:left">
												<option value="" style="text-align:left">--- Select ---</option>
												<option value="m" style="text-align:left">Married</option>
												<option value="u" style="text-align:left">Unmarried</option>
											</select>
										</td>
										<td align="right"><sup class="saptaColor">*</sup>Emergency No&nbsp;:</td>
										<td><input name="emergencyno" id="emergencyno" type="text"  maxlength="10" onkeypress="return validateNumeric(event)"/></td>
										
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Possess Vehicle&nbsp;:</td>
										<td><select name="possessvehicle" id="possessvehicle" style="text-align:left">
												<option value="" style="text-align:left">--- Select ---</option>
												<option value="y" style="text-align:left">Yes</option>
												<option value="n" style="text-align:left">No</option>
											</select>
										</td>
										<td align="right">Blood Group&nbsp;:</td>
										<td><input name="bgroup" id="bgroup" type="text" maxlength="3"/></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Accident / Illness&nbsp;:</td>
										<td>
											<select name="accidentillness" id="accidentillness" style="text-align:left">
												<option value="" style="text-align:left">--- Select ---</option>
												<option value="y" style="text-align:left">Yes</option>
												<option value="n" style="text-align:left">No</option>
											</select>
										</td>
										<td align="right"><sup class="saptaColor">*</sup>Joining Location&nbsp;:</td>
										<td><input name="joininglocation" id="joininglocation" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
									</tr>
									<tr id="descriptiontablerow" class="hidden">	
										<td align="right"><sup class="saptaColor" id="desc">*</sup>Description&nbsp;:</td>
										<td><textarea  class="WIDT155PX" id="illnessdescr" name="illnessdescr"></textarea></td>
									</tr>
								</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement"><input type="button" value="Previous" class="graybtn" id="emp_det_prev"/></div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_det_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									 <input type="button" value="Next" id="emp_det_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_address" class="hidden">
						<div class = "content" id="current_address">
							<div class = "nav">
								Current Address
							</div>
							<table class="oddTd50P">
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Street&nbsp;:</td>
									<td><input name="cstreet" id="cstreet" type="text"/></td>
									<td align="right"><sup class="saptaColor">*</sup>City&nbsp;:</td>
									<td><input name="ccity" id="ccity" type="text"   onkeypress="return ValidateAlpha(event)"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>State&nbsp;:</td>
									<td><input name="cstate" id="cstate" type="text" onkeypress="return ValidateAlpha(event)"/></td>
									<td align="right"><sup class="saptaColor">*</sup>Country&nbsp;:</td>
									<td><input name="ccountry" id="ccountry" type="text" onkeypress="return ValidateAlpha(event)" /></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Pincode&nbsp;:</td>
									<td><input name="cpincode" id="cpincode" type="text"  maxlength="6" onkeypress="return validateNumeric(event)"/></td>
									<td align="right"></td>
									<td>
										
									</td>
								</tr>
							</table>
						</div>
						<label style="margin-left:10px;"><b>Do Your Current Address Same As Permanemt Address<sup class="saptaColor">*</sup></b></label>&nbsp;&nbsp;
							<select id="optional_address" class="selectBox" style=" width: initial;" >
								<option value="" style="text-align:center">--- Select ---</option>
								<option value="y" style="text-align:left">Yes</option>
								<option value="n" style="text-align:left">No</option>
							</select>
						<div class = "content hidden" id="permanent_address">
							<div class = "nav">Permanent Address</div>
							<br/>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Street&nbsp;:</td>
									<td><input name="pstreet" id="pstreet" type="text"  readonly/></td>
									<td align="right"><sup class="saptaColor">*</sup>City&nbsp;:</td>
									<td><input name="pcity" id="pcity" type="text"   onkeypress="return ValidateAlpha(event)" readonly/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>State&nbsp;:</td>
									<td><input name="pstate" id="pstate" type="text"  onkeypress="return ValidateAlpha(event)" readonly/></td>
									<td align="right"><sup class="saptaColor">*</sup>Country&nbsp;:</td>
									<td><input name="pcountry" id="pcountry" type="text"  onkeypress="return ValidateAlpha(event)" readonly/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor">*</sup>Pincode&nbsp;:</td>
									<td><input name="ppincode" id="ppincode" type="text"  maxlength="6" onkeypress="return validateNumeric(event)"/></td>
									<td align="right"></td>
									<td></td>	
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_add_prev"/>
							</div>
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" class="graybtn" id="emp_add_btn"/>
								</div>
								<div class="leftElement ">
									<input id="decline" type="button" value="Decline" class="graybtn" />
								</div>
							</div>
						</div>
						<div id="permanent_mandatory" class = "mandContent" style="text-align: center;"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_family_background" class="hidden">
					<div id="addfamily_detail_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
					</div>
						<div id="fbdynamicdiv" class="content">
							<div class = "nav">Family Background</div>
							<div class="responsive">
								<table class="data" id="emp_familybg_Table">
									<tr>
										<th class="first"><sup class="saptaColor">*</sup>Relationship</th>
										<th class=""><sup class="saptaColor">*</sup>Name</th>
										<th class=""><sup class="saptaColor">*</sup>Age</th>
										<th class="">Education</th>
										<th class="last">Occupation</th>
									</tr>					
									<tr id="fbdynamictr_1">
										<td>
											<select id="fbrelationship_1" name="fbrelationship_1">
												<option value="" style="text-align: center;">--- Select ---</option>
												<option value="father" style="text-align: left;">Father</option>
												<option value="mother" style="text-align: left;">Mother</option>
												<option value="spouse" style="text-align: left;">Spouse</option>
												<option value="brother" style="text-align: left;">Brother</option>
												<option value="sister" style="text-align: left;">Sister</option>
												<option value="son" style="text-align: left;">Son</option>
												<option value="daughter" style="text-align: left;">Daughter</option>
											</select>	
										</td>
										<td><input name="fbname_1" id="fbname_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td><select name="fbage_1" id="fbage_1" >
												<option value="">--- Select ---</option>
											<c:forEach var="i" begin="1" end="100">
		   										<option value="${i}">${i}</option>
											</c:forEach>
											</select>
										</td>
										<td><input name="fbeducation_1" id="fbeducation_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td><input name="fboccupation_1" id="fboccupation_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td class="noborder">
											<div id="fb_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
												<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_familydetail_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_fam_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_familybackground_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_education" class="hidden">
					<div id="add_education_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
					</div>
						<div id="educationdynamicdiv1" class="content">
							<div class = "nav"> Employee Education </div>
							<div class="responsive">
								<table class="data Education" id="emp_education_Table">
									<tr>
										<th class=""><sup class="saptaColor">*</sup>Degree</th>
										<th class=""><sup class="saptaColor">*</sup>Specialization</th>
										<th class=""><sup class="saptaColor">*</sup>Rank / Scholarship</th>
										<th class="first"><sup class="saptaColor">*</sup>Institution Name</th>
										<th class=""><sup class="saptaColor">*</sup>From</th>
										<th class="last"><sup class="saptaColor">*</sup>To</th>
									</tr>					
									<tr id="education_dynamictr_1">
										<td><input name="emp_degree_1" id="emp_degree_1" type="text" /></td>
										<td><input name="emp_specialization_1" id="emp_specialization_1" type="text" /></td>
										<td><input name="emp_rankscholership_1" id="emp_rankscholership_1" type="text" /></td>
										<td><input name="emp_institution_name_1" id="emp_institution_name_1" type="text" /></td>
										<td><b class="datePicInput"><input name="emp_from_1" readonly="readonly" id="emp_from_1" class="datePicMob datePcK" type="text"/></b></td>
										<td><b class="datePicInput"><input name="emp_to_1" id="emp_to_1" readonly="readonly" class="datePicMob datePcK" type="text" /></b></td>
										<td class="noborder">
											<div id="education_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
												<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
											</div>
										</td>
									</tr>
								</table>	
							</div>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_education_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
								
									<input id="emp_edu_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_eduction_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_skillset" class="hidden">
					<div id="add_skillset_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
					</div>
						<div id="skillsetdynamicdiv1" class="content">
							<div class = "nav">Employee Skill Set</div>
							<table class="data" id="emp_skillset_Table">
								<tr>
									<th class="first"><sup class="saptaColor">*</sup>Skill Set Name</th>
									<th class="last"><sup class="saptaColor">*</sup>Level</th>
								</tr>					
								<tr id="skillset_dynamictr_1">
									<td><input name="emp_skillset_name_1" id="emp_skillset_name_1" type="text"  /></td>
									<td>
										<select name="emp_skillset_level_1" id="emp_skillset_level_1" >
											<option value="" style="text-align:center">--- Select ---</option>
											<option value="b" style="text-align:left">Basic</option>
											<option value="a" style="text-align:left">Advanced</option>
											<option value="e" style="text-align:left">Expert</option>
										</select>
									</td>
									<td class="noborder">
										<div id="skillset_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_skillset_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_skill_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_skillset_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_reference" class="hidden">
					<div id="add_reference_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
					</div>
						<div id="empreferencedynamicdiv1" class="content">
							<div class = "nav"> Employee References </div>
							<div class="responsive">
								<table class="data" id="emp_reference_Table">
									<tr>
										<th class="first"><sup class="saptaColor">*</sup>Name</th>
										<th>Address</th>
										<th>Phone No</th>
										<th><sup class="saptaColor">*</sup>Mobile</th>
										<th><sup class="saptaColor">*</sup>Skill</th>
										<th class="last"><sup class="saptaColor">*</sup>Designation</th>
									</tr>					
									<tr id="reference_dynamictr_1">
										<td><input name="emp_reference_name_1" id="emp_reference_name_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td><input name="emp_reference_address_1" id="emp_reference_address_1" type="text"  /></td>
										<td><input name="emp_reference_phone_1" id="emp_reference_phone_1" type="text"  onkeypress="return validateNumeric(event)"/></td>
										<td><input name="emp_reference_mobile_1" id="emp_reference_mobile_1" type="text"  maxlength="10" onkeypress="return validateNumeric(event)"/></td>
										<td><input name="emp_reference_skill_-*-1" id="emp_reference_skill_1" type="text" ;" /></td>
										<td><input name="emp_reference_designation_1" id="emp_reference_designation_1" type="text"  /></td>
										<td class="noborder">
											<div id="reference_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
												<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_reference_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_ref_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_reference_next"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_reference_skip"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_languageknown" class="" >
					<div id="add_languageknown_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
							<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
					</div>
						<div id="emplanguageknowndynamicdiv1" class="content">
							<div class = "nav"> Employee Language Known </div>
							<div class="responsive">
								<table class="data" id="emp_languageknown_Table">
									<tr>
										<th class="first"><sup class="saptaColor">*</sup>Language</th>
										<th><sup class="saptaColor">*</sup>Read</th>
										<th><sup class="saptaColor">*</sup>Write</th>
										<th class="last"><sup class="saptaColor">*</sup>Speak</th>
									</tr>					
									<tr id="languageknown_dynamictr_1">
										<td><input name="emp_languageknown_language_1" id="emp_languageknown_language_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td>
											<select name="emp_languageknown_read_1" id="emp_languageknown_read_1" >
												<option value="" style="text-align:center">--- Select ---</option>
												<option value="y" style="text-align:left">Yes</option>
												<option value="n" style="text-align:left">No</option>
											</select>
										</td>
										<td>
											<select name="emp_languageknown_write_1" id="emp_languageknown_write_1" >
												<option value="" style="text-align:center">--- Select ---</option>
												<option value="y" style="text-align:left">Yes</option>
												<option value="n" style="text-align:left">No</option>
											</select>
										</td>
										<td>
											<select name="emp_languageknown_speak_1" id="emp_languageknown_speak_1" >
												<option value="" style="text-align:center">--- Select 
												---</option>
												<option value="y" style="text-align:left">Yes</option>
												<option value="n" style="text-align:left">No</option>
											</select>
										</td>
										<td class="noborder">
											<div id="languageknown_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
												<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_languageknown_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
								
									<input id="emp_lang_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_languageknown_next"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_employmenthistory" class="hidden">
						<div id="add_employmenthistory_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
								<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
						</div>
						<div id="empemploymenthistorydynamicdiv1" class="content">
							<div class = "nav">Employment History</div>
							<div class="responsive">
								<table class="data" id="emp_employmenthistory_Table">
									<tr>
										<th class="first"><sup class="saptaColor">*</sup>Name</th>
										<th><sup class="saptaColor">*</sup>Address</th>
										<th><sup class="saptaColor">*</sup>From Date</th>
										<th><sup class="saptaColor">*</sup>To Date</th>
										<th><sup class="saptaColor">*</sup>First Salary</th>
										<th><sup class="saptaColor">*</sup>Last Salary</th>
										<th><sup class="saptaColor">*</sup>Responsibility</th>
										<th><sup class="saptaColor">*</sup>Designation</th>
									</tr>					
									<tr id="employmenthistory_dynamictr_1">
										<td><input name="emp_employmenthistory_name_1" id="emp_employmenthistory_name_1" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td><input name="emp_employmenthistory_address_1" id="emp_employmenthistory_address_1" type="text"  /></td>
										<td><b class="datePicInput" ><input name="emp_employmenthistory_fromdate_1" readonly="readonly" id="emp_employmenthistory_fromdate_1" class="datePicMob datepicking datePcK" type="text"/></b></td>
										<td><b class="datePicInput"><input name="emp_employmenthistory_todate_1" readonly="readonly" id="emp_employmenthistory_todate_1" class="datePicMob datepicking datePcK" type="text"  /></b></td>
										<td><input name="emp_employmenthistory_startingsalary_1" id="emp_employmenthistory_startingsalary_1" type="text"  onkeypress="return validateNumeric(event)"/></td>
										<td><input name="emp_employmenthistory_lastsalary_1" id="emp_employmenthistory_lastsalary_1" type="text"  onkeypress="return validateNumeric(event)"/></td>
										<td><input name="emp_employmenthistory_responsibility_1" id="emp_employmenthistory_responsibility_1" type="text"  /></td>
										<td><input name="emp_employmenthistory_designation_1" id="emp_employmenthistory_designation_1" type="text"  /></td>
										<td class="noborder">
											<div id="employmenthistory_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
												<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_employmenthistory_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_hist_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_employmenthistory_next"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_employmenthistory_skip"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_achievements" class="hidden">
						<div id="add_achievements_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
								<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
						</div>
						<div id="empachievementsdynamicdiv1" class="content">
							<div class = "nav">Employee Achievements</div>
							<table class="data" id="emp_achievements_Table">
								<tr>
									<th class="first"><sup class="saptaColor">*</sup>Company Name</th>
									<th><sup class="saptaColor">*</sup>Achievement</th>
								</tr>					
								<tr id="achievements_dynamictr_1">
									<td><input name="emp_achievements_companyname_1" id="emp_achievements_companyname_1" type="text"  /></td>
									<td><input name="emp_achievements_achievementname_1" id="emp_achievements_achievementname_1" type="text"  /></td>
									<td class="noborder">
										<div id="achievements_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_achievements_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_achv_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_achievements_next"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_achievements_skip"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_culturals" class="hidden">
						<div id="add_culturals_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
								<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
						</div>
						<div id="empculturalsdynamicdiv1" class="content">
							<div class = "nav"> Employee Cultural Activity </div>
							<table class="data" id="emp_culturals_Table">
								<tr>
									<th class="first"><sup class="saptaColor">*</sup>Event Name</th>
									<th><sup class="saptaColor">*</sup>Achievement</th>
								</tr>					
								<tr id="culturals_dynamictr_1">
									<td><input name="emp_culturals_eventname_1" id="emp_culturals_eventname_1" type="text"  /></td>
									<td><input name="emp_culturals_eventachievement_1" id="emp_culturals_eventachievement_1" type="text" /></td>
									<td class="noborder">
										<div id="culturals_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_culturals_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_cul_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_culturals_next"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_culturals_skip"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_sports" class="hidden">
						<div id="add_sports_more" style="cursor: pointer" class="rightElement MRGR10PX MRGT10PX MRGB10PX">
								<img src="<%=request.getContextPath() %>/resources/images/add.png" alt="Add More"/>
						</div>
						<div id="empsportsdynamicdiv1" class="content">
							<div class = "nav">Employee Sports Activity</div>
							<table class="data" id="emp_sports_Table">
								<tr>
									<th class="first"><sup class="saptaColor">*</sup>Event Name</th>
									<th><sup class="saptaColor">*</sup>Achievement</th>
								</tr>					
								<tr id="sports_dynamictr_1">
									<td><input name="emp_sports_sportsname_1" id="emp_sports_sportsname_1" type="text" /></td>
									<td><input name="emp_sports_sportsachievement_1" id="emp_sports_sportsachievement_1" type="text"  /></td>
									<td class="noborder">
										<div id="sports_remove_1" style="cursor: pointer" class="rightElement MRGR10PX">
											<img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_sports_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
									
									<input id="emp_spo_decline" type="button" value="Decline" class="graybtn" />
								</div>
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_sports_next"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_sports_skip"/>
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="emp_about" class="hidden">
						<div class = "content">
							<div class = "nav">About Employee</div>
							<br>
							<div style="width: 100%;display: inline-block;text-align: center;margin-bottom: 10px;" class="MRGL10PX"><b>If fresher not required to fill the following</b></div>
							<br>
							<table>
								<tr>
									<td align="right"><sup class="saptaColor" id="">*</sup>Total Experience&nbsp;:</td>
									<td><input name="emp_totalexp" id="emp_totalexp" type="text"  onkeypress="return validateNumericWithPrecision(event)"/></td>
									<td align="right"><sup class="saptaColor" id="">*</sup>Relevent Experience&nbsp;:</td>
									<td><input name="emp_relexp" id="emp_relexp" type="text" onkeypress="return validateNumericWithPrecision(event)"/></td>
								</tr>
								<tr>
									<td align="right"><sup class="saptaColor" id="">*</sup>Present Salary&nbsp;:</td>
									<td><input name="emp_presentsalary" id="emp_presentsalary" type="text" onkeypress="return validateNumeric(event)"/></td>
									<td align="right"><sup class="saptaColor" id="">*</sup>Expected Salary&nbsp;:</td>
									<td><input name="emp_expectedsalary" id="emp_expectedsalary" type="text"  onkeypress="return validateNumeric(event)"/></td>
								</tr>
								<tr>
									<td align="right" >Strength&nbsp;:</td>
									<td><textarea style=" height: 100px; resize:none;" id="emp_strength" name="emp_strength"></textarea></td>
									<td align="right" >Weakness&nbsp;:</td>
									<td><textarea style=" height: 100px; resize:none;" id="emp_weakness" name="emp_weakness"></textarea></td>
								</tr>
							</table>
							
							<!-- <table>
								 <tr>
									<td align="right" >Strength&nbsp;:</td>
									<td><textarea style=" height: 100px; resize:none;" id="emp_strength" name="emp_strength"></textarea></td>
									<td align="right" >Weakness&nbsp;:</td>
									<td><textarea style=" height: 100px; resize:none;" id="emp_weakness" name="emp_weakness"></textarea></td>
								</tr> 
							</table> -->
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_about_prev"/>
							</div>
							<div class="clearTable rightElement">
								<div class="rightElement MRGL10PX">
									<input type="button" value="Next" id="emp_about_btn"/>
									<input type="button" value="Skip" class="graybtn MRGR10PX" id="emp_about_skip"/>
								</div>
								<div class="leftElement ">
									<input id="emp_abt_decline" type="button" value="Decline" class="graybtn" />&nbsp;
								</div>
							</div>
						</div>
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
					<div id="employeebankdetail" class="hidden">
						<div class="content">
							<div class="nav">
								 Employee Bank Details
							</div>
								<table>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Bank Name&nbsp;:</td>
										<td><input name="bank_name" id="bank_name" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td align="right"><sup class="saptaColor">*</sup>A/C No&nbsp;:</td>
										<td><input name="bank_accno" id="bank_accno" type="text"  onkeypress="return validateNumeric(event)"/></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Branch&nbsp;:</td>
										<td><input name="bank_branch" id="bank_branch" type="text"  /></td>
										<td align="right"><sup class="saptaColor">*</sup>Address&nbsp;:</td>
										<td><input name="bank_address" id="bank_address" type="text" /></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>City&nbsp;:</td>
										<td><input name="bank_city" id="bank_city" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
										<td align="right"><sup class="saptaColor">*</sup>State&nbsp;:</td>
										<td><input name="bank_state" id="bank_state" type="text"  onkeypress="return ValidateAlpha(event)"/></td>
									</tr>
									<tr>
										<td align="right"><sup class="saptaColor">*</sup>Pincode&nbsp;:</td>
										<td><input name="bank_pincode" id="bank_pincode" type="text"  maxlength="6" minlength="6" onkeypress="return validateNumeric(event)"/></td>
										<td align="right"><sup class="saptaColor">*</sup>IFSC&nbsp;:</td>
										<td><input name="bank_ifsc" id="bank_ifsc" type="text" /></td>
									</tr>
								</table>
						</div>
						<div class="clearWidth">
							<div class="leftElement">
								<input type="button" value="Previous" class="graybtn" id="emp_bank_prev"/>
							</div>
							<div class="rightElement">
								<div class="leftElement ">
								
									<input id="emp_bank_decline" type="button" value="Decline" class="graybtn"/>
									<input type="button" value="Skip & Submit" class="graybtn MRGR10PX" id="emp_bank_skip"/>
								</div>
								<div class="rightElement MRGL10PX">
									 <input type="button" value="Submit" id="add_employee"/>
								</div>
							</div>	
						</div>
						
						<div style="text-align: center;"  class = "mandContent"><b class="saptaColor">*</b>mandatory fields</div>
					</div>
				</div>
					<div id="userMsg" class="hidden">
						<h1><b class="saptaColor">Notification</b></h1>
						<div id="userMsgContent"></div>
						<div class="clearWidth MRGT10PX">
							<a href="<%=request.getContextPath() %>/home" ><input type="button" value="Done" id="user" /></a>
						</div>
					</div>
					<div id ="addsuccessful_fancybox" class="hidden">
					<h1><b class="saptaColor">Notification</b></h1>
					<div id = "successful_msg_content"></div>
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
						<input id="familydetails_ok" type="button" value="Done" class="MRGT10PX"/>&nbsp;</a>
					</div>
					<div id="confirmMsgDecline" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline"></div>
						<input type="button" id="emp_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline1" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline1"></div>
						<input type="button" id="emp_det_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_det_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline2" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline2"></div>
						<input type="button" id="decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline3" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline3"></div>
						<input type="button" id="emp_fam_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_fam_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline4" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline4"></div>
						<input type="button" id="emp_edu_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_edu_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline5" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline5"></div>
						<input type="button" id="emp_skill_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_skill_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline6" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline6"></div>
						<input type="button" id="emp_ref_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_ref_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline7" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline7"></div>
						<input type="button" id="emp_lang_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_lang_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline8" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline8"></div>
						<input type="button" id="emp_hist_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_hist_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline9" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline9"></div>
						<input type="button" id="emp_achv_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_achv_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline10" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline10"></div>
						<input type="button" id="emp_cul_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_cul_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline11" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline11"></div>
						<input type="button" id="emp_spo_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_spo_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline12" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline12"></div>
						<input type="button" id="emp_abt_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_abt_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<div id="confirmMsgDecline13" class="hidden" >
						<h1><b class="saptaColor">Confirmation</b></h1>
						<div id="confirmationMsgContentDecline13"></div>
						<input type="button" id="emp_bank_decline_no" class="rightElement graybtn" value="Cancel" style=" margin-top: 10px; ">
						<a href ="<%=request.getContextPath() %>/home" style="text-decoration: none">
							<input type="button" id="emp_bank_decline_yes" class="leftElement  MRGR10PX" value="Yes I'm" style="margin-top: 10px">
						</a>	
					</div>
					<!--Content Area END-->
					<%@include file="footer.jsp"%>
				</div>
		</body>
		 <script type="text/javascript">
		function white_space(field)
		{
		     field.value = (field.value).replace(/^\\s*/g,'');
		}
			$(document).ready(function(){
				$("body").css("cursor", "progress");
				$("#pageTitle").html("<b class='saptaColor'>Add</b> Employee");
				$("#menu_employee").addClass("active");
				
				$(function() {
					 $( "#jdate, #rdate, #pvalidupto, #doa, #emp_from_1, #emp_to_1, #emp_employmenthistory_fromdate_1, #emp_employmenthistory_todate_1 " ).datepicker({
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
				
				$(function() {
					 $( "#dob" ).datepicker({
						 yearRange: '1950:2100',
						 defaultDate: new Date(),
						 changeMonth: true,
						 changeYear: true,
						 maxDate: new Date(),
						 showOn: "button",
		               	 buttonImage:  $("#contextpath").val()+"/resources/images/calendar.gif",
		                 buttonImageOnly: true,
						 dateFormat :"dd-mm-yy"
					 });
				 });
				
				$('#accidentillness').on('change', function (e){
					if($("#accidentillness").val() == "y"){
						$("#descriptiontablerow").removeClass("hidden");
					}else{
						$("#descriptiontablerow").addClass("hidden");
					}
				});
				
				$('#emp_totalexp').on('change', function (e){
					if($("#emp_totalexp").val() != "" && $("#emp_totalexp").val() > 0 || $("#emp_totalexp").val().length > 0 ){
						$("#desc1").removeClass("hidden");
						$("#desc2").removeClass("hidden");
						$("#desc3").removeClass("hidden");
					}else{
						$("#desc1").addClass("hidden");
						$("#desc2").addClass("hidden");
						$("#desc3").addClass("hidden");
						$("#emp_relexp").val("");
						$("#emp_presentsalary").val("");
						$("#emp_expectedsalary").val("");
					}
				});
				
				$('#passport').on('change', function (e){
					if($("#passport").val() == ""){
						 $("#pplaceofissued").val("");
						 $("#pvalidupto").val("");
					}
				});
				$('#pplaceofissued').on('change', function (e){
					if($("#passport").val() == ""){
						 $("#pplaceofissued").val("");
						 $("#pvalidupto").val("");
					}
				});
				$('#pvalidupto').on('change', function (e){
					if($("#passport").val() == ""){
						 $("#pplaceofissued").val("");
						 $("#pvalidupto").val("");
					}
				});
				
				var successflag;
				var fbsuccessflag = "false";
				var edusuccessflag = "false";
				var skillsuccessflag = "false";
				var counter = 2;
				$("#addfamily_detail_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'fbdynamictr_' + counter);
					newemp_dynamic.html('<td><select id="fbrelationship_' + counter +'" name="fbrelationship_' + counter +'"><option value="">--- Select ---</option><option value="father" style="text-align: left;">Father</option><option value="mother" style="text-align: left;">Mother</option><option value="spouse" style="text-align: left;">Spouse</option><option value="brother" style="text-align: left;">Brother</option><option value="sister" style="text-align: left;">Sister</option><option value="son" style="text-align: left;">Son</option><option value="daughter" style="text-align: left;">Daughter</option></select></td><td><input name="fbname_' + counter +'" id="fbname_' + counter +'" type="text"  onkeypress="return ValidateAlpha(event)"/></td><td><select name="fbage_' + counter +'" id="fbage_' + counter +'" ><option value="">--- Select ---</option><c:forEach var="i" begin="1" end="100"><option value="${i}">${i}</option></c:forEach></select></td><td><input name="fbeducation_' + counter +'" id="fbeducation_' + counter +'" type="text"  onkeypress="return ValidateAlpha(event)"/></td><td><input name="fboccupation_' + counter +'" id="fboccupation_' + counter +'" type="text"  onkeypress="return ValidateAlpha(event)"/></td><td class="noborder"><div id="fb_remove_' + counter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_familybg_Table");
					counter++;
				});
				$(document).on('click','[id^="fb_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(10, id.length);
					if(counter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
			    	   counter--;
				       $("#fbdynamictr_" + i).remove();
				    }   
				 });
				var eduCounter = 2;
				$("#add_education_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'education_dynamictr_' + eduCounter);
					newemp_dynamic.html('<td><input name="emp_degree_' + eduCounter +'" id="emp_degree_' + eduCounter +'" type="text" style="width: 70px;"/></td><td><input name="emp_specialization_' + eduCounter +'" id="emp_specialization_' + eduCounter +'" type="text" /></td><td><input name="emp_rankscholership_' + eduCounter +'" id="emp_rankscholership_' + eduCounter +'" type="text" /></td><td><input name="emp_institution_name_' + eduCounter +'" id="emp_institution_name_' + eduCounter +'" type="text" /></td><td><b class="datePicInput"><input name="emp_from_' + eduCounter +'" id="emp_from_' + eduCounter +'" class="datePicMob datepicking datePcK" raedonly="readonly" type="text" /></b></td><td><b class="datePicInput"><input name="emp_to_' + eduCounter +'" id="emp_to_' + eduCounter +'" class="datePicMob  datepicking datePcK" raedonly="readonly" type="text" /></b></td><td class="noborder"><div id="education_remove_' + eduCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_education_Table");
					$(function() {
						 $( "#emp_to_"+eduCounter+",#emp_from_"+eduCounter).datepicker({
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
					eduCounter++;
				});
				$(document).on('click','[id^="education_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(17, id.length);
					if(eduCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	eduCounter--;
				       $("#education_dynamictr_" + i).remove();
				    }
				});
				var skillsetCounter = 2;
				$("#add_skillset_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'skillset_dynamictr_' + skillsetCounter);
					newemp_dynamic.html('<td><input name="emp_skillset_name_' + skillsetCounter +'" id="emp_skillset_name_' + skillsetCounter +'" type="text"/></td><td><select name="emp_skillset_level_' + skillsetCounter +'" id="emp_skillset_level_' + skillsetCounter +'" ><option value="" style="text-align:center">--- Select ---</option><option value="b" style="text-align:left">Basic</option><option value="a" style="text-align:left">Advanced</option><option value="e" style="text-align:left">Expert</option></select></td><td class="noborder"><div id="skillset_remove_' + skillsetCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_skillset_Table");
					skillsetCounter++;
				});
				$(document).on('click','[id^="skillset_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(16, id.length);
					if(skillsetCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	skillsetCounter--;
				       $("#skillset_dynamictr_" + i).remove();
				    }   
				 });
				var referenceCounter = 2;
				$("#add_reference_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'reference_dynamictr_' + referenceCounter);
					newemp_dynamic.html('<td><input name="emp_reference_name_' + referenceCounter +'" id="emp_reference_name_' + referenceCounter +'" type="text" onkeypress="return ValidateAlpha(event)"\></td><td><input name="emp_reference_address_' + referenceCounter +'" id="emp_reference_address_' + referenceCounter +'" type="text"  /></td><td><input name="emp_reference_phone_' + referenceCounter +'" id="emp_reference_phone_' + referenceCounter +'" type="text"  onkeypress="return validateNumeric(event)"/></td><td><input name="emp_reference_mobile_' + referenceCounter +'" id="emp_reference_mobile_' + referenceCounter +'" type="text"  maxlength="10" onkeypress="return validateNumeric(event)"/></td><td><input name="emp_reference_skill_' + referenceCounter +'" id="emp_reference_skill_' + referenceCounter +'" type="text"  /></td><td><input name="emp_reference_designation_' + referenceCounter +'" id="emp_reference_designation_' + referenceCounter +'" type="text"  /></td><td class="noborder"><div id="reference_remove_' + referenceCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_reference_Table");
					referenceCounter++;
				});
				$(document).on('click','[id^="reference_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(17, id.length);
					if(referenceCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	referenceCounter--;
				       $("#reference_dynamictr_" + i).remove();
				    }   
				 });
				var languageCounter = 2;
				$("#add_languageknown_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'languageknown_dynamictr_' + languageCounter);
					newemp_dynamic.html('<td><input name="emp_languageknown_language_' + languageCounter +'" id="emp_languageknown_language_' + languageCounter +'" type="text"  onkeypress="return ValidateAlpha(event)"/></td><td><select name="emp_languageknown_read_' + languageCounter +'" id="emp_languageknown_read_' + languageCounter +'" ><option value="" style="text-align:center;">--- Select ---</option><option value="y" style="text-align:left;">Yes</option><option value="n" style="text-align:left;">No</option></select></td><td><select name="emp_languageknown_write_' + languageCounter +'" id="emp_languageknown_write_' + languageCounter +'" ><option value="" style="text-align:center;">--- Select ---</option><option value="y" style="text-align:left;">Yes</option><option value="n" style="text-align:left;">No</option></select></td><td><select name="emp_languageknown_speak_' + languageCounter +'" id="emp_languageknown_speak_' + languageCounter +'" ><option value="" style="text-align:center;">--- Select ---</option><option value="y" style="text-align:left;">Yes</option><option value="n" style="text-align:left;">No</option></select></td><td class="noborder"><div id="languageknown_remove_' + languageCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_languageknown_Table");
					languageCounter++;
				});
				$(document).on('click','[id^="languageknown_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(21, id.length);
					if(languageCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	languageCounter--;
				       $("#languageknown_dynamictr_" + i).remove();
				    }   
				 });
				var historyCounter = 2;
				$("#add_employmenthistory_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'employmenthistory_dynamictr_' + historyCounter);
					newemp_dynamic.html('<td><input name="emp_employmenthistory_name_' + historyCounter +'" id="emp_employmenthistory_name_' + historyCounter +'" type="text" onkeypress="return ValidateAlpha(event)"/></td><td><input name="emp_employmenthistory_address_' + historyCounter +'" id="emp_employmenthistory_address_' + historyCounter +'" type="text"  /></td><td><b class="datePicInput"><input name="emp_employmenthistory_fromdate_' + historyCounter +'" id="emp_employmenthistory_fromdate_' + historyCounter +'" class="datePicMob datepicking datePcK" raedonly="readonly" type="text" /></b></td><td><b class="datePicInput"><input name="emp_employmenthistory_todate_' + historyCounter +'" id="emp_employmenthistory_todate_' + historyCounter +'" class="datePicMob  datepicking datePcK" raedonly="readonly" type="text"  /></b></td><td><input name="emp_employmenthistory_startingsalary_' + historyCounter +'" id="emp_employmenthistory_startingsalary_' + historyCounter +'" type="text"  onkeypress="return validateNumeric(event)"/></td><td><input name="emp_employmenthistory_lastsalary_' + historyCounter +'" id="emp_employmenthistory_lastsalary_' + historyCounter +'" type="text"  onkeypress="return validateNumeric(event)"/></td><td><input name="emp_employmenthistory_responsibility_' + historyCounter +'" id="emp_employmenthistory_responsibility_' + historyCounter +'" type="text"  /></td><td><input name="emp_employmenthistory_designation_' + historyCounter +'" id="emp_employmenthistory_designation_' + historyCounter +'" type="text"  /></td><td class="noborder"><div id="employmenthistory_remove_' + historyCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_employmenthistory_Table");
					$(function() {
						 $( "#emp_employmenthistory_fromdate_"+historyCounter+", #emp_employmenthistory_todate_"+historyCounter).datepicker({
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
					historyCounter++;
				});
				$(document).on('click','[id^="employmenthistory_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(25, id.length);
					if(historyCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	historyCounter--;
				       $("#employmenthistory_dynamictr_" + i).remove();
				    }   
				 });
				var achievementsCounter = 2;
				$("#add_achievements_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'achievements_dynamictr_' + achievementsCounter);
					newemp_dynamic.html('<td><input name="emp_achievements_companyname_' + achievementsCounter +'" id="emp_achievements_companyname_' + achievementsCounter +'" type="text" style="width: 158px;" /></td><td><input name="emp_achievements_achievementname_' + achievementsCounter +'" id="emp_achievements_achievementname_' + achievementsCounter +'" type="text" style="width: 158px;" /></td><td class="noborder"><div id="achievements_remove_' + achievementsCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_achievements_Table");
					achievementsCounter++;
				});
				$(document).on('click','[id^="achievements_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(20, id.length);
					if(achievementsCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	achievementsCounter--;
				       $("#achievements_dynamictr_" + i).remove();
				    }   
				 });
				var culturalsCounter = 2;
				$("#add_culturals_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'culturals_dynamictr_' + culturalsCounter);
					newemp_dynamic.html('<td><input name="emp_culturals_eventname_' + culturalsCounter +'" id="emp_culturals_eventname_' + culturalsCounter +'" type="text" style="width: 158px;" /></td><td><input name="emp_culturals_eventachievement_' + culturalsCounter +'" id="emp_culturals_eventachievement_' + culturalsCounter +'" type="text" style="width: 158px;" /></td><td class="noborder"><div id="culturals_remove_' + culturalsCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_culturals_Table");
					culturalsCounter++;
				});
				$(document).on('click','[id^="culturals_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(17, id.length);
					if(culturalsCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	culturalsCounter--;
				       $("#culturals_dynamictr_" + i).remove();
				    }   
				 });
				var sportsCounter = 2;
				$("#add_sports_more").click(function () {
					var newemp_dynamic = $(document.createElement('tr')).attr("id", 'sports_dynamictr_' + sportsCounter);
					newemp_dynamic.html('<td><input name="emp_sports_sportsname_' + sportsCounter +'" id="emp_sports_sportsname_' + sportsCounter +'" type="text" style="width: 158px;" /></td><td><input name="emp_sports_sportsachievement_' + sportsCounter +'" id="emp_sports_sportsachievement_' + sportsCounter +'" type="text" style="width: 158px;" /></td><td class="noborder"><div id="sports_remove_' + sportsCounter +'" style="cursor: pointer" class="rightElement MRGR10PX"><img src="<%=request.getContextPath() %>/resources/images/delete.png" alt="Remove"/></div></td>');
					newemp_dynamic.appendTo("#emp_sports_Table");
					sportsCounter++;
				});
				$(document).on('click','[id^="sports_remove_"]', function(e) {
					var id = $(this).attr("id");
					var i = id.substring(14, id.length);
					if(sportsCounter==2){
						$("#errorMsgContent").html("Atleast one detail sholud be required...");
						$.fancybox.open('#errorMsg');
				    }else{
				    	sportsCounter--;
				       $("#sports_dynamictr_" + i).remove();
				    }   
				 });
				$('#optional_address').on('change', function (e) {
					var optionval = $("option:selected", this);
					if(optionval.val() == "y"){
						$("#emp_add_btn").removeClass("graybtn");
						$("#emp_add_btn").prop("disabled",false);
						var permanentstreet = $("#cstreet").val();
						var permanentcity = $("#ccity").val();
						var permanentstate = $("#cstate").val();
						var permanentcountry = $("#ccountry").val();
						var permanentpincode = $("#cpincode").val();
						$("#pstreet").val(permanentstreet);
						$("#pcity").val(permanentcity);
						$("#pstate").val(permanentstate);
						$("#pcountry").val(permanentcountry);
						$("#ppincode").val(permanentpincode);
						
						$('#pstreet').prop('readonly', true);
						$('#pcity').prop('readonly', true);
						$('#pstate').prop('readonly', true);
						$('#pcountry').prop('readonly', true);
						$('#ppincode').prop('readonly', true);
						
						
						$('#cstreet').prop('readonly', true);
						$('#ccity').prop('readonly', true);
						$('#cstate').prop('readonly', true);
						$('#ccountry').prop('readonly', true);
						$('#cpincode').prop('readonly', true);
						
						$("#permanent_address").removeClass("hidden");
					}else if(optionval.val() == "n"){
						$("#emp_add_btn").removeClass("graybtn");
						$("#emp_add_btn").prop("disabled",false);
						$("#permanent_address").val("");
						
						$("#pstreet").val("");
						$("#pcity").val("");
						$("#pstate").val("");
						$("#pcountry").val("");
						$("#ppincode").val("");
						
						
						$('#pstreet').prop('readonly', false);
						$('#pcity').prop('readonly', false);
						$('#pstate').prop('readonly', false);
						$('#pcountry').prop('readonly', false);
						$('#ppincode').prop('readonly', false);
						
						$('#cstreet').prop('readonly', false);
						$('#ccity').prop('readonly', false);
						$('#cstate').prop('readonly', false);
						$('#ccountry').prop('readonly', false);
						$('#cpincode').prop('readonly', false);
						
						$("#permanent_address").removeClass("hidden");
					}else if(optionval.val() == ""){
						$("#emp_add_btn").addClass("graybtn");
						$("#emp_add_btn").prop("disabled",true);
						$("#permanent_address").addClass("hidden");
					}
				});
				
					$('#emp_reference_skip').click(function() {
						var count = 1;
						$('[id^="reference_dynamictr_"]').each(function(i, item) {
							count++;
							var id = $(this).attr("id");
							var i = id.substring(20, id.length);
							$("#emp_reference_name_"+i).val("");
							$("#emp_reference_address_"+i).val("");
							$("#emp_reference_phone_"+i).val("");
							$("#emp_reference_mobile_"+i).val("");
							$("#emp_reference_skill_"+i).val("");
							$("#emp_reference_designation_"+i).val("");
							if(count > 2){
								$("#reference_dynamictr_" +i).remove();
								count--;
							}
						});
							$("#emp_reference").addClass("hidden"); 
							$("#emp_languageknown").removeClass("hidden"); 
					});
					
					$('#emp_employmenthistory_skip').click(function() {
						var count = 1;
						$('[id^="employmenthistory_dynamictr_"]').each(function(i, item) {
							count++;
							var id = $(this).attr("id");
							var i = id.substring(28, id.length);
							$("#emp_employmenthistory_name_"+i).val("");
							$("#emp_employmenthistory_address_"+i).val("");
							$("#emp_employmenthistory_fromdate_"+i).val("");
							$("#emp_employmenthistory_todate_"+i).val("");
							$("#emp_employmenthistory_startingsalary_"+i).val("");
							$("#emp_employmenthistory_lastsalary_"+i).val("");
							$("#emp_employmenthistory_responsibility_"+i).val("");
							$("#emp_employmenthistory_designation_"+i).val("");
							if(count > 2){
								$("#employmenthistory_dynamictr_" +i).remove();
								count--;
							}
						});
							$("#emp_employmenthistory").addClass("hidden"); 
							$("#emp_achievements").removeClass("hidden"); 
					});
					
					$('#emp_achievements_skip').click(function() {
						var count = 1;
						$('[id^="achievements_dynamictr_"]').each(function(i, item) {
							count++;
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							$("#emp_achievements_companyname_"+i).val("");
							$("#emp_achievements_achievementname_"+i).val("");
							if(count > 2){
								$("#achievements_dynamictr_" +i).remove();
								count--;
							}
						});
							$("#emp_achievements").addClass("hidden"); 
							$("#emp_culturals").removeClass("hidden"); 
					});
					

					$('#emp_culturals_skip').click(function() {
						var count = 1;
						$('[id^="culturals_dynamictr_"]').each(function(i, item) {
							count++;
							var id = $(this).attr("id");
							var i = id.substring(20, id.length);
							$("#emp_culturals_eventname_"+i).val("");
							$("#emp_culturals_eventachievement_"+i).val("");
							if(count > 2){
								$("#culturals_dynamictr_" +i).remove();
								count--;
							}
						});
							$("#emp_culturals").addClass("hidden"); 
							$("#emp_sports").removeClass("hidden"); 
					});
					
					$('#emp_sports_skip').click(function() {
						var count = 1;
						$('[id^="sports_dynamictr_"]').each(function(i, item) {
							count++;
							var id = $(this).attr("id");
							var i = id.substring(17, id.length);
							$("#emp_sports_sportsname_"+i).val("");
							$("#emp_sports_sportsachievement_"+i).val("");
							if(count > 2){
								$("#sports_dynamictr_" +i).remove();
								count--;
							}
						});
							$("#emp_sports").addClass("hidden"); 
							$("#emp_about").removeClass("hidden"); 
					});
					
					$('#emp_about_skip').click(function() {
						$("#emp_strength").val("");
						$("#emp_weakness").val("");
						$("#emp_totalexp").val("");
						$("#emp_relexp").val("");
						$("#emp_presentsalary").val("");
						$("#emp_expectedsalary").val("");
						$("#emp_about").addClass("hidden");
						$("#employeebankdetail").removeClass("hidden");
					});
					
					
					$('#emp_det_prev').click(function() {
						$("body").css("cursor", "default");
							$("#employeedetail").addClass("hidden"); 
							$("#employee").removeClass("hidden"); 
						$("body").css("cursor", "default");
					});
					$('#emp_add_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_address").addClass("hidden" );
							$("#employeedetail").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_familydetail_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_family_background").addClass("hidden" );
							$("#emp_address").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_education_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_education").addClass("hidden" );
							$("#emp_family_background").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_skillset_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_skillset").addClass("hidden" );
							$("#emp_education").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_reference_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_reference").addClass("hidden" );
							$("#emp_skillset").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_languageknown_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_languageknown").addClass("hidden" );
							$("#emp_reference").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_employmenthistory_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_employmenthistory").addClass("hidden" );
							$("#emp_languageknown").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_achievements_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_achievements").addClass("hidden" );
							$("#emp_employmenthistory").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_culturals_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_culturals").addClass("hidden" );
							$("#emp_achievements").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_sports_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_sports").addClass("hidden" );
							$("#emp_culturals").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_about_prev').click(function() {
						$("body").css("cursor", "default");
							$("#emp_about").addClass("hidden" );
							$("#emp_sports").removeClass("hidden");
						$("body").css("cursor", "default");
					});
					$('#emp_bank_prev').click(function() {
						$("body").css("cursor", "default");
							$("#employeebankdetail").addClass("hidden");
							$("#emp_about").removeClass("hidden" );
						$("body").css("cursor", "default");
					});
			//Decline function		
					$("#emp_decline").click(function(){
						$("#confirmationMsgContentDecline").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline');
					});
					 $("#emp_decline_no").click(function(){
						 $.fancybox.close();
					 });
					 $('#emp_decline_yes').click(function() {
						$("body").css("cursor", "default");
					}); 
					 
				     $("#emp_det_decline").click(function(){
						$("#confirmationMsgContentDecline1").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline1');
					});
					$("#emp_det_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_det_decline_yes').click(function() {
						$("body").css("cursor", "default");
					}); 
					
				     $("#decline").click(function(){
						$("#confirmationMsgContentDecline2").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline2');
					});
					$("#decline_no").click(function(){
						$.fancybox.close();
					});
					$('#decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_fam_decline").click(function(){
						$("#confirmationMsgContentDecline3").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline3');
					});
					$("#emp_fam_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_fam_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_edu_decline").click(function(){
						$("#confirmationMsgContentDecline4").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline4');
					});
					$("#emp_edu_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_edu_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_skill_decline").click(function(){
						$("#confirmationMsgContentDecline5").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline5');
					});
					$("#emp_skill_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_skill_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_ref_decline").click(function(){
						$("#confirmationMsgContentDecline6").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline6');
					});
					$("#emp_ref_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_ref_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_lang_decline").click(function(){
						$("#confirmationMsgContentDecline7").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline7');
					});
					$("#emp_lang_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_lang_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_hist_decline").click(function(){
						$("#confirmationMsgContentDecline8").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline8');
					});
					$("#emp_hist_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_hist_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_achv_decline").click(function(){
						$("#confirmationMsgContentDecline9").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline9');
					});
					$("#emp_achv_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_achv_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_cul_decline").click(function(){
						$("#confirmationMsgContentDecline10").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline10');
					});
					$("#emp_cul_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_cul_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_spo_decline").click(function(){
						$("#confirmationMsgContentDecline11").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline11');
					});
					$("#emp_spo_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_spo_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_abt_decline").click(function(){
						$("#confirmationMsgContentDecline12").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline12');
					});
					$("#emp_abt_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_abt_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					$("#emp_bank_decline").click(function(){
						$("#confirmationMsgContentDecline13").html("Are you sure want to decline...?");
						$.fancybox.open('#confirmMsgDecline13');
					});
					$("#emp_bank_decline_no").click(function(){
						$.fancybox.close();
					});
					$('#emp_bank_decline_yes').click(function() {
						$("body").css("cursor", "default");
					});
					
					
					$('#emp_next').click(function(){
						$("body").css("cursor", "default");
							var validation = true;
							//Employee
							var fname = $("#fname").val().trim();
							var mname = $("#mname").val().trim();
							var lname = $("#lname").val().trim();
							var mobile = $("#mobilenumber").val();
							var phone = $("#phone").val();
							var email = $("#emailid").val();
							var passport = $("#passport").val();
							var pplaceofissued = $("#pplaceofissued").val();
							var pvalidupto = $("#pvalidupto").val();
							var validupto = $("#pvalidupto").datepicker().val();
							var pvalidupto = validupto.split('/').join('-');
							var dlno = $("#dlno").val();
							var pan = $("#pan").val();
							var aadharno = $("#aadharno").val();
							var pfno = $("#pfno").val();
							var personalemailid = $("#personalemailid").val();
							
							if(fname == "" || fname.length == 0) validation = false;
							if(lname == "" || lname.length == 0) validation = false;
							if(mobile == "" || mobile.length == 0) validation = false;
							if(email == "" || email.length == 0) validation = false;
							if(personalemailid == "" || personalemailid.length == 0) validation = false;
							if(isNaN(mobile)  || mobile.length != 10) validation = false;
							if(!validateEmail(email)) validation = false;
							if(!validateEmail(personalemailid)) validation = false;
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#employee").addClass("hidden" );
								$("#employeedetail").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					
					 $('#emp_det_next').click(function() {
						 $("body").css("cursor", "default");
								var validation = true;
								//Employee Details
								var dob = $("#dob").datepicker().val();
								var dateofbirth = dob.split('/').join('-');
								var age = $("#age").val().replace(/[^0-9.]/ig, '');
								var gender = $("#gender").val();
								var postapplied = $("#postapplied").val();
								var dept = $("#depart").val();
								var jdate = $("#jdate").datepicker().val();
								jdate = jdate.split('/').join('-');
								var rdate = $("#rdate").datepicker().val();
								rdate = rdate.split('/').join('-');
								var emergencyno = $("#emergencyno").val();
								var marital = $("#marital").val();
								var doa = $("#doa").datepicker().val();
								var dateofanniversary = doa.split('/').join('-');
								var bgroup = $("#bgroup").val();
								var possessvehicle = $("#possessvehicle").val();
								var accidentillness = $("#accidentillness").val();
								var joininglocation = $("#joininglocation").val();
								var illnessdescr = $("#illnessdescr").val();
								
								if(accidentillness == "y"){
									if(illnessdescr == "" || illnessdescr.length == 0) validation = false;
								}
								
								var jdatevalidation = $.datepicker.parseDate('dd-mm-yy',jdate);
								if(!(dob == "") && !(dob.length == 0) ){
									var dobvalidation = $.datepicker.parseDate('dd-mm-yy',dob);
									if ((dobvalidation) > (jdatevalidation)) validation = false; 
								}
								
								
								 if(!(rdate == "") && !(rdate.length == 0) ){
									var rdatevalidation = $.datepicker.parseDate('dd-mm-yy',rdate);
									if ((jdatevalidation) >= (rdatevalidation))  validation = false; 	
								 }
								if(dateofbirth == "" || dateofbirth.length == 0) validation = false;
								if(age == "" || age.length == 0) validation = false;
								if(gender == "" || gender.length == 0) validation = false;
								if(postapplied == "" || postapplied.length == 0) validation = false;
								if(jdate == "" || jdate.length == 0 ) validation = false;
								if(emergencyno == "" || emergencyno.length == 0) validation = false;
								if(marital == "" || marital.length == 0) validation = false;
								if(possessvehicle == "" || possessvehicle.length == 0) validation = false;
								if(accidentillness == "" || accidentillness.length == 0) validation = false;
								if(joininglocation == "" || joininglocation.length == 0) validation = false;
								
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#employeedetail").addClass("hidden");
								$("#emp_address").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_add_btn').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							
							var cstreet = $("#cstreet").val();
							cstreet = cstreet.split('/').join('-');
							cstreet = cstreet.split('#').join(' ');
							var ccity = $("#ccity").val();
							var cstate = $("#cstate").val();
							var ccountry = $("#ccountry").val();
							var cpincode = $("#cpincode").val();
							
							
							if(cstreet == "" || cstreet.length == 0) validation = false;
							if(ccity == "" || ccity.length == 0) validation = false;
							if(cstate == "" || cstate.length == 0) validation = false;
							if(ccountry == "" || ccountry.length == 0) validation = false;
							if(cpincode == "" || cpincode.length == 0) validation = false;
							if(isNaN(cpincode)  || cpincode.length != 6) validation = false;
							
							
							//Permanent Address
							var pstreet = $("#pstreet").val();
							pstreet = pstreet.split('/').join('-');
							pstreet = pstreet.split('#').join(' ');
							var pcity = $("#pcity").val();
							var pstate = $("#pstate").val();
							var pcountry = $("#pcountry").val();
							var ppincode = $("#ppincode").val();
							
							if(pstreet == "" || pstreet.length == 0) validation = false;
							if(pcity == "" || pcity.length == 0) validation = false;
							if(pstate == "" || pstate.length == 0) validation = false;
							if(pcountry == "" || pcountry.length == 0) validation = false;
							if(ppincode == "" || ppincode.length == 0) validation = false;
							if(isNaN(ppincode)  || ppincode.length != 6) validation = false;
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_address").addClass("hidden");
								$("#emp_family_background").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_familybackground_next').click(function() {
						var validation = true;
						var all = new Array();
						$('[id^="fbdynamictr_"]').each(function(i, item) {
							$("body").css("cursor", "default");
							var id = $(this).attr("id");
							var i = id.substring(12, id.length);
							var relationship = $("#fbrelationship_"+i).val();
							all[i]=relationship;
							var name = $("#fbname_"+i).val();
							var age = $("#fbage_"+i).val();
							var education = $("#fbeducation_"+i).val();
							var occupation = $("#fboccupation_"+i).val();
							if(relationship == "" || relationship.length == 0) validation = false;
							if(name == "" || name.length == 0) validation = false;
							if(age == "" || age.length == 0) validation = false;
						});
						for(var j = 0; j < all.length; j++){
							for(var k = 1; k < j; k++){
								if((all[j] == "father" && all[j] == all[k]) || (all[j] == "mother" && all[j] == all[k]))
									validation = false;
							}
						}
						if(validation == false){
							$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
							$.fancybox.open('#errorMsg');
						}else{
							$("#emp_family_background").addClass("hidden");
							$("#emp_education").removeClass("hidden");
						}
							$("body").css("cursor", "default");
					});
					$('#emp_eduction_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="education_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(20, id.length);
								var empeduinstitutionname = $("#emp_institution_name_"+i).val();
								var empedudegree = $("#emp_degree_"+i).val();
								var empeduspecialization = $("#emp_specialization_"+i).val();
								var empedurankscholership = $("#emp_rankscholership_"+i).val();
								var empedufrom = $("#emp_from_"+i).datepicker().val();
								var empeduto = $("#emp_to_"+i).datepicker().val();
							
								if(empeduinstitutionname == "" || empeduinstitutionname.length == 0) validation = false;
								if(empedudegree == "" || empedudegree.length == 0) validation = false;
								if(empeduspecialization == "" || empeduspecialization.length == 0) validation = false;
								if(empedurankscholership == "" || empedurankscholership.length == 0) validation = false;
								if(empedufrom == "" || empedufrom.length == 0) validation = false;
								if(empeduto == "" || empeduto.length == 0) validation = false;
								var empedufromvalidation = $.datepicker.parseDate('dd-mm-yy',empedufrom);
								var empedutovalidation = $.datepicker.parseDate('dd-mm-yy',empeduto);
								if ((empedufromvalidation) >= (empedutovalidation))  validation = false; 	
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_education").addClass("hidden");
								$("#emp_skillset").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_skillset_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="skillset_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(19, id.length);
								var skillsetname = $("#emp_skillset_name_"+i).val();
								var skillsetlevel = $("#emp_skillset_level_"+i).val();
							
								if(skillsetname == "" || skillsetname.length == 0) validation = false;
								if(skillsetlevel == "" || skillsetlevel.length == 0) validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_skillset").addClass("hidden");
								$("#emp_reference").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_reference_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="reference_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(20, id.length);
								var referencename = $("#emp_reference_name_"+i).val();
								var referenceaddress = $("#emp_reference_address_"+i).val();
								var referencephone = $("#emp_reference_phone_"+i).val();
								var referencemobile = $("#emp_reference_mobile_"+i).val();
								var referenceskill = $("#emp_reference_skill_"+i).val();
								var referencedesignation = $("#emp_reference_designation_"+i).val();
							
								if(referencename == "" || referencename.length == 0) validation = false;
								if(referencemobile == "" || referencemobile.length == 0) validation = false;
								if(referenceskill == "" || referenceskill.length == 0) validation = false;
								if(referencedesignation == "" || referencedesignation.length == 0) validation = false;
								if(isNaN(referencemobile)  || referencemobile.length != 10) validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_reference").addClass("hidden");
								$("#emp_languageknown").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_languageknown_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="languageknown_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(24, id.length);
								var languagename = $("#emp_languageknown_language_"+i).val();
								var languageread = $("#emp_languageknown_read_"+i).val();
								var languagewrite = $("#emp_languageknown_write_"+i).val();
								var languagespeak = $("#emp_languageknown_speak_"+i).val();
							
								if(languagename == "" || languagename.length == 0) validation = false;
								if(languageread == "" || languageread.length == 0) validation = false;
								if(languagewrite == "" || languagewrite.length == 0) validation = false;
								if(languagespeak == "" || languagespeak.length == 0) validation = false;
								if(languageread == 'n' && languagewrite == 'n' && languagespeak == 'n') validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_languageknown").addClass("hidden");
								$("#emp_employmenthistory").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_employmenthistory_next').click(function() {
							var validation = true;
							$('[id^="employmenthistory_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(28, id.length);
								var emphistoryname = $("#emp_employmenthistory_name_"+i).val();
								var emphistoryaddress = $("#emp_employmenthistory_address_"+i).val();
								var emphistoryfromdate = $("#emp_employmenthistory_fromdate_"+i).datepicker().val();
								var emphistorytodate = $("#emp_employmenthistory_todate_"+i).datepicker().val();
								var emphistorystartingsalary = $("#emp_employmenthistory_startingsalary_"+i).val();
								var emphistorylastsalary = $("#emp_employmenthistory_lastsalary_"+i).val();
								var emphistoryresponsibility = $("#emp_employmenthistory_responsibility_"+i).val();
								var emphistorydesignation = $("#emp_employmenthistory_designation_"+i).val();
							
								if(emphistoryname == "" || emphistoryname.length == 0) validation = false;
								if(emphistoryaddress == "" || emphistoryaddress.length == 0) validation = false;
								if(emphistoryfromdate == "" || emphistoryfromdate.length == 0) validation = false;
								if(emphistorytodate == "" || emphistorytodate.length == 0) validation = false;
								if(emphistorystartingsalary == "" || emphistorystartingsalary.length == 0) validation = false;
								if(emphistorylastsalary == "" || emphistorylastsalary.length == 0) validation = false;
								if(emphistoryresponsibility == "" || emphistoryresponsibility.length == 0) validation = false;
								if(emphistorydesignation == "" || emphistorydesignation.length == 0) validation = false;
								
								var emphistoryfromdatevalidation = $.datepicker.parseDate('dd-mm-yy',emphistoryfromdate);
								var emphistorytodatevalidation = $.datepicker.parseDate('dd-mm-yy',emphistorytodate);
								if ((emphistoryfromdatevalidation) >= (emphistorytodatevalidation))  validation = false; 	
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_employmenthistory").addClass("hidden");
								$("#emp_achievements").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					
					$('#emp_achievements_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="achievements_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(23, id.length);
								var companyname = $("#emp_achievements_companyname_"+i).val();
								var achievementname = $("#emp_achievements_achievementname_"+i).val();
							
								if(companyname == "" || companyname.length == 0) validation = false;
								if(companyname == "" || companyname.length == 0) validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_achievements").addClass("hidden");
								$("#emp_culturals").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					});
					$('#emp_culturals_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="culturals_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(20, id.length);
								var eventname = $("#emp_culturals_eventname_"+i).val();
								var eventachievement = $("#emp_culturals_eventachievement_"+i).val();
							
								if(eventname == "" || eventname.length == 0) validation = false;
								if(eventachievement == "" || eventachievement.length == 0) validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_culturals").addClass("hidden");
								$("#emp_sports").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					 });
					 $('#emp_sports_next').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							$('[id^="sports_dynamictr_"]').each(function(i, item) {
								var id = $(this).attr("id");
								var i = id.substring(17, id.length);
								var sportsname = $("#emp_sports_sportsname_"+i).val();
								var sportsachievement = $("#emp_sports_sportsachievement_"+i).val();
								
								if(sportsname == "" || sportsname.length == 0) validation = false;
								if(sportsachievement == "" || sportsachievement.length == 0) validation = false;
							});
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								$("#emp_sports").addClass("hidden");
								$("#emp_about").removeClass("hidden");
							}
						$("body").css("cursor", "default");
					 }); 
					 $('#emp_about_btn').click(function() {
							$("body").css("cursor", "default");
								var validation = true;
								var empstrength = $("#emp_strength").val();
								var empweakness = $("#emp_weakness").val();
								var emptotalexperience = $("#emp_totalexp").val();
								var empreleventexperience = $("#emp_relexp").val();
								var emppresentsalary = $("#emp_presentsalary").val();
								var empexpectedsalary = $("#emp_expectedsalary").val();
								if(emptotalexperience == "" || emptotalexperience.length == 0) validation = false;
								if(empreleventexperience == "" || empreleventexperience.length == 0) validation = false;
								if(emppresentsalary == "" || emppresentsalary.length == 0 ) validation = false;
								if(empexpectedsalary == "" || empexpectedsalary.length == 0) validation = false;
								if(empreleventexperience > emptotalexperience) validation = false;
								if(validation == false){
									$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
									$.fancybox.open('#errorMsg');
								}else{
									$("#emp_about").addClass("hidden");
									$("#employeebankdetail").removeClass("hidden");
								}
							$("body").css("cursor", "default");
						});
					
					$('#emp_bank_skip').click(function() {
						$("body").css("cursor", "default");
							var validation = true;
							//Employee
							var fname = $("#fname").val();
							var mname = $("#mname").val();
							var lname = $("#lname").val();
							var mobile = $("#mobilenumber").val();
							var phone = $("#phone").val();
							var email = $("#emailid").val();
							var passport = $("#passport").val();
							var pplaceofissued = $("#pplaceofissued").val();
							var pvalidupto = $("#pvalidupto").val();
							var dlno = $("#dlno").val();
							var pan = $("#pan").val();
							var aadharno = $("#aadharno").val();
							var pfno = $("#pfno").val();
							var personalemailid = $("#personalemailid").val();
							//Employee Details
							var dob = $("#dob").datepicker().val();
							var dateofbirth = dob.split('/').join('-');
							var age = $("#age").val().replace(/[^0-9.]/ig, '');
							var gender = $("#gender").val();
							var postapplied = $("#postapplied").val();
							var dept = $("#depart").val();
							var jdate = $("#jdate").datepicker().val();
							jdate = jdate.split('/').join('-');
							var rdate = $("#rdate").datepicker().val();
							rdate = rdate.split('/').join('-');
							var emergencyno = $("#emergencyno").val();
							var marital = $("#marital").val();
							var doa = $("#doa").datepicker().val();
							var dateofanniversary = doa.split('/').join('-');
							var bgroup = $("#bgroup").val();
							var possessvehicle = $("#possessvehicle").val();
							var accidentillness = $("#accidentillness").val();
							var joininglocation = $("#joininglocation").val();
							var illnessdescr = $("#illnessdescr").val();
							
							//emp_address 
							
							var cstreet = $("#cstreet").val();
							cstreet = cstreet.replace("#","=");
							cstreet = cstreet.replace("/","*");
							var ccity = $("#ccity").val();
							var cstate = $("#cstate").val();
							var ccountry = $("#ccountry").val();
							var cpincode = $("#cpincode").val();
							var pstreet = $("#pstreet").val();
							pstreet = pstreet.replace("#","=");
							pstreet = pstreet.replace("/","*");
							var pcity = $("#pcity").val();
							var pstate = $("#pstate").val();
							var pcountry = $("#pcountry").val();
							var ppincode = $("#ppincode").val();
							// Employee About 
							var empstrength = $("#emp_strength").val();
							var empweakness = $("#emp_weakness").val();
							var emptotalexperience = $("#emp_totalexp").val();
							var empreleventexperience = $("#emp_relexp").val();
							var emppresentsalary = $("#emp_presentsalary").val();
							var empexpectedsalary = $("#emp_expectedsalary").val();
							//emp bank Account
							var bank_name ="null";
							var bank_accno = "null";
							var bank_branch ="null";
							var bank_address ="null";
							var bank_city ="null";
							var bank_state ="null";
							var bank_pincode = "null";
							var bank_ifsc ="null";
							
							if(mname == "" || mname.length == 0) mname = "null";
							if(phone == "" || phone.length == 0) phone = "null";
							if(passport == "" || passport.length == 0) passport = "null";
							if(pplaceofissued == "" || pplaceofissued.length == 0) pplaceofissued = "null";
							if(pvalidupto == "" || pvalidupto.length == 0) pvalidupto = "null";
							if(dlno == "" || dlno.length == 0) dlno = "null";
							if(pan == "" || pan.length == 0) pan = "null";
							if(aadharno == "" || aadharno.length == 0) aadharno = "null";
							if(pfno == "" || pfno.length == 0) pfno = "null";
							if(rdate == "" || rdate.length == 0) rdate = "null";
							if(dept == "" || dept.length == 0) dept = "null";
							if(bgroup == "" || bgroup.length == 0) bgroup = "null";
							if(dateofanniversary == "" || dateofanniversary.length == 0) dateofanniversary = "null";
							if(illnessdescr == "" || illnessdescr.length == 0) illnessdescr = "null";
							if(emptotalexperience == "" || emptotalexperience.length == 0) emptotalexperience = "null";
							if(empreleventexperience == "" || empreleventexperience.length == 0) empreleventexperience = "null";
							if(emppresentsalary == "" || emppresentsalary.length == 0) emppresentsalary = "null";
							if(empexpectedsalary == "" || empexpectedsalary.length == 0) empexpectedsalary = "null";
							if(empstrength == "" || empstrength.length == 0) empstrength = "null";
							if(empweakness == "" || empweakness.length == 0) empweakness = "null";
							var resourceURL = $("#contextpath").val()+"/employee/add/"+fname+"/"+mname+"/"+lname+"/"+email+"/"+personalemailid+"/"+mobile+"/"+phone+"/"+passport+"/"+pplaceofissued+"/"+pvalidupto+"/"+dlno+"/"+pan+"/"+aadharno+"/"+pfno+"/"+dateofbirth+"/"+age+"/"+gender+"/"+postapplied+"/"+dept+"/"+jdate+"/"+rdate+"/"+emergencyno+"/"+marital+"/"+dateofanniversary+"/"+bgroup+"/"+possessvehicle+"/"+accidentillness+"/"+joininglocation+"/"+illnessdescr+"/"+cstreet+"/"+ccity+"/"+cstate+"/"+ccountry+"/"+cpincode+"/"+pstreet+"/"+pcity+"/"+pstate+"/"+pcountry+"/"+ppincode+"/"+empstrength+"/"+empweakness+"/"+emptotalexperience+"/"+empreleventexperience+"/"+emppresentsalary+"/"+empexpectedsalary+"/"+bank_name+"/"+bank_accno+"/"+bank_branch+"/"+bank_address+"/"+bank_city+"/"+bank_state+"/"+bank_pincode+"/"+bank_ifsc;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									// Clearing Employee
									$("#fname").val("");
									$("#mname").val("");
									$("#lname").val("");
									$("#mobilenumber").val("");
									$("#phone").val("");
									$("#emailid").val("");
									$("#passport").val("");
									$("#pplaceofissued").val("");
									$("#pvalidupto").val("");
									$("#dlno").val("");
									$("#pan").val("");
									$("#aadharno").val("");
									$("#pfno").val("");
									$("#personalemailid").val("");
									
									// Clearing Employee Details
									$("#dob").val("");
									$("#age").val("");
									$("#gender").val("");
									$("#postapplied").val("");
									$("#depart").val("");
									$("#jdate").val("");
									$("#rdate").val("");
									$("#emergencyno").val("");
									$("#marital").val("");
									$("#doa").val("");
									$("#bgroup").val("");
									$("#possessvehicle").val("");
									$("#accidentillness").val("");
									$("#joininglocation").val("");
									$("#illnessdescr").val("");
									
									//clearing address 
									$("#cstreet").val("");
									$("#ccity").val("");
									$("#cstate").val("");
									$("#ccountry").val("");
									$("#cpincode").val("");
									$("#pstreet").val("");
									$("#pcity").val("");
									$("#pstate").val("");
									$("#pcountry").val("");
									$("#ppincode").val("");
									
									//clearing bank acc Details
									$("#emp_strength").val("");
									$("#emp_weakness").val("");
									$("#emp_totalexp").val("");
									$("#emp_relexp").val("");
									$("#emp_presentsalary").val("");
									$("#emp_expectedsalary").val("");
									
									//clearing bank acc Details
									$("#bank_name").val("");
									$("#bank_accno").val("");
									$("#bank_branch").val("");
									$("#bank_address").val("");
									$("#bank_city").val("");
									$("#bank_state").val("");
									$("#bank_pincode").val("");
									$("#bank_ifsc").val("");
									
									successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag = "true"){
										addFamilyBackgroundDetails();
									}
								},
								error: function (xhr, ajaxOptions, thrownError) {
									$("#errorMsgContent").html(thrownError);
									$.fancybox.open('#errorMsg');
								}
							});
						$("body").css("cursor", "default");
					});
					$('#add_employee').click(function(){
						$("body").css("cursor", "default");
							var validation = true;
							//Employee
							var fname = $("#fname").val();
							var mname = $("#mname").val();
							var lname = $("#lname").val();
							var mobile = $("#mobilenumber").val();
							var phone = $("#phone").val();
							var email = $("#emailid").val();
							var passport = $("#passport").val();
							var pplaceofissued = $("#pplaceofissued").val();
							var pvalidupto = $("#pvalidupto").val();
							var dlno = $("#dlno").val();
							var pan = $("#pan").val();
							var aadharno = $("#aadharno").val();
							var pfno = $("#pfno").val();
							var personalemailid = $("#personalemailid").val();
							
							//Employee Details
							var dob = $("#dob").datepicker().val();
							var dateofbirth = dob.split('/').join('-');
							var age = $("#age").val().replace(/[^0-9.]/ig, '');
							var gender = $("#gender").val();
							var postapplied = $("#postapplied").val();
							var dept = $("#depart").val();
							var jdate = $("#jdate").datepicker().val();
							jdate = jdate.split('/').join('-');
							var rdate = $("#rdate").datepicker().val();
							rdate = rdate.split('/').join('-');
							var emergencyno = $("#emergencyno").val();
							var marital = $("#marital").val();
							var doa = $("#doa").datepicker().val();
							var dateofanniversary = doa.split('/').join('-');
							var bgroup = $("#bgroup").val();
							var possessvehicle = $("#possessvehicle").val();
							var accidentillness = $("#accidentillness").val();
							var joininglocation = $("#joininglocation").val();
							var illnessdescr = $("#illnessdescr").val();
							//emp_address 
							var cstreet = $("#cstreet").val();
							cstreet = cstreet.replace("#","=");
							cstreet = cstreet.replace("/","*");
							var ccity = $("#ccity").val();
							var cstate = $("#cstate").val();
							var ccountry = $("#ccountry").val();
							var cpincode = $("#cpincode").val();
							var pstreet = $("#pstreet").val();
							pstreet = pstreet.replace("#","=");
							pstreet = pstreet.replace("/","*");
							var pcity = $("#pcity").val();
							var pstate = $("#pstate").val();
							var pcountry = $("#pcountry").val();
							var ppincode = $("#ppincode").val();
							// Employee About 
							var empstrength = $("#emp_strength").val();
							var empweakness = $("#emp_weakness").val();
							var emptotalexperience = $("#emp_totalexp").val();
							var empreleventexperience = $("#emp_relexp").val();
							var emppresentsalary = $("#emp_presentsalary").val();
							var empexpectedsalary = $("#emp_expectedsalary").val();
							//emp bank Account
							var bank_name = $("#bank_name").val();
							var bank_accno = $("#bank_accno").val();
							var bank_branch = $("#bank_branch").val();
							var bank_address = $("#bank_address").val();
							bank_address = bank_address.replace("#","=");
							bank_address = bank_address.replace("/","*");
							var bank_city = $("#bank_city").val();
							var bank_state = $("#bank_state").val();
							var bank_pincode = $("#bank_pincode").val();
							var bank_ifsc = $("#bank_ifsc").val();
							
							if(bank_name == "" || bank_name.length == 0) validation = false;
							if(bank_accno == "" || bank_accno.length == 0) validation = false;
							if(bank_branch == "" || bank_branch.length == 0) validation = false;
							if(bank_address == "" || bank_address.length == 0) validation = false;
							if(bank_city == "" || bank_city.length == 0) validation = false;
							if(bank_state == "" || bank_state.length == 0) validation = false;
							if(bank_pincode == "" || bank_pincode.length == 0) validation = false;
							if(bank_ifsc == "" || bank_ifsc.length == 0) validation = false;
							if(isNaN(bank_pincode)  || bank_pincode.length != 6) validation = false;
							
							if(validation == false){
								$("#errorMsgContent").html("All necessary information has not been provided or it may be invalid data");
								$.fancybox.open('#errorMsg');
							}else{
								if(mname == "" || mname.length == 0) mname = "null";
								if(phone == "" || phone.length == 0) phone = "null";
								if(passport == "" || passport.length == 0) passport = "null";
								if(pplaceofissued == "" || pplaceofissued.length == 0) pplaceofissued = "null";
								if(pvalidupto == "" || pvalidupto.length == 0) pvalidupto = "null";
								if(dlno == "" || dlno.length == 0) dlno = "null";
								if(pan == "" || pan.length == 0) pan = "null";
								if(aadharno == "" || aadharno.length == 0) aadharno = "null";
								if(pfno == "" || pfno.length == 0) pfno = "null";
								if(rdate == "" || rdate.length == 0) rdate = "null";
								if(dept == "" || dept.length == 0) dept = "null";
								if(bgroup == "" || bgroup.length == 0) bgroup = "null";
								if(dateofanniversary == "" || dateofanniversary.length == 0) dateofanniversary = "null";
								if(illnessdescr == "" || illnessdescr.length == 0) illnessdescr = "null";
								if(emptotalexperience == "" || emptotalexperience.length == 0) emptotalexperience = "null";
								if(empreleventexperience == "" || empreleventexperience.length == 0) empreleventexperience = "null";
								if(emppresentsalary == "" || emppresentsalary.length == 0) emppresentsalary = "null";
								if(empexpectedsalary == "" || empexpectedsalary.length == 0) empexpectedsalary = "null";
								if(empstrength == "" || empstrength.length == 0) empstrength = "null";
								if(empweakness == "" || empweakness.length == 0) empweakness = "null";
								
								var resourceURL = $("#contextpath").val()+"/employee/add/"+fname+"/"+mname+"/"+lname+"/"+email+"/"+personalemailid+"/"+mobile+"/"+phone+"/"+passport+"/"+pplaceofissued+"/"+pvalidupto+"/"+dlno+"/"+pan+"/"+aadharno+"/"+pfno+"/"+dateofbirth+"/"+age+"/"+gender+"/"+postapplied+"/"+dept+"/"+jdate+"/"+rdate+"/"+emergencyno+"/"+marital+"/"+dateofanniversary+"/"+bgroup+"/"+possessvehicle+"/"+accidentillness+"/"+joininglocation+"/"+illnessdescr+"/"+cstreet+"/"+ccity+"/"+cstate+"/"+ccountry+"/"+cpincode+"/"+pstreet+"/"+pcity+"/"+pstate+"/"+pcountry+"/"+ppincode+"/"+empstrength+"/"+empweakness+"/"+emptotalexperience+"/"+empreleventexperience+"/"+emppresentsalary+"/"+empexpectedsalary+"/"+bank_name+"/"+bank_accno+"/"+bank_branch+"/"+bank_address+"/"+bank_city+"/"+bank_state+"/"+bank_pincode+"/"+bank_ifsc;
								alert("dasas "+ resourceURL)
								$.ajax({
									url : resourceURL,
									type : 'GET',
									async: false,
									dataType : 'json',
									success: function(data) {
										// Clearing Employee
										$("#fname").val("");
										$("#mname").val("");
										$("#lname").val("");
										$("#mobilenumber").val("");
										$("#phone").val("");
										$("#emailid").val("");
										$("#passport").val("");
										$("#pplaceofissued").val("");
										$("#pvalidupto").val("");
										$("#dlno").val("");
										$("#pan").val("");
										$("#aadharno").val("");
										$("#pfno").val("");
										$("#personalemailid").val("");
										
										// Clearing Employee Details
										$("#dob").val("");
										$("#age").val("");
										$("#gender").val("");
										$("#postapplied").val("");
										$("#depart").val("");
										$("#jdate").val("");
										$("#rdate").val("");
										$("#emergencyno").val("");
										$("#marital").val("");
										$("#doa").val("");
										$("#bgroup").val("");
										$("#possessvehicle").val("");
										$("#accidentillness").val("");
										$("#joininglocation").val("");
										$("#illnessdescr").val("");
										
										//clearing address 
										$("#cstreet").val("");
										$("#ccity").val("");
										$("#cstate").val("");
										$("#ccountry").val("");
										$("#cpincode").val("");
										$("#pstreet").val("");
										$("#pcity").val("");
										$("#pstate").val("");
										$("#pcountry").val("");
										$("#ppincode").val("");
										
										//clearing bank acc Details
										$("#emp_strength").val("");
										$("#emp_weakness").val("");
										$("#emp_totalexp").val("");
										$("#emp_relexp").val("");
										$("#emp_presentsalary").val("");
										$("#emp_expectedsalary").val("");
										
										//clearing bank acc Details
										$("#bank_name").val("");
										$("#bank_accno").val("");
										$("#bank_branch").val("");
										$("#bank_address").val("");
										$("#bank_city").val("");
										$("#bank_state").val("");
										$("#bank_pincode").val("");
										$("#bank_ifsc").val("");
										
										successflag = data.response.successflag;
										var errors = data.response.errors;
										var results = data.response.result;
										
										if(successflag == "true"){
											addFamilyBackgroundDetails();
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
				// Add Employee Family Background Function
					function addFamilyBackgroundDetails(){
						$('[id^="fbdynamictr_"]').each(function(i, item) {
						$("body").css("cursor", "default");
							var id = $(this).attr("id");
							var i = id.substring(12, id.length);
							var relationship = $("#fbrelationship_"+i).val();
							var name = $("#fbname_"+i).val();
							var age = $("#fbage_"+i).val();
							var education = $("#fbeducation_"+i).val();
							var occupation = $("#fboccupation_"+i).val();
							if(education == "" || education.length == 0) education = "null";
							if(occupation == "" || occupation.length == 0) occupation = "null";
							
							var resourceURL = $("#contextpath").val()+"/employee/addempfamilybackground/"+relationship+"/"+name+"/"+age+"/"+education+"/"+occupation;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									
									if(successflag == "true"){
										//clear Textbox As Empty
										$("#fbrelationship_"+i).val(" ");
										$("#fbname_"+i).val(" ");
										$("#fbage_"+i).val(" ");
										$("#fbeducation_"+i).val(" ");
										$("#fboccupation_"+i).val(" ");
										
										//clear Variables As Null
										relationship = null;
										name = null;
										age = null;
										education = null;
										occupation = null;
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
						});
						addEducationDetails();
					}
				// Add Employee Education Details Function
					 function addEducationDetails(){
						 $('[id^="education_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(20, id.length);
							var empeduinstitutionname = $("#emp_institution_name_"+i).val();
							var empedudegree = $("#emp_degree_"+i).val();
							var empeduspecialization = $("#emp_specialization_"+i).val();
							var empedurankscholership = $("#emp_rankscholership_"+i).val();
							var empedufrom = $("#emp_from_"+i).datepicker().val();
							var empeduto = $("#emp_to_"+i).datepicker().val();
						var resourceURL = $("#contextpath").val()+"/employee/addempeducationdetails/"+empeduinstitutionname+"/"+empedudegree+"/"+empeduspecialization+"/"+empedurankscholership+"/"+empedufrom+"/"+empeduto;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear Textbox As Empty
										$("#emp_institution_name_"+i).val(" ");
										$("#emp_degree_"+i).val("");
										$("#emp_specialization_"+i).val(" ");
										$("#emp_rankscholership_"+i).val(" ");
										$("#emp_from_"+i).val(" ");
										$("#emp_to_"+i).val(" ");
										//clear Variables As Null
										empeduinstitutionname = null;
										empedudegree = null;
										empeduspecialization = null;
										empedurankscholership = null;
										empedufrom = null;
										empeduto = null;
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
						});
						addSkillSetDetails();
					} 
					function addSkillSetDetails(){
						$('[id^="skillset_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(19, id.length);
							var skillsetname = $("#emp_skillset_name_"+i).val();
							var skillsetlevel = $("#emp_skillset_level_"+i).val();
						var resourceURL = $("#contextpath").val()+"/employee/addempskillsetdetails/"+skillsetname+"/"+skillsetlevel;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear Textbox As Empty
										$("#emp_skillset_name_"+i).val(" ");
										$("#emp_skillset_level_"+i).val(" ");
										//clear Variables As Null
										skillsetname = null;
										skillsetlevel = null;
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
						});
						addReferenceDetails();
					}
					function addReferenceDetails(){
						$('[id^="reference_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(20, id.length);
							var referencename = $("#emp_reference_name_"+i).val();
							var referenceaddress = $("#emp_reference_address_"+i).val();
							referenceaddress = referenceaddress.replace("#","=");
							referenceaddress = referenceaddress.replace("/","*");
							var referencephone = $("#emp_reference_phone_"+i).val();
							var referencemobile = $("#emp_reference_mobile_"+i).val();
							var referenceskill = $("#emp_reference_skill_"+i).val();
							var referencedesignation = $("#emp_reference_designation_"+i).val();
							
							if(referencename == "" || referencename.length == 0) referencename = "null";
							if(referenceaddress == "" || referenceaddress.length == 0) referenceaddress = "null";
							if(referencephone == "" || referencephone.length == 0) referencephone = "null";
							if(referencemobile == "" || referencemobile.length == 0) referencemobile = "null";
							if(referenceskill == "" || referenceskill.length == 0) referenceskill = "null";
							if(referencedesignation == "" || referencedesignation.length == 0) referencedesignation = "null";
							
						var resourceURL = $("#contextpath").val()+"/employee/addempreferencedetails/"+referencename+"/"+referenceaddress+"/"+referencephone+"/"+referencemobile+"/"+referenceskill+"/"+referencedesignation;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear Textbox As Empty
										$("#emp_reference_name_"+i).val(" ");
										$("#emp_reference_address_"+i).val(" ");
										$("#emp_reference_phone_"+i).val(" ");
										$("#emp_reference_mobile_"+i).val(" ");
										$("#emp_reference_skill_"+i).val(" ");
										$("#emp_reference_designation_"+i).val(" ");
										//clear Variables As Null
										referencename = null;
										referenceaddress = null;
										referencephone = null;
										referencemobile = null;
										referenceskill = null;
										referencedesignation = null;
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
						});
						addLanguageKnownDetails();
					}
					function addLanguageKnownDetails(){
						$('[id^="languageknown_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(24, id.length);
							var languagename = $("#emp_languageknown_language_"+i).val();
							var languageread = $("#emp_languageknown_read_"+i).val();
							var languagewrite = $("#emp_languageknown_write_"+i).val();
							var languagespeak = $("#emp_languageknown_speak_"+i).val();
							
						var resourceURL = $("#contextpath").val()+"/employee/addemplanguageknowndetails/"+languagename+"/"+languageread+"/"+languagewrite+"/"+languagespeak;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear textbox value as emplty
										$("#emp_languageknown_language_"+i).val("");
										$("#emp_languageknown_read_"+i).val("");
										$("#emp_languageknown_write_"+i).val("");
										$("#emp_languageknown_speak_"+i).val("");
										//clear Variables As Null
										languagename = null;
										languageread = null;
										languagewrite = null;
										languagespeak = null;
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
						});
						addEmploymentHistoryDetails();
					}
					function addEmploymentHistoryDetails(){
						$('[id^="employmenthistory_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(28, id.length);
							var emphistoryname = $("#emp_employmenthistory_name_"+i).val();
							var emphistoryaddress = $("#emp_employmenthistory_address_"+i).val();
							emphistoryaddress = emphistoryaddress.replace("#","=");
							emphistoryaddress = emphistoryaddress.replace("/","*");
							var emphistoryfromdate = $("#emp_employmenthistory_fromdate_"+i).datepicker().val();
							var emphistorytodate = $("#emp_employmenthistory_todate_"+i).datepicker().val();
							var emphistorystartingsalary = $("#emp_employmenthistory_startingsalary_"+i).val();
							var emphistorylastsalary = $("#emp_employmenthistory_lastsalary_"+i).val();
							var emphistoryresponsibility = $("#emp_employmenthistory_responsibility_"+i).val();
							var emphistorydesignation = $("#emp_employmenthistory_designation_"+i).val();
							
							if(emphistoryname == "" || emphistoryname.length == 0) emphistoryname = "null";
							if(emphistoryaddress == "" || emphistoryaddress.length == 0) emphistoryaddress = "null";
							if(emphistoryfromdate == "" || emphistoryfromdate.length == 0) emphistoryfromdate = "null";
							if(emphistorytodate == "" || emphistorytodate.length == 0) emphistorytodate = "null";
							if(emphistorystartingsalary == "" || emphistorystartingsalary.length == 0) emphistorystartingsalary = "null";
							if(emphistorylastsalary == "" || emphistorylastsalary.length == 0) emphistorylastsalary = "null";
							if(emphistoryresponsibility == "" || emphistoryresponsibility.length == 0) emphistoryresponsibility = "null";
							if(emphistorydesignation == "" || emphistorydesignation.length == 0) emphistorydesignation = "null";
							
						var resourceURL = $("#contextpath").val()+"/employee/addemploymenthistorydetails/"+emphistoryname+"/"+emphistoryaddress+"/"+emphistoryfromdate+"/"+emphistorytodate+"/"+emphistorystartingsalary+"/"+emphistorylastsalary+"/"+emphistoryresponsibility+"/"+emphistorydesignation;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear textbox values as emplty
										$("#emp_employmenthistory_name_"+i).val("");
										$("#emp_employmenthistory_address_"+i).val("");
										$("#emp_employmenthistory_fromdate_"+i).datepicker().val("");
										$("#emp_employmenthistory_todate_"+i).datepicker().val("");
										$("#emp_employmenthistory_startingsalary_"+i).val("");
										$("#emp_employmenthistory_lastsalary_"+i).val("");
										$("#emp_employmenthistory_responsibility_"+i).val("");
										$("#emp_employmenthistory_designation_"+i).val("");
										//clear Variables as null
										emphistoryname = null;
										emphistoryaddress = null;
										emphistoryfromdate = null;
										emphistorytodate = null;
										emphistorystartingsalary = null;
										emphistorylastsalary = null;
										emphistoryresponsibility = null;
										emphistorydesignation = null;
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
						});
						addEmpAchievementsDetails();
					}
					
					function addEmpAchievementsDetails(){
						$('[id^="achievements_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(23, id.length);
							var companyname = $("#emp_achievements_companyname_"+i).val();
							var achievementname = $("#emp_achievements_achievementname_"+i).val();
							
							if(companyname == "" || companyname.length == 0) companyname = "null";
							if(achievementname == "" || achievementname.length == 0) achievementname = "null";
							
							var resourceURL = $("#contextpath").val()+"/employee/addempachievementsdetails/"+companyname+"/"+achievementname;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear textbox values as emplty
										$("#emp_achievements_companyname_"+i).val("");
										$("#emp_achievements_achievementname_"+i).val("");
										//clear Variables as null
										companyname = null;
										achievementname = null;
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
						});
						addEmpCulturalsDetails();
					}
					
					function addEmpCulturalsDetails(){
						$('[id^="culturals_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(20, id.length);
							var eventname = $("#emp_culturals_eventname_"+i).val();
							var eventachievement = $("#emp_culturals_eventachievement_"+i).val();
							
							if(eventname == "" || eventname.length == 0) eventname = "null";
							if(eventachievement == "" || eventachievement.length == 0) eventachievement = "null";
							
							var resourceURL = $("#contextpath").val()+"/employee/addempculturalsdetails/"+eventname+"/"+eventachievement;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear textbox values as emplty
										$("#emp_culturals_eventname_"+i).val("");
										$("#emp_culturals_eventachievement_"+i).val("");
										//clear Variables as null
										eventname = null;
										eventachievement = null;
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
						});
						addEmpSportsDetails();
					}
					
					function addEmpSportsDetails(){
						$('[id^="sports_dynamictr_"]').each(function(i, item) {
							var id = $(this).attr("id");
							var i = id.substring(17, id.length);
							var sportsname = $("#emp_sports_sportsname_"+i).val();
							var sportsachievement = $("#emp_sports_sportsachievement_"+i).val();
							
							if(sportsname == "" || sportsname.length == 0) sportsname = "null";
							if(sportsachievement == "" || sportsachievement.length == 0) sportsachievement = "null";
							
							var resourceURL = $("#contextpath").val()+"/employee/addempsportsdetails/"+sportsname+"/"+sportsachievement;
							$.ajax({
								url : resourceURL,
								type : 'GET',
								async: false,
								dataType : 'json',
								success: function(data) {
									var successflag = data.response.successflag;
									var errors = data.response.errors;
									var results = data.response.result;
									if(successflag == "true"){
										//clear textbox values as emplty
										$("#emp_sports_sportsname_"+i).val("");
										$("#emp_sports_sportsachievement_"+i).val("");
										//clear Variables as null
										sportsname = null;
										sportsachievement = null;
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
						});
							$("#successful_msg_content").html("Employee details added successfully ...");
							$.fancybox.open('#addsuccessful_fancybox');
					}
					
					$('#user').click(function() {
						$("body").css("cursor", "default");
					});
						
					$('#emp_det_next').click(function() {
						$("body").css("cursor", "default");
					});
						
					$('#emp_next').click(function() {
						$("body").css("cursor", "default");
					});
						
					$('#emp_add_prev').click(function() {
						$("body").css("cursor", "default");
					});
						
					$('#emp_det_prev').click(function() {
						$("body").css("cursor", "default");
					});
				$("body").css("cursor", "default");
			});
		</script>
	</html>