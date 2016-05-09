package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpSkillSetDAO;
import com.sapta.hr.domainobject.EmpSkillSetDO;
import com.sapta.hr.exception.AppException;

public class EmpSkillSetService {
	public EmpSkillSetDO persist(EmpSkillSetDO empSkillSetDO) throws AppException {
		return new EmpSkillSetDAO().persist(empSkillSetDO);
	}
	
	public List<EmpSkillSetDO> retrive() throws AppException {
		return new EmpSkillSetDAO().retrive();
	}

	public List<EmpSkillSetDO> retriveById(long id) throws AppException {
		return new EmpSkillSetDAO().retriveById(id);
	}
	
	public List<EmpSkillSetDO> retriveByEmpId(long id) throws AppException {
		return new EmpSkillSetDAO().retriveByEmpId(id);
	}

	public boolean update(EmpSkillSetDO empSkillSetDO) throws AppException {
		return new EmpSkillSetDAO().update(empSkillSetDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpSkillSetDAO().delete(id);
	}

}
