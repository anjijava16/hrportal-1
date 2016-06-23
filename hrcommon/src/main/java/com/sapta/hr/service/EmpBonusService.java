package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.EmpBonusDAO;
import com.sapta.hr.dao.EmpTDSDAO;
import com.sapta.hr.domainobject.EmpBonusDO;
import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.exception.AppException;

public class EmpBonusService {
	public String persist(EmpBonusDO empbonusPayDO) throws AppException {
		return new EmpBonusDAO().persist(empbonusPayDO);
	}
	
	public List<EmpBonusDO> retrive() throws AppException {
		return new EmpBonusDAO().retrive();
	}
	
	public List<EmpBonusDO> retriveByEmpId(long id) throws AppException {
		return new EmpBonusDAO().retriveByEmpId(id);
	}
	
	public List<EmpBonusDO> retriveById(long id) throws AppException {
		return new EmpBonusDAO().retriveById(id);
	}
	
	public List<EmpBonusDO> retriveByEmpIdMonth(long empid,Date bonusmonth) throws AppException {
		return new EmpBonusDAO().retriveByEmpIdMonth(empid,bonusmonth);
	}
	
	public boolean update(EmpBonusDO empBonusDO) throws AppException {
		return new EmpBonusDAO().update(empBonusDO);
	}
	
	public boolean delete(EmpBonusDO empBonusDO) throws AppException {
		return new EmpBonusDAO().delete(empBonusDO);
	}

	public List<EmpBonusDO> getFinancialYearEmpBonusReport(Date stdate, Date eddate) throws AppException {
		return new EmpBonusDAO().getFinancialYearEmpBonusReport(stdate, eddate);
	}
	public List<EmpBonusDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new EmpBonusDAO().FindAllEvents(stdate,eddate);
	}
}
