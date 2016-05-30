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

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.domainobject.InvoiceDetailsDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.InvoiceDetailsService;
import com.sapta.hr.service.InvoiceService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.InvoiceDetailsUtil;
import com.sapta.hr.web.util.InvoiceUtil;
import com.sapta.hr.web.util.ProjectUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/invoice")
public class InvoiceController {

	String validation = null;
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
	}
	
	@RequestMapping(value = "/viewinvoice", method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest request) {
		double totalamount=0;
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_INVOICE;
			    List<InvoiceDO> invoiceAllList = new InvoiceService().retriveinvoice();
				List<CustomerDO> customerList = new CustomerService().retrive();
				List<ProjectDO> projectList = new ProjectService().retriveProject();
				if (invoiceAllList != null && invoiceAllList.size() > 0) {
					model.addAttribute(CommonConstants.INVOICE_ALL_LIST, invoiceAllList);
					model.addAttribute(CommonConstants.INVOICE_ALL_LIST_SIZE, invoiceAllList.size());
				}
				
				
				
				if (invoiceAllList != null && invoiceAllList.size() > 0) {
					model.addAttribute(CommonConstants.INVOICE_LIST, invoiceAllList);
					model.addAttribute(CommonConstants.INVOICE_LIST_SIZE, invoiceAllList.size());
					for (InvoiceDO invdo : invoiceAllList) {
						if(invdo.getInvoicestatus() == 'i'){
							totalamount = totalamount + invdo.getReceivedamount();
						}
					}
				}
				model.addAttribute("totalamount", totalamount);
				model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
				model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
			}
		} catch (Exception e) { }
		return pagename;
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
			List<InvoiceDO> invoiceList = new InvoiceService().FindAllEvents(StartDate, edate);
			if (invoiceList != null && invoiceList.size() > 0) {
				respJSON = InvoiceUtil.getinvoiceList(invoiceList);
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
		    List<InvoiceDO> invoiceList = new InvoiceService().FindAllEvents(StartDate, edate);
			if (invoiceList != null) {
				Collections.reverse(invoiceList);
				respJSON = InvoiceUtil.getInvoiceDataTableList(invoiceList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/viewinvoice/{id}", method = RequestMethod.GET)
	public String viewinvoicetrackingById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_INVOICE;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
				}
				List<InvoiceDO> invoiceList = new InvoiceService().retriveinvoice();
					
				if (invoiceList != null && invoiceList.size() > 0) {
					model.addAttribute(CommonConstants.INVOICE_LIST, 	invoiceList);
					model.addAttribute(CommonConstants.INVOICE_LIST_SIZE, 	invoiceList.size());
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getlist", method = RequestMethod.GET)
	public @ResponseBody String getList(Model model, HttpServletRequest request) {
		JSONObject respJSON = new JSONObject();
		try {
			if (WebManager.authenticateSession(request)) { 
			    List<InvoiceDO> invoiceList = new InvoiceService().retriveinvoice();
				if (invoiceList != null) {
					Collections.reverse(invoiceList);
					respJSON = InvoiceUtil.getInvoiceDataTableList(invoiceList);
				}
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";		
	}
	
	@RequestMapping(value = "/gettotalamount", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmount(Model model, HttpServletRequest request) {
		JSONObject respJSON = new JSONObject();
		try {
			if (WebManager.authenticateSession(request)) { 
			    List<InvoiceDO> invoiceList = new InvoiceService().retriveinvoice();
				if (invoiceList != null) {
					respJSON = InvoiceUtil.getinvoiceList(invoiceList);
				}
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";		
	}
	
	@RequestMapping(value = "/addinvoice", method = RequestMethod.GET)
	public String addinvoicetracking(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_INVOICE;
				List<CustomerDO> customerList = new CustomerService().retrive();
				List<ProjectDO> projectList = new ProjectService().retriveProject();
				model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
				model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/retrivebycustandproject/{projectid}/{customerid}", method = RequestMethod.GET)
	public @ResponseBody String retriveByCustAndProjct(@PathVariable long projectid, @PathVariable long customerid, Model model,HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<InvoiceDO> invoiceList = new InvoiceService().retriveByCustAndProjct(projectid, customerid);
			Collections.reverse(invoiceList);
			jsonresp = InvoiceUtil.getinvoiceList(invoiceList).toString();
		} catch (Exception e) {}
		
		return jsonresp != null ? jsonresp.toString() : "";
		
		
	}
	
	@RequestMapping(value = "/getinvoice", method = RequestMethod.GET)
	public @ResponseBody String getInvoice(Model model,HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<InvoiceDO> invoiceList = new InvoiceService().retriveinvoice();
			Collections.reverse(invoiceList);
			jsonresp = InvoiceUtil.getinvoiceList(invoiceList).toString();
		} catch (Exception e) {}
		
		return jsonresp != null ? jsonresp.toString() : "";
		
		
	}
	
	@RequestMapping(value = "/add/{invoicenumber}/{invoicedate}/{duedate}/{customerid}/{projectid}/{totalamount}/{servicetax}/{invoicetype}/{servicetaxper}/{amounttype}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String invoicenumber, @PathVariable String invoicedate, @PathVariable String duedate, 
		   @PathVariable long customerid, @PathVariable long projectid, @PathVariable double totalamount, @PathVariable double servicetax, 
		   @PathVariable char invoicetype, @PathVariable String amounttype, @PathVariable String servicetaxper, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
								
				InvoiceDO invoiceDO = new InvoiceDO();
				
				invoiceDO.setInvoiceno(invoicenumber);
                invoiceDO.setInvoicedate(CommonUtil.convertStringToDate(invoicedate));
                invoiceDO.setDuedate(CommonUtil.convertStringToDate(duedate));
                invoiceDO.setCustomerid(customerid);
                invoiceDO.setProjectid(projectid);
                invoiceDO.setTypeofinvoice(invoicetype);
                invoiceDO.setAmounttype(amounttype);
                invoiceDO.setInvoicestatus('a');
                if(servicetax != 0){
                	invoiceDO.setServicetax(servicetax);
                }
                System.out.println("totalamount===== "+servicetaxper);
                invoiceDO.setTotalamount(totalamount);
                invoiceDO.setServicetaxper(servicetaxper);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				invoiceDO.setUpdatedby(user.getUsername());
				invoiceDO.setUpdatedon(new Date());
				new InvoiceService().persistinvoice(invoiceDO);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/addinvoicedetails/{invoicenumber}/{reference}/{servicefrom}/{serviceto}/{totalhrs}/{rateperhr}/{dueamount}", method = RequestMethod.GET)
	public @ResponseBody String addInvoiceDetails(@PathVariable String invoicenumber, @PathVariable String reference, @PathVariable String servicefrom, 
		   @PathVariable String serviceto, @PathVariable long totalhrs, @PathVariable double rateperhr, @PathVariable double dueamount, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
								
				InvoiceDetailsDO invoiceDetailsDO = new InvoiceDetailsDO();
				
				invoiceDetailsDO.setInvoiceno(invoicenumber);
				invoiceDetailsDO.setRefnumbername(reference);
				invoiceDetailsDO.setServicefrom(CommonUtil.convertStringToDate(servicefrom));
				invoiceDetailsDO.setServiceto(CommonUtil.convertStringToDate(serviceto));
				invoiceDetailsDO.setDueamount(dueamount);
				invoiceDetailsDO.setTimeperiod(totalhrs);
				invoiceDetailsDO.setRateofperiod(rateperhr);
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				invoiceDetailsDO.setUpdatedby(user.getUsername());
				invoiceDetailsDO.setUpdatedon(new Date());
				new InvoiceDetailsService().persistinvoice(invoiceDetailsDO);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/getbyinvoiceno/{invoiceno}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String invoiceno, Model model) {
		JSONObject respJSON = null;
		try {
			List<InvoiceDO> invoiceList = new InvoiceService().retriveByInvoiceNo(invoiceno);
			if (invoiceList != null && invoiceList.size() > 0) {
				respJSON = InvoiceUtil.getinvoiceListGrid(invoiceList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";	
	}
	
	@RequestMapping(value = "/retrivebyid/{invoiceno}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable String invoiceno, Model model,HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<InvoiceDO> invoiceList = new InvoiceService().retriveByInvoiceNo(invoiceno);
			jsonresp = InvoiceUtil.getinvoiceList(invoiceList).toString();
		} catch (Exception e) {}
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/getinvoicedetails/{invoiceno}", method = RequestMethod.GET)
	public @ResponseBody String retriveInvoiceDetails(@PathVariable String invoiceno, Model model,HttpServletRequest request) {
		String jsonresp = null;
		try {
			List<InvoiceDetailsDO> invoiceDetailsList = new InvoiceDetailsService().retriveByInvoiceNo(invoiceno);
			jsonresp = InvoiceDetailsUtil.getinvoiceDetailList(invoiceDetailsList).toString();
		} catch (Exception e) {}
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{invoiceno}/{invoicedate}/{duedate}/{totalamount}/{servicetax}/{projectid}/{customerid}/{servicetaxper}/{amounttype}/{invoicetype}/{status}/{receiveddate}/{receivedamount}/{receivedamounttype}/{receivedcomments}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String invoiceno, @PathVariable String invoicedate, @PathVariable String duedate, 
			@PathVariable double totalamount, @PathVariable double servicetax, @PathVariable long projectid, @PathVariable long customerid, @PathVariable String servicetaxper, @PathVariable String amounttype, @PathVariable char invoicetype, 
			@PathVariable char status, @PathVariable String receiveddate, @PathVariable double receivedamount, @PathVariable String receivedamounttype, 
			@PathVariable String receivedcomments, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				InvoiceDO invoiceDO = new InvoiceDO();
					invoiceDO.setId(id);
					invoiceDO.setInvoiceno(invoiceno);
					invoiceDO.setInvoicedate(CommonUtil.convertStringToDate(invoicedate));
					invoiceDO.setDuedate(CommonUtil.convertStringToDate(duedate));
					invoiceDO.setCustomerid(customerid);
					invoiceDO.setProjectid(projectid);
					invoiceDO.setTotalamount(totalamount);
					invoiceDO.setServicetaxper(servicetaxper);
					invoiceDO.setAmounttype(amounttype);
					invoiceDO.setTypeofinvoice(invoicetype);
					invoiceDO.setInvoicestatus(status);
					if(!receiveddate.equalsIgnoreCase("null"))
					invoiceDO.setReceiveddate(CommonUtil.convertStringToDate(receiveddate));
					if(!receivedamounttype.equalsIgnoreCase("null"))
					invoiceDO.setReceivedamounttype(receivedamounttype);
					if(!receivedcomments.equalsIgnoreCase("null"))
					invoiceDO.setReceivedcomments(receivedcomments);
					if(receivedamount!=0)
					invoiceDO.setReceivedamount(receivedamount);
					if(servicetax!=0)
					invoiceDO.setServicetax(servicetax);
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					invoiceDO.setUpdatedby(user.getUsername());
					invoiceDO.setUpdatedon(new Date());
					new InvoiceService().update(invoiceDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/updateinvoicedetails/{id}/{invoiceno}/{reference}/{servicefrom}/{serviceto}/{timeperiod}/{rateperiod}/{dueamount}", method = RequestMethod.GET)
	public @ResponseBody String updateInvoiceDetails(@PathVariable long id, @PathVariable String invoiceno, @PathVariable String reference, @PathVariable String servicefrom, @PathVariable String serviceto, 
			@PathVariable long timeperiod, @PathVariable double rateperiod, @PathVariable double dueamount, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				InvoiceDetailsDO invoiceDetailsDO = new InvoiceDetailsDO();
					invoiceDetailsDO.setId(id);
					invoiceDetailsDO.setInvoiceno(invoiceno);
					invoiceDetailsDO.setRefnumbername(reference);
					invoiceDetailsDO.setServicefrom(CommonUtil.convertStringToDate(servicefrom));
					invoiceDetailsDO.setServiceto(CommonUtil.convertStringToDate(serviceto));
					invoiceDetailsDO.setTimeperiod(timeperiod);
					invoiceDetailsDO.setRateofperiod(rateperiod);
					invoiceDetailsDO.setDueamount(dueamount);
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					invoiceDetailsDO.setUpdatedby(user.getUsername());
					invoiceDetailsDO.setUpdatedon(new Date());
					new InvoiceDetailsService().update(invoiceDetailsDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
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
	
	@RequestMapping(value = "/viewfyinvoice/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_INVOICE;
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
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try{
			if (WebManager.authenticateSession(request)) {
				List<InvoiceDO> invoiceList = new InvoiceService().retriveById(id);
				boolean status = false;
				for(InvoiceDO invoiceDO : invoiceList){
					status = new InvoiceService().delete(invoiceDO);
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
	
	
	
	
