package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpDetailDAO {
	
	static Logger logger = Logger.getLogger(EmpDetailDAO.class.getName());
	
	private EntityManager em = null;

	public EmpDetailDO persist(EmpDetailDO empdetail) throws AppException {
		
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empdetail != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(empdetail);
				TransactionManager.commitTransaction();		
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empdetail;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpDetailDO> retrive() throws AppException {
		List<EmpDetailDO> empdetailList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpDetailDO.FIND_ALL);
				empdetailList = (List<EmpDetailDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empdetailList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpDetailDO> retriveById(long id) throws AppException {
		List<EmpDetailDO> empdetailList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpDetailDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMPDETAIL_ID, id);
				empdetailList = (List<EmpDetailDO>) q.getResultList();
				
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empdetailList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpDetailDO> retriveByEmpId(long id) throws AppException {
		List<EmpDetailDO> empdetailList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpDetailDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				empdetailList = (List<EmpDetailDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empdetailList;
	}
	

	public boolean update(EmpDetailDO empdetailDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empdetailDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empdetailDO);
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
			if (em != null && id > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(UserDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMPDETAIL_ID, id);
				List<EmpDetailDO> empdetailList = (List<EmpDetailDO>) q.getResultList();
				if (empdetailList != null && empdetailList.size() > 0) {
					em.remove(empdetailList.get(0));
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
