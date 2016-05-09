package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpCulturalsDAO;
import com.sapta.hr.domainobject.EmpCulturalsDO;
import com.sapta.hr.exception.AppException;

public class EmpCulturalsService {
	public EmpCulturalsDO persist(EmpCulturalsDO empCulturalsDO) throws AppException {
		return new EmpCulturalsDAO().persist(empCulturalsDO);
	}
	
	public List<EmpCulturalsDO> retrive() throws AppException {
		return new EmpCulturalsDAO().retrive();
	}

	public List<EmpCulturalsDO> retriveById(long id) throws AppException {
		return new EmpCulturalsDAO().retriveById(id);
	}
	
	public List<EmpCulturalsDO> retriveByEmpId(long id) throws AppException {
		return new EmpCulturalsDAO().retriveByEmpId(id);
	}

	public boolean update(EmpCulturalsDO empCulturalsDO) throws AppException {
		return new EmpCulturalsDAO().update(empCulturalsDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpCulturalsDAO().delete(id);
	}

}
