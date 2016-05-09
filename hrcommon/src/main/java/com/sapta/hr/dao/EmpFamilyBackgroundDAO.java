package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpFamilyBackgroundDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpFamilyBackgroundDAO {
	
	static Logger logger = Logger.getLogger(EmpFamilyBackgroundDAO.class.getName());
	
	private EntityManager em = null;

	public EmpFamilyBackgroundDO persist(EmpFamilyBackgroundDO empFamilyBackgroundDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empFamilyBackgroundDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empFamilyBackgroundDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empFamilyBackgroundDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpFamilyBackgroundDO> retrive() throws AppException {
		List<EmpFamilyBackgroundDO> empFamilyBackgroundList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpFamilyBackgroundDO.FIND_ALL);
				empFamilyBackgroundList = (List<EmpFamilyBackgroundDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empFamilyBackgroundList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpFamilyBackgroundDO> retriveById(long id) throws AppException {
		List<EmpFamilyBackgroundDO> empFamilyBackgroundList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpFamilyBackgroundDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empFamilyBackgroundList = (List<EmpFamilyBackgroundDO>) q.getResultList();
				
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empFamilyBackgroundList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpFamilyBackgroundDO> retriveByEmpId(long id) throws AppException {
		List<EmpFamilyBackgroundDO> empFamilyBackgroundList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpFamilyBackgroundDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empFamilyBackgroundList = (List<EmpFamilyBackgroundDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empFamilyBackgroundList;
	}

	public boolean update(EmpFamilyBackgroundDO empFamilyBackgroundDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empFamilyBackgroundDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empFamilyBackgroundDO);
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
				Query q = em.createNamedQuery(EmpFamilyBackgroundDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmpFamilyBackgroundDO> empFamilyBackgroundList = (List<EmpFamilyBackgroundDO>) q.getResultList();
				if (empFamilyBackgroundList != null && empFamilyBackgroundList.size() > 0) {
					em.remove(empFamilyBackgroundList.get(0));
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
