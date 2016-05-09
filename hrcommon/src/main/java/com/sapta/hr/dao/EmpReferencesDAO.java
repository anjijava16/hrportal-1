package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpReferencesDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpReferencesDAO {
	
	static Logger logger = Logger.getLogger(EmpReferencesDAO.class.getName());
	
	private EntityManager em = null;

	public EmpReferencesDO persist(EmpReferencesDO empReferencesDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empReferencesDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empReferencesDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empReferencesDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpReferencesDO> retrive() throws AppException {
		List<EmpReferencesDO> empReferencesList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpReferencesDO.FIND_ALL);
				empReferencesList = (List<EmpReferencesDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empReferencesList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpReferencesDO> retriveById(long id) throws AppException {
		List<EmpReferencesDO> empReferencesList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpReferencesDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empReferencesList = (List<EmpReferencesDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empReferencesList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpReferencesDO> retriveByEmpId(long id) throws AppException {
		List<EmpReferencesDO> empReferencesList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpReferencesDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empReferencesList = (List<EmpReferencesDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empReferencesList;
	}

	public boolean update(EmpReferencesDO empReferencesDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empReferencesDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empReferencesDO);
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
				Query q = em.createNamedQuery(EmpReferencesDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmpReferencesDO> empReferencesList = (List<EmpReferencesDO>) q.getResultList();
				if (empReferencesList != null && empReferencesList.size() > 0) {
					em.remove(empReferencesList.get(0));
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
