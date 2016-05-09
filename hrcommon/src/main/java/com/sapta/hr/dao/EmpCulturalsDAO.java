package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpCulturalsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpCulturalsDAO {
	
	static Logger logger = Logger.getLogger(EmpCulturalsDAO.class.getName());
	
	private EntityManager em = null;

	public EmpCulturalsDO persist(EmpCulturalsDO empCulturalsDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empCulturalsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empCulturalsDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empCulturalsDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpCulturalsDO> retrive() throws AppException {
		List<EmpCulturalsDO> empCulturalsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCulturalsDO.FIND_ALL);
				empCulturalsList = (List<EmpCulturalsDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empCulturalsList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpCulturalsDO> retriveById(long id) throws AppException {
		List<EmpCulturalsDO> empCulturalsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCulturalsDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empCulturalsList = (List<EmpCulturalsDO>) q.getResultList();
				
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empCulturalsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpCulturalsDO> retriveByEmpId(long id) throws AppException {
		List<EmpCulturalsDO> empCulturalsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCulturalsDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empCulturalsList = (List<EmpCulturalsDO>) q.getResultList();
				
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empCulturalsList;
	}

	public boolean update(EmpCulturalsDO empCulturalsDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empCulturalsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empCulturalsDO);
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
				Query q = em.createNamedQuery(EmpCulturalsDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmpCulturalsDO> empCulturalsList = (List<EmpCulturalsDO>) q.getResultList();
				if (empCulturalsList != null && empCulturalsList.size() > 0) {
					em.remove(empCulturalsList.get(0));
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
