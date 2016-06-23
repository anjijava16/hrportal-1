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

import com.sapta.hr.domainobject.ServiceTaxDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.ServiceTaxService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ServiceTaxUtill;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/servicetax")
public class ServiceTaxController {
static Logger logger = Logger.getLogger(TDSController.class.getName());
	
	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_SERVICETAX;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/servicetax", method = RequestMethod.GET)
	public String viewTds(Model model, HttpServletRequest request) {
		double totalamount=0;
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_SERVICETAX;
				List<ServiceTaxDO> taxList = new ServiceTaxService().retriveTds();
				for (ServiceTaxDO tdsdo : taxList) {
					totalamount = totalamount + tdsdo.getAmount();
				}
				model.addAttribute("totalamount", totalamount);
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<ServiceTaxDO> taxList = new ServiceTaxService().retriveTdsById(id);
			if(taxList != null ){
				respJSON = ServiceTaxUtill.getservicetaxList(taxList).toString();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbytaxmonth/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String tdsmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = tdsmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<ServiceTaxDO> taxList = new ServiceTaxService().FindAllEvents(StartDate ,edate );
			if (taxList != null) {
				Collections.reverse(taxList);
				respJSON = ServiceTaxUtill.getservicetaxDataTableList(taxList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/add/{tdsmonth}/{amount}/{comments}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String tdsmonth, @PathVariable double amount, @PathVariable String comments, 
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ServiceTaxDO tdsdo = new ServiceTaxDO();
				tdsdo.setTaxmonth(CommonUtil.convertStringToDate(tdsmonth));
				tdsdo.setAmount(amount);
				/*tdsdo.setRefer(refer);*/
				/*tdsdo.setComments(comments);*/
				if (!comments.equalsIgnoreCase("null")){
					tdsdo.setComments(comments);
				}
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				tdsdo.setUpdatedby(user.getUsername());
				tdsdo.setUpdatedon(new Date());
				new ServiceTaxService().persistTds(tdsdo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String getList(Model model, HttpServletRequest request) {
		JSONObject respJSON = null; 
		double total = 0;
		try {
			List<ServiceTaxDO> taxList = new ServiceTaxService().retriveTds();
			if (taxList != null) {
				Collections.reverse(taxList);
				respJSON = ServiceTaxUtill.getservicetaxDataTableList(taxList);
			}
			for(int i = 0; i<= taxList.size(); i++){
				total = total + taxList.get(i).getAmount();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	
	@RequestMapping(value = "/getbytdsmonthajax/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForajax(@PathVariable String tdsmonth, Model model) {
		JSONObject respJSON = null;
		try {
			
			String SDate = tdsmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<ServiceTaxDO> taxList = new ServiceTaxService().FindAllEvents(StartDate ,edate );
			if (taxList != null) {
				respJSON = ServiceTaxUtill.getservicetaxList(taxList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebytdsmonth/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable String tdsmonth, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<ServiceTaxDO> taxList = new ServiceTaxService().retriveTdsByTDMONTH(tdsmonth);
			if(taxList != null){
				respJSON = ServiceTaxUtill.getservicetaxList(taxList).toString();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/viewfyservicetax/{month}", method = RequestMethod.GET)
	public String viewFyTDS(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_SERVICETAX;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/update/{id}/{tdsmonth}/{amount}/{comment}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String tdsmonth,  @PathVariable Double amount, 
		@PathVariable String comment, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				if(id > 0){
					List<ServiceTaxDO> taxList = new ServiceTaxService().retriveTdsById(id);
					if(taxList != null && taxList.size() > 0){
						ServiceTaxDO tdsdatalist = taxList.get(0);
						if(tdsdatalist != null){
							
							/*if(empid != 0)tdsdatalist.setEmpid((empid));*/
							if(!tdsmonth.equalsIgnoreCase("null"))
								tdsdatalist.setTaxmonth(CommonUtil.convertStringToDate(tdsmonth));	
							if(amount !=null)
								tdsdatalist.setAmount(amount);
							/*if (!refrence.equalsIgnoreCase("null"))
								tdsdatalist.setRefer(refrence);*/
							if (!comment.equalsIgnoreCase("null")){
								tdsdatalist.setComments(comment);
							}else{
								tdsdatalist.setComments(null);
							}
							
							tdsdatalist.setUpdatedby(user.getUsername());
							tdsdatalist.setUpdatedon(new Date());
							new ServiceTaxService().update(tdsdatalist);
							
							
						}
					}
				}
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
				List <ServiceTaxDO> taxList = new ServiceTaxService().retriveTdsById(id);
				for(ServiceTaxDO tdsdo:taxList){
					new ServiceTaxService().delete(tdsdo);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	
	
}
