package com.sapta.hr.web.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sapta.hr.domainobject.AddressDO;
import com.sapta.hr.domainobject.EmpAboutDO;
import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.domainobject.EmpAchievementsDO;
import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.domainobject.EmpCulturalsDO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.domainobject.EmpEducationDO;
import com.sapta.hr.domainobject.EmpEmploymentHistoryDO;
import com.sapta.hr.domainobject.EmpFamilyBackgroundDO;
import com.sapta.hr.domainobject.EmpLanguageKnownDO;
import com.sapta.hr.domainobject.EmpReferencesDO;
import com.sapta.hr.domainobject.EmpSkillSetDO;
import com.sapta.hr.domainobject.EmpSportsDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.AddressService;
import com.sapta.hr.service.EmpAboutService;
import com.sapta.hr.service.EmpAccDetailService;
import com.sapta.hr.service.EmpAchievementsService;
import com.sapta.hr.service.EmpCTCService;
import com.sapta.hr.service.EmpCulturalsService;
import com.sapta.hr.service.EmpDetailService;
import com.sapta.hr.service.EmpEducationService;
import com.sapta.hr.service.EmpEmploymentHistoryService;
import com.sapta.hr.service.EmpFamilyBackgroundService;
import com.sapta.hr.service.EmpLanguageKnownService;
import com.sapta.hr.service.EmpReferencesService;
import com.sapta.hr.service.EmpSkillSetService;
import com.sapta.hr.service.EmpSportsService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.AddressUtil;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpAboutUtil;
import com.sapta.hr.web.util.EmpAccDetailUtil;
import com.sapta.hr.web.util.EmpAchievementsUtil;
import com.sapta.hr.web.util.EmpCulturalsUtil;
import com.sapta.hr.web.util.EmpDetailUtil;
import com.sapta.hr.web.util.EmpEducationUtil;
import com.sapta.hr.web.util.EmpEmploymentHistoryUtil;
import com.sapta.hr.web.util.EmpFamilyBackgroundUtil;
import com.sapta.hr.web.util.EmpLanguageKnownUtil;
import com.sapta.hr.web.util.EmpReferencesUtil;
import com.sapta.hr.web.util.EmpSkillSetUtil;
import com.sapta.hr.web.util.EmpSportsUtil;
import com.sapta.hr.web.util.EmployeeUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {

	String validation = null;
	
	static Logger logger = Logger.getLogger(EmployeeController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_EMPLOYEE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/viewemployee", method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_EMPLOYEE;
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
				
				if (employeeList != null && employeeList.size() > 0) {
					Collections.reverse(employeeList);
					model.addAttribute(CommonConstants.EMPLOYEE_LIST, 	employeeList);
					model.addAttribute(CommonConstants.EMPLOYEE_LIST_SIZE, 	employeeList.size());
				}
			}
		} catch (Exception e) { }
		return pagename;
	}

	@RequestMapping(value = "/viewemployee/{id}", method = RequestMethod.GET)
	public String viewEmployeeById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_EMPLOYEE;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
				}
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
					
				if (employeeList != null && employeeList.size() > 0) {
					model.addAttribute(CommonConstants.EMPLOYEE_LIST, 	employeeList);
					model.addAttribute(CommonConstants.EMPLOYEE_LIST_SIZE, 	employeeList.size());
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/addemployee", method = RequestMethod.GET)
	public String addEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_EMPLOYEE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{fname}/{mname}/{lname}/{email}/{personalemailid}/{mobile}/{phone}/{passport}/{pplaceofissued}"
			+ "/{pvalidupto}/{dlno}/{pan}/{aadharno}/{pfno}/{dateofbirth}/{age}/{gender}/{postapplied}/{dept}/{jdate}"
			+ "/{rdate}/{emergencyno}/{marital}/{dateofanniversary}/{bgroup}/{possessvehicle}/{accidentillness}/{joininglocation}"
			+ "/{illnessdescr}/{cstreet}/{ccity}/{cstate}/{ccountry}/{cpincode}/{pstreet}/{pcity}/{pstate}"
			+ "/{pcountry}/{ppincode}/{empstrength}/{empweakness}/{emptotalexperience}/{empreleventexperience}"
			+ "/{emppresentsalary}/{empexpectedsalary}/{bank_name}/{bank_accno}/{bank_branch}/{bank_address}/{bank_city}/{bank_state}"
			+ "/{bank_pincode}/{bank_ifsc}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String fname, @PathVariable String mname,
			@PathVariable String lname, @PathVariable String email,@PathVariable String personalemailid,
			@PathVariable String mobile, @PathVariable String phone,
			@PathVariable String passport, @PathVariable String pplaceofissued, 
			@PathVariable String pvalidupto, @PathVariable String dlno, 
			@PathVariable String pan,@PathVariable String aadharno, @PathVariable String pfno, @PathVariable String dateofbirth, @PathVariable String age, 
			@PathVariable char gender, @PathVariable String postapplied, 
			@PathVariable String dept, @PathVariable String jdate,
			@PathVariable String rdate, @PathVariable String emergencyno, 
			@PathVariable char marital, @PathVariable String dateofanniversary,
			@PathVariable String bgroup, @PathVariable char possessvehicle,
			@PathVariable char accidentillness,@PathVariable String joininglocation, @PathVariable String illnessdescr, 
			@PathVariable String cstreet, @PathVariable String ccity, 
			@PathVariable String cstate, @PathVariable String ccountry, 
			@PathVariable String cpincode, @PathVariable String pstreet, @PathVariable String pcity, 
			@PathVariable String pstate, @PathVariable String pcountry, 
			@PathVariable String ppincode, @PathVariable String empstrength, @PathVariable String empweakness,
			@PathVariable String emptotalexperience, @PathVariable String empreleventexperience, 
			@PathVariable String emppresentsalary, @PathVariable String empexpectedsalary,
			@PathVariable String bank_name, @PathVariable String bank_accno, @PathVariable String bank_branch, 
			@PathVariable String bank_address, @PathVariable String bank_city, 
			@PathVariable String bank_state, @PathVariable String bank_pincode, 
			@PathVariable String bank_ifsc, Model model, HttpServletRequest request) {

		try {
			if (WebManager.authenticateSession(request)) {
				EmployeeDO employee = new EmployeeDO();
				employee.setFname(fname);
				employee.setLname(lname);
				employee.setEmail(email);
				employee.setMobileno(Long.parseLong(mobile));
				employee.setStatus('a'); // a=Active, i=Inactive
				employee.setPersonalemailid(personalemailid);
				if (!mname.equalsIgnoreCase("null"))
					employee.setMname(mname);
				if (!phone.equalsIgnoreCase("null"))
					employee.setPhone(Long.valueOf(phone));
				if (!passport.equalsIgnoreCase("null"))
					employee.setPassport(passport);
				if (!pplaceofissued.equalsIgnoreCase("null"))
					employee.setPplaceofissued(pplaceofissued);
				if (!pvalidupto.equalsIgnoreCase("null"))
					employee.setPvalidupto(CommonUtil.convertStringToDate(pvalidupto));
				if (!dlno.equalsIgnoreCase("null"))
					employee.setDlno(dlno);
				if (!pan.equalsIgnoreCase("null"))
					employee.setPan(pan);
				if (!aadharno.equalsIgnoreCase("null"))
					employee.setAadharno(aadharno);
				if (!pfno.equalsIgnoreCase("null"))
					employee.setPfno(pfno);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				employee.setUpdatedby(user.getUsername());
				employee.setUpdatedon(new Date());
				EmployeeDO respEmployee = new EmployeeService().persist(employee);
				EmpDetailDO employeedetail = new EmpDetailDO();
					if (respEmployee.getId() > 0) {
						employeedetail.setEmpid(respEmployee.getId());
						employeedetail.setDob(CommonUtil.convertStringToDate(dateofbirth));
						employeedetail.setAge(Integer.parseInt(age));
						employeedetail.setGender(gender);
						employeedetail.setJdate(CommonUtil.convertStringToDate(jdate));
						employeedetail.setMarital(marital);
						employeedetail.setEmergencyno(emergencyno);
						employeedetail.setPostapplied(postapplied);
						employeedetail.setPossessvehicle(possessvehicle);
						employeedetail.setIllnessaccident(accidentillness);
						employeedetail.setJoininglocation(joininglocation);
						
						if (!bgroup.equalsIgnoreCase("null"))
							employeedetail.setBloodgroup(bgroup);
						if (!dept.equalsIgnoreCase("null"))
							employeedetail.setDept(dept);
						if (!illnessdescr.equalsIgnoreCase("null"))
							employeedetail.setDescription(illnessdescr);
						if (!rdate.equalsIgnoreCase("null"))
							employeedetail.setRdate(CommonUtil.convertStringToDate(rdate));
						if (!rdate.equalsIgnoreCase("null"))
							employeedetail.setDoa(CommonUtil.convertStringToDate(dateofanniversary));
						
						employeedetail.setUpdatedby(user.getUsername());
						employeedetail.setUpdatedon(new Date());
						
						EmpDetailDO respEmpDetail =	new EmpDetailService().persist(employeedetail);
						AddressDO caddressdo = new AddressDO();
						if (respEmpDetail.getEmpid() > 0) {
							caddressdo.setEmpid(respEmployee.getId());
							/*String cstrt = cstreet.replace( '/', '-');
							cstrt.replace(' ', '#');*/
							cstreet = cstreet.replace("=","#");
							cstreet = cstreet.replace("*","/");
							caddressdo.setStreet(cstreet);
							caddressdo.setCity(ccity);
							caddressdo.setState(cstate);
							caddressdo.setCountry(ccountry);
							caddressdo.setPin(Long.parseLong(cpincode));
							caddressdo.setType('c'); //Current Address
							caddressdo.setUpdatedby(user.getUsername());
							caddressdo.setUpdatedon(new Date());
							caddressdo = new AddressService() .persist(caddressdo);
							
							AddressDO paddressDO = new AddressDO();
							paddressDO.setEmpid(caddressdo.getEmpid());
							/*String pstrt = pstreet.replace( '/','-' );
							pstrt.replace('#', ' ');*/
							pstreet = pstreet.replace("=", "#");
							pstreet = pstreet.replace("*", "/");
							paddressDO.setStreet(pstreet);
							paddressDO.setCity(pcity);
							paddressDO.setState(pstate);
							paddressDO.setCountry(pcountry);
							paddressDO.setPin(Long.parseLong(ppincode));
							paddressDO.setType('p'); //Permanent Address
							paddressDO.setUpdatedby(user.getUsername());
							paddressDO.setUpdatedon(new Date());
									
							AddressDO respAddress = new AddressService().persist(paddressDO);
							
							EmpAccDetailDO empAccDetailDO = new EmpAccDetailDO();
							if (respAddress.getEmpid() > 0) {
								empAccDetailDO.setEmpid(respEmployee.getId());
								if (!bank_name.equalsIgnoreCase("null"))
									empAccDetailDO.setBankname(bank_name);
								if (!bank_accno.equalsIgnoreCase("null"))
									empAccDetailDO.setAccountno(Long.parseLong(bank_accno));
								if (!bank_branch.equalsIgnoreCase("null"))
									empAccDetailDO.setBranch(bank_branch);
								bank_address = bank_address.replace("=","#");
								bank_address = bank_address.replace("*","/");
								if (!bank_address.equalsIgnoreCase("null"))
									empAccDetailDO.setAddress(bank_address);
								if (!bank_city.equalsIgnoreCase("null"))
									empAccDetailDO.setCity(bank_city);
								if (!bank_state.equalsIgnoreCase("null"))
									empAccDetailDO.setState(bank_state);
								if (!bank_pincode.equalsIgnoreCase("null"))
									empAccDetailDO.setPincode(Long.parseLong(bank_pincode));
								if (!bank_ifsc.equalsIgnoreCase("null"))
								empAccDetailDO.setIfsc(bank_ifsc); 
								empAccDetailDO.setUpdatedby(user.getUsername());
								empAccDetailDO.setUpdatedon(new Date());
								
								EmpAccDetailDO respEmpAcc	= new EmpAccDetailService().persist(empAccDetailDO);
								EmpAboutDO empAboutDO = new EmpAboutDO();
								if(respEmpAcc.getEmpid() > 0){
									empAboutDO.setEmpid(respEmployee.getId());
									if(!empstrength.equalsIgnoreCase("null"))
									empAboutDO.setStrength(empstrength);
									if(!empweakness.equalsIgnoreCase("null"))
									empAboutDO.setWeakness(empweakness);
									
									if (!emptotalexperience.equalsIgnoreCase("null"))
										empAboutDO.setTotalexp(emptotalexperience);
									if (!empreleventexperience.equalsIgnoreCase("null"))
										empAboutDO.setRelexp(empreleventexperience);
									if (!emppresentsalary.equalsIgnoreCase("null"))
										empAboutDO.setPresentsalary(Long.parseLong(emppresentsalary));
									if (!empexpectedsalary.equalsIgnoreCase("null"))
										empAboutDO.setExpectedsalary(Long.parseLong(empexpectedsalary));
									empAboutDO.setUpdatedby(user.getUsername());
									empAboutDO.setUpdatedon(new Date());
								}
								new EmpAboutService().persist(empAboutDO);
							}
						}
					}
				 }
			}catch (Exception e) {
				return CommonWebUtil.buildErrorResponse("").toString();
			}
		return CommonWebUtil.buildSuccessResponse().toString();
	}

	@RequestMapping(value = "/addempfamilybackground/{relationship}/{name}/{age}/{education}/{occupation}", method = RequestMethod.GET)
	public @ResponseBody String addEmployeeFamilyBackground(@PathVariable String relationship, @PathVariable String name,
			@PathVariable  String age, @PathVariable String  education, @PathVariable String occupation,
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpFamilyBackgroundDO empFamilyBackgroundDO = new EmpFamilyBackgroundDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empFamilyBackgroundDO.setEmpid(employeeDO.getId());
					empFamilyBackgroundDO.setRelationship(relationship);
					empFamilyBackgroundDO.setName(name);
					empFamilyBackgroundDO.setAge(Integer.parseInt(age));
					if (!education.equalsIgnoreCase("null"))
						empFamilyBackgroundDO.setEducation(education);
					if (!occupation.equalsIgnoreCase("null"))
						empFamilyBackgroundDO.setOccupation(occupation);
					
				    UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				    empFamilyBackgroundDO.setUpdatedby(user.getUsername());
				    empFamilyBackgroundDO.setUpdatedon(new Date());
					new EmpFamilyBackgroundService().persist(empFamilyBackgroundDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addempeducationdetails/{empeduinstitutionname}/{empedudegree}/{empeduspecialization}/{empedurankscholership}/{empedufrom}/{empeduto}", method = RequestMethod.GET)
	public @ResponseBody String addEmployeeEducation(@PathVariable String empeduinstitutionname, @PathVariable String empedudegree,
			@PathVariable  String empeduspecialization, @PathVariable String  empedurankscholership, 
			@PathVariable String empedufrom, @PathVariable String empeduto, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpEducationDO empEducationDO = new EmpEducationDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empEducationDO.setEmpid(employeeDO.getId());
					empEducationDO.setInstitutionname(empeduinstitutionname);
					empEducationDO.setDegree(empedudegree);
					empEducationDO.setSpecialization(empeduspecialization);
					empEducationDO.setRankscholarship(empedurankscholership);
					empEducationDO.setEdufrom(CommonUtil.convertStringToDate(empedufrom));
					empEducationDO.setEduto(CommonUtil.convertStringToDate(empeduto));
					
				    UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				    empEducationDO.setUpdatedby(user.getUsername());
				    empEducationDO.setUpdatedon(new Date());
					new EmpEducationService().persist(empEducationDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addempskillsetdetails/{skillsetname}/{skillsetlevel}", method = RequestMethod.GET)
	public @ResponseBody String addEmployeeSkillset(@PathVariable String skillsetname, @PathVariable char skillsetlevel,
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSkillSetDO empSkillSetDO = new EmpSkillSetDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empSkillSetDO.setEmpid(employeeDO.getId());
					empSkillSetDO.setName(skillsetname);
					empSkillSetDO.setLevel(skillsetlevel);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				    empSkillSetDO.setUpdatedby(user.getUsername());
				    empSkillSetDO.setUpdatedon(new Date());
					new EmpSkillSetService().persist(empSkillSetDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	@RequestMapping(value = "/addempreferencedetails/{referencename}/{referenceaddress}/{referencephone}/{referencemobile}/{referenceskill}/{referencedesignation}", method = RequestMethod.GET)
	public @ResponseBody String addEmployeeReference(@PathVariable String referencename, @PathVariable String referenceaddress, @PathVariable String referencephone, 
			@PathVariable String referencemobile, @PathVariable String referenceskill, @PathVariable String referencedesignation,
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpReferencesDO empReferencesDO = new EmpReferencesDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empReferencesDO.setEmpid(employeeDO.getId());
					if (!referencename.equalsIgnoreCase("null"))
						empReferencesDO.setName(referencename);
					if (!referenceaddress.equalsIgnoreCase("null")){
						referenceaddress = referenceaddress.replace("=", "#");
						referenceaddress = referenceaddress.replace("*", "/");
						empReferencesDO.setAddress(referenceaddress);}
					if (!referencephone.equalsIgnoreCase("null"))
						empReferencesDO.setPhone(Long.parseLong(referencephone));
					if (!referencemobile.equalsIgnoreCase("null"))
						empReferencesDO.setMobile(Long.parseLong(referencemobile));
					if (!referenceskill.equalsIgnoreCase("null"))
						empReferencesDO.setSkill(referenceskill);
					if (!referencedesignation.equalsIgnoreCase("null"))
						empReferencesDO.setDesignation(referencedesignation);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empReferencesDO.setUpdatedby(user.getUsername());
					empReferencesDO.setUpdatedon(new Date());
					new EmpReferencesService().persist(empReferencesDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addemplanguageknowndetails/{languagename}/{languageread}/{languagewrite}/{languagespeak}", method = RequestMethod.GET)
	public @ResponseBody String addEmployeeLanguageKnown(@PathVariable String languagename, @PathVariable char languageread, @PathVariable char languagewrite, 
			@PathVariable char languagespeak, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpLanguageKnownDO empLanguageKnownDO = new EmpLanguageKnownDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empLanguageKnownDO.setEmpid(employeeDO.getId());
					empLanguageKnownDO.setLanguagename(languagename);
					empLanguageKnownDO.setLanguageread(languageread);
					empLanguageKnownDO.setLanguagewrite(languagewrite);
					empLanguageKnownDO.setLanguagespeak(languagespeak);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empLanguageKnownDO.setUpdatedby(user.getUsername());
					empLanguageKnownDO.setUpdatedon(new Date());
					new EmpLanguageKnownService().persist(empLanguageKnownDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value ="/addemploymenthistorydetails/{emphistoryname}/{emphistoryaddress}/{emphistoryfromdate}/{emphistorytodate}/{emphistorystartingsalary}/{emphistorylastsalary}/{emphistoryresponsibility}/{emphistorydesignation}", method = RequestMethod.GET)
	public @ResponseBody String addEmploymentHistory(@PathVariable String emphistoryname, @PathVariable String emphistoryaddress, @PathVariable String emphistoryfromdate, 
			@PathVariable String emphistorytodate, @PathVariable String emphistorystartingsalary, @PathVariable String emphistorylastsalary, @PathVariable String emphistoryresponsibility,
			@PathVariable String emphistorydesignation, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpEmploymentHistoryDO empEmploymentHistoryDO = new EmpEmploymentHistoryDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empEmploymentHistoryDO.setEmpid(employeeDO.getId());
					if (!emphistoryname.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setName(emphistoryname);
					if (!emphistoryaddress.equalsIgnoreCase("null"))
						emphistoryaddress = emphistoryaddress.replace("=", "#");
						emphistoryaddress = emphistoryaddress.replace("*", "/");
						empEmploymentHistoryDO.setAddress(emphistoryaddress);
					if (!emphistorystartingsalary.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setStartingsalary(Long.parseLong(emphistorystartingsalary));
					if (!emphistorylastsalary.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setLastsalary(Long.parseLong(emphistorylastsalary));
					if (!emphistoryresponsibility.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setResponsibility(emphistoryresponsibility);
					if (!emphistorydesignation.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setDesignation(emphistorydesignation);
					if (!emphistoryfromdate.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setFromdate(CommonUtil.convertStringToDate(emphistoryfromdate));
					if (!emphistorytodate.equalsIgnoreCase("null"))
						empEmploymentHistoryDO.setTodate(CommonUtil.convertStringToDate(emphistorytodate));
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empEmploymentHistoryDO.setUpdatedby(user.getUsername());
					empEmploymentHistoryDO.setUpdatedon(new Date());
					new EmpEmploymentHistoryService().persist(empEmploymentHistoryDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addempachievementsdetails/{companyname}/{achievementname}", method = RequestMethod.GET)
	public @ResponseBody String addEmpAchievements(@PathVariable String companyname, @PathVariable String achievementname, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpAchievementsDO empAchievementsDO = new EmpAchievementsDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					
					empAchievementsDO.setEmpid(employeeDO.getId());
					if (!companyname.equalsIgnoreCase("null"))
						empAchievementsDO.setCompanyname(companyname);
					if (!achievementname.equalsIgnoreCase("null"))
						empAchievementsDO.setAchievement(achievementname);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empAchievementsDO.setUpdatedby(user.getUsername());
					empAchievementsDO.setUpdatedon(new Date());
					new EmpAchievementsService().persist(empAchievementsDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addempculturalsdetails/{eventname}/{eventachievement}", method = RequestMethod.GET)
	public @ResponseBody String addEmpCulturals(@PathVariable String eventname, @PathVariable String eventachievement, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpCulturalsDO empCulturalsDO = new EmpCulturalsDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empCulturalsDO.setEmpid(employeeDO.getId());
					if (!eventname.equalsIgnoreCase("null"))
						empCulturalsDO.setEventname(eventname);
					if (!eventachievement.equalsIgnoreCase("null"))
						empCulturalsDO.setAchievement(eventachievement);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empCulturalsDO.setUpdatedby(user.getUsername());
					empCulturalsDO.setUpdatedon(new Date());
					new EmpCulturalsService().persist(empCulturalsDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addempsportsdetails/{sportsname}/{sportsachievement}", method = RequestMethod.GET)
	public @ResponseBody String addEmpSports(@PathVariable String sportsname, @PathVariable String sportsachievement, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSportsDO empSportsDO = new EmpSportsDO();
				EmployeeDO employeeDO = new EmployeeService().retriveEmpID();
				if(employeeDO != null){
					empSportsDO.setEmpid(employeeDO.getId());
					if (!sportsname.equalsIgnoreCase("null"))
						empSportsDO.setEventname(sportsname);
					if (!sportsachievement.equalsIgnoreCase("null"))
						empSportsDO.setAchievement(sportsachievement);
				 
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empSportsDO.setUpdatedby(user.getUsername());
					empSportsDO.setUpdatedon(new Date());
					new EmpSportsService().persist(empSportsDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployee(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmployeeDO> employeeList = new EmployeeService().retriveById(id);
			jsonresp = EmployeeUtil.getEmployeeList(employeeList).toString();
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeDetails(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpDetailDO> empDetailList = new EmpDetailService().retriveByEmpId(id);
			if (empDetailList != null && empDetailList.size() > 0) {
				jsonresp = EmpDetailUtil.getEmployeeDetailList(empDetailList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/address/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveAddress(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<AddressDO> addressList = new AddressService().retriveByEmpId(id);
			if (addressList != null && addressList.size() > 0) {
				jsonresp = AddressUtil.getCurrentAddressList(addressList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getfamilybackgrounddetails/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeFamilyDetails(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpFamilyBackgroundDO> empFamilyBackgroundList = new EmpFamilyBackgroundService().retriveByEmpId(id);
			if (empFamilyBackgroundList != null && empFamilyBackgroundList.size() > 0) {
				jsonresp = EmpFamilyBackgroundUtil.getEmpFamilyBackgroundList(empFamilyBackgroundList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getempeducationdetails/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeEducationDetails(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpEducationDO> empEducationList = new EmpEducationService().retriveByEmpId(id);
			if (empEducationList != null && empEducationList.size() > 0) {
				jsonresp = EmpEducationUtil.getEmpEducationList(empEducationList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeeskillset/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeSkillSetLevel(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpSkillSetDO> empSkillSetList = new EmpSkillSetService().retriveByEmpId(id);
			if (empSkillSetList != null && empSkillSetList.size() > 0) {
				jsonresp = EmpSkillSetUtil.getEmpSkillsetList(empSkillSetList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeereference/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeReferenceDetails(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpReferencesDO> empReferencesList = new EmpReferencesService().retriveByEmpId(id);
			if (empReferencesList != null && empReferencesList.size() > 0) {
				jsonresp = EmpReferencesUtil.getEmpReferencesList(empReferencesList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeelanguageknown/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeLanguageKnown(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpLanguageKnownDO> empLanguageKnownList = new EmpLanguageKnownService().retriveByEmpId(id);
			if (empLanguageKnownList != null && empLanguageKnownList.size() > 0) {
				jsonresp = EmpLanguageKnownUtil.getEmpLanguageKnownList(empLanguageKnownList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemploymenthistory/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmploymentHistory(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpEmploymentHistoryDO> empEmploymentHistoryList = new EmpEmploymentHistoryService().retriveByEmpId(id);
			if (empEmploymentHistoryList != null && empEmploymentHistoryList.size() > 0) {
				jsonresp = EmpEmploymentHistoryUtil.getEmpEmploymentHistoryList(empEmploymentHistoryList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeeachievements/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeAchievement(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpAchievementsDO> empAchievementsList = new EmpAchievementsService().retriveByEmpId(id);
			if (empAchievementsList != null && empAchievementsList.size() > 0) {
				jsonresp = EmpAchievementsUtil.getEmpAchievementsList(empAchievementsList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeeculturals/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeCulturals(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpCulturalsDO> empCulturalsList = new EmpCulturalsService().retriveByEmpId(id);
			if (empCulturalsList != null && empCulturalsList.size() > 0) {
				jsonresp = EmpCulturalsUtil.getEmpCulturalsList(empCulturalsList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getemployeesports/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeeSports(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpSportsDO> empSportsList = new EmpSportsService().retriveByEmpId(id);
			if (empSportsList != null && empSportsList.size() > 0) {
				jsonresp = EmpSportsUtil.getEmpSportsList(empSportsList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/empaboutdetails/{id}", method = RequestMethod.GET)
	public @ResponseBody String getEmpAboutDetail(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpAboutDO> empAboutList = new EmpAboutService().retriveByEmpId(id);
			if (empAboutList != null && empAboutList.size() > 0) {
				jsonresp = EmpAboutUtil.getEmpAboutList(empAboutList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/empbankdetail/{id}", method = RequestMethod.GET)
	public @ResponseBody String getBankDetail(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<EmpAccDetailDO> empAccDetailList = new EmpAccDetailService().retriveByEmpId(id);
			if (empAccDetailList != null && empAccDetailList.size() > 0) {
				jsonresp = EmpAccDetailUtil.getEmpAccDetailList(empAccDetailList).toString();
			}
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/addmoreemployeefamilydetails/{employeeid}/{addrelationship}/{addname}/{addage}/{addeducation}/{addoccupation}", method = RequestMethod.GET)
	public @ResponseBody String addMoreFamilyBackground(@PathVariable String employeeid, @PathVariable String addrelationship, 
			@PathVariable String addname, @PathVariable String addage, @PathVariable String addeducation, @PathVariable String addoccupation, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpFamilyBackgroundDO> empfamilybackground = new EmpFamilyBackgroundService().retriveByEmpId(Long.parseLong(employeeid));
				if(empfamilybackground.size() > 0 ){
					for (EmpFamilyBackgroundDO empFamilyBackgroundDO : empfamilybackground) {
						if(empFamilyBackgroundDO.getRelationship().equalsIgnoreCase("father") && empFamilyBackgroundDO.getRelationship().equalsIgnoreCase(addrelationship))
							return CommonWebUtil.buildErrorResponse("Father already added").toString();
						if(empFamilyBackgroundDO.getRelationship().equalsIgnoreCase("mother") && empFamilyBackgroundDO.getRelationship().equalsIgnoreCase(addrelationship))
							return CommonWebUtil.buildErrorResponse("Mother already added").toString();
					}
				}
				EmpFamilyBackgroundDO empFamilyBackgroundDO = new EmpFamilyBackgroundDO();
				empFamilyBackgroundDO.setEmpid(Long.parseLong(employeeid));		
				empFamilyBackgroundDO.setRelationship(addrelationship);
				empFamilyBackgroundDO.setName(addname);
				empFamilyBackgroundDO.setAge(Integer.parseInt(addage));
				if (!addeducation.equalsIgnoreCase("null"))
					empFamilyBackgroundDO.setEducation(addeducation);
				if (!addoccupation.equalsIgnoreCase("null"))
					empFamilyBackgroundDO.setOccupation(addoccupation);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empFamilyBackgroundDO.setUpdatedby(user.getUsername());
				empFamilyBackgroundDO.setUpdatedon(new Date());
				new EmpFamilyBackgroundService().persist(empFamilyBackgroundDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	@RequestMapping(value = "/addmoreemployeeeducation/{employeeid}/{institutionname}/{degree}/{specialization}/{rankscholarship}/{edufrom}/{eduto}", method = RequestMethod.GET)
	public @ResponseBody String addMoreEducationDetails(@PathVariable String employeeid, @PathVariable String institutionname, @PathVariable String degree, 
			@PathVariable String specialization, @PathVariable String rankscholarship, @PathVariable String edufrom, @PathVariable String eduto, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
                
				EmpEducationDO empEducationDO = new EmpEducationDO();
				empEducationDO.setEmpid(Long.parseLong(employeeid));		
				empEducationDO.setInstitutionname(institutionname);
				empEducationDO.setDegree(degree);
				empEducationDO.setSpecialization(specialization);
				empEducationDO.setRankscholarship(rankscholarship);
				empEducationDO.setEdufrom(CommonUtil.convertStringToDate(edufrom));
				empEducationDO.setEduto(CommonUtil.convertStringToDate(eduto));
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empEducationDO.setUpdatedby(user.getUsername());
				empEducationDO.setUpdatedon(new Date());
				new EmpEducationService().persist(empEducationDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoreemployeeskillset/{empid}/{name}/{level}", method = RequestMethod.GET)
	public @ResponseBody String addMoreSkillsetDetails(@PathVariable String empid, @PathVariable String name, @PathVariable char level, 
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSkillSetDO empSkillSetDO = new EmpSkillSetDO();
				empSkillSetDO.setEmpid(Long.parseLong(empid));		
				empSkillSetDO.setName(name);
				empSkillSetDO.setLevel(level);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empSkillSetDO.setUpdatedby(user.getUsername());
				empSkillSetDO.setUpdatedon(new Date());
				new EmpSkillSetService().persist(empSkillSetDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoreemployeereferences/{empid}/{name}/{address}/{phone}/{mobile}/{skill}/{designation}", method = RequestMethod.GET)
	public @ResponseBody String addMoreReferencesDetails(@PathVariable String empid, @PathVariable String name, @PathVariable String address, @PathVariable String phone, 
			@PathVariable String mobile, @PathVariable String skill, @PathVariable String designation, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
                
				EmpReferencesDO empReferencesDO = new EmpReferencesDO();
				empReferencesDO.setEmpid(Long.parseLong(empid));		
				empReferencesDO.setName(name);
				if (!address.equalsIgnoreCase("null")){
					address = address.replace("=", "#");
					address = address.replace("*", "/");
					empReferencesDO.setAddress(address);
				}
				if (!phone.equalsIgnoreCase("null"))
				empReferencesDO.setPhone(Long.parseLong(phone));
				empReferencesDO.setMobile(Long.parseLong(mobile));
				empReferencesDO.setSkill(skill);
				empReferencesDO.setDesignation(designation);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empReferencesDO.setUpdatedby(user.getUsername());
				empReferencesDO.setUpdatedon(new Date());
				new EmpReferencesService().persist(empReferencesDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmorelanguageknown/{empid}/{name}/{read}/{write}/{speak}", method = RequestMethod.GET)
	public @ResponseBody String addMoreLanguageKnownDetails(@PathVariable String empid, @PathVariable String name, @PathVariable char read, @PathVariable char write, 
		@PathVariable char speak, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpLanguageKnownDO empLanguageKnownDO = new EmpLanguageKnownDO();
				empLanguageKnownDO.setEmpid(Long.parseLong(empid));		
				empLanguageKnownDO.setLanguagename(name);
				empLanguageKnownDO.setLanguageread(read);
				empLanguageKnownDO.setLanguagewrite(write);
				empLanguageKnownDO.setLanguagespeak(speak);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empLanguageKnownDO.setUpdatedby(user.getUsername());
				empLanguageKnownDO.setUpdatedon(new Date());
				new EmpLanguageKnownService().persist(empLanguageKnownDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoreemploymenthistory/{empid}/{name}/{address}/{fromdate}/{todate}/{startingsalary}/{lastsalary}/{designation}/{responsibility}", method = RequestMethod.GET)
	public @ResponseBody String addMoreEmploymentHistoryDetails(@PathVariable String empid, @PathVariable String name, @PathVariable String address, @PathVariable String fromdate, 
		@PathVariable String todate, @PathVariable String startingsalary, @PathVariable String lastsalary, @PathVariable String designation, @PathVariable String responsibility,
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpEmploymentHistoryDO empEmploymentHistoryDO = new EmpEmploymentHistoryDO();
				empEmploymentHistoryDO.setEmpid(Long.parseLong(empid));		
				empEmploymentHistoryDO.setName(name);
				address = address.replace("=", "#");
				address = address.replace("*", "/");
				empEmploymentHistoryDO.setAddress(address);
				empEmploymentHistoryDO.setFromdate(CommonUtil.convertStringToDate(fromdate));
				empEmploymentHistoryDO.setTodate(CommonUtil.convertStringToDate(todate));
				empEmploymentHistoryDO.setStartingsalary(Long.parseLong(startingsalary));
				empEmploymentHistoryDO.setLastsalary(Long.parseLong(lastsalary));
				empEmploymentHistoryDO.setDesignation(designation);
				empEmploymentHistoryDO.setResponsibility(responsibility);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empEmploymentHistoryDO.setUpdatedby(user.getUsername());
				empEmploymentHistoryDO.setUpdatedon(new Date());
				new EmpEmploymentHistoryService().persist(empEmploymentHistoryDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoreachievements/{empid}/{companyname}/{achievement}", method = RequestMethod.GET)
	public @ResponseBody String addMoreAchievementsDetails(@PathVariable String empid, @PathVariable String companyname, @PathVariable String achievement, 
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpAchievementsDO empAchievementsDO = new EmpAchievementsDO();
				empAchievementsDO.setEmpid(Long.parseLong(empid));		
				empAchievementsDO.setCompanyname(companyname);
				empAchievementsDO.setAchievement(achievement);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empAchievementsDO.setUpdatedby(user.getUsername());
				empAchievementsDO.setUpdatedon(new Date());
				new EmpAchievementsService().persist(empAchievementsDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoreculturals/{empid}/{eventname}/{achievement}", method = RequestMethod.GET)
	public @ResponseBody String addMoreCulturalsDetails(@PathVariable String empid, @PathVariable String eventname, @PathVariable String achievement, 
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpCulturalsDO empCulturalsDO = new EmpCulturalsDO();
				empCulturalsDO.setEmpid(Long.parseLong(empid));		
				empCulturalsDO.setEventname(eventname);
				empCulturalsDO.setAchievement(achievement);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empCulturalsDO.setUpdatedby(user.getUsername());
				empCulturalsDO.setUpdatedon(new Date());
				new EmpCulturalsService().persist(empCulturalsDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addmoresports/{empid}/{eventname}/{achievement}", method = RequestMethod.GET)
	public @ResponseBody String addMoreSportsDetails(@PathVariable String empid, @PathVariable String eventname, @PathVariable String achievement, 
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSportsDO empSportsDO = new EmpSportsDO();
				empSportsDO.setEmpid(Long.parseLong(empid));		
				empSportsDO.setEventname(eventname);
				empSportsDO.setAchievement(achievement);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empSportsDO.setUpdatedby(user.getUsername());
				empSportsDO.setUpdatedon(new Date());
				new EmpSportsService().persist(empSportsDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/update/{id}/{fname}/{mname}/{lname}/{email}/{personalemail}/{mobile}/{phone}/{passport}/{pplaceofissued}/{pvalidupto}/{dlno}/{status}/{pan}/{aadharno}/{pfno}/{releasedate}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id ,@PathVariable String fname, @PathVariable String mname,
		@PathVariable String lname, @PathVariable String email,@PathVariable String personalemail,
		@PathVariable String mobile, @PathVariable String phone,
		@PathVariable String passport,@PathVariable String pplaceofissued, 
		@PathVariable String pvalidupto, @PathVariable String dlno, 
		@PathVariable char status, @PathVariable String pan,@PathVariable String aadharno,@PathVariable String pfno, 
		@PathVariable String releasedate, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				if(id > 0){
					List<EmployeeDO> employeeDOList = new EmployeeService().retriveById(id);
					if(employeeDOList != null && employeeDOList.size() > 0){
						EmployeeDO employee = employeeDOList.get(0);
						if(employee != null){
							employee.setFname(fname);
							employee.setLname(lname);
							employee.setEmail(email);
							employee.setPersonalemailid(personalemail);
							employee.setMobileno(Long.parseLong(mobile));
							employee.setStatus(status); 

							if (!mname.equalsIgnoreCase("null")){
								employee.setMname(mname);
							}else{
								employee.setMname(null);
							}
							if (!phone.equalsIgnoreCase("null")){
								employee.setPhone(Long.valueOf(phone));
							}else{
								employee.setPhone(null);
							}
							if (!passport.equalsIgnoreCase("null")){
								employee.setPassport(passport);
							}else{
								employee.setPassport(null);
							}
							if (!pplaceofissued.equalsIgnoreCase("null")){
								employee.setPplaceofissued(pplaceofissued);
							}else{
								employee.setPplaceofissued(null);
							}
							if (!pvalidupto.equalsIgnoreCase("null")){
								employee.setPvalidupto(CommonUtil.convertStringToDate(pvalidupto));
							}else{
								employee.setPvalidupto(null);
							}
							if (!dlno.equalsIgnoreCase("null")){
								employee.setDlno(dlno);
							}else{
								employee.setDlno(null);
							}
							if (!pan.equalsIgnoreCase("null")){
								employee.setPan(pan);
							}else{
								employee.setPan(null);
							}
							if (!aadharno.equalsIgnoreCase("null")){
								employee.setAadharno(aadharno);
							}else{
								employee.setAadharno(null);
							}
							if (!pfno.equalsIgnoreCase("null")){
								employee.setPfno(pfno);
							}else{
								employee.setPfno(null);
							}

							UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
							employee.setUpdatedby(user.getUsername());
							employee.setUpdatedon(new Date());

							//Update into Employee
							new EmployeeService().update(employee);
						}
					}
				}
				
				
				
				//if(status == 'i'){
					if(releasedate != null){
						// releasedate 					
						
						// Update Release Date in Employee Details
						List<EmpDetailDO> empDetailDOList = new EmpDetailService().retriveByEmpId(id);
						if(empDetailDOList != null && empDetailDOList.size() > 0){
							EmpDetailDO empDetailDO = empDetailDOList.get(0);
							empDetailDO.setRdate(CommonUtil.convertStringToDate(releasedate));
							new EmpDetailService().update(empDetailDO);
						}
						
						// Update End Date in CTC
						
						List<EmpCTCDO> empCTCDOList = new EmpCTCService().retriveByEmpId(id);
						if(empCTCDOList != null && empCTCDOList.size() > 0){
							for (EmpCTCDO empCTCDO : empCTCDOList) {
								//if(empCTCDO.getStatus() == 'a'){
									empCTCDO.setStatus(status);
									empCTCDO.setEnddate(CommonUtil.convertStringToDate(releasedate));
									new EmpCTCService().update(empCTCDO);
								//}
							}
						}		
					}
				//}
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/empdetailupdate/{id}/{dob}/{age}/{gender}/{postapplied}/{department}/{jdate}/{rdate}/{emergencyno}/{marital}/{doa}/{bgroup}/{possessvehicle}/{accidentillness}/{joininglocation}/{illnessdescr}",
		method = RequestMethod.GET)
	public @ResponseBody String  empdetailupdate(@PathVariable long id, @PathVariable String dob, @PathVariable String age, 
		@PathVariable char gender, @PathVariable String postapplied, 
		@PathVariable String department, @PathVariable String jdate,
		@PathVariable String rdate, @PathVariable String emergencyno,
		@PathVariable char marital, @PathVariable String doa,
		@PathVariable String bgroup, @PathVariable char possessvehicle, 
		@PathVariable char accidentillness, @PathVariable String joininglocation, @PathVariable String illnessdescr, Model model, HttpServletRequest request ){
		try {
			if (WebManager.authenticateSession(request)) {
				EmpDetailDO employeedetail = new EmpDetailDO();
					employeedetail.setId(id);
					employeedetail.setEmpid(id);
					employeedetail.setDob(CommonUtil.convertStringToDate(dob));
					employeedetail.setAge(Integer.parseInt(age));
					employeedetail.setGender(gender);
					employeedetail.setPostapplied(postapplied);
					employeedetail.setJdate(CommonUtil.convertStringToDate(jdate));
					employeedetail.setEmergencyno(emergencyno);
					employeedetail.setMarital(marital);
					employeedetail.setPossessvehicle(possessvehicle);
					employeedetail.setIllnessaccident(accidentillness);
					employeedetail.setJoininglocation(joininglocation);
					
					if (!department.equalsIgnoreCase("null"))
						employeedetail.setDept(department);
					if (!rdate.equalsIgnoreCase("null"))
						employeedetail.setRdate(CommonUtil.convertStringToDate(rdate));
					if (!doa.equalsIgnoreCase("null"))
						employeedetail.setDoa(CommonUtil.convertStringToDate(doa));
					if (!bgroup.equalsIgnoreCase("null"))
						employeedetail.setBloodgroup(bgroup);
					if (!illnessdescr.equalsIgnoreCase("null"))
						employeedetail.setDescription(illnessdescr);
					
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					employeedetail.setUpdatedby(user.getUsername());
					employeedetail.setUpdatedon(new Date());
					
					new EmpDetailService().update(employeedetail);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addressupdate/{id}/{cid}/{cstreet}/{ccity}/{cstate}/{ccountry}/{cpincode}"
		+ "/{pid}/{pstreet}/{pcity}/{pstate}/{pcountry}/{ppincode}", method = RequestMethod.GET)
	public @ResponseBody String addressUpdate(@PathVariable long id, @PathVariable String cid, @PathVariable String cstreet, @PathVariable String ccity, 
		@PathVariable String cstate, @PathVariable String ccountry, @PathVariable String cpincode, @PathVariable String pid, @PathVariable String pstreet, 
		@PathVariable String pcity, @PathVariable String pstate, @PathVariable String pcountry, @PathVariable String ppincode, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				AddressDO caddressdo = new AddressDO();
				caddressdo.setId(Long.parseLong(cid));
				caddressdo.setEmpid(id);				
				cstreet = cstreet.replace("=","#");
				cstreet = cstreet.replace('*', '/');
				caddressdo.setStreet(cstreet);
				caddressdo.setCity(ccity);
				caddressdo.setState(cstate);
				caddressdo.setCountry(ccountry);
				caddressdo.setPin(Long.parseLong(cpincode));
				caddressdo.setType('c');
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				caddressdo.setUpdatedby(user.getUsername());
				caddressdo.setUpdatedon(new Date());

				new AddressService().update(caddressdo);
				
				AddressDO paddressDO = new AddressDO();
				
				paddressDO.setId(Long.parseLong(pid));
				paddressDO.setEmpid(id);
				pstreet = pstreet.replace("=","#");
				pstreet = pstreet.replace('*', '/');
				paddressDO.setStreet(pstreet);
				paddressDO.setCity(pcity);
				paddressDO.setState(pstate);
				paddressDO.setCountry(pcountry);
				paddressDO.setPin(Long.parseLong(ppincode));
				paddressDO.setType('p');
				paddressDO.setUpdatedby(user.getUsername());
				paddressDO.setUpdatedon(new Date());
				
				new AddressService() .update(paddressDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/familybackgroundupdate/{id}/{empid}/{relationship}/{name}/{age}/{education}/{occupation}", method = RequestMethod.GET)
	public @ResponseBody String familyBackgroundUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String relationship, 
		@PathVariable String name, @PathVariable String age, @PathVariable String education, @PathVariable String occupation, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
                
				EmpFamilyBackgroundDO empFamilyBackgroundDO = new EmpFamilyBackgroundDO();
				empFamilyBackgroundDO.setId(Long.parseLong(id));
				empFamilyBackgroundDO.setEmpid(Long.parseLong(empid));		
				empFamilyBackgroundDO.setRelationship(relationship);
				empFamilyBackgroundDO.setName(name);
				empFamilyBackgroundDO.setAge(Integer.parseInt(age));
				if (!education.equalsIgnoreCase("null"))
					empFamilyBackgroundDO.setEducation(education);
				if (!occupation.equalsIgnoreCase("null"))
					empFamilyBackgroundDO.setOccupation(occupation);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empFamilyBackgroundDO.setUpdatedby(user.getUsername());
				empFamilyBackgroundDO.setUpdatedon(new Date());
				new EmpFamilyBackgroundService().update(empFamilyBackgroundDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/educationdetailsupdate/{id}/{empid}/{institutionname}/{degree}/{specialization}/{rankscholarship}/{edufrom}/{eduto}", method = RequestMethod.GET)
	public @ResponseBody String empEducationUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String institutionname, @PathVariable String degree, 
		@PathVariable String specialization, @PathVariable String rankscholarship, @PathVariable String edufrom, @PathVariable String eduto, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpEducationDO empEducationDO = new EmpEducationDO();
				empEducationDO.setId(Long.parseLong(id));
				empEducationDO.setEmpid(Long.parseLong(empid));		
				empEducationDO.setInstitutionname(institutionname);
				empEducationDO.setDegree(degree);
				empEducationDO.setSpecialization(specialization);
				empEducationDO.setRankscholarship(rankscholarship);
				empEducationDO.setEdufrom(CommonUtil.convertStringToDate(edufrom));
				empEducationDO.setEduto(CommonUtil.convertStringToDate(eduto));
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empEducationDO.setUpdatedby(user.getUsername());
				empEducationDO.setUpdatedon(new Date());
				new EmpEducationService().update(empEducationDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/skillsetupdate/{id}/{empid}/{skillsetname}/{skillsetlevel}", method = RequestMethod.GET)
	public @ResponseBody String empSkillsetUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String skillsetname, 
		@PathVariable char skillsetlevel, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSkillSetDO empSkillSetDO = new EmpSkillSetDO();
				empSkillSetDO.setId(Long.parseLong(id));
				empSkillSetDO.setEmpid(Long.parseLong(empid));		
				empSkillSetDO.setName(skillsetname);
				empSkillSetDO.setLevel(skillsetlevel);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empSkillSetDO.setUpdatedby(user.getUsername());
				empSkillSetDO.setUpdatedon(new Date());
				new EmpSkillSetService().update(empSkillSetDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	@RequestMapping(value = "/referencesupdate/{id}/{empid}/{name}/{address}/{phone}/{mobile}/{skill}/{designation}", method = RequestMethod.GET)
	public @ResponseBody String empReferencesUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String name, @PathVariable String address, 
		@PathVariable String phone, @PathVariable String mobile, @PathVariable String skill, @PathVariable String designation, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpReferencesDO empReferencesDO = new EmpReferencesDO();
				empReferencesDO.setId(Long.parseLong(id));
				empReferencesDO.setEmpid(Long.parseLong(empid));
				if (!name.equalsIgnoreCase("null"))
				empReferencesDO.setName(name);
				if (!address.equalsIgnoreCase("null")){
					address = address.replace("=", "#");
					address = address.replace("*", "/");
					empReferencesDO.setAddress(address);
				}else
					empReferencesDO.setAddress(null);
				if (!phone.equalsIgnoreCase("null"))
				empReferencesDO.setPhone(Long.parseLong(phone));
				if (!mobile.equalsIgnoreCase("null"))
				empReferencesDO.setMobile(Long.parseLong(mobile));
				if (!skill.equalsIgnoreCase("null"))
				empReferencesDO.setSkill(skill);
				if (!designation.equalsIgnoreCase("null"))
				empReferencesDO.setDesignation(designation);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empReferencesDO.setUpdatedby(user.getUsername());
				empReferencesDO.setUpdatedon(new Date());
				new EmpReferencesService().update(empReferencesDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/languageknownupdate/{id}/{empid}/{name}/{read}/{write}/{speak}", method = RequestMethod.GET)
	public @ResponseBody String empLanguageKnownUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String name, @PathVariable char read, 
		@PathVariable char write, @PathVariable char speak, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpLanguageKnownDO empLanguageKnownDO = new EmpLanguageKnownDO();
				empLanguageKnownDO.setId(Long.parseLong(id));
				empLanguageKnownDO.setEmpid(Long.parseLong(empid));
				empLanguageKnownDO.setLanguagename(name);
				empLanguageKnownDO.setLanguageread(read);
				empLanguageKnownDO.setLanguagewrite(write);
				empLanguageKnownDO.setLanguagespeak(speak);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empLanguageKnownDO.setUpdatedby(user.getUsername());
				empLanguageKnownDO.setUpdatedon(new Date());
				new EmpLanguageKnownService().update(empLanguageKnownDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/employmenthistoryupdate/{id}/{empid}/{name}/{address}/{fromdate}/{todate}/{startingsalary}/{lastsalary}/{designation}/{responsibility}", method = RequestMethod.GET)
	public @ResponseBody String empEmploymentHistoryUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String name, @PathVariable String address, @PathVariable String fromdate,@PathVariable String todate, @PathVariable String startingsalary, @PathVariable String lastsalary, @PathVariable String designation, @PathVariable String responsibility,Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpEmploymentHistoryDO empEmploymentHistoryDO = new EmpEmploymentHistoryDO();
				empEmploymentHistoryDO.setId(Long.parseLong(id));
				empEmploymentHistoryDO.setEmpid(Long.parseLong(empid));
				if (!name.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setName(name);
				if (!address.equalsIgnoreCase("null"))
					address = address.replace("=", "#");
					address = address.replace("*", "/");
					empEmploymentHistoryDO.setAddress(address);
				if (!fromdate.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setFromdate(CommonUtil.convertStringToDate(fromdate));
				if (!todate.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setTodate(CommonUtil.convertStringToDate(todate));;
				if (!startingsalary.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setStartingsalary(Long.parseLong(startingsalary));
				if (!lastsalary.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setLastsalary(Long.parseLong(lastsalary));
				if (!responsibility.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setResponsibility(responsibility);
				if (!designation.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setDesignation(designation);
				if (!name.equalsIgnoreCase("null"))
					empEmploymentHistoryDO.setName(name);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empEmploymentHistoryDO.setUpdatedby(user.getUsername());
				empEmploymentHistoryDO.setUpdatedon(new Date());
				new EmpEmploymentHistoryService().update(empEmploymentHistoryDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/achievementsupdate/{id}/{empid}/{companyname}/{achievements}", method = RequestMethod.GET)
	public @ResponseBody String empEmployeeAchievementsUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String companyname, @PathVariable String achievements,
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
                
				EmpAchievementsDO empAchievementsDO = new EmpAchievementsDO();
				empAchievementsDO.setId(Long.parseLong(id));
				empAchievementsDO.setEmpid(Long.parseLong(empid));
				if (!companyname.equalsIgnoreCase("null"))
					empAchievementsDO.setCompanyname(companyname);
				if (!achievements.equalsIgnoreCase("null"))
					empAchievementsDO.setAchievement(achievements);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empAchievementsDO.setUpdatedby(user.getUsername());
				empAchievementsDO.setUpdatedon(new Date());
				new EmpAchievementsService().update(empAchievementsDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/culturalsupdate/{id}/{empid}/{name}/{achievements}", method = RequestMethod.GET)
	public @ResponseBody String empEmployeeCulturalsUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String name, @PathVariable String achievements,
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpCulturalsDO empCulturalsDO = new EmpCulturalsDO();
				empCulturalsDO.setId(Long.parseLong(id));
				empCulturalsDO.setEmpid(Long.parseLong(empid));
				if (!name.equalsIgnoreCase("null"))
					empCulturalsDO.setEventname(name);
				if (!achievements.equalsIgnoreCase("null"))
					empCulturalsDO.setAchievement(achievements);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empCulturalsDO.setUpdatedby(user.getUsername());
				empCulturalsDO.setUpdatedon(new Date());
				new EmpCulturalsService().update(empCulturalsDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/sportsupdate/{id}/{empid}/{name}/{achievements}", method = RequestMethod.GET)
	public @ResponseBody String empEmployeeSportsUpdate(@PathVariable String id, @PathVariable String empid, @PathVariable String name, @PathVariable String achievements,
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpSportsDO empSportsDO = new EmpSportsDO();
				empSportsDO.setId(Long.parseLong(id));
				empSportsDO.setEmpid(Long.parseLong(empid));
				if (!name.equalsIgnoreCase("null"))
					empSportsDO.setEventname(name);
				if (!achievements.equalsIgnoreCase("null"))
					empSportsDO.setAchievement(achievements);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				empSportsDO.setUpdatedby(user.getUsername());
				empSportsDO.setUpdatedon(new Date());
				new EmpSportsService().update(empSportsDO);
			}	
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/empaboutupdate/{id}/{empid}/{strength}/{weakness}/{totalexp}/{releventexp}/{presentsalary}/{expectedsalary}",
	method = RequestMethod.GET)
	public @ResponseBody String  empAboutDetailsUpdate(@PathVariable long id, @PathVariable long empid, @PathVariable String strength, @PathVariable String weakness, 
		@PathVariable String totalexp, @PathVariable String releventexp, @PathVariable String presentsalary, @PathVariable String expectedsalary, 
		Model model, HttpServletRequest request ){
		
		try {
			if (WebManager.authenticateSession(request)) {
				EmpAboutDO empAboutDO = new EmpAboutDO();
					empAboutDO.setId(id);
					empAboutDO.setEmpid(empid);
					if (!strength.equalsIgnoreCase("null"))
					empAboutDO.setStrength(strength);
					if (!weakness.equalsIgnoreCase("null"))
					empAboutDO.setWeakness(weakness);
					empAboutDO.setTotalexp(totalexp);
					empAboutDO.setRelexp(releventexp);
					empAboutDO.setPresentsalary(Long.parseLong(presentsalary));
					empAboutDO.setExpectedsalary(Long.parseLong(expectedsalary));
						
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empAboutDO.setUpdatedby(user.getUsername());
					empAboutDO.setUpdatedon(new Date());
				new EmpAboutService().update(empAboutDO);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/empbankdetailupdate/{id}/{bank_name}/{bank_accno}/{bank_branch}/{bank_address}/{bank_city}/{bank_state}/{bank_pincode}/{bank_ifsc}",
		method = RequestMethod.GET)
	public @ResponseBody String  empBankDetailUpdate(@PathVariable long id, @PathVariable String bank_name, @PathVariable String bank_accno, 
		@PathVariable String bank_branch, @PathVariable String bank_address, 
		@PathVariable String bank_city, @PathVariable String bank_state,
		@PathVariable String bank_pincode, @PathVariable String bank_ifsc,
		Model model, HttpServletRequest request ){	
		try {
			if (WebManager.authenticateSession(request)) {
				EmpAccDetailDO empAccDetailDO = new EmpAccDetailDO();
					empAccDetailDO.setId(id);
					empAccDetailDO.setEmpid(id);
					if (!bank_name.equalsIgnoreCase("null"))
					empAccDetailDO.setBankname(bank_name);
					if (!bank_accno.equalsIgnoreCase("null"))
					empAccDetailDO.setAccountno(Long.parseLong(bank_accno));
					if (!bank_branch.equalsIgnoreCase("null"))
					empAccDetailDO.setBranch(bank_branch);
					if (!bank_address.equalsIgnoreCase("null"))
					bank_address = bank_address.replace("=", "#");
					bank_address = bank_address.replace("*", "/");
					empAccDetailDO.setAddress(bank_address);
					if (!bank_city.equalsIgnoreCase("null"))
					empAccDetailDO.setCity(bank_city);
					if (!bank_state.equalsIgnoreCase("null"))
					empAccDetailDO.setState(bank_state);
					if (!bank_pincode.equalsIgnoreCase("null"))
					empAccDetailDO.setPincode(Long.parseLong(bank_pincode));
					if (!bank_ifsc.equalsIgnoreCase("null"))
					empAccDetailDO.setIfsc(bank_ifsc);
						
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empAccDetailDO.setUpdatedby(user.getUsername());
					empAccDetailDO.setUpdatedon(new Date());
				new EmpAccDetailService().update(empAccDetailDO);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
			if (employeeList != null) {
				Collections.reverse(employeeList);
				respJSON = EmployeeUtil.getEmployeeDataTableList(employeeList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/getbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<EmployeeDO> employeeList = new EmployeeService().retriveById(id);

			if (employeeList != null) {
				respJSON = EmployeeUtil.getEmployeeDataTableList(employeeList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
}