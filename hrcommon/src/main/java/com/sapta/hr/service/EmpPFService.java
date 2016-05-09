package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.EmpPFDAO;
import com.sapta.hr.domainobject.EmpPFDO;
import com.sapta.hr.exception.AppException;

public class EmpPFService {

	public String persist(EmpPFDO emppfDO) throws AppException {
		return new EmpPFDAO().persist(emppfDO);
	}

	public boolean update(EmpPFDO emppfdo) throws AppException {
		return new EmpPFDAO().update(emppfdo);
	}

	public List<EmpPFDO> retrive() throws AppException {
		return new EmpPFDAO().retrive();
	}

	public boolean delete(long id) throws AppException {
		return new EmpPFDAO().delete(id);
	}
	
	public List<EmpPFDO> retriveById(long id) throws AppException {
		return new EmpPFDAO().retriveById(id);
	}
	
	public List<EmpPFDO> retriveByEmpId(long id) throws AppException {
		return new EmpPFDAO().retriveByEmpId(id);
	}
	
	public List<EmpPFDO> retriveByEmpIdMonth(long empid,Date  month) throws AppException {
		return new EmpPFDAO().retriveByEmpIdMonth(empid,month);
	}
	
	public List<EmpPFDO> FindByEmpIdAndDate(Long empid,Date pfdate) throws AppException {
		return new EmpPFDAO().FindByEmpIdAndDate(empid,pfdate);
	}
	
}
