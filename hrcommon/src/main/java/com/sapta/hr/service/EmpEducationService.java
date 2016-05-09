package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpEducationDAO;
import com.sapta.hr.domainobject.EmpEducationDO;
import com.sapta.hr.exception.AppException;

public class EmpEducationService {
	public EmpEducationDO persist(EmpEducationDO empEducationDO) throws AppException {
		return new EmpEducationDAO().persist(empEducationDO);
	}
	
	public List<EmpEducationDO> retrive() throws AppException {
		return new EmpEducationDAO().retrive();
	}

	public List<EmpEducationDO> retriveById(long id) throws AppException {
		return new EmpEducationDAO().retriveById(id);
	}
	
	public List<EmpEducationDO> retriveByEmpId(long id) throws AppException {
		return new EmpEducationDAO().retriveByEmpId(id);
	}

	public boolean update(EmpEducationDO empEducationDO) throws AppException {
		return new EmpEducationDAO().update(empEducationDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpEducationDAO().delete(id);
	}

}
