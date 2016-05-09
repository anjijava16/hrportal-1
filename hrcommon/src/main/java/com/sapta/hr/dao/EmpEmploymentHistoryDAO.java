package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpEmploymentHistoryDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpEmploymentHistoryDAO {
	
	static Logger logger = Logger.getLogger(EmpEmploymentHistoryDAO.class.getName());
	
	private EntityManager em = null;

	public EmpEmploymentHistoryDO persist(EmpEmploymentHistoryDO empEmploymentHistoryDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empEmploymentHistoryDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empEmploymentHistoryDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empEmploymentHistoryDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpEmploymentHistoryDO> retrive() throws AppException {
		List<EmpEmploymentHistoryDO> empEmploymentHistoryList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpEmploymentHistoryDO.FIND_ALL);
				empEmploymentHistoryList = (List<EmpEmploymentHistoryDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empEmploymentHistoryList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpEmploymentHistoryDO> retriveById(long id) throws AppException {
		List<EmpEmploymentHistoryDO> empEmploymentHistoryList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpEmploymentHistoryDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empEmploymentHistoryList = (List<EmpEmploymentHistoryDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empEmploymentHistoryList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpEmploymentHistoryDO> retriveByEmpId(long id) throws AppException {
		List<EmpEmploymentHistoryDO> empEmploymentHistoryList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpEmploymentHistoryDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empEmploymentHistoryList = (List<EmpEmploymentHistoryDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empEmploymentHistoryList;
	}

	public boolean update(EmpEmploymentHistoryDO empEmploymentHistoryDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empEmploymentHistoryDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empEmploymentHistoryDO);
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
				Query q = em.createNamedQuery(EmpEmploymentHistoryDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmpEmploymentHistoryDO> empEmploymentHistoryList = (List<EmpEmploymentHistoryDO>) q.getResultList();
				if (empEmploymentHistoryList != null && empEmploymentHistoryList.size() > 0) {
					em.remove(empEmploymentHistoryList.get(0));
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
