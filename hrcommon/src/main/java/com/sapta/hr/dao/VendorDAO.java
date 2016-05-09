package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class VendorDAO {
	static Logger logger = Logger.getLogger(VendorDAO.class.getName());
	private EntityManager em = null;

	public VendorDO persist(VendorDO vendorDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && vendorDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(vendorDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return vendorDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<VendorDO> retrive() throws AppException {
		List<VendorDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(VendorDO.FIND_ALL);
				userList = (List<VendorDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return userList;
	}

	@SuppressWarnings("unchecked")
	public List<VendorDO> retriveById(long id) throws AppException {
		List<VendorDO> vendorList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(VendorDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				vendorList = (List<VendorDO>) q.getResultList();
				}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return vendorList;
	}
	
	@SuppressWarnings("unchecked")
	public List<VendorDO> retriveByName(String name) throws AppException {
		List<VendorDO> vendorList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(VendorDO.FIND_BY_NAME);
				q.setParameter(CommonConstants.NAME, name);
				vendorList = (List<VendorDO>) q.getResultList();
				}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return vendorList;
	}
	
	public boolean update(VendorDO vendorDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(vendorDO);
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

	public boolean delete(VendorDO vendorDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				vendorDO = em.merge(vendorDO);
				em.remove(vendorDO);
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
