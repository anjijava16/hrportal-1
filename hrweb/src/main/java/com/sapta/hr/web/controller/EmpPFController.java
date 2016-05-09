package com.sapta.hr.web.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sapta.hr.domainobject.EmpPFDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.EmpPFService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.WebManager;


@Controller
@RequestMapping(value = "/emppf")
public class EmpPFController {

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpPFDO> emppfList = new EmpPFService().retrive();
				if (emppfList != null && emppfList.size() > 0) {
					Collections.reverse(emppfList);
					model.addAttribute(CommonConstants.EMP_PF_LIST, emppfList);
					model.addAttribute(CommonConstants.EMP_PF_LIST_SIZE, emppfList.size());
				} else {
					model.addAttribute(CommonConstants.EMP_PF_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EMP_PF;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{empid}/{emppf}/{pfmonth}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable double emppf, @PathVariable String pfmonth, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpPFDO> emppfList = new EmpPFService().retriveByEmpIdMonth(empid, CommonUtil.convertStringToDate(pfmonth));
				if (emppfList != null && emppfList.size() > 0) {
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.PF_AVAILABLE);
					return respJSON.toString();
				}else{
					employeeList = new EmployeeService().retriveById(empid);
					if(employeeList.get(0).getStatus() == 'a'){
						
						if (employeeList != null && employeeList.size() > 0) {
							String pfmonth1 = pfmonth;		   
							EmpPFDO emppfDO = new EmpPFDO();
							emppfDO.setPfamount(emppf);
							emppfDO.setEmpid(empid);
							emppfDO.setPfmonth(CommonUtil.convertStringToDate(pfmonth1));
							UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
							emppfDO.setUpdatedby(user.getUsername());
							emppfDO.setUpdatedon(new Date());
							 
							String result = null;
							result = new EmpPFService().persist(emppfDO);
							
							if(result.equalsIgnoreCase("true") && result != null){
								respJSON = CommonWebUtil.buildSuccessResponse();
							}else{
								respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
							}
						}else{
							respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
						}
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
					}
					return respJSON.toString();
				}
			}
		}catch (Exception e) {e.printStackTrace();}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{empid}/{employeepf}/{editedstartdate}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable long empid,@PathVariable double employeepf, @PathVariable String editedstartdate, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		List<EmployeeDO> employeeList = null;
		try {
			if (WebManager.authenticateSession(request)) {
				employeeList = new EmployeeService().retriveById(empid);
				if(employeeList.get(0).getStatus() == 'a'){
					EmpPFDO pfDO = new EmpPFDO();
					pfDO.setId(id);
					pfDO.setPfamount(employeepf);
					pfDO.setEmpid(empid);
					pfDO.setPfmonth(CommonUtil.convertStringToDate(editedstartdate));
					UserDO userDO = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					pfDO.setUpdatedby(userDO.getUsername());
					pfDO.setUpdatedon(new Date());
					new EmpPFService().update(pfDO);
					respJSON = CommonWebUtil.buildSuccessResponse();
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EMP_NOT_AVAILABLE);
				}
			}
		}catch (Exception e) { 
			e.printStackTrace();
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpPFDO> emppfList = new EmpPFService().retriveById(id);
				if(emppfList != null && emppfList.size() > 0){
					boolean status = false;
					for (EmpPFDO empPFDO : emppfList) {
						long empid =empPFDO.getId();
						status = new EmpPFService().delete(empid);
					}
					
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
	
}
