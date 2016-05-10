package com.sapta.hr.web.controller;

import java.util.Calendar;
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

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.ExternalInvoiceDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.ExternalInvoiceService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ExternalInvoiceUtil;
import com.sapta.hr.web.util.ProjectUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/externalinvoice")
public class ExternalInvoiceController {
	
	/*String validation = null;
	String pagename = CommonConstants.JSP_LOGIN_FORWARD;
	static Logger logger = Logger.getLogger(InvoiceController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_INVOICE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}*/
	

	@RequestMapping(value = "/addexternalinvoice", method = RequestMethod.GET)
	public String addinvoicetracking(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_EXT_INVOICE;
				List<CustomerDO> customerList = new CustomerService().retrive();
				model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{invoicenumber}/{invoicedate}/{duedate}/{customerid}/{projectid}/{amounttype}/{invoiceamount}/{status}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String invoicenumber, @PathVariable String invoicedate, @PathVariable String duedate, 
		   @PathVariable long customerid, @PathVariable long projectid, @PathVariable char amounttype,
		   @PathVariable double invoiceamount, @PathVariable char status, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
								
				ExternalInvoiceDO extInvoiceDO = new ExternalInvoiceDO();
				extInvoiceDO.setCustomerid(customerid);
				extInvoiceDO.setProjectid(projectid);
				extInvoiceDO.setInvoiceno(invoicenumber);
				extInvoiceDO.setInvoicedate(CommonUtil.convertStringToDate(invoicedate));
				extInvoiceDO.setDuedate(CommonUtil.convertStringToDate(duedate));
				extInvoiceDO.setAmounttype(amounttype);
				extInvoiceDO.setInvoiceamount(invoiceamount);
				extInvoiceDO.setInvoicestatus(status);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				extInvoiceDO.setUpdatedby(user.getUsername());
				extInvoiceDO.setUpdatedon(new Date());
				new ExternalInvoiceService().persist(extInvoiceDO);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	@RequestMapping(value = "/update/{id}/{invoiceno}/{invoicedate}/{duedate}/{projectid}/{customerid}/{amounttype}/{invoiceamount}/{status}/{receiveddate}/{receivedamount}/{receivedamounttype}/{receivedcomments}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String invoiceno, @PathVariable String invoicedate, @PathVariable String duedate, 
			@PathVariable long projectid, @PathVariable long customerid, @PathVariable char amounttype , @PathVariable double invoiceamount,	@PathVariable char status, @PathVariable String receiveddate, @PathVariable double receivedamount, @PathVariable String receivedamounttype, 
			@PathVariable String receivedcomments, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				ExternalInvoiceDO extInvoiceDO = new ExternalInvoiceDO();
					extInvoiceDO.setId(id);
					extInvoiceDO.setInvoiceno(invoiceno);
					extInvoiceDO.setInvoicedate(CommonUtil.convertStringToDate(invoicedate));
					extInvoiceDO.setDuedate(CommonUtil.convertStringToDate(duedate));
					extInvoiceDO.setCustomerid(customerid);
					extInvoiceDO.setProjectid(projectid);
					extInvoiceDO.setAmounttype(amounttype);
					extInvoiceDO.setInvoicestatus(status);
					extInvoiceDO.setInvoiceamount(invoiceamount);
					if(!receiveddate.equalsIgnoreCase("null"))
						extInvoiceDO.setReceiveddate(CommonUtil.convertStringToDate(receiveddate));
					if(!receivedamounttype.equalsIgnoreCase("null"))
						extInvoiceDO.setReceivedamounttype(receivedamounttype);
					if(!receivedcomments.equalsIgnoreCase("null"))
						extInvoiceDO.setReceivedcomments(receivedcomments);
					if(receivedamount!=0)
						extInvoiceDO.setReceivedamount(receivedamount);
					
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					extInvoiceDO.setUpdatedby(user.getUsername());
					extInvoiceDO.setUpdatedon(new Date());
					new ExternalInvoiceService().update(extInvoiceDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	
	@RequestMapping(value = "/viewexternalinvoice", method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_EXT_INVOICE;
			    List<ExternalInvoiceDO> invoiceAllList = new ExternalInvoiceService().retrive();
				List<CustomerDO> customerList = new CustomerService().retrive();
				List<ProjectDO> projectList = new ProjectService().retriveProject();
				if (invoiceAllList != null && invoiceAllList.size() > 0) {
					model.addAttribute(CommonConstants.INVOICE_ALL_LIST, invoiceAllList);
					model.addAttribute(CommonConstants.INVOICE_ALL_LIST_SIZE, invoiceAllList.size());
				}else {
					model.addAttribute(CommonConstants.INVOICE_ALL_LIST_SIZE, 0);
				}
				if(customerList.size() > 0){
					model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				    model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				}else{
					model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 0);
				}
				if(customerList.size() > 0){
					model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
					model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
				}else{
					model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, 0);
				}
			}	
		}catch (Exception e) { }
		return pagename;
	}

	@RequestMapping(value = "/getlist", method = RequestMethod.GET)
	public @ResponseBody String getList(Model model, HttpServletRequest request) {
		JSONObject respJSON = new JSONObject();
		try {
			if (WebManager.authenticateSession(request)) { 
			    List<ExternalInvoiceDO> externalInvoiceDO = new ExternalInvoiceService().retrive();
				if (externalInvoiceDO != null) {
					Collections.reverse(externalInvoiceDO);
					respJSON = ExternalInvoiceUtil.getInvoiceDataTableList(externalInvoiceDO);
				}
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";		
	}
	
	@RequestMapping(value = "/retrivebyid/{invoiceno}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable String invoiceno, Model model,HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<ExternalInvoiceDO> invoiceList = new ExternalInvoiceService().retriveByInvoiceNo(invoiceno);
			jsonresp = ExternalInvoiceUtil.getinvoiceList(invoiceList).toString();
		} catch (Exception e) {}
		
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
	
	@RequestMapping(value = "/getbydateajax/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdDateAjax(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = ptmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<ExternalInvoiceDO> extinvoiceList = new ExternalInvoiceService().FindAllEvents(StartDate, edate);
			if (extinvoiceList != null && extinvoiceList.size() > 0) {
				respJSON = ExternalInvoiceUtil.getinvoiceList(extinvoiceList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbymonth/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdDate(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = ptmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
		    List<ExternalInvoiceDO> extinvoiceList = new ExternalInvoiceService().FindAllEvents(StartDate, edate);
			if (extinvoiceList != null) {
				Collections.reverse(extinvoiceList);
				respJSON = ExternalInvoiceUtil.getInvoiceDataTableList(extinvoiceList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/viewfyinvoice/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		System.out.println("hi hiam fyreport "+month);
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_EXT_INVOICE;
				List<CustomerDO> customerList = new CustomerService().retrive();
				List<ProjectDO> projectList = new ProjectService().retriveProject();
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
				model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
			}
		} catch (Exception e) { }
		return pagename;
	}
}
