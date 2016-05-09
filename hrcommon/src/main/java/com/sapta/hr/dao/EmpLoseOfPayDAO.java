package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpLoseOfPayDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpLoseOfPayDAO {
	
	static Logger logger = Logger.getLogger(EmpLoseOfPayDAO.class.getName());
	
	private EntityManager em = null;

	public String persist(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empLoseOfPayDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empLoseOfPayDO);
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
	public List<EmpLoseOfPayDO> retrive() throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_ALL);
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpLoseOfPayDO> retriveactive() throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_ACTIVE);
				q.setParameter(CommonConstants.STATUS, 'a');
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpLoseOfPayDO> retriveById(long id) throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpLoseOfPayDO> retriveByEmpId(long id) throws AppException {
		List<EmpLoseOfPayDO> empctcList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_EMPID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				empctcList = (List<EmpLoseOfPayDO>) q.getResultList();
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
	public List<EmpLoseOfPayDO> retriveByEmpIdAndStartdateEnddate(long id, Date startdate, Date enddate) throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_EMP_ID_AND_START_DATE_END_DATE);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				q.setParameter(CommonConstants.START_DATE, startdate);
				q.setParameter(CommonConstants.END_DATE, enddate);
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpLoseOfPayDO> retriveByEmpIdActive(long id) throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_EMPID_ACTIVE);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				q.setParameter(CommonConstants.STATUS, 'a');
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
	
	
	public boolean update(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empLoseOfPayDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empLoseOfPayDO);
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
	public boolean delete(EmpLoseOfPayDO empLoseOfPayDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empLoseOfPayDO.getId() > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, empLoseOfPayDO.getId());
				List<EmpLoseOfPayDO> emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
				if (emplopList != null && emplopList.size() > 0) {
					em.remove(emplopList.get(0));
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
	public List<EmpLoseOfPayDO> retriveByDate(long id, Date  month) throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_DATE);
				q.setParameter(CommonConstants.EMP_ID, id);
				q.setParameter(CommonConstants.MONTH, month);
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpLoseOfPayDO> retriveByBetweenDates(long id, Date month) throws AppException {
		List<EmpLoseOfPayDO> emplopList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpLoseOfPayDO.FIND_BY_DATE);
				q.setParameter(CommonConstants.EMP_ID, id);
				q.setParameter(CommonConstants.MONTH, month);
				emplopList = (List<EmpLoseOfPayDO>) q.getResultList();
			}
		} catch (Exception eException) {
			eException.printStackTrace();
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return emplopList;
	}
}
