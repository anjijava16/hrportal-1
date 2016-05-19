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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.EmpAssignmentDO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.EmpAssignmentService;
import com.sapta.hr.service.EmpDetailService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpAssignmentUtil;
import com.sapta.hr.web.util.EmployeeUtil;
import com.sapta.hr.web.util.ProjectUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/assignment")
@SessionAttributes("session")
public class EmpAssignmentController {

	String validation = null;
	
	static Logger logger = Logger.getLogger(ProjectController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		logger.info("Inside assignment");
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ASSIGNMENT;
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/addassignment", method = RequestMethod.GET)
	public String addEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			logger.info("Inside Addassignment");
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADDASSIGNMENT;
				/*List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();*/
				
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployeeActive();
				if (employeeList != null && employeeList.size() > 0) {
					model.addAttribute(CommonConstants.EMPLOYEE_LIST, employeeList);
				}
				
				List<CustomerDO> CustomerList = new CustomerService().retrive();
				if (CustomerList != null && CustomerList.size() > 0) {
					model.addAttribute(CommonConstants.CUSTOMER_LIST, CustomerList);
				}
				
				List<ProjectDO> projectList = new ProjectService().retriveActiveProject();

				if (projectList != null && projectList.size() > 0) {
					model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/add/{sdate}/{edate}/{powo}/{comment}/{status}/{eid}/{projid}/{amount}/{amounttype}/{billtype}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String sdate, @PathVariable String edate, @PathVariable String powo,
			@PathVariable String comment, @PathVariable String status,  @PathVariable String eid, 
			@PathVariable String projid, @PathVariable String amount, @PathVariable String amounttype, @PathVariable String billtype,
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				long empid, pid;
				empid = Long.valueOf(eid);
				pid = Long.valueOf(projid);
				Date Sdate = CommonUtil.convertStringToDate(sdate);
				List<EmpDetailDO> empdetail = new EmpDetailService().retriveByEmpId(empid);
				List<ProjectDO> project = new ProjectService().retriveById(pid);
				
				if(empdetail.size() == 0 ){
					return CommonWebUtil.buildErrorResponse("Employee not exist.... ").toString();					
				}
				
				if(project.get(0).getEnddate() != null){
					if(project.size() > 0 && Sdate.before(project.get(0).getStartdate()) || Sdate.after(project.get(0).getEnddate())){
						return CommonWebUtil.buildErrorResponse("Mismatch in startdate.... ").toString();
					}
				}
				
				if(!edate.equalsIgnoreCase("null") && project.get(0).getEnddate() != null){
					if(project.size() > 0 && CommonUtil.convertStringToDate(edate).after(project.get(0).getEnddate())){
						return CommonWebUtil.buildErrorResponse("Mismatch in enddate.... ").toString();
					}
				}
				
				if( empdetail.size() > 0 && Sdate.before(empdetail.get(0).getJdate())){
					return CommonWebUtil.buildErrorResponse("Start date should be greater than joining date ...").toString();
				}
				
				EmpAssignmentDO assigndo = new EmpAssignmentDO();
				if (empid > 0 && pid > 0){
					assigndo.setEmpid(empid);
					assigndo.setProjectid(pid);
				}
				assigndo.setStartdate(Sdate);
				if(!edate.equalsIgnoreCase("null")){
					assigndo.setEnddate(CommonUtil.convertStringToDate(edate));
				}
				assigndo.setStatus(status.charAt(0));
				if (!powo.equalsIgnoreCase("null"))  assigndo.setPo_wo(powo);				
				if (!comment.equalsIgnoreCase("null")) assigndo.setComments(comment);
				if (!amounttype.equalsIgnoreCase("null"))assigndo.setAmounttype(amounttype);
				if(!amount.equalsIgnoreCase("null"))assigndo.setAmount(Double.valueOf(amount));
				if (!billtype.equalsIgnoreCase("null"))
					assigndo.setBilltype(billtype);

				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				assigndo.setUpdatedby(user.getUsername());
				assigndo.setUpdatedon(new Date());

				new EmpAssignmentService().persist(assigndo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/viewassignment", method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VIEW_ASSIGNMENT;
				List<CustomerDO> customerList = null;
				List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
				List<EmpAssignmentDO> assgList = new EmpAssignmentService().retrive();
				List<ProjectDO> projectList = new ProjectService().retriveProject();
				if (assgList != null && assgList.size() > 0) {
					model.addAttribute(CommonConstants.ASSIGN_LIST,assgList);
					model.addAttribute(CommonConstants.ASSIGLIST_SIZE,assgList.size());
					customerList = new CustomerService().retrive();
					List<EmpAssignmentDO> assginList = new EmpAssignmentService().retrive();
					if (assginList != null && assginList.size() > 0) {
						model.addAttribute(CommonConstants.ASSIGN_LIST, assginList);
						model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
						model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
						model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
						model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
						model.addAttribute(CommonConstants.EMPLOYEE_LIST, 	employeeList);
						model.addAttribute(CommonConstants.EMPLOYEE_LIST_SIZE, 	employeeList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/viewassignment/{id}", method = RequestMethod.GET)
	public String viewEmployeeById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_ASSIGNMENT;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
					
					List<EmpAssignmentDO> assignList = new EmpAssignmentService().retrive();
					if (assignList != null && assignList.size() > 0) {
						model.addAttribute(CommonConstants.ASSIGN_LIST,assignList);
						model.addAttribute(CommonConstants.ASSIGLIST_SIZE,assignList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			List<EmpAssignmentDO> empList = new EmpAssignmentService().retrive();
			if (empList != null) {
				Collections.reverse(empList);
				respJSON = EmpAssignmentUtil.getAssignDataTableList(empList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get/{aid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long aid, Model model) {
		System.out.println(aid);
		JSONObject respJSON = null;
		try {
			List<EmpAssignmentDO> assgList = new EmpAssignmentService().retriveById(aid);
			if (assgList != null) {
				respJSON = EmpAssignmentUtil.getAssignDataTableList(assgList);
				System.out.println(respJSON);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getempassign/{pid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForAssignDetails(@PathVariable long pid, Model model) {
		System.out.println(pid);
		JSONObject respJSON = null;
		try {
			List<EmpAssignmentDO> assgList = new EmpAssignmentService().retriveByProjectId(pid);
			if (assgList != null) {
				respJSON = EmpAssignmentUtil.getAssignDataTableList(assgList);
				System.out.println(respJSON);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getEmp/{eid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGridEmp(@PathVariable long eid, Model model) {
		JSONObject respJSON = null;
		try {
			List<EmpAssignmentDO> assgList = new EmpAssignmentService().retriveByEmpId(eid);
			if (assgList != null) {
				respJSON = EmpAssignmentUtil.getAssignDataTableList(assgList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List <EmpAssignmentDO> assgList = new EmpAssignmentService().retriveById(id);
			jsonresp = EmpAssignmentUtil.getAsignList(assgList).toString();
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyempid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmp(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List <EmployeeDO> empList = new EmployeeService().retriveById(id);
			jsonresp = EmployeeUtil.getEmployeeList(empList).toString();
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyprojectid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveproj(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List <ProjectDO> proList = new ProjectService().retriveById(id);
			jsonresp = ProjectUtil.getProjectList(proList).toString();
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{startdate}/{enddate}/{powo}/{status}/{eid}/{projid}/{comments}/{amount}/{amounttype}/{billtype}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String startdate, @PathVariable String enddate, @PathVariable String powo, @PathVariable char status,
			  @PathVariable long eid, @PathVariable long projid, @PathVariable String comments, @PathVariable String amount, @PathVariable String amounttype, @PathVariable String billtype,
			  Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				EmpAssignmentDO assigndo = new EmpAssignmentDO();
				assigndo.setId(id);
				if (eid > 0 && projid > 0)
				{
					assigndo.setEmpid(eid);
					assigndo.setProjectid(projid);
				}
				assigndo.setStartdate(CommonUtil.convertStringToDate(startdate));
				assigndo.setEnddate(CommonUtil.convertStringToDate(enddate));
				assigndo.setStatus(status);
				
				if (!comments.equalsIgnoreCase("null"))
				assigndo.setComments(comments);
				
				if (!powo.equalsIgnoreCase("null"))
					assigndo.setPo_wo(powo);
				
				if (!amounttype.equalsIgnoreCase("null"))assigndo.setAmounttype(amounttype);
				if(!amount.equalsIgnoreCase("null"))assigndo.setAmount(Double.valueOf(amount));
				if (!billtype.equalsIgnoreCase("null"))assigndo.setBilltype(billtype);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				assigndo.setUpdatedby(user.getUsername());
				assigndo.setUpdatedon(new Date());

				new EmpAssignmentService().update(assigndo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				List<EmpAssignmentDO> assgList = new EmpAssignmentService().retriveById(id);
				for(EmpAssignmentDO assigndo : assgList){
					new EmpAssignmentService().delete(assigndo);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
	return CommonWebUtil.buildSuccessResponse().toString();
	}

}
