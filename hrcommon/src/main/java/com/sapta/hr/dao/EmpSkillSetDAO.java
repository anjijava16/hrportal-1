package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpSkillSetDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpSkillSetDAO {
	
	static Logger logger = Logger.getLogger(EmpSkillSetDAO.class.getName());
	
	private EntityManager em = null;

	public EmpSkillSetDO persist(EmpSkillSetDO empSkillSetDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empSkillSetDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empSkillSetDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empSkillSetDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpSkillSetDO> retrive() throws AppException {
		List<EmpSkillSetDO> empSkillSetList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpSkillSetDO.FIND_ALL);
				empSkillSetList = (List<EmpSkillSetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empSkillSetList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpSkillSetDO> retriveById(long id) throws AppException {
		List<EmpSkillSetDO> empSkillSetList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpSkillSetDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empSkillSetList = (List<EmpSkillSetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empSkillSetList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpSkillSetDO> retriveByEmpId(long id) throws AppException {
		List<EmpSkillSetDO> empSkillSetList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpSkillSetDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empSkillSetList = (List<EmpSkillSetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empSkillSetList;
	}

	public boolean update(EmpSkillSetDO empSkillSetDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empSkillSetDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empSkillSetDO);
				TransactionManager.commitTransaction();
		        status = true;
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return status;
	}

	@SuppressWarnings("unchecked")
	public boolean delete(long id) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpSkillSetDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmpSkillSetDO> empSkillSetList = (List<EmpSkillSetDO>) q.getResultList();
				if (empSkillSetList != null && empSkillSetList.size() > 0) {
					em.remove(empSkillSetList.get(0));
				}
				TransactionManager.commitTransaction();
				status = true;
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return status;
	}
}
