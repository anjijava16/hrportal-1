package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpDetailDAO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.exception.AppException;

public class EmpDetailService {
	public EmpDetailDO persist(EmpDetailDO empdetail) throws AppException {
		return new EmpDetailDAO().persist(empdetail);
	}
	
	public List<EmpDetailDO> retrive() throws AppException {
		return new EmpDetailDAO().retrive();
	}

	public List<EmpDetailDO> retriveById(long id) throws AppException {
		return new EmpDetailDAO().retriveById(id);
	}
	
	public List<EmpDetailDO> retriveByEmpId(long id) throws AppException {
		return new EmpDetailDAO().retriveByEmpId(id);
	}

	public boolean update(EmpDetailDO empdetailDO) throws AppException {
		return new EmpDetailDAO().update(empdetailDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpDetailDAO().delete(id);
	}

}
