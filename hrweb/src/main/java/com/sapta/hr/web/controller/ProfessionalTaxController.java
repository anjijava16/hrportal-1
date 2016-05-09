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

import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.ProfessionalTaxService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ProfessionalTaxUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/professionaltax")
public class ProfessionalTaxController {
	static Logger logger = Logger.getLogger(ProfessionalTaxController.class.getName());
	
	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_PROFESSIONALTAX;
				double totalamount = 0;
				List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTax();
				List<ProfessionalTaxDO> ptList = new ProfessionalTaxService().retriveProfessionalTax();
				if(ptList != null && ptList.size() > 0){
					for(ProfessionalTaxDO pt: ptList){
						totalamount =  totalamount + pt.getAmount();
					}
				}
				model.addAttribute("totalamount",totalamount);
				if (taxList != null && taxList.size() > 0) {
					model.addAttribute(CommonConstants.TAX_LIST,taxList);
					model.addAttribute(CommonConstants.TAX_LIST_SIZE,taxList.size());
				}
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/viewprofessionaltax/{ptmonth}", method = RequestMethod.GET)
	public String viewProjectById(@PathVariable String ptmonth, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_PROFESSIONALTAX;
				if( ptmonth != null){
					model.addAttribute(CommonConstants.PT_MONTH, 	ptmonth);
					List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTaxByMonth(ptmonth);
					if (taxList != null && taxList.size() > 0) {
						model.addAttribute(CommonConstants.TAX_LIST,taxList);
						model.addAttribute(CommonConstants.TAX_LIST_SIZE,taxList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}			
	
	@RequestMapping(value = "/viewfyprofessionaltax/{month}", method = RequestMethod.GET)
	public String viewFyProfessionalTax(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_PROFESSIONALTAX;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	@RequestMapping(value = "/add/{empid}/{ptmonth}/{amount}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid, @PathVariable String ptmonth, @PathVariable double amount, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ProfessionalTaxDO ptdo = new ProfessionalTaxDO();
				ptdo.setEmpid(empid);
				ptdo.setPtmonth(CommonUtil.convertStringToDate(ptmonth));
				ptdo.setAmount(amount);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				ptdo.setUpdatedby(user.getUsername());
				ptdo.setUpdatedon(new Date());
				
				new ProfessionalTaxService().persistProfessionalTax(ptdo);
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
			List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTax();
			if (taxList != null) {
				Collections.reverse(taxList);
				respJSON = ProfessionalTaxUtil.getptDataTableList(taxList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTaxById(id);
			if (taxList != null && taxList.size() > 0) {
				respJSON = ProfessionalTaxUtil.getProfessionalTaxGrid(taxList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
		
	@RequestMapping(value = "/getbyempid/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByEmpIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTaxByEmpId(id);
			if (taxList != null && taxList.size() > 0) {
				respJSON = ProfessionalTaxUtil.getProfessionalTaxGrid(taxList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}	
	
	@RequestMapping(value = "/getbymonth/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByMonthForGrid(@PathVariable String ptmonth, Model model) {
	JSONObject respJSON = null;
	try {
		String SDate = ptmonth;		   
		Date StartDate = CommonUtil.convertStringToDate(SDate);
	    Calendar c = Calendar.getInstance();      
	    c.setTime(StartDate);
	    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
	    Date edate= c.getTime();
	    List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().FindAllEvents(StartDate ,edate );
	    if (taxList != null) {
	    		Collections.reverse(taxList);
				respJSON = ProfessionalTaxUtil.getptDataTableList(taxList);
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/gettotal/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String gettotal(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			
			String SDate = ptmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
		    List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().FindAllEvents(StartDate ,edate );
			if (taxList != null) {
				respJSON = ProfessionalTaxUtil.getProfessionalTaxList(taxList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
}
