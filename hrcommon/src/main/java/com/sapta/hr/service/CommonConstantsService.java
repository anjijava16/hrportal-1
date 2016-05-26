package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.CommonConstantsDAO;
import com.sapta.hr.domainobject.CommonConstantsDO;
import com.sapta.hr.exception.AppException;

public class CommonConstantsService {
	
	/*public String persist(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().persist(empctcDO);
	}*/
	
	public List<CommonConstantsDO> retrive() throws AppException {
		return new CommonConstantsDAO().retrive();
	}
	
	/*public List<EmpCTCDO> retriveactive() throws AppException {
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
	
	public List<EmpCTCDO> retriveByStatus(long id) throws AppException {
		return new EmpCTCDAO().retriveByStatus(id);
	}

	public boolean update(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().update(empctcDO);
	}

	public boolean delete(EmpCTCDO empctcDO) throws AppException {
		return new EmpCTCDAO().delete(empctcDO);
	}*/
	
	
}
