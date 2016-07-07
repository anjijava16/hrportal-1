package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class TDSDAO {
	static Logger logger = Logger.getLogger(TDSDAO.class.getName());
	private EntityManager em = null;
	
	public TDSDO persist(TDSDO tdsDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(tdsDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				tdsList = (List<TDSDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> FindByEmpIdAndDate(long empid , Date tdsdate) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				tdsList = (List<TDSDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
	
	/*@SuppressWarnings("unchecked")
	public List<TDSDO> FindByEmpIdAndDate(Long empid , Date tdsdate) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && tdsdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				tdsList = (List<TDSDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}*/
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> getFinancialYearTDSReport(Date stdate, Date eddate) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_ST_ET_DATE_BY_ORDER);
				q.setParameter("stdate", stdate);
				q.setParameter("eddate", eddate);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> retrive() throws AppException {
		List<TDSDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_ALL);
				userList = (List<TDSDO>) q.getResultList();
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
	public List<TDSDO> retriveById(long id) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}

	@SuppressWarnings("unchecked")
	public List<TDSDO> retriveByEmpId(long id) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> retriveTDSByEmpIdMonth(long empid, Date tdsdate) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empid > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMPLOYEE_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}	
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> retriveByInvoicenumber(String invoice) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && invoice.length() > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_INVOICE);
				q.setParameter(CommonConstants.REFER, invoice);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<TDSDO> retriveByTDMONTH(String tdsmonth) throws AppException {
		List<TDSDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(TDSDO.FIND_BY_TDMONTH);
				q.setParameter(CommonConstants.TDMONTH, tdsmonth);
				tdsList = (List<TDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}	
	
	public boolean update(TDSDO tdsDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && tdsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(tdsDO);
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
	
	public boolean delete(TDSDO tdsDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && tdsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				tdsDO = em.merge(tdsDO);
				em.remove(tdsDO);
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
