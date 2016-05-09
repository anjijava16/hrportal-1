package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class AssetTypeDAO {

	static Logger logger = Logger.getLogger(AssetTypeDAO.class.getName());

	private EntityManager em = null;
	
	public AssetTypeDO persist(AssetTypeDO assetTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetTypeDO !=null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(assetTypeDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetTypeDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetTypeDO> retrive() throws AppException {
		List<AssetTypeDO> assetTypeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetTypeDO.FIND_ALL);
				assetTypeList = (List<AssetTypeDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetTypeList;
	}

	@SuppressWarnings("unchecked")
	public List<AssetTypeDO> retriveById(long id) throws AppException {
		List<AssetTypeDO> assetTypeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetTypeDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ASSET_ID, id);
				assetTypeList = (List<AssetTypeDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetTypeList;
	}

	public boolean update(AssetTypeDO assetTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetTypeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(assetTypeDO);
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

	public boolean delete(AssetTypeDO assetTypeDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetTypeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				assetTypeDO = em.merge(assetTypeDO);
				em.remove(assetTypeDO);
				TransactionManager.commitTransaction();
			}
		}catch (Exception eException) {
			return false;
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

}
