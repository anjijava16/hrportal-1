package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpBonusDO;
import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpBonusDAO {

	
static Logger logger = Logger.getLogger(EmpLoseOfPayDAO.class.getName());
	
	private EntityManager em = null;

	public String persist(EmpBonusDO empBounsDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empBounsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empBounsDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			return "false";
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return "true";
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> retrive() throws AppException {
		List<EmpBonusDO> empBounsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_ALL);
				empBounsList = (List<EmpBonusDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empBounsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> retriveByEmpId(long id) throws AppException {
		List<EmpBonusDO> empBounsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				empBounsList = (List<EmpBonusDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empBounsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> retriveById(long id) throws AppException {
		List<EmpBonusDO> empBounsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empBounsList = (List<EmpBonusDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empBounsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> retriveByEmpIdMonth(long empid , Date bonusmonth) throws AppException {
		List<EmpBonusDO> empBounsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empid > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_EMPID_MONTH);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.MONTH, bonusmonth);
				empBounsList = (List<EmpBonusDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empBounsList;
	}
	

	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> getFinancialYearEmpBonusReport(Date stdate, Date eddate) throws AppException {
		List<EmpBonusDO> bonusList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_ST_ET_DATE_BY_ORDER);
				q.setParameter("stdate", stdate);
				q.setParameter("eddate", eddate);
				bonusList = (List<EmpBonusDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return bonusList;
	}
	
	
	
	public boolean update(EmpBonusDO empBounsDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empBounsDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empBounsDO);
				TransactionManager.commitTransaction();
		        status = true;
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return status;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public boolean delete(EmpBonusDO empBounsDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empBounsDO.getId() > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, empBounsDO.getId());
				List<EmpBonusDO> empBounsList = (List<EmpBonusDO>) q.getResultList();
				if (empBounsList != null && empBounsList.size() > 0) {
					em.remove(empBounsList.get(0));
				}
				TransactionManager.commitTransaction();
				status = true;
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return status;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpBonusDO> FindAllEvents(Date stdate , Date eddate) throws AppException {
		List<EmpBonusDO> tdsList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpBonusDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PT_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PT_MONTH_EDDATE, eddate);
				tdsList = (List<EmpBonusDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return tdsList;
	}
}
