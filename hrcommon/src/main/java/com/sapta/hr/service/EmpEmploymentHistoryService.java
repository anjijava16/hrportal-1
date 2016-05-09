package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpEmploymentHistoryDAO;
import com.sapta.hr.domainobject.EmpEmploymentHistoryDO;
import com.sapta.hr.exception.AppException;

public class EmpEmploymentHistoryService {
	
	public EmpEmploymentHistoryDO persist(EmpEmploymentHistoryDO empEmploymentHistoryDO) throws AppException {
		return new EmpEmploymentHistoryDAO().persist(empEmploymentHistoryDO);
	}
	
	public List<EmpEmploymentHistoryDO> retrive() throws AppException {
		return new EmpEmploymentHistoryDAO().retrive();
	}

	public List<EmpEmploymentHistoryDO> retriveById(long id) throws AppException {
		return new EmpEmploymentHistoryDAO().retriveById(id);
	}
	
	public List<EmpEmploymentHistoryDO> retriveByEmpId(long id) throws AppException {
		return new EmpEmploymentHistoryDAO().retriveByEmpId(id);
	}

	public boolean update(EmpEmploymentHistoryDO empEmploymentHistoryDO) throws AppException {
		return new EmpEmploymentHistoryDAO().update(empEmploymentHistoryDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpEmploymentHistoryDAO().delete(id);
	}

}
