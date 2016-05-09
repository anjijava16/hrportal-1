package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.EmpLoseOfPayDAO;
import com.sapta.hr.domainobject.EmpLoseOfPayDO;
import com.sapta.hr.exception.AppException;

public class EmpLoseOfPayService {
	public String persist(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		return new EmpLoseOfPayDAO().persist(empLoseOfPayDO);
	}
	
	public List<EmpLoseOfPayDO> retrive() throws AppException {
		return new EmpLoseOfPayDAO().retrive();
	}
	
	public List<EmpLoseOfPayDO> retriveactive() throws AppException {
		return new EmpLoseOfPayDAO().retriveactive();
	}
	
	public List<EmpLoseOfPayDO> retriveByEmpIdActive(long id) throws AppException {
		return new EmpLoseOfPayDAO().retriveByEmpIdActive(id);
	}
	
	public List<EmpLoseOfPayDO> retriveById(long id) throws AppException {
		return new EmpLoseOfPayDAO().retriveById(id);
	}

	public List<EmpLoseOfPayDO> retriveByEmpId(long id) throws AppException {
		return new EmpLoseOfPayDAO().retriveByEmpId(id);
	}
	
	public List<EmpLoseOfPayDO> retriveByEmpIdAndStartdateEnddate(long id, Date startdate, Date enddate) throws AppException {
		return new EmpLoseOfPayDAO().retriveByEmpIdAndStartdateEnddate(id, startdate, enddate);
	}
	
	public boolean update(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		return new EmpLoseOfPayDAO().update(empLoseOfPayDO);
	}

	public boolean delete(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		return new EmpLoseOfPayDAO().delete(empLoseOfPayDO);
	}
	
	 public List<EmpLoseOfPayDO> retriveByDate(long id, Date  month ) throws AppException {
		return new EmpLoseOfPayDAO().retriveByDate( id, month);
	}
	
	
}
