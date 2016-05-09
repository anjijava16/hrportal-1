package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class AssetDAO {

	static Logger logger = Logger.getLogger(AssetDAO.class.getName());

	private EntityManager em = null;
	
	public AssetDO persist(AssetDO assetDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetDO !=null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(assetDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetDO> retrive() throws AppException {
		List<AssetDO> assetList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetDO.FIND_ALL);
				assetList = (List<AssetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetList;
	}

	@SuppressWarnings("unchecked")
	public List<AssetDO> retriveById(long id) throws AppException {
		List<AssetDO> assetList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ASSET_ID, id);
				assetList = (List<AssetDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return assetList;
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetDO> getAssetReport(Date stdate , Date eddate) throws AppException {
		List<AssetDO> expenseList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetDO.FIND_BY_ST_ET_DATE_ORDER_BY);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				expenseList = (List<AssetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return expenseList;
	}
	
	@SuppressWarnings("unchecked")
	public List<AssetDO> getFinancialYearAssetReport(Date stdate , Date eddate) throws AppException {
		List<AssetDO> expenseList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(AssetDO.FIND_BY_ST_ET_DATE_ORDER_BY);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				expenseList = (List<AssetDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return expenseList;
	}

	public boolean update(AssetDO assetDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(assetDO);
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

	public boolean delete(AssetDO assetDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && assetDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				assetDO = em.merge(assetDO);
				em.remove(assetDO);
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

}
