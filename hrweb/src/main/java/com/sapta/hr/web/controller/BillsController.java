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

import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.BillsService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.BillsUtil;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/bills")
public class BillsController {

	String validation = null;
	String pagename = CommonConstants.JSP_LOGIN_FORWARD;
	static Logger logger = Logger.getLogger(BillsController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_BILLS;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/viewbills", method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_BILLS;
				List<BillsDO> billsList = new BillsService().retrivebills();
				double totalamount = 0;
				if (billsList != null && billsList.size() > 0) {
					for(BillsDO billsDO : billsList){
						if(billsDO.getStatus()=='i'){
							totalamount = totalamount + billsDO.getDueamount();
						}
					}
					
					model.addAttribute(CommonConstants.BILLS_LIST, 	billsList);
					model.addAttribute(CommonConstants.BILLS_LIST_SIZE, billsList.size());
				}
				List<VendorDO> vendorList = null;
				vendorList = new VendorService().retrive();
				if(vendorList != null){
					model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
				}
				model.addAttribute(CommonConstants.TOTALAMOUNT, CommonUtil.convertfloatValueWithTwoDecimalPoints(totalamount));
			}
		} catch (Exception e) { }
		return pagename;
	}

	@RequestMapping(value = "/viewbills/{id}", method = RequestMethod.GET)
	public String viewbillsById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_BILLS;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
				}
				List<BillsDO> billsList = new BillsService().retrivebills();
					
				if (billsList != null && billsList.size() > 0) {
					model.addAttribute(CommonConstants.BILLS_LIST, 	billsList);
					model.addAttribute(CommonConstants.BILLS_LIST_SIZE, 	billsList.size());
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/viewfybills/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				List<VendorDO> vendorList = new VendorService().retrive();
				pagename = CommonConstants.JSP_VIEW_BILLS;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getlist", method = RequestMethod.GET)
	public @ResponseBody String getList(Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) { 
				List<BillsDO> billsList = new BillsService().retrivebills();
				if (billsList != null) {
					Collections.reverse(billsList);
					respJSON = BillsUtil.getBillDataTableList(billsList);
				}
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/gettotalamount", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmount(Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) { 
				List<BillsDO> billsList = new BillsService().retrivebills();
				if (billsList != null && billsList.size() > 0) {
					respJSON = BillsUtil.getbillsList(billsList);
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(CommonConstants.ERRORS);
				}
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/addbill", method = RequestMethod.GET)
	public String addbills(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_BILLS;
				List<VendorDO> vendorList = new VendorService().retrive();
				if (vendorList != null && vendorList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, 	vendorList);
					model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, 	vendorList.size());
				}
				
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/retrivebyVendor/{vendorid}", method = RequestMethod.GET)
	public @ResponseBody String retriveVendor(@PathVariable long vendorid,Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<BillsDO> billsList = new BillsService().retriveVendor(vendorid);
			if (billsList != null && billsList.size() > 0) {
				Collections.reverse(billsList);
				respJSON = BillsUtil.getbillsList(billsList).toString();
			}/*else{
				respJSON = CommonWebUtil.buildErrorResponse("").toString();
			}*/
			
		} catch (Exception e) {}
		
		return respJSON != null ? respJSON.toString() : "";
		
	}
	
	@RequestMapping(value = "/add/{billdate}/{duedate}/{dueamount}/{amounttype}/{vendorid}/{billno}/{comments}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String billdate, @PathVariable String duedate, @PathVariable double dueamount, @PathVariable char amounttype, 
			@PathVariable long vendorid, @PathVariable String billno, @PathVariable String comments,Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				BillsDO billsdo = new BillsDO();
				billsdo.setBillno(billno);
				billsdo.setBilldate(CommonUtil.convertStringToDate(billdate));
				if(!duedate.equalsIgnoreCase("null")){
					billsdo.setDuedate(CommonUtil.convertStringToDate(duedate));
				}
				billsdo.setDueamount(dueamount);
				billsdo.setAmounttype(amounttype);
				billsdo.setStatus('a');
				billsdo.setVendorid(vendorid);
				if(!comments.equalsIgnoreCase("null")){
					billsdo.setComments(comments);
				}
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				billsdo.setUpdatedby(user.getUsername());
				billsdo.setUpdatedon(new Date());
				
				new BillsService().persistbills(billsdo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/getbybillno/{billno}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String billno, Model model) {
		JSONObject respJSON = null;
		try {
			List<BillsDO> billsList = new BillsService().retriveByBillNo(billno);
			if (billsList != null && billsList.size() > 0) {
				respJSON = BillsUtil.getbillsListGrid(billsList);
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
			List<BillsDO> billsList = new BillsService().FindAllEvents(StartDate, edate);
			if (billsList != null) {
				Collections.reverse(billsList);
				respJSON = BillsUtil.getBillDataTableList(billsList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
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
			List<BillsDO> billsList = new BillsService().FindAllEvents(StartDate, edate);
			if (billsList != null && billsList.size() > 0) {
				Collections.reverse(billsList);
				respJSON = BillsUtil.getbillsList(billsList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyid/{billno}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long billno, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<BillsDO> billsList = new BillsService().retriveById(billno);
			if (billsList != null && billsList.size() > 0) {
				respJSON = BillsUtil.getbillsList(billsList).toString();
			}
			
		} catch (Exception e) {}
		
		return respJSON != null ? respJSON.toString() : "";
		
	}
	
	@RequestMapping(value = "/update/{id}/{billno}/{billdate}/{duedate}/{dueamount}/{amounttype}/{status}/{paidOn}/{comments}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id,@PathVariable String billno,@PathVariable String billdate, @PathVariable String duedate, @PathVariable double dueamount, 
			@PathVariable char amounttype,@PathVariable char status, @PathVariable String paidOn,@PathVariable String comments, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				
				List<BillsDO> billsList = new BillsService().retriveById(id);
				
				for(BillsDO billsDO:billsList){
					billsDO.setBillno(billno);
					billsDO.setBilldate(CommonUtil.convertStringToDate(billdate));
					if(!duedate.equalsIgnoreCase("null")){
						billsDO.setDuedate(CommonUtil.convertStringToDate(duedate));
					}
					billsDO.setDueamount(dueamount);
					billsDO.setStatus(status);
					if(!comments.equalsIgnoreCase("null")){
						billsDO.setComments(comments);
					} else {
						billsDO.setComments(null);
					}
					if(!String.valueOf(amounttype).equalsIgnoreCase("null"))
					billsDO.setAmounttype(amounttype);
					billsDO.setPaidon(CommonUtil.convertStringToDate(paidOn));
					
					UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
					billsDO.setUpdatedby(user.getUsername());
					billsDO.setUpdatedon(new Date());

					new BillsService().update(billsDO);
				}
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try{
			if (WebManager.authenticateSession(request)) {
				List<BillsDO> billsList = new BillsService().retriveById(id);
				boolean status = false;
				for(BillsDO billsDO : billsList){
					status = new BillsService().delete(billsDO);
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
	
	
	
	
