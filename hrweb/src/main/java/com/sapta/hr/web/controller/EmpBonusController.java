package com.sapta.hr.web.controller;

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

import com.sapta.hr.domainobject.EmpBonusDO;
import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.EmpBonusService;
import com.sapta.hr.service.EmpTDSService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpBounsUtill;
import com.sapta.hr.web.util.EmpTdsUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/empbonus")
public class EmpBonusController {
	String validation = null;
	
	static Logger logger = Logger.getLogger(EmpLossOfPayController.class.getName());

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpBonusDO> empBonusList = new EmpBonusService().retrive();
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
				if (employeeList != null && employeeList.size() > 0) {
					model.addAttribute(CommonConstants.EMPLOYEE_LIST, 	employeeList);
				}
				if (empBonusList != null && empBonusList.size() > 0) {
					Collections.reverse(empBonusList);
					model.addAttribute(CommonConstants.EMP_BOUNS_LIST, empBonusList);
					model.addAttribute(CommonConstants.EMP_BOUNS_LIST_SIZE, empBonusList.size());
				} else {
					model.addAttribute(CommonConstants.EMP_BOUNS_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EMP_BOUNS;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{empid}/{bonus}/{bonusMonth}/{comment}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable long bonus, @PathVariable String bonusMonth, @PathVariable String comment, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(bonusMonth));
				if(employeeList.size() != 0){
					if(employeeList.get(0).getStatus() == 'i'){
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						return respJSON.toString();
					}
				}
				if(payrolldata.size() == 0 ){
					if(employeeList != null && employeeList.size() != 0 ){
						EmpBonusDO empBonusDO = new EmpBonusDO();
						empBonusDO.setEmpid(empid);
						empBonusDO.setBonusamount(bonus);
						empBonusDO.setBonusmonth(CommonUtil.convertStringToDate(bonusMonth));
						if(!comment.equalsIgnoreCase("null"))empBonusDO.setComments(comment);
						
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empBonusDO.setUpdatedby(user.getUsername());
						empBonusDO.setUpdatedon(new Date());
						
						String result = null;
						result = new EmpBonusService().persist(empBonusDO);
						if(result.equalsIgnoreCase("true") && result != null){
							respJSON = CommonWebUtil.buildSuccessResponse();
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_BOUNS_NOT_AVAILABLE);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{empbonusid}/{empid}/{editbonusamount}/{editbonusmonth}/{editcomment}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long empbonusid, @PathVariable long empid, @PathVariable long editbonusamount, @PathVariable String editbonusmonth, @PathVariable String editcomment, 
		   Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(editbonusmonth));
				if(employeeList.size() != 0){
					if(employeeList.get(0).getStatus() == 'i'){
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						return respJSON.toString();
					}
				}
				if(payrolldata.size() == 0 ){
					if(employeeList != null && employeeList.size() != 0 ){
						EmpBonusDO empBonusDO = new EmpBonusDO();
						empBonusDO.setId(empbonusid);
						empBonusDO.setEmpid(empid);
						empBonusDO.setBonusmonth(CommonUtil.convertStringToDate(editbonusmonth));
						empBonusDO.setBonusamount(editbonusamount);
						if(!editcomment.equalsIgnoreCase("null"))empBonusDO.setComments(editcomment);
						
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empBonusDO.setUpdatedby(user.getUsername());
						empBonusDO.setUpdatedon(new Date());
						Boolean result = new EmpBonusService().update(empBonusDO);
						if(result){
							respJSON = CommonWebUtil.buildSuccessResponse();
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_BOUNS_NOT_AVAILABLE);
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpBonusDO> empBonusList = new EmpBonusService().retriveById(id);
				if(empBonusList != null && empBonusList.size() > 0){
					EmpBonusDO empBonusDO = empBonusList.get(0);
					boolean status = new EmpBonusService().delete(empBonusDO);
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
	
	@RequestMapping(value = "/getempbonus/{empid}/{bonusMonth}", method = RequestMethod.GET)
	public @ResponseBody String getEmpBonus(@PathVariable long empid, @PathVariable String bonusMonth, Model model) {
		String jsonresp = null;
		try {
			Calendar c = Calendar.getInstance();
			String selectemonth = bonusMonth;
			Date startdate = CommonUtil.convertStringToDate(selectemonth);
			c.setTime(startdate);
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			long bonusamount = 0;
			List<EmpBonusDO> empBonusList = new EmpBonusService().retriveByEmpIdMonth(empid, startdate);
			if(empBonusList.size() > 0){
				for (EmpBonusDO empBonusDO : empBonusList) {
					bonusamount = bonusamount + empBonusDO.getBonusamount();
				}
			}
			jsonresp = String.valueOf(bonusamount);
		} catch (Exception e) { }

		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/viewfybonus/{month}", method = RequestMethod.GET)
	public String viewFyBonus(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_EMP_BOUNS;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getbyempbonusmonth/{bonusmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String bonusmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = bonusmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<EmpBonusDO> bonusList = new EmpBonusService().FindAllEvents(StartDate ,edate );
			if (bonusList != null) {
				Collections.reverse(bonusList);
				respJSON = EmpBounsUtill.gettdsDataTableList(bonusList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
	
}