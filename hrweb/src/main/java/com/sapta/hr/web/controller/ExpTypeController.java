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

import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.ExpTypeService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ExpTypeUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/expensetype")
public class ExpTypeController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(ExpTypeController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retrive();
				if (expenseTypeList != null && expenseTypeList.size() > 0) {
					Collections.reverse(expenseTypeList);
					model.addAttribute(CommonConstants.EXP_TYPE_LIST_SIZE, expenseTypeList.size());
					model.addAttribute(CommonConstants.EXP_TYPE_LIST, expenseTypeList);
				} else {
					model.addAttribute(CommonConstants.EXP_TYPE_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_EXPENSE_TYPE;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/update/{id}/{name}/{dispname}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id,@PathVariable String name, @PathVariable String dispname, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retriveById(id);
				if(expenseTypeList != null && expenseTypeList.size() > 0){
					ExpTypeDO ExpTypeDO = expenseTypeList.get(0);
					ExpTypeDO.setDispname(dispname);
					ExpTypeDO.setName(name);
					
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					ExpTypeDO.setUpdatedby(user.getUsername());
					ExpTypeDO.setUpdatedon(new Date());
					
					boolean status = new ExpTypeService().update(ExpTypeDO);
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
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retriveById(id);
				if(expenseTypeList != null && expenseTypeList.size() > 0){
					ExpTypeDO ExpTypeDO = expenseTypeList.get(0);
					
					boolean status = new ExpTypeService().delete(ExpTypeDO);
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
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retrive();
				if (expenseTypeList != null && expenseTypeList.size() > 0) {
					Collections.reverse(expenseTypeList);
					respJSON = ExpTypeUtil.getExpenseTypeList(expenseTypeList);
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EXPENSETYPE_NOT_AVAILABLE);
				}	
			}
		} catch (Exception e) { 
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.EXPENSETYPE_NOT_AVAILABLE);
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/add/{name}/{dispname}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String name, @PathVariable String dispname, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				ExpTypeDO ExpTypeDO = new ExpTypeDO();
				ExpTypeDO.setDispname(dispname);
				ExpTypeDO.setName(name);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				ExpTypeDO.setUpdatedby(user.getUsername());
				ExpTypeDO.setUpdatedon(new Date());
				
				new ExpTypeService().persist(ExpTypeDO);
				respJSON = CommonWebUtil.buildSuccessResponse();
			}
		}catch (Exception e) { e.printStackTrace();}
		
		return respJSON != null ? respJSON.toString() : "";
	}
}
