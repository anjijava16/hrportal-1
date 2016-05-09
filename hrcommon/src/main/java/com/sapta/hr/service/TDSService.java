package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.TDSDAO;
import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.exception.AppException;

public class TDSService {
	static Logger logger = Logger.getLogger(TDSService.class.getName());
	
	public TDSDO persistTds(TDSDO tdsDO) throws AppException {
		return new TDSDAO().persist(tdsDO);
	}

	public List<TDSDO> retriveTds() throws AppException {
		return new TDSDAO().retrive();
	}

	public List<TDSDO> getFinancialYearTDSReport(Date stdate, Date eddate) throws AppException {
		return new TDSDAO().getFinancialYearTDSReport(stdate, eddate);
	}
	
	public List<TDSDO> retriveTdsById(long id) throws AppException {
		return new TDSDAO().retriveById(id);
	}
	
	public List<TDSDO> retriveTdsByEmpId(long id) throws AppException {
		return new TDSDAO().retriveByEmpId(id);
	}
	
	public List<TDSDO> retriveTdsByEmpIdMonth(long empid,Date tdsdate) throws AppException {
		return new TDSDAO().retriveTDSByEmpIdMonth(empid,tdsdate);
	}
	
	public List<TDSDO> retriveTdsByTDMONTH(String tdsmonth) throws AppException {
		return new TDSDAO().retriveByTDMONTH(tdsmonth);
	}
	
	public List<TDSDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new TDSDAO().FindAllEvents(stdate,eddate);
	}
	
	public List<TDSDO> FindByEmpIdAndDate(Long empid,Date tdsdate) throws AppException {
		return new TDSDAO().FindByEmpIdAndDate(empid,tdsdate);
	}
	
	public boolean update(TDSDO tdsDO) throws AppException {
		return new TDSDAO().update(tdsDO);
	}

	public boolean delete(TDSDO tdsDO) throws AppException {
		return new TDSDAO().delete(tdsDO);
	}
	

}
