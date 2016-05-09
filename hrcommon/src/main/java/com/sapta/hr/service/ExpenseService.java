package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.ExpenseDAO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.exception.AppException;

public class ExpenseService {

	static Logger logger = Logger.getLogger(ExpenseService.class.getName());
	
	public ExpenseDO persistExpense(ExpenseDO expenseDO) throws AppException {
		return new ExpenseDAO().persist(expenseDO);
	}

	public List<ExpenseDO> retrive() throws AppException {
		return new ExpenseDAO().retrive();
	}

	public List<ExpenseDO> retriveById(long id) throws AppException {
		return new ExpenseDAO().retriveById(id);
	}
	
	public List<ExpenseDO> retriveByType(String type) throws AppException {
		return new ExpenseDAO().retriveByType(type);
	}
	
	public List<ExpenseDO> getExpenseReport(Date stdate, Date eddate) throws AppException {
		return new ExpenseDAO().getFinancialYearExpenseReport(stdate, eddate);
	}
	
	public List<ExpenseDO> getFinancialYearExpenseReport(Date stdate, Date eddate) throws AppException {
		return new ExpenseDAO().getFinancialYearExpenseReport(stdate, eddate);
	}
	
	public boolean updateExpense(ExpenseDO expenseDO) throws AppException {
		return new ExpenseDAO().update(expenseDO);
	}
	
	public boolean deleteExpense(ExpenseDO expenseDO) throws AppException {
		return new ExpenseDAO().delete(expenseDO);
	}

	
}
