package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpAccDetailDAO;
import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.exception.AppException;

public class EmpAccDetailService {
	public EmpAccDetailDO persist(EmpAccDetailDO empAccDetailDO) throws AppException {
		return new EmpAccDetailDAO().persist(empAccDetailDO);
	}
	
	public List<EmpAccDetailDO> retrive() throws AppException {
		return new EmpAccDetailDAO().retrive();
	}
	
	public List<EmpAccDetailDO> retriveById(long id) throws AppException {
		return new EmpAccDetailDAO().retriveById(id);
	}

	public List<EmpAccDetailDO> retriveByEmpId(long id) throws AppException {
		return new EmpAccDetailDAO().retriveByEmpId(id);
	}

	public boolean update(EmpAccDetailDO empAccDetailDO) throws AppException {
		return new EmpAccDetailDAO().update(empAccDetailDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpAccDetailDAO().delete(id);
	}
	
}
