package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.ExpTypeDAO;
import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.exception.AppException;

public class ExpTypeService {

	static Logger logger = Logger.getLogger(ExpTypeService.class.getName());
	
	public ExpTypeDO persist(ExpTypeDO exptypeDO) throws AppException {
		return new ExpTypeDAO().persist(exptypeDO);
	}

	public List<ExpTypeDO> retrive() throws AppException {
		return new ExpTypeDAO().retrive();
	}

	public List<ExpTypeDO> retriveById(long id) throws AppException {
		return new ExpTypeDAO().retriveById(id);
	}
	
	public boolean update(ExpTypeDO exptypeDO) throws AppException {
		return new ExpTypeDAO().update(exptypeDO);
	}

	public boolean delete(ExpTypeDO exptypeDO) throws AppException {
		return new ExpTypeDAO().delete(exptypeDO);
	}

}
