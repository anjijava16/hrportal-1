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

import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.EmpTDSService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpTdsUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/emptds")
public class EmpTDSController {
	String validation = null;
	
	static Logger logger = Logger.getLogger(EmpLossOfPayController.class.getName());

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpTDSDO> empTDSList = new EmpTDSService().retrive();
				if (empTDSList != null && empTDSList.size() > 0) {
					Collections.reverse(empTDSList);
					model.addAttribute(CommonConstants.EMP_TDS_LIST, empTDSList);
					model.addAttribute(CommonConstants.EMP_TDS_LIST_SIZE, empTDSList.size());
				} else {
					model.addAttribute(CommonConstants.EMP_TDS_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EMP_TDS;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{empid}/{tds}/{tdsMonth}/{comment}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable long tds, @PathVariable String tdsMonth, @PathVariable String comment, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(tdsMonth));
				if(employeeList.size() != 0){
					if(employeeList.get(0).getStatus() == 'i'){
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						return respJSON.toString();
					}
				}
				if(payrolldata.size() == 0 ){
					if(employeeList != null && employeeList.size() != 0 ){
						EmpTDSDO empTDSDO = new EmpTDSDO();
						empTDSDO.setEmpid(empid);
						empTDSDO.setTds(tds);
						empTDSDO.setTdsmonth(CommonUtil.convertStringToDate(tdsMonth));
						if(!comment.equalsIgnoreCase("null"))empTDSDO.setComments(comment);
						
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empTDSDO.setUpdatedby(user.getUsername());
						empTDSDO.setUpdatedon(new Date());
						
						String result = null;
						result = new EmpTDSService().persist(empTDSDO);
						if(result.equalsIgnoreCase("true") && result != null){
							respJSON = CommonWebUtil.buildSuccessResponse();
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_TDS_NOT_AVAILABLE);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{emptdsid}/{empid}/{edittdsamount}/{edittdsmonth}/{editcomment}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long emptdsid, @PathVariable long empid, @PathVariable long edittdsamount, @PathVariable String edittdsmonth, @PathVariable String editcomment, 
		   Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(edittdsmonth));
				if(employeeList.size() != 0){
					if(employeeList.get(0).getStatus() == 'i'){
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						return respJSON.toString();
					}
				}
				if(payrolldata.size() == 0 ){
					if(employeeList != null && employeeList.size() != 0 ){
						EmpTDSDO empTDSDO = new EmpTDSDO();
						empTDSDO.setId(emptdsid);
						empTDSDO.setEmpid(empid);
						empTDSDO.setTdsmonth(CommonUtil.convertStringToDate(edittdsmonth));
						empTDSDO.setTds(edittdsamount);
						if(!editcomment.equalsIgnoreCase("null"))empTDSDO.setComments(editcomment);
						
						UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
						empTDSDO.setUpdatedby(user.getUsername());
						empTDSDO.setUpdatedon(new Date());
						Boolean result = new EmpTDSService().update(empTDSDO);
						if(result){
							respJSON = CommonWebUtil.buildSuccessResponse();
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_TDS_NOT_AVAILABLE);
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
				List<EmpTDSDO> empTDSList = new EmpTDSService().retriveById(id);
				if(empTDSList != null && empTDSList.size() > 0){
					EmpTDSDO empTDSDO = empTDSList.get(0);
					boolean status = new EmpTDSService().delete(empTDSDO);
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
	
	@RequestMapping(value = "/getemptds/{empid}/{tdsMonth}", method = RequestMethod.GET)
	public @ResponseBody String getEmpTDS(@PathVariable long empid, @PathVariable String tdsMonth, Model model) {
		String jsonresp = null;
		try {
			Calendar c = Calendar.getInstance();
			String selectemonth = tdsMonth;
			Date startdate = CommonUtil.convertStringToDate(selectemonth);
			c.setTime(startdate);
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			long tdsamount = 0;
			List<EmpTDSDO> empTDSList = new EmpTDSService().retriveByEmpIdMonth(empid, startdate);
			System.out.println("2 "+empTDSList.size());
			if(empTDSList.size() > 0){
				for (EmpTDSDO empTDSDO : empTDSList) {
					tdsamount = tdsamount + empTDSDO.getTds();
				}
			}
			jsonresp = String.valueOf(tdsamount);
		} catch (Exception e) { }

		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	
	@RequestMapping(value = "/viewfytds/{month}", method = RequestMethod.GET)
	public String viewFyTDS(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_EMP_TDS;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getbyemptdsmonth/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String tdsmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = tdsmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<EmpTDSDO> tdsList = new EmpTDSService().FindAllEvents(StartDate ,edate );
			if (tdsList != null) {
				Collections.reverse(tdsList);
				respJSON = EmpTdsUtil.gettdsDataTableList(tdsList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get( Model model) {
		JSONObject respJSON = null;
		try {
			List<EmpTDSDO> tdsList = new EmpTDSService().retrive();
			if (tdsList != null) {
				Collections.reverse(tdsList);
				respJSON = EmpTdsUtil.gettdsDataTableList(tdsList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
}