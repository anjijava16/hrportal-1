package com.sapta.hr.web.controller;

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

import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.AssetService;
import com.sapta.hr.service.BillsService;
import com.sapta.hr.service.ExpenseService;
import com.sapta.hr.service.InvoiceService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.service.ProfessionalTaxService;
import com.sapta.hr.service.TDSService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.AssetUtil;
import com.sapta.hr.web.util.BillsUtil;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.ExpenseUtil;
import com.sapta.hr.web.util.InvoiceUtil;
import com.sapta.hr.web.util.PayrollUtil;
import com.sapta.hr.web.util.ProfessionalTaxUtil;
import com.sapta.hr.web.util.TDSUtill;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/fyreports")
public class FYReportsController {
	String validation = null;
	
	static Logger logger = Logger.getLogger(FYReportsController.class.getName());
	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		try {
			
		} catch (Exception e) {
		}
		return null;
	}
	@RequestMapping(value = "/fybills")
	public String viewBillsReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_BILLS;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/getbillsreport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearBillsReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<BillsDO> billsList = new BillsService().getFinancialYearBillsReport(stdate, eddate, 'i');  // 'i' means paid status, 'a' means pending status
			if (billsList != null && billsList.size() > 0) {
				respJSON = BillsUtil.getbillsList(billsList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/fyinvoice")
	public String viewInvoiceReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_INVOICE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/getinvoicereport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearInvoiceReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<InvoiceDO> invoiceList = new InvoiceService().getFinancialYearInvoiceReport(stdate, eddate, 'i');  // 'i' means paid status, 'a' means pending status
			if (invoiceList != null && invoiceList.size() > 0) {
				respJSON = InvoiceUtil.getinvoiceList(invoiceList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/fyexpense")
	public String viewExpenseReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_EXPENSE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/getexpensereport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearExpenseReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<ExpenseDO> expenseList = new ExpenseService().getFinancialYearExpenseReport(stdate, eddate);
			if (expenseList != null && expenseList.size() > 0) {
				respJSON = ExpenseUtil.getExpenseList(expenseList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/fyasset")
	public String viewAssetReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_ASSET;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/getassetreport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearAssetReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<AssetDO> assetList = new AssetService().getFinancialYearAssetReport(stdate, eddate);
			if (assetList != null && assetList.size() > 0) {
				respJSON = AssetUtil.getAssetList(assetList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}

	
	@RequestMapping(value = "/fytds")
	public String viewTDSReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_TDS;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/gettdsreport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearTDSReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<TDSDO> tdsList = new TDSService().getFinancialYearTDSReport(stdate, eddate);
			if (tdsList != null && tdsList.size() > 0) {
				respJSON = TDSUtill.gettdsList(tdsList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/fyprofessionaltax")
	public String viewPTReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_PROFESSIONALTAX;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/getptreport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearPTReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().getFinancialYearProfessionalTaxReport(stdate, eddate);
			if (taxList != null && taxList.size() > 0) {
				respJSON = ProfessionalTaxUtil.getProfessionalTaxList(taxList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/fypayroll")
	public String viewPayrollReport(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_FY_PAYROLL;
			}
		} catch (Exception e) {
		}
		return pagename;
	}


	@RequestMapping(value = "/getpayrollreport/{firstdate}/{lastdate}", method = RequestMethod.GET)
	public @ResponseBody String getFinancialYearPayrollReport(Model model, @PathVariable String firstdate, @PathVariable String lastdate ) {
		JSONObject respJSON = null;
		try {
			Date stdate = CommonUtil.convertStringToDate(firstdate);
			Date eddate = CommonUtil.convertStringToDate(lastdate);
			List<PayrollDO> payrollList = new PayrollService().getFinancialYearPayrollReport(stdate, eddate);
			if (payrollList != null && payrollList.size() > 0) {
				respJSON = PayrollUtil.getPayrollDetailsList(payrollList);
			}else {
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
			}
		} catch (Exception e) {
			respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91031);
		}
		return respJSON != null ? respJSON.toString() : "";
	}
}
