package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.EmpAssignmentDAO;
import com.sapta.hr.domainobject.EmpAssignmentDO;
import com.sapta.hr.exception.AppException;

public class EmpAssignmentService {

	static Logger logger = Logger.getLogger(EmpAssignmentService.class.getName());

	public EmpAssignmentDO persist(EmpAssignmentDO empassigndo) throws AppException {
		return new EmpAssignmentDAO().persist(empassigndo);
	}
	
	public List<EmpAssignmentDO> retrive() throws AppException {
		return new EmpAssignmentDAO().retrive();
	}

	public List<EmpAssignmentDO> retriveById(long id) throws AppException {
		return new EmpAssignmentDAO().retriveById(id);
	}
	
	public List<EmpAssignmentDO> retriveByProjectId(long id) throws AppException {
		return new EmpAssignmentDAO().retriveByProjectId(id);
	}
	
	public List<EmpAssignmentDO> retriveByEmpId(long id) throws AppException {
		return new EmpAssignmentDAO().retriveByEmpId(id);
	}

	public boolean update(EmpAssignmentDO empassigndo) throws AppException {
		return new EmpAssignmentDAO().update(empassigndo);
	}
	
	public boolean delete(EmpAssignmentDO empassigndo) throws AppException {
		return new EmpAssignmentDAO().delete(empassigndo);
	}

}
