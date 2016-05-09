package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpReferencesDAO;
import com.sapta.hr.domainobject.EmpReferencesDO;
import com.sapta.hr.exception.AppException;

public class EmpReferencesService {
	public EmpReferencesDO persist(EmpReferencesDO empReferencesDO) throws AppException {
		return new EmpReferencesDAO().persist(empReferencesDO);
	}
	
	public List<EmpReferencesDO> retrive() throws AppException {
		return new EmpReferencesDAO().retrive();
	}

	public List<EmpReferencesDO> retriveById(long id) throws AppException {
		return new EmpReferencesDAO().retriveById(id);
	}
	
	public List<EmpReferencesDO> retriveByEmpId(long id) throws AppException {
		return new EmpReferencesDAO().retriveByEmpId(id);
	}

	public boolean update(EmpReferencesDO empReferencesDO) throws AppException {
		return new EmpReferencesDAO().update(empReferencesDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpReferencesDAO().delete(id);
	}

}
