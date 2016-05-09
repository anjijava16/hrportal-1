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

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ProjectUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	String validation = null;
	
	static Logger logger = Logger.getLogger(ProjectController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_PROJECT;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/viewproject", method = RequestMethod.GET)
	public String viewProject(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VIEW_PROJECT;
				List<ProjectDO> projectList = null;
				List<CustomerDO> customerList = null;
				String id = request.getParameter("id");
				if(id != null){
					projectList = new ProjectService().retriveById(Integer.parseInt(id));
				}else{
					projectList = new ProjectService().retriveProject();
				}
				if (projectList != null && projectList.size() > 0) {
					Collections.reverse(projectList);
					model.addAttribute(CommonConstants.PROJECT_LIST, 	projectList);
					model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, 	projectList.size());
				}
				customerList = new CustomerService().retrive();
				Collections.reverse(customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				List<ProjectDO> projList = new ProjectService().retriveProject();
				
				if (projectList != null && projList.size() > 0) {
					Collections.reverse(projList);
					model.addAttribute(CommonConstants.PROJECT_LIST, projList);
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/viewproject/{id}", method = RequestMethod.GET)
	public String viewProjectById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_PROJECT;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
					List<ProjectDO> projectList = new ProjectService().retriveProject();
					List<CustomerDO> customerList = null;
					if (projectList != null && projectList.size() > 0) {
						model.addAttribute(CommonConstants.PROJECT_LIST, 	projectList);
						model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, 	projectList.size());
						customerList = new CustomerService().retrive();
						model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
						model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}			
	
	@RequestMapping(value = "/addproject", method = RequestMethod.GET)
	public String addProject(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<CustomerDO> CustomerList = new CustomerService().retrive();
				if (CustomerList != null && CustomerList.size() > 0) {
					model.addAttribute(CommonConstants.CUSTOMER_LIST, CustomerList);
				}
				pagename = CommonConstants.JSP_ADD_PROJECT;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/add/{customerid}/{name}/{dispname}/{type}/{status}/{description}/{startdate}/{enddate}/{prjctcode}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long customerid,	@PathVariable String name, @PathVariable String dispname, @PathVariable String type, 
		   @PathVariable String status, @PathVariable String description, @PathVariable String startdate, @PathVariable String enddate, @PathVariable String prjctcode,
		   Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ProjectDO projdo = new ProjectDO();
				projdo.setCustomerid(customerid);
				projdo.setName(name);
				projdo.setType(type);
				projdo.setStatus(status.charAt(0));
				projdo.setDispname(dispname);
				projdo.setStartdate(CommonUtil.convertStringToDate(startdate));
				if(!enddate.equalsIgnoreCase("null")){
					projdo.setEnddate(CommonUtil.convertStringToDate(enddate));
				}
				projdo.setProjectcode(prjctcode);
				if (!description.equalsIgnoreCase("null")) projdo.setDescription(description);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				projdo.setUpdatedby(user.getUsername());
				projdo.setUpdatedon(new Date());
				
				new ProjectService().persistProject(projdo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<ProjectDO> projectList = new ProjectService().retriveProject();
			if (projectList != null) {
				Collections.reverse(projectList);
				respJSON = ProjectUtil.getProjectDataTableList(projectList);
			}
		} catch (Exception e) {
		}

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<ProjectDO> projectList = new ProjectService().retriveById(id);
			if (projectList != null) {
				respJSON = ProjectUtil.getProjectDataTableList(projectList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}

	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<ProjectDO> projectList = new ProjectService().retriveById(id);
			respJSON = ProjectUtil.getProjectList(projectList).toString();
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebycustid/{custid}", method = RequestMethod.GET)
	public @ResponseBody String retriveCustomer(@PathVariable long custid, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<ProjectDO> projectList = new ProjectService().retriveByCustId(custid);
			respJSON = ProjectUtil.getProjectList(projectList).toString();
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{customer_id}/{name}/{dispname}/{descr}/{status}/{type}/{startdate}/{enddate}/{projectcode}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id ,@PathVariable long customer_id, @PathVariable String name, @PathVariable String dispname,
		@PathVariable String descr, @PathVariable char status, @PathVariable String type, @PathVariable String startdate, @PathVariable String enddate,  
		@PathVariable String projectcode, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ProjectDO projectDO = new ProjectDO();
				projectDO.setId(id);
				projectDO.setCustomerid(customer_id);
				projectDO.setName(name);
				projectDO.setDispname(dispname);
				projectDO.setStatus(status);
				projectDO.setType(type);
				projectDO.setStartdate(CommonUtil.convertStringToDate(startdate));
				if(!enddate.equalsIgnoreCase("null")){
					projectDO.setEnddate(CommonUtil.convertStringToDate(enddate));
				}
				projectDO.setProjectcode(projectcode);
				if (!descr.equalsIgnoreCase("null"))
					projectDO.setDescription(descr);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				projectDO.setUpdatedby(user.getUsername());
				projectDO.setUpdatedon(new Date());

				new ProjectService().update(projectDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<ProjectDO> projectList = new ProjectService().retriveById(id);
				boolean status = false;
				for(ProjectDO projectDO : projectList){
					status = new ProjectService().delete(projectDO);
				}
				
				if(status){
					respJSON = CommonWebUtil.buildSuccessResponse();
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
				}
			}else{
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return respJSON != null ? respJSON.toString() : "";
	}
}