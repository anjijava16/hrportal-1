package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpSportsDAO;
import com.sapta.hr.domainobject.EmpSportsDO;
import com.sapta.hr.exception.AppException;

public class EmpSportsService {
	public EmpSportsDO persist(EmpSportsDO empSportsDO) throws AppException {
		return new EmpSportsDAO().persist(empSportsDO);
	}
	
	public List<EmpSportsDO> retrive() throws AppException {
		return new EmpSportsDAO().retrive();
	}

	public List<EmpSportsDO> retriveById(long id) throws AppException {
		return new EmpSportsDAO().retriveById(id);
	}
	
	public List<EmpSportsDO> retriveByEmpId(long id) throws AppException {
		return new EmpSportsDAO().retriveByEmpId(id);
	}

	public boolean update(EmpSportsDO empSportsDO) throws AppException {
		return new EmpSportsDAO().update(empSportsDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpSportsDAO().delete(id);
	}

}
