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

import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.ExpTypeService;
import com.sapta.hr.service.ExpenseService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ExpenseUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/expense")
public class ExpenseController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(ExpenseController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_EXPENSE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/viewexpense", method = RequestMethod.GET)
	public String viewIntExpense(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VIEW_EXPENSE;
				List<ExpenseDO> expenseList = new ExpenseService().retrive();
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retrive();
				if (expenseList != null && expenseList.size() > 0) {
					Collections.reverse(expenseList);
					Collections.reverse(expenseTypeList);
					model.addAttribute(CommonConstants.EXPENSE_LIST, expenseList);
					model.addAttribute(CommonConstants.EXPENSE_LIST_SIZE, expenseList.size());
					model.addAttribute(CommonConstants.EXP_TYPE_LIST, expenseTypeList);
					model.addAttribute(CommonConstants.EXP_TYPE_LIST_SIZE, expenseTypeList.size());
					
				}
			}
		} catch (Exception e) {	}
		return pagename;
	}
	
	@RequestMapping(value = "/viewfyexpense/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_EXPENSE;
				List<ExpenseDO> expenseList = new ExpenseService().retrive();
				List<ExpTypeDO> expenseTypeList = new ExpTypeService().retrive();
				if (expenseList != null && expenseList.size() > 0) {
					model.addAttribute(CommonConstants.EXPENSE_LIST, expenseList);
					model.addAttribute(CommonConstants.EXPENSE_LIST_SIZE, expenseList.size());
					model.addAttribute(CommonConstants.EXP_TYPE_LIST, expenseTypeList);
					model.addAttribute(CommonConstants.EXP_TYPE_LIST_SIZE, expenseTypeList.size());
					
				}
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getbymonth/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdDate(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String sDate = ptmonth;		   
			Date startDate = CommonUtil.convertStringToDate(sDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(startDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date endDate= c.getTime();
			List<ExpenseDO> expenseList = new ExpenseService().getExpenseReport(startDate, endDate);
			if (expenseList != null) {
				respJSON = ExpenseUtil.getExpenseDataTableList(expenseList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbydatetotalamount/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmountByDate(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String sDate = ptmonth;		   
			Date startDate = CommonUtil.convertStringToDate(sDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(startDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date endDate= c.getTime();
			List<ExpenseDO> expenseList = new ExpenseService().getExpenseReport(startDate, endDate);
			if (expenseList != null) {
				respJSON = ExpenseUtil.getExpenseList(expenseList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<ExpenseDO> expenseList = new ExpenseService().retrive();
			if (expenseList != null) {
				Collections.reverse(expenseList);
				respJSON = ExpenseUtil.getExpenseDataTableList(expenseList);
			}
		} catch (Exception e) {
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/gettotalamount", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmount(Model model) {
		JSONObject respJSON = null;
		try {
			List<ExpenseDO> expenseList = new ExpenseService().retrive();
			if (expenseList != null) {
				respJSON = ExpenseUtil.getExpenseList(expenseList);
			}
		} catch (Exception e) {
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get/{type}", method = RequestMethod.GET)
	public @ResponseBody String getByType(@PathVariable String type, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			List<ExpenseDO> expenseList = new ExpenseService().retriveByType(type);

			if (expenseList != null) {
				respJSON = ExpenseUtil.getExpenseDataTableList(expenseList);
			}
		} catch (Exception e) {
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getforajax/{type}", method = RequestMethod.GET)
	public @ResponseBody String getByTypeajax(@PathVariable String type, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			List<ExpenseDO> expenseList = new ExpenseService().retriveByType(type);

			if (expenseList != null && expenseList.size() > 0) {
				respJSON = ExpenseUtil.getExpenseList(expenseList);
			}else{
				respJSON = CommonWebUtil.buildErrorResponse("fail");
			}
		} catch (Exception e) {
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/addexpense", method = RequestMethod.GET)
	public String addEmployee(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<ExpTypeDO> expTypeList = new ExpTypeService().retrive();
				if (expTypeList != null && expTypeList.size() > 0) {
					model.addAttribute(CommonConstants.EXP_TYPE_LIST, expTypeList);
				}
				pagename = CommonConstants.JSP_ADD_EXPENSE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/add/{category}/{date}/{exptypeid}/{descrip}/{billno}/{mode}/{cardno}/{amount}/{bankname}", method = RequestMethod.GET)
	public @ResponseBody String addinternal(@PathVariable String date, @PathVariable long exptypeid, @PathVariable char category, @PathVariable String descrip,
		@PathVariable String billno, @PathVariable char mode, @PathVariable String cardno, @PathVariable double amount, @PathVariable String bankname,
		Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ExpenseDO expensedo = new ExpenseDO();
				
				if (category == 'I') expensedo.setCategory("internal");
				else if (category == 'E') expensedo.setCategory("external");
				expensedo.setModeofpay(mode);
				expensedo.setExpdate(CommonUtil.convertStringToDate(date));
				expensedo.setExptypeid(exptypeid);
				expensedo.setDescription(descrip);
				expensedo.setAmount(amount);

				if (!billno.equalsIgnoreCase("null")) expensedo.setBillno(billno);
				if (!cardno.equalsIgnoreCase("null")) expensedo.setCardno(cardno);
				if (!bankname.equalsIgnoreCase("null"))	expensedo.setBankname(bankname);

				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				expensedo.setUpdatedby(user.getUsername());
				expensedo.setUpdatedon(new Date());
				new ExpenseService().persistExpense(expensedo);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/update/{id}/{category}/{date}/{exptypeid}/{descrip}/{billno}/{mode}/{cardno}/{amount}/{bankname}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String date, @PathVariable long exptypeid, @PathVariable String category, 
		@PathVariable String descrip, @PathVariable String billno, @PathVariable char mode, @PathVariable String cardno, @PathVariable double amount, 
		@PathVariable String bankname, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				ExpenseDO expensedo = new ExpenseDO();
				expensedo.setId(id);
				if (category.equalsIgnoreCase("internal")) expensedo.setCategory("internal");
				else if (category.equalsIgnoreCase("external")) expensedo.setCategory("external");

				expensedo.setModeofpay(mode);
				expensedo.setExpdate(CommonUtil.convertStringToDate(date));
				expensedo.setExptypeid(exptypeid);
				expensedo.setDescription(descrip);
				expensedo.setAmount(amount);
				
				if (!billno.equalsIgnoreCase("null")) expensedo.setBillno(billno);
				if (!cardno.equalsIgnoreCase("null")) expensedo.setCardno(cardno);
				if (!bankname.equalsIgnoreCase("null"))	expensedo.setBankname(bankname);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				expensedo.setUpdatedby(user.getUsername());
				expensedo.setUpdatedon(new Date());
				new ExpenseService().updateExpense(expensedo);
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
				List <ExpenseDO> expList = new ExpenseService().retriveById(id);
				for(ExpenseDO expensedo:expList){
					new ExpenseService().deleteExpense(expensedo);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retrivebyId(@PathVariable long id, Model model, HttpServletRequest request) {
		String jsonresp = null;
		try {
			List <ExpenseDO> expList = new ExpenseService().retriveById(id);
			jsonresp = ExpenseUtil.getExpenseList(expList).toString();
			
		} catch (Exception e) { }
		
		return jsonresp != null ? jsonresp.toString() : "";
	}
}
