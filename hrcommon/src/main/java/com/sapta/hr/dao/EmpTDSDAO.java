package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpTDSDAO {

	
static Logger logger = Logger.getLogger(EmpLoseOfPayDAO.class.getName());
	
	private EntityManager em = null;

	public String persist(EmpTDSDO empTDSDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empTDSDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				System.out.println("in");
				em.persist(empTDSDO);
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
	public List<EmpTDSDO> retrive() throws AppException {
		List<EmpTDSDO> empTDSList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpTDSDO.FIND_ALL);
				empTDSList = (List<EmpTDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empTDSList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpTDSDO> retriveByEmpId(long id) throws AppException {
		List<EmpTDSDO> empTDSList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpTDSDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				empTDSList = (List<EmpTDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empTDSList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpTDSDO> retriveById(long id) throws AppException {
		List<EmpTDSDO> empTDSList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpTDSDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empTDSList = (List<EmpTDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empTDSList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpTDSDO> retriveByEmpIdMonth(long empid , Date tdsmonth) throws AppException {
		List<EmpTDSDO> empTDSList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empid > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpTDSDO.FIND_BY_EMPID_MONTH);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.MONTH, tdsmonth);
				empTDSList = (List<EmpTDSDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empTDSList;
	}
	
	public boolean update(EmpTDSDO empTDSDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empTDSDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empTDSDO);
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
	public boolean delete(EmpTDSDO empTDSDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empTDSDO.getId() > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpTDSDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, empTDSDO.getId());
				List<EmpTDSDO> empTDSList = (List<EmpTDSDO>) q.getResultList();
				if (empTDSList != null && empTDSList.size() > 0) {
					em.remove(empTDSList.get(0));
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
}
