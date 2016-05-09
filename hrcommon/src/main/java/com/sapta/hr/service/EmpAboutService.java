package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpAboutDAO;
import com.sapta.hr.domainobject.EmpAboutDO;
import com.sapta.hr.exception.AppException;

public class EmpAboutService {
	public EmpAboutDO persist(EmpAboutDO empAboutDO) throws AppException {
		return new EmpAboutDAO().persist(empAboutDO);
	}
	
	public List<EmpAboutDO> retrive() throws AppException {
		return new EmpAboutDAO().retrive();
	}

	public List<EmpAboutDO> retriveById(long id) throws AppException {
		return new EmpAboutDAO().retriveById(id);
	}
	
	public List<EmpAboutDO> retriveByEmpId(long id) throws AppException {
		return new EmpAboutDAO().retriveByEmpId(id);
	}

	public boolean update(EmpAboutDO empAboutDO) throws AppException {
		return new EmpAboutDAO().update(empAboutDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpAboutDAO().delete(id);
	}

}
