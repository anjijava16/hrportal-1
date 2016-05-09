package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpCTCDAO {
	
	static Logger logger = Logger.getLogger(EmpCTCDAO.class.getName());
	
	private EntityManager em = null;

	public String persist(EmpCTCDO empctc) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empctc != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empctc);
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
	public List<EmpCTCDO> retrive() throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_ALL);
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpCTCDO> retriveactive() throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_ACTIVE);
				q.setParameter(CommonConstants.STATUS, 'a');
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpCTCDO> retriveById(long id) throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpCTCDO> retriveByEmpId(long id) throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpCTCDO> retriveByEmpIdActive(long id) throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_BY_EMPID_ACTIVE);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				q.setParameter(CommonConstants.STATUS, 'a');
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}
	
	
	public boolean update(EmpCTCDO empctcDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empctcDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empctcDO);
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
	public boolean delete(EmpCTCDO empctcDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empctcDO.getId() > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpCTCDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, empctcDO.getId());
				List<EmpCTCDO> empctcList = (List<EmpCTCDO>) q.getResultList();
				if (empctcList != null && empctcList.size() > 0) {
					em.remove(empctcList.get(0));
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
	public List<EmpCTCDO> retriveByDate(long id ,Date  month) throws AppException {
		List<EmpCTCDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpCTCDO.FIND_BY_DATE);
				q.setParameter(CommonConstants.EMP_ID, id);
				q.setParameter(CommonConstants.MONTH, month);
				empctcList = (List<EmpCTCDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empctcList;
	}
}
