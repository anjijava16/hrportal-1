package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpFamilyBackgroundDAO;
import com.sapta.hr.domainobject.EmpFamilyBackgroundDO;
import com.sapta.hr.exception.AppException;

public class EmpFamilyBackgroundService {
	public EmpFamilyBackgroundDO persist(EmpFamilyBackgroundDO empFamilyBackgroundDO) throws AppException {
		return new EmpFamilyBackgroundDAO().persist(empFamilyBackgroundDO);
	}
	
	public List<EmpFamilyBackgroundDO> retrive() throws AppException {
		return new EmpFamilyBackgroundDAO().retrive();
	}

	public List<EmpFamilyBackgroundDO> retriveById(long id) throws AppException {
		return new EmpFamilyBackgroundDAO().retriveById(id);
	}
	
	public List<EmpFamilyBackgroundDO> retriveByEmpId(long id) throws AppException {
		return new EmpFamilyBackgroundDAO().retriveByEmpId(id);
	}

	public boolean update(EmpFamilyBackgroundDO empFamilyBackgroundDO) throws AppException {
		return new EmpFamilyBackgroundDAO().update(empFamilyBackgroundDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpFamilyBackgroundDAO().delete(id);
	}

}
