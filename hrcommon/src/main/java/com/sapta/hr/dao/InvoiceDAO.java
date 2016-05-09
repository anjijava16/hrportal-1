package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class InvoiceDAO {

	static Logger logger = Logger.getLogger(InvoiceDAO.class.getName());

	private EntityManager em = null;
	
	public InvoiceDO persist(InvoiceDO invoiceDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(invoiceDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<InvoiceDO> retrive() throws AppException {
		List<InvoiceDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_ALL);
				userList = (List<InvoiceDO>) q.getResultList();
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
	public List<InvoiceDO> retriveById(long id) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				invoiceList = (List<InvoiceDO>) q.getResultList();
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
	public List<InvoiceDO> retriveByInvoiceNo(String invoiceno) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_BY_INVOICE_NO);
				q.setParameter(CommonConstants.INVOICE_NO, invoiceno);
				invoiceList = (List<InvoiceDO>) q.getResultList();
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
	public List<InvoiceDO> retriveByCustAndProjct(long projectid, long customerid) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_BY_PROJECT_CUSTOMER_ID);
				q.setParameter(CommonConstants.PROJECT_ID, projectid);
				q.setParameter(CommonConstants.CUSTOMER_ID, customerid);
				invoiceList = (List<InvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}

	

	public boolean update(InvoiceDO invoiceDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(invoiceDO);
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
	
	@SuppressWarnings("unchecked")
	public List<InvoiceDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				invoiceList = (List<InvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}
	
	@SuppressWarnings("unchecked")
	public List<InvoiceDO> getFinancialYearInvoiceReport(Date stdate , Date eddate, char status) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_BY_ST_ET_DATE_BY_STATUS);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				q.setParameter(CommonConstants.STATUS, status);
				invoiceList = (List<InvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}

	public boolean delete(InvoiceDO invoiceDO)throws AppException{
		try{
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				invoiceDO = em.merge(invoiceDO);
				em.remove(invoiceDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<InvoiceDO> retriveByStatus(char status) throws AppException {
		List<InvoiceDO> invoiceList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(InvoiceDO.FIND_INACTIVE);
				q.setParameter(CommonConstants.STATUS, status);
				invoiceList = (List<InvoiceDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return invoiceList;
	}
}
