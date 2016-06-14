package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpPFDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpPFDAO {

static Logger logger = Logger.getLogger(EmpCTCDAO.class.getName());
	
	private EntityManager em = null;

	@SuppressWarnings("unchecked")
	public List<EmpPFDO> retrive() throws AppException {
		List<EmpPFDO> empPFList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpPFDO.FIND_ALL);
				empPFList = (List<EmpPFDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empPFList;
	}

	
	public String persist(EmpPFDO emppf) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && emppf != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(emppf);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			return "false";
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return "true";
	}
	
	
	public boolean update(EmpPFDO emppfDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && emppfDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(emppfDO);
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
	public boolean delete(long id) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpPFDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				List<EmpPFDO> emppfList = (List<EmpPFDO>) q.getResultList();
					em.remove(emppfList.get(0));
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
	public List<EmpPFDO> FindByEmpIdAndDate(long empid , Date pfdate) throws AppException {
		List<EmpPFDO> emppfList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpPFDO.FIND_BY_EMPID_DATE);
				q.setParameter(CommonConstants.EMP_ID, empid);
				q.setParameter(CommonConstants.PF_DATE, pfdate);
				emppfList = (List<EmpPFDO>) q.getResultList();
			
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emppfList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<EmpPFDO> retriveByEmpId(long id) throws AppException {
		List<EmpPFDO> emppfList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpPFDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				emppfList = (List<EmpPFDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emppfList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpPFDO> retriveById(long id) throws AppException {
		List<EmpPFDO> emppfList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpPFDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				emppfList = (List<EmpPFDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emppfList;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<EmpPFDO> retriveByEmpIdMonth(long empid,Date  pfmonth) throws AppException {
		List<EmpPFDO> emppfList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empid > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpPFDO.FIND_BY_EMPID_MONTH);
				q.setParameter(CommonConstants.EMPLOYEE_ID, empid);
				q.setParameter(CommonConstants.EMPLOYEE_PFMONTH, pfmonth);
				emppfList = (List<EmpPFDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emppfList;
	}

}
