package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpLanguageKnownDAO;
import com.sapta.hr.domainobject.EmpLanguageKnownDO;
import com.sapta.hr.exception.AppException;

public class EmpLanguageKnownService {
	public EmpLanguageKnownDO persist(EmpLanguageKnownDO empLanguageKnownDO) throws AppException {
		return new EmpLanguageKnownDAO().persist(empLanguageKnownDO);
	}
	
	public List<EmpLanguageKnownDO> retrive() throws AppException {
		return new EmpLanguageKnownDAO().retrive();
	}

	public List<EmpLanguageKnownDO> retriveById(long id) throws AppException {
		return new EmpLanguageKnownDAO().retriveById(id);
	}
	
	public List<EmpLanguageKnownDO> retriveByEmpId(long id) throws AppException {
		return new EmpLanguageKnownDAO().retriveByEmpId(id);
	}

	public boolean update(EmpLanguageKnownDO empLanguageKnownDO) throws AppException {
		return new EmpLanguageKnownDAO().update(empLanguageKnownDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpLanguageKnownDAO().delete(id);
	}

}
