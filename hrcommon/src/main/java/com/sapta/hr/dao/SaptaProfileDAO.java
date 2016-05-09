package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.SaptaProfileDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class SaptaProfileDAO {
	
	static Logger logger = Logger.getLogger(SaptaProfileDAO.class.getName());
	
	private EntityManager em = null;

	public SaptaProfileDO persist(SaptaProfileDO saptaprofileDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && saptaprofileDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(saptaprofileDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} 
		finally {
			SessionManager.closeEntityManager(em);
		}
		return saptaprofileDO;
	}
	
	@SuppressWarnings("unchecked")
	public SaptaProfileDO retrive() throws AppException {
		List<SaptaProfileDO> saptaprofileList = null;
		SaptaProfileDO saptaprofile = null; 
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(SaptaProfileDO.FIND_ALL);
				saptaprofileList = (List<SaptaProfileDO>) q.getResultList();
				saptaprofile = saptaprofileList.get(0);
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return saptaprofile;
	}
	
	@SuppressWarnings("unchecked")
	public List<SaptaProfileDO> retriveById(long id) throws AppException {
		List<SaptaProfileDO> saptaProfileList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(VendorDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				saptaProfileList = (List<SaptaProfileDO>) q.getResultList();
				}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return saptaProfileList;
	}
	
	@SuppressWarnings("unchecked")
	public List<SaptaProfileDO> retriveList() throws AppException {
		List<SaptaProfileDO> saptaProfileList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(SaptaProfileDO.FIND_ALL);
				saptaProfileList = (List<SaptaProfileDO>) q.getResultList();
				}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return saptaProfileList;
	}
	
	public boolean update(SaptaProfileDO saptaprofileDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(saptaprofileDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

	public boolean delete(SaptaProfileDO saptaprofileDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				saptaprofileDO = em.merge(saptaprofileDO);
				em.remove(saptaprofileDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			return false;
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

}
