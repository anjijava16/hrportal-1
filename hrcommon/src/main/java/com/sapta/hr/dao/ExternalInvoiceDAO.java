package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.ExternalInvoiceDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class ExternalInvoiceDAO {

	static Logger logger = Logger.getLogger(InvoiceDAO.class.getName());

	private EntityManager em = null;
	
	public ExternalInvoiceDO persist(ExternalInvoiceDO extInvoiceDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(extInvoiceDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return extInvoiceDO;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<ExternalInvoiceDO> retrive() throws AppException {
		List<ExternalInvoiceDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExternalInvoiceDO.FIND_ALL);
				userList = (List<ExternalInvoiceDO>) q.getResultList();
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
	public List<ExternalInvoiceDO> retriveById(long id) throws AppException {
		List<ExternalInvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExternalInvoiceDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				invoiceList = (List<ExternalInvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ExternalInvoiceDO> retriveByInvoiceNo(String extinvoiceno) throws AppException {
		List<ExternalInvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExternalInvoiceDO.FIND_BY_INVOICE_NO);
				q.setParameter(CommonConstants.INVOICE_NO, extinvoiceno);
				invoiceList = (List<ExternalInvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ExternalInvoiceDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
		List<ExternalInvoiceDO> extinvoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExternalInvoiceDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				extinvoiceList = (List<ExternalInvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return extinvoiceList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ExternalInvoiceDO> getFinancialYearInvoiceReport(Date stdate , Date eddate, char status) throws AppException {
		List<ExternalInvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ExternalInvoiceDO.FIND_BY_ST_ET_DATE_BY_STATUS);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				q.setParameter(CommonConstants.STATUS, status);
				invoiceList = (List<ExternalInvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}
	
	public boolean update(ExternalInvoiceDO extinvoiceDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(extinvoiceDO);
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
	
	public boolean delete(ExternalInvoiceDO extinvoiceDO)throws AppException{
		try{
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				extinvoiceDO = em.merge(extinvoiceDO);
				em.remove(extinvoiceDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}
	
}
