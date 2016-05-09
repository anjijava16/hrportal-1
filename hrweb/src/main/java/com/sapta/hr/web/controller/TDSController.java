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

import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.TDSService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.TDSUtill;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/tds")
public class TDSController {
	static Logger logger = Logger.getLogger(TDSController.class.getName());
	
	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_TDS;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/tds", method = RequestMethod.GET)
	public String viewTds(Model model, HttpServletRequest request) {
		double totalamount=0;
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_TDS;
				List<TDSDO> tdsList = new TDSService().retriveTds();
				for (TDSDO tdsdo : tdsList) {
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
			List<TDSDO> tdsList = new TDSService().retriveTdsById(id);
			if(tdsList != null ){
				respJSON = TDSUtill.gettdsList(tdsList).toString();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/viewtds/{tdsmonth}", method = RequestMethod.GET)
	public String viewTdsmonth(@PathVariable String tdsmonth, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_TDS;
				if( tdsmonth != null){
					model.addAttribute(CommonConstants.TDMONTH, tdsmonth);
					List<TDSDO> tdsList = new TDSService().retriveTdsByTDMONTH(tdsmonth);
					if (tdsList != null && tdsList.size() > 0) {
						model.addAttribute(CommonConstants.Tds_LIST,tdsList);
						model.addAttribute(CommonConstants.Tds_LIST_SIZE,tdsList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}	
	
	@RequestMapping(value = "/paytds", method = RequestMethod.GET)
	public String paytds(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_PAY_TDS;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	
	@RequestMapping(value = "/add/{tdsmonth}/{amount}/{refer}/{comments}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String tdsmonth, @PathVariable double amount, @PathVariable String refer, @PathVariable String comments, 
			Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				TDSDO tdsdo = new TDSDO();
				tdsdo.setTdsmonth(CommonUtil.convertStringToDate(tdsmonth));
				tdsdo.setAmount(amount);
				tdsdo.setRefer(refer);
				tdsdo.setComments(comments);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				tdsdo.setUpdatedby(user.getUsername());
				tdsdo.setUpdatedon(new Date());
				new TDSService().persistTds(tdsdo);
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
			List<TDSDO> tdsList = new TDSService().retriveTds();
			if (tdsList != null) {
				Collections.reverse(tdsList);
				respJSON = TDSUtill.gettdsDataTableList(tdsList);
			}
			for(int i = 0; i<= tdsList.size(); i++){
				total = total + tdsList.get(i).getAmount();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbytdsmonth/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable String tdsmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String SDate = tdsmonth;		   
			Date StartDate = CommonUtil.convertStringToDate(SDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(StartDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date edate= c.getTime();
			List<TDSDO> tdsList = new TDSService().FindAllEvents(StartDate ,edate );
			if (tdsList != null) {
				Collections.reverse(tdsList);
				respJSON = TDSUtill.gettdsDataTableList(tdsList);
			}
		} catch (Exception e) { }
		
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
			List<TDSDO> tdsList = new TDSService().FindAllEvents(StartDate ,edate );
			if (tdsList != null) {
				respJSON = TDSUtill.gettdsList(tdsList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
		
	
	@RequestMapping(value = "/retrivebytdsmonth/{tdsmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable String tdsmonth, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<TDSDO> tdsList = new TDSService().retriveTdsByTDMONTH(tdsmonth);
			if(tdsList != null){
				respJSON = TDSUtill.gettdsList(tdsList).toString();
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/viewfytds/{month}", method = RequestMethod.GET)
	public String viewFyTDS(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_TDS;
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	
	@RequestMapping(value = "/update/{id}/{empid}/{tdsmonth}/{amount}/{refrence}/{comment}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable long empid, @PathVariable String tdsmonth,  @PathVariable Double amount, @PathVariable String refrence, 
		@PathVariable String comment, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				if(id > 0){
					List<TDSDO> tdsList = new TDSService().retriveTdsById(id);
					if(tdsList != null && tdsList.size() > 0){
						TDSDO tdsdatalist = tdsList.get(0);
						if(tdsdatalist != null){
							
							if(empid != 0)tdsdatalist.setEmpid((empid));
							if(!tdsmonth.equalsIgnoreCase("null"))
								tdsdatalist.setTdsmonth(CommonUtil.convertStringToDate(tdsmonth));	
							if(amount !=null)
								tdsdatalist.setAmount(amount);
							if (!refrence.equalsIgnoreCase("null"))
								tdsdatalist.setRefer(refrence);
							if (!comment.equalsIgnoreCase("null"))
							
							tdsdatalist.setUpdatedby(user.getUsername());
							tdsdatalist.setUpdatedon(new Date());
							new TDSService().update(tdsdatalist);
							
							
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
				List <TDSDO> tdsList = new TDSService().retriveTdsById(id);
				for(TDSDO tdsdo:tdsList){
					new TDSService().delete(tdsdo);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	
	
	
	
	
}
