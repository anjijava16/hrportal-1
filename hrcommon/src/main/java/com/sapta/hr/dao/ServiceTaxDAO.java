package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.ServiceTaxDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class ServiceTaxDAO {
	static Logger logger = Logger.getLogger(TDSDAO.class.getName());
	private EntityManager em = null;
	
	public ServiceTaxDO persist(ServiceTaxDO servicetaxDo) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(servicetaxDo);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return servicetaxDo;
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> FindByEmpIdAndDate(long empid , Date tdsdate) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}
	
	/*@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> FindByEmpIdAndDate(Long empid , Date tdsdate) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && tdsdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}*/
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> getFinancialYearServicetaxReport(Date stdate, Date eddate) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_ST_ET_DATE_BY_ORDER);
				q.setParameter("stdate", stdate);
				q.setParameter("eddate", eddate);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> retrive() throws AppException {
		List<ServiceTaxDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_ALL);
				userList = (List<ServiceTaxDO>) q.getResultList();
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
	public List<ServiceTaxDO> retriveById(long id) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}

	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> retriveByEmpId(long id) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> retriveTDSByEmpIdMonth(long empid, Date tdsdate) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empid > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMPLOYEE_ID, empid);
				q.setParameter(CommonConstants.TDS_DATE, tdsdate);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}	
	
	@SuppressWarnings("unchecked")
	public List<ServiceTaxDO> retriveByTDMONTH(String tdsmonth) throws AppException {
		List<ServiceTaxDO> taxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ServiceTaxDO.FIND_BY_TDMONTH);
				q.setParameter(CommonConstants.TDMONTH, tdsmonth);
				taxList = (List<ServiceTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return taxList;
	}	
	
	public boolean update(ServiceTaxDO servicetaxDo) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && servicetaxDo != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(servicetaxDo);
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
	
	public boolean delete(ServiceTaxDO servicetaxDo) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && servicetaxDo != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				servicetaxDo = em.merge(servicetaxDo);
				em.remove(servicetaxDo);
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
