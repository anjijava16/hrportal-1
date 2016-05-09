package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.PayrollDAO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.exception.AppException;

public class PayrollService {

	static Logger logger = Logger.getLogger(PayrollService.class.getName());
	
	public PayrollDO persist(PayrollDO payrollDO) throws AppException {
		return new PayrollDAO().persist(payrollDO);
	}
	
	public List<PayrollDO> retrive() throws AppException {
		return new PayrollDAO().retrive();
	}
	
	public List<PayrollDO> FindByStartAndEndDate(Date stdate,Date eddate) throws AppException {
		return new PayrollDAO().FindByStartAndEndDate(stdate,eddate);
	}
	
	public List<PayrollDO> retriveByMonth(Date payrollmonth) throws AppException {
		return new PayrollDAO().retriveByMonth(payrollmonth);
	}
	
	public List<PayrollDO> getFinancialYearPayrollReport(Date stdate, Date eddate) throws AppException {
		return new PayrollDAO().getFinancialYearPayrollReport(stdate, eddate);
	}
	public List<PayrollDO> retriveByEmpidMonth(long empid, Date eddate) throws AppException {
		return new PayrollDAO().retriveByEmpidMonth(empid, eddate);
	}

	public List<PayrollDO> retrivebyid(long  empid) throws AppException {
		return new PayrollDAO().retrivebyid(empid);
	}

}
