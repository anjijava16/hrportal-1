package com.sapta.hr.service;

import java.util.List;

import com.sapta.hr.dao.EmpAchievementsDAO;
import com.sapta.hr.domainobject.EmpAchievementsDO;
import com.sapta.hr.exception.AppException;

public class EmpAchievementsService {
	public EmpAchievementsDO persist(EmpAchievementsDO empAchievementsDO) throws AppException {
		return new EmpAchievementsDAO().persist(empAchievementsDO);
	}
	
	public List<EmpAchievementsDO> retrive() throws AppException {
		return new EmpAchievementsDAO().retrive();
	}

	public List<EmpAchievementsDO> retriveById(long id) throws AppException {
		return new EmpAchievementsDAO().retriveById(id);
	}
	
	public List<EmpAchievementsDO> retriveByEmpId(long id) throws AppException {
		return new EmpAchievementsDAO().retriveByEmpId(id);
	}

	public boolean update(EmpAchievementsDO empAchievementsDO) throws AppException {
		return new EmpAchievementsDAO().update(empAchievementsDO);
	}

	public boolean delete(long id) throws AppException {
		return new EmpAchievementsDAO().delete(id);
	}

}
