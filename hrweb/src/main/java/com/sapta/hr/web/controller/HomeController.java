package com.sapta.hr.web.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.BillsService;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.ExpenseService;
import com.sapta.hr.service.InvoiceService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/home")
public class HomeController {

	String validation = null;
	
	static Logger logger = Logger.getLogger(HomeController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		int currentmonth = Calendar.getInstance().get(Calendar.MONTH);
		int nextYear = currentYear+1;
		if(currentmonth < 3){
			currentYear = currentYear-1;
			nextYear = currentYear+1;
		}
		//Start Year
		String currentdate = "01-04-"+currentYear;
		Date stdate = CommonUtil.convertStringToDate(currentdate);
		//End Year 
		String nextdate = "31-03-"+nextYear;
		Date eddate = CommonUtil.convertStringToDate(nextdate);
		
		try {
			List<EmployeeDO> employeeList = new EmployeeService().retriveEmployeeActive();
			List<ProjectDO> projectList = new ProjectService().retriveActiveProject();
			List<CustomerDO> customerList = new CustomerService().retrive();
			List<VendorDO> vendorList = new VendorService().retrive();
			List<ExpenseDO> expenseList = new ExpenseService().retrive();
			List<BillsDO> billsList = new BillsService().retrivebystatus('a');
			List<InvoiceDO> invoiceList = new InvoiceService().retrivebystatus('a');
			List<PayrollDO> payrollList = new PayrollService().FindByStartAndEndDate(stdate, eddate);
			
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_HOME;
			}
			
			//Active Employee List Size
			if (employeeList != null && employeeList.size() > 0) {
				model.addAttribute(CommonConstants.EMP_ACTIVE_LIST_SIZE, employeeList.size());
			} else {
				model.addAttribute(CommonConstants.EMP_ACTIVE_LIST_SIZE, "NA");
			}
			
			//Active Project List Size
			if (projectList != null && projectList.size() > 0) {
				model.addAttribute(CommonConstants.PROJECT_ACTIVE_LIST_SIZE, projectList.size());
			} else {
				model.addAttribute(CommonConstants.PROJECT_ACTIVE_LIST_SIZE, "NA");
			}
			
			//Customer List Size
			if (customerList != null && customerList.size() > 0) {
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, customerList.size());
			} else {
				model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, "NA");
			}
			
			//Vendor List Size
			if (vendorList != null && vendorList.size() > 0) {
				model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, vendorList.size());
			} else {
				model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, "NA");
			}
			
			//Expense Total Amount
			double totalexpenseamount = 0;
			if (expenseList != null && expenseList.size() > 0) {
				
				for(ExpenseDO expenseDO : expenseList){
					totalexpenseamount += expenseDO.getAmount();
				}
				model.addAttribute(CommonConstants.EXPENSE_TOTAL_AMOUNT, CommonUtil.convertnumberValueWithcomma(totalexpenseamount));
			} else {
				model.addAttribute(CommonConstants.EXPENSE_TOTAL_AMOUNT, "NA");
			}
			
			//Bills Pending List Size
			if (billsList != null && billsList.size() > 0) {
				model.addAttribute(CommonConstants.BILLS_LIST, billsList);
				model.addAttribute(CommonConstants.BILLS_LIST_SIZE, billsList.size());
			} else {
				model.addAttribute(CommonConstants.BILLS_LIST_SIZE, "NA");
			}
			
			//Invoice Pending List Size
			if (invoiceList != null && invoiceList.size() > 0) {
				model.addAttribute(CommonConstants.INVOICE_LIST_SIZE, invoiceList.size());
			} else {
				model.addAttribute(CommonConstants.INVOICE_LIST_SIZE, "NA");
			}
			
			//Payroll Total Amount
			double totalamount = 0;
			if (payrollList != null && payrollList.size() > 0) {
				
				for(PayrollDO payrollDO : payrollList){
					totalamount += payrollDO.getNetpayableamount();
				}
				model.addAttribute(CommonConstants.PAYROLL_TOTAL_AMOUNT, CommonUtil.convertnumberValueWithcomma(totalamount));
			} else {
				model.addAttribute(CommonConstants.PAYROLL_TOTAL_AMOUNT, "NA");
			}
			
		} catch (Exception e) {
		}
		return pagename;
	}
}