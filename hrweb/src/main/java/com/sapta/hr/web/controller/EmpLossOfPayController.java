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

import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.domainobject.EmpLoseOfPayDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.EmpCTCService;
import com.sapta.hr.service.EmpLoseOfPayService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpCtcUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/emplop")
public class EmpLossOfPayController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(EmpLossOfPayController.class.getName());

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpLoseOfPayDO> emplopList = new EmpLoseOfPayService().retrive();
				if (emplopList != null && emplopList.size() > 0) {
					Collections.reverse(emplopList);
					model.addAttribute(CommonConstants.EMP_LOP_LIST, emplopList);
					model.addAttribute(CommonConstants.EMP_LOP_LIST_SIZE, emplopList.size());
				} else {
					model.addAttribute(CommonConstants.EMP_LOP_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EMP_LOSS_OF_PAY;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{empid}/{startdate}/{enddate}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable String startdate, @PathVariable String enddate, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				String lopdate ="01-"+startdate.substring(3);
				List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(lopdate));
				//List<EmpLoseOfPayDO> emplopList = new EmpLoseOfPayService().retriveByEmpId(empid);
				if(employeeList.size() != 0){
					if(employeeList.get(0).getStatus() == 'i'){
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						return respJSON.toString();
					}
				}
				if(payrolldata.size() == 0 ){
					/*if(emplopList.size() > 0){
						for (EmpLoseOfPayDO empLoseOfPayDO : emplopList) {
							if((CommonUtil.convertStringToDate(startdate)).before(empLoseOfPayDO.getEnddate()) || (CommonUtil.convertStringToDate(startdate)).equals(empLoseOfPayDO.getEnddate())){
								respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_LOP_NOT_AVILABLE);
								return respJSON.toString();
							}
						}
					}*/
					if(employeeList != null && employeeList.size() != 0 ){
						EmpLoseOfPayDO empLoseOfPayDO = new EmpLoseOfPayDO();
						empLoseOfPayDO.setEmpid(empid);
						empLoseOfPayDO.setStartdate(CommonUtil.convertStringToDate(startdate));
						if(!enddate.equalsIgnoreCase("null")){
							empLoseOfPayDO.setEnddate(CommonUtil.convertStringToDate(enddate));
						}else{
							empLoseOfPayDO.setEnddate(CommonUtil.convertStringToDate(startdate));
						}
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empLoseOfPayDO.setUpdatedby(user.getUsername());
						empLoseOfPayDO.setUpdatedon(new Date());
						String result = null;
						result = new EmpLoseOfPayService().persist(empLoseOfPayDO);
						if(result.equalsIgnoreCase("true") && result != null){
							respJSON = CommonWebUtil.buildSuccessResponse();
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_LEAV_NOT_AVAILABLE);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
	
	@RequestMapping(value = "/update/{emplopid}/{empid}/{startdate}/{enddate}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long emplopid, @PathVariable long empid, @PathVariable String startdate, @PathVariable String enddate, 
		   Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		int count = 0;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				List<EmpLoseOfPayDO> emplopList = new EmpLoseOfPayService().retriveByEmpId(empid);
				if(employeeList != null && employeeList.size() != 0){
					if(emplopList.size() > 0){
						for (EmpLoseOfPayDO empLoseOfPayDO : emplopList) {
							if(employeeList.get(0).getStatus() == 'i'){
								respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
								return respJSON.toString();
							}
							if((CommonUtil.convertStringToDate(enddate)).after(empLoseOfPayDO.getStartdate()) || (CommonUtil.convertStringToDate(enddate)).equals(empLoseOfPayDO.getStartdate())){
								count++;
								if(count == 2){
									respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_LOP_NOT_AVILABLE);
									return respJSON.toString();
								}
								
							}
						}
					}
					EmpLoseOfPayDO empLoseOfPayDO = new EmpLoseOfPayDO();
					empLoseOfPayDO.setId(emplopid);
					empLoseOfPayDO.setEmpid(empid);
					empLoseOfPayDO.setStartdate(CommonUtil.convertStringToDate(startdate));
					if(!enddate.equalsIgnoreCase("null"))
						empLoseOfPayDO.setEnddate(CommonUtil.convertStringToDate(enddate));
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					empLoseOfPayDO.setUpdatedby(user.getUsername());
					empLoseOfPayDO.setUpdatedon(new Date());
					Boolean result = new EmpLoseOfPayService().update(empLoseOfPayDO);
					if(result){
						respJSON = CommonWebUtil.buildSuccessResponse();
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
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
				List<EmpLoseOfPayDO> emplopList = new EmpLoseOfPayService().retriveById(id);
				if(emplopList != null && emplopList.size() > 0){
					EmpLoseOfPayDO empLoseOfPayDO = emplopList.get(0);
					boolean status = new EmpLoseOfPayService().delete(empLoseOfPayDO);
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
	
	@RequestMapping(value = "/getbyempid/{empid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long empid, Model model) {
		JSONObject respJSON = null;
		try {
			List<EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpId(empid);
			if (empctcList != null && empctcList.size() > 0) {
				respJSON = EmpCtcUtil.getEmpCTCListGrid(empctcList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbyempidanddate/{empid}/{selecteddatevalue}", method = RequestMethod.GET)
	public @ResponseBody String retriveByBetweenDates(@PathVariable long empid, @PathVariable String selecteddatevalue, Model model) {
		String jsonresp = null;
		try {
			Calendar c = Calendar.getInstance();
			String selectemonth = selecteddatevalue;
			Date startdate = CommonUtil.convertStringToDate(selectemonth);
			c.setTime(startdate);
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			Date enddate = c.getTime();
			long loseofpay = 0;
			List<EmpLoseOfPayDO> payrolldata = new EmpLoseOfPayService().retriveByEmpIdAndStartdateEnddate(empid, startdate, enddate);
			if(payrolldata.size() > 0){
				for (EmpLoseOfPayDO empLoseOfPayDO : payrolldata) {
					if((empLoseOfPayDO.getStartdate()).equals(empLoseOfPayDO.getEnddate())){
						loseofpay = loseofpay + 1;
					}else{
						long diff =  empLoseOfPayDO.getEnddate().getTime() - empLoseOfPayDO.getStartdate().getTime();
						long diffDays = diff / (24 * 60 * 60 * 1000);
						loseofpay = loseofpay + diffDays + 1;
					}
				}
				
				
			}
			
			jsonresp = String.valueOf(loseofpay);
		} catch (Exception e) { }

		return jsonresp != null ? jsonresp.toString() : "";
	}
	
}
