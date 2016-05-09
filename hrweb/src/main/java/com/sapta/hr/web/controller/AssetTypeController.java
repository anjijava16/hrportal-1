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

import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.AssetTypeService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/assettype")
public class AssetTypeController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(AssetTypeController.class.getName());

	@RequestMapping(method = RequestMethod.GET) 
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
				if (assetTypeList != null && assetTypeList.size() > 0) {
					Collections.reverse(assetTypeList);
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST, assetTypeList);
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST_SIZE, assetTypeList.size());
				} else {
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST_SIZE, 0);
				}
				pagename = CommonConstants.JSP_ASSET_TYPE;
			}
		}catch (Exception e) { e.printStackTrace();}
		return pagename;
	}
	
	@RequestMapping(value = "/update/{id}/{name}/{dispname}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id,@PathVariable String name, @PathVariable String dispname, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retriveById(id);
				if(assetTypeList != null && assetTypeList.size() > 0){
					AssetTypeDO assetTypeDO = assetTypeList.get(0);
					assetTypeDO.setDispname(dispname);
					assetTypeDO.setName(name);
					
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					assetTypeDO.setUpdatedby(user.getUsername());
					assetTypeDO.setUpdatedon(new Date());
					
					boolean status = new AssetTypeService().update(assetTypeDO);
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
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retriveById(id);
				if(assetTypeList != null && assetTypeList.size() > 0){
					AssetTypeDO assetTypeDO = assetTypeList.get(0);
					boolean status = new AssetTypeService().delete(assetTypeDO);
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
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
				if (assetTypeList != null && assetTypeList.size() > 0) {
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.ASSETTYPE_NOT_AVAILABLE);
				}	
			}
		} catch (Exception e) { 
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant.ASSETTYPE_NOT_AVAILABLE);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/add/{name}/{dispname}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String name, @PathVariable String dispname, Model model, HttpServletRequest request){
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				AssetTypeDO assetTypeDO = new AssetTypeDO();
				assetTypeDO.setDispname(dispname);
				assetTypeDO.setName(name);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				assetTypeDO.setUpdatedby(user.getUsername());
				assetTypeDO.setUpdatedon(new Date());
				
				new AssetTypeService().persist(assetTypeDO);
				respJSON = CommonWebUtil.buildSuccessResponse();
			}
		}catch (Exception e) { e.printStackTrace();}
		return respJSON != null ? respJSON.toString() : "";
	}
}
