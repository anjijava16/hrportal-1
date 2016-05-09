package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class ProfessionalTaxDAO {
	static Logger logger = Logger.getLogger(ProfessionalTaxDAO.class.getName());
	private EntityManager em = null;
	
	public ProfessionalTaxDO persist(ProfessionalTaxDO professionaltax) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && professionaltax != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(professionaltax);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltax;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProfessionalTaxDO> getFinancialYearProfessionalTaxReport(Date stdate, Date eddate) throws AppException {
		List<ProfessionalTaxDO> professionaltaxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_ST_ET_DATE_ORDER);
				q.setParameter("stdate", stdate);
				q.setParameter("eddate", eddate);
				professionaltaxList = (List<ProfessionalTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltaxList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProfessionalTaxDO> retrive() throws AppException {
		List<ProfessionalTaxDO> professionaltaxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_ALL);
				professionaltaxList = (List<ProfessionalTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltaxList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProfessionalTaxDO> retriveById(long id) throws AppException {
		List<ProfessionalTaxDO> professionaltaxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				professionaltaxList = (List<ProfessionalTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltaxList;
	}

	@SuppressWarnings("unchecked")
	public List<ProfessionalTaxDO> retriveByEmpId(long id) throws AppException {
		List<ProfessionalTaxDO> professionaltaxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				professionaltaxList = (List<ProfessionalTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltaxList;
	}	
	
	@SuppressWarnings("unchecked")
	public List<ProfessionalTaxDO> retriveByMonth(String ptmonth) throws AppException {
		List<ProfessionalTaxDO> professionaltaxList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_MONTH);
				q.setParameter(CommonConstants.PT_MONTH, ptmonth);
				professionaltaxList = (List<ProfessionalTaxDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return professionaltaxList;
	}	


@SuppressWarnings("unchecked")
public List<ProfessionalTaxDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
	List<ProfessionalTaxDO> ptList = null;
	try {
		em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
		if (em != null && stdate != null) {
			logger.info("Entity Manager is not null");
			Query q = em.createNamedQuery(ProfessionalTaxDO.FIND_BY_ST_ET_DATE);
			q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
			q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
			ptList = (List<ProfessionalTaxDO>) q.getResultList();
		
		}
	} catch (Exception eException) {
		logger.info(eException.getMessage());
		throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
	} finally {
		SessionManager.closeEntityManager(em);
	}
	return ptList;
}
}
