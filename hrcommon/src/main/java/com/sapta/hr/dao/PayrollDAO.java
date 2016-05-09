package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class PayrollDAO {

	static Logger logger = Logger.getLogger(PayrollDAO.class.getName());

	private EntityManager em = null;
	
	public PayrollDO persist(PayrollDO payrollDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && payrollDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(payrollDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollDO;
	}
	

	@SuppressWarnings("unchecked")
	public List<PayrollDO> retriveByMonth(Date payrollmonthdate) throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && payrollmonthdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_BY_PAYROLLMONTH_DATE);
				q.setParameter(CommonConstants.PAYROLL_MONTH_DATE, payrollmonthdate);
				payrollList = (List<PayrollDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}
	
	@SuppressWarnings("unchecked")
	public List<PayrollDO> retrive() throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_ALL);
				payrollList = (List<PayrollDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}
	
	@SuppressWarnings("unchecked")
	public List<PayrollDO> getFinancialYearPayrollReport(Date stdate, Date eddate) throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_BY_ST_ET_DATE);
				q.setParameter("stdate", stdate);
				q.setParameter("eddate", eddate);
				payrollList = (List<PayrollDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}
	
	@SuppressWarnings("unchecked")
	public List<PayrollDO> FindByStartAndEndDate(Date stdate , Date eddate) throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && stdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_BY_ST_ET_DATE);
				q.setParameter(CommonConstants.PAYROLL_MONTH_STDATE, stdate);
				q.setParameter(CommonConstants.PAYROLL_MONTH_EDDATE, eddate);
				payrollList = (List<PayrollDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<PayrollDO> retriveByEmpidMonth(long empid, Date  payrollmonthdate) throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && payrollmonthdate != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.PAYROLL_MONTH_DATE, payrollmonthdate);
				q.setParameter(CommonConstants.EMP_ID, empid);
				payrollList = (List<PayrollDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}


	@SuppressWarnings("unchecked")
	public List<PayrollDO> retrivebyid(long empid) throws AppException {
		List<PayrollDO> payrollList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(PayrollDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMP_ID, empid);
				payrollList = (List<PayrollDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return payrollList;
	}
}
