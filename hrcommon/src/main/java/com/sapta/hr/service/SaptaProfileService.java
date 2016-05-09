package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.SaptaProfileDAO;
import com.sapta.hr.domainobject.SaptaProfileDO;
import com.sapta.hr.exception.AppException;

public class SaptaProfileService {
	
	public SaptaProfileDO persist(SaptaProfileDO saptaprofileDO) throws AppException {
		return new SaptaProfileDAO().persist(saptaprofileDO);
	}
	
	public SaptaProfileDO retrive() throws AppException {
		return new SaptaProfileDAO().retrive();
	}
	
	public List<SaptaProfileDO> retriveList() throws AppException {
		return new SaptaProfileDAO().retriveList();
	}
	
	public List<SaptaProfileDO> retriveById(long id) throws AppException {
		return new SaptaProfileDAO().retriveById(id);
	}
	
	public boolean delete(SaptaProfileDO saptaprofileDO) throws AppException {
		return new SaptaProfileDAO().delete(saptaprofileDO);
	}

	public boolean update(SaptaProfileDO saptaprofileDO) throws AppException {
		return new SaptaProfileDAO().update(saptaprofileDO);
	}
}
