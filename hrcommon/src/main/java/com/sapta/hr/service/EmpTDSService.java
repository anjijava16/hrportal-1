package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.EmpTDSDAO;
import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.exception.AppException;

public class EmpTDSService {
	public String persist(EmpTDSDO emptdsPayDO) throws AppException {
		return new EmpTDSDAO().persist(emptdsPayDO);
	}
	
	public List<EmpTDSDO> retrive() throws AppException {
		return new EmpTDSDAO().retrive();
	}
	
	public List<EmpTDSDO> retriveByEmpId(long id) throws AppException {
		return new EmpTDSDAO().retriveByEmpId(id);
	}
	
	public List<EmpTDSDO> retriveById(long id) throws AppException {
		return new EmpTDSDAO().retriveById(id);
	}
	
	public List<EmpTDSDO> retriveByEmpIdMonth(long empid,Date tdsmonth) throws AppException {
		return new EmpTDSDAO().retriveByEmpIdMonth(empid,tdsmonth);
	}
	
	public boolean update(EmpTDSDO empTDSDO) throws AppException {
		return new EmpTDSDAO().update(empTDSDO);
	}
	
	public boolean delete(EmpTDSDO empTDSDO) throws AppException {
		return new EmpTDSDAO().delete(empTDSDO);
	}
	
}
