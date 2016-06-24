package com.sapta.hr.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
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

import com.sapta.hr.domainobject.CtcList;
import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.EmpCTCService;
import com.sapta.hr.service.EmpDetailService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpCtcUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/empctc")
public class EmpCTCController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(EmpCTCController.class.getName());

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
				List<CtcList> employectclist = new ArrayList<CtcList>();
				//List<EmpDetailDO> empdetails= null;
				for (EmployeeDO employeeDO : employeeList) {
					List<EmpCTCDO> empctcList = null;
					if(employeeDO.getStatus() == 'a'){
						empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
					}else{
						empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
						if(empctcList.size() == 0){
							empctcList = new EmpCTCService().retriveByEmpId(employeeDO.getId());
						}
					}
					if(empctcList.size()  > 0 ){
							CtcList ctclist = new CtcList();
							//empdetails= new EmpDetailService().retriveByEmpId(empctcList.get(0).getEmpid());
							ctclist.setEmpid(empctcList.get(0).getEmpid());
							ctclist.setId(empctcList.get(0).getEmpid());
							if(employeeDO.getMname() != null && employeeDO.getMname().length() > 0){
								ctclist.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getMname()+"&nbsp"+employeeDO.getLname());
							}else{
								ctclist.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getLname());
							}
							/*ctclist.setEmpname(employeeDO.getFname());*/
							ctclist.setEmpctc(empctcList.get(0).getEmpctc());
							ctclist.setStatus(empctcList.get(0).getStatus());
							ctclist.setStartdate(empctcList.get(0).getStartdate());
							ctclist.setEnddate(empctcList.get(0).getEnddate());
							ctclist.setBandchange(empctcList.get(0).getBandchange());
							
							ctclist.setDesignation(empctcList.get(0).getDesignation());
							ctclist.setEnddate(empctcList.get(0).getEnddate());
							if(employeeDO.getStatus() == 'i'){
								ctclist.setEmpstatus("Closed");
							}else{
								ctclist.setEmpstatus("Active");
							}
						
							employectclist.add(ctclist);
					}
				}
				
				if (employectclist != null && employectclist.size() > 0) {
					Collections.reverse(employectclist);
					model.addAttribute(CommonConstants.EMP_CTC_LIST, employectclist);
					model.addAttribute(CommonConstants.EMP_CTC_LIST_SIZE, employectclist.size());
				} else {
					model.addAttribute(CommonConstants.EMP_CTC_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EMP_CTC;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/update/{empid}/{empctc}/{startdate}/{enddate}/{bandchange}/{designation}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long empid,@PathVariable long empctc, @PathVariable String startdate, @PathVariable String enddate, 
									   @PathVariable String bandchange, @PathVariable String designation, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(empid);
				List<EmployeeDO> empdetail= new EmployeeService().retriveById(empid);
				boolean status = false;
				Calendar c = Calendar.getInstance();
			    Date StartDate = CommonUtil.convertStringToDate(startdate);
			    c.setTime(StartDate);
			    c.add(Calendar.DATE, -1); 
			    Date previousedate = c.getTime();
			   
				if(empctcList != null && empctcList.size() > 0){
					for(EmpCTCDO empctcDO : empctcList){
						empctcDO.setStatus('i');
						if(empctcList.get(0).getEnddate() == null){
							empctcDO.setEnddate(previousedate);
						}
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empctcDO.setUpdatedby(user.getUsername());
						empctcDO.setUpdatedon(new Date());
						
						status = new EmpCTCService().update(empctcDO);
						respJSON = CommonWebUtil.buildSuccessResponse();
					}
					if(status && empdetail.get(0).getStatus() == 'a'){
						EmpCTCDO ctcDO = new EmpCTCDO();
						ctcDO.setEmpctc(empctc);
						ctcDO.setEmpid(empid);
						ctcDO.setStatus('a');
						ctcDO.setStartdate(CommonUtil.convertStringToDate(startdate));
						if(!enddate.equalsIgnoreCase("null")){
							Date ctcEndDate = CommonUtil.convertStringToDate(enddate);
						    c.setTime(ctcEndDate);
						    //c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
						    Date ctcEndngDate= c.getTime();
							ctcDO.setEnddate(ctcEndngDate);
						}
						if(bandchange.equalsIgnoreCase("y")){
							ctcDO.setBandchange(bandchange);
							ctcDO.setDesignation(designation);
						}else if(empctcList.size() > 0){
							Collections.reverse(empctcList);
							ctcDO.setDesignation(empctcList.get(0).getDesignation());
						}
						UserDO userDO = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						ctcDO.setUpdatedby(userDO.getUsername());
						ctcDO.setUpdatedon(new Date());
						new EmpCTCService().persist(ctcDO);
						
						//Update Employee Designation
						List<EmpDetailDO> empdetails= new EmpDetailService().retriveByEmpId(empid);
						EmpDetailDO employeedetail = new EmpDetailDO();
						employeedetail.setId(empdetails.get(0).getId());
						employeedetail.setEmpid(empdetails.get(0).getEmpid());
						employeedetail.setDob(empdetails.get(0).getDob());
						employeedetail.setAge(empdetails.get(0).getAge());
						employeedetail.setGender(empdetails.get(0).getGender());
						employeedetail.setDept(empdetails.get(0).getDept());
						employeedetail.setJdate(empdetails.get(0).getJdate());
						employeedetail.setEmergencyno(empdetails.get(0).getEmergencyno());
						employeedetail.setMarital(empdetails.get(0).getMarital());
						employeedetail.setPossessvehicle(empdetails.get(0).getPossessvehicle());
						employeedetail.setIllnessaccident(empdetails.get(0).getIllnessaccident());
						employeedetail.setJoininglocation(empdetails.get(0).getJoininglocation());
						if(designation!=null){
							employeedetail.setPostapplied(designation);
						}else {
							employeedetail.setPostapplied(empdetails.get(0).getPostapplied());
						}
						employeedetail.setRdate(empdetails.get(0).getRdate());
						employeedetail.setDoa(empdetails.get(0).getDoa());
						employeedetail.setBloodgroup(empdetails.get(0).getBloodgroup());
						employeedetail.setDescription(empdetails.get(0).getDescription());
						
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						employeedetail.setUpdatedby(user.getUsername());
						employeedetail.setUpdatedon(new Date());
						
						new EmpDetailService().update(employeedetail);
						
						respJSON = CommonWebUtil.buildSuccessResponse();
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
				}
			}
		}catch (Exception e) { e.printStackTrace();}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpCTCDO> empctcList = new EmpCTCService().retriveById(id);
				if(empctcList != null && empctcList.size() > 0){
					EmpCTCDO empctcDO = empctcList.get(0);
					boolean status = new EmpCTCService().delete(empctcDO);
					if(status){
						respJSON = CommonWebUtil.buildSuccessResponse();
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
				}
			}
		}catch (Exception e) { e.printStackTrace();}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpCTCDO> empctcList = new EmpCTCService().retrive();
				if (empctcList != null && empctcList.size() > 0) {
					respJSON = CommonWebUtil.buildSuccessResponse();
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.CTC_NOT_AVAILABLE);
				}	
			}
		} catch (Exception e) { 
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.CTC_NOT_AVAILABLE);
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/add/{empid}/{empctc}/{startdate}/{enddate}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable long empctc, @PathVariable String startdate, @PathVariable String enddate, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(empid);
				List<EmpDetailDO> empdetail= new EmpDetailService().retriveByEmpId(empid);
				List<EmployeeDO> employee= new EmployeeService().retriveById(empid);
				if(employee.get(0).getStatus() == 'a'){
					if (empctcList != null && empctcList.size() > 0) {
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.CTC_AVAILABLE);
					}else{
						if (empdetail != null && empdetail.size() > 0) {
							Date ctcStartDate = CommonUtil.convertStringToDate(startdate);		   
						    Calendar c = Calendar.getInstance();
						    c.setTime(empdetail.get(0).getJdate());
				            c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
				            Date startMonthDate = c.getTime();
						    if(ctcStartDate.before(startMonthDate)){
						    	respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_JOINING_DATE_ERROR);
						    }else{
						    	EmpCTCDO empctcDO = new EmpCTCDO();
								empctcDO.setEmpctc(empctc);
								empctcDO.setEmpid(empid);
								empctcDO.setStatus('a');
								empctcDO.setStartdate(ctcStartDate);
								empctcDO.setDesignation(empdetail.get(0).getPostapplied());
								if(!enddate.equalsIgnoreCase("null")){
							    	Date ctcEndDate = CommonUtil.convertStringToDate(enddate);
								    c.setTime(ctcEndDate);
								    //c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
								    Date ctcEndngDate= c.getTime();
								    if(ctcEndngDate != null){
										empctcDO.setEnddate(ctcEndngDate);
									}
							    }
								UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
								empctcDO.setUpdatedby(user.getUsername());
								empctcDO.setUpdatedon(new Date());
								 
								String result = null;
								result = new EmpCTCService().persist(empctcDO);
								if(result.equalsIgnoreCase("true") && result != null){
									respJSON = CommonWebUtil.buildSuccessResponse();
								}else{
									respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
								}
						    }
						}else{
							respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						}
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
				}
				
			}
		}catch (Exception e) { e.printStackTrace();}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbyempid/{empid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long empid, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			List<EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpId(empid);
			if (empctcList != null && empctcList.size() > 0) {
				Collections.reverse(empctcList);
				respJSON = EmpCtcUtil.getCustomerDataTableList(empctcList, request);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbygrid", method = RequestMethod.GET)
	public @ResponseBody String getForGrid(Model model) {
		JSONObject respJSON = null;
		try {
			List<EmpCTCDO> empctcList = new EmpCTCService().retrive();
			if (empctcList != null && empctcList.size() > 0) {
				respJSON = EmpCtcUtil.getEmpCTCListGrid(empctcList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
}
