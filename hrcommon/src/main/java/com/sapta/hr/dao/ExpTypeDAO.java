package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class ExpTypeDAO {

	static Logger logger = Logger.getLogger(ExpTypeDAO.class.getName());

	private EntityManager em = null;
	
	public ExpTypeDO persist(ExpTypeDO expTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && expTypeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(expTypeDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return expTypeDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<ExpTypeDO> retrive() throws AppException {
		List<ExpTypeDO> expTypeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExpTypeDO.FIND_ALL);
				expTypeList = (List<ExpTypeDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return expTypeList;
	}

	@SuppressWarnings("unchecked")
	public List<ExpTypeDO> retriveById(long id) throws AppException {
		List<ExpTypeDO> expTypeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExpTypeDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EXPENSE_ID, id);
				expTypeList = (List<ExpTypeDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return expTypeList;
	}

	public boolean update(ExpTypeDO expTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && expTypeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(expTypeDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;

	}

	public boolean delete(ExpTypeDO expTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && expTypeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				expTypeDO = em.merge(expTypeDO);
				em.remove(expTypeDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception ex) {
			return false;
	    }finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

}
