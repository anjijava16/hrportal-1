package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.EmpCTCDAO;
import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.exception.AppException;

public class EmpCTCService {
	public String persist(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().persist(empctcDO);
	}
	
	public List<EmpCTCDO> retrive() throws AppException {
		return new EmpCTCDAO().retrive();
	}
	
	public List<EmpCTCDO> retriveactive() throws AppException {
		return new EmpCTCDAO().retriveactive();
	}
	
	public List<EmpCTCDO> retriveByEmpIdActive(long id) throws AppException {
		return new EmpCTCDAO().retriveByEmpIdActive(id);
	}
	
	public List<EmpCTCDO> retriveById(long id) throws AppException {
		return new EmpCTCDAO().retriveById(id);
	}

	public List<EmpCTCDO> retriveByEmpId(long id) throws AppException {
		return new EmpCTCDAO().retriveByEmpId(id);
	}
	
	public boolean update(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().update(empctcDO);
	}

	public boolean delete(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().delete(empctcDO);
	}
	
	 public List<EmpCTCDO> retriveByDate(long id, Date  month ) throws AppException {
		return new EmpCTCDAO().retriveByDate( id, month);
	}
	
	
}
