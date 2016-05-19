package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmpAssignmentDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmpAssignmentDAO {

	static Logger logger = Logger.getLogger(EmpAssignmentDAO.class.getName());

	private EntityManager em = null;
	
	public EmpAssignmentDO persist(EmpAssignmentDO empassignmentDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empassignmentDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);

				em.persist(empassignmentDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empassignmentDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpAssignmentDO> retrive() throws AppException {
		List<EmpAssignmentDO> empassignmentList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpAssignmentDO.FIND_ALL);
				empassignmentList = (List<EmpAssignmentDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empassignmentList;
	}

	@SuppressWarnings("unchecked")
	public List<EmpAssignmentDO> retriveById(long id) throws AppException {
		@SuppressWarnings("unused")
		EmpAssignmentDO empassigndo = null;
		List<EmpAssignmentDO> empAssignmentList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpAssignmentDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empAssignmentList = (List<EmpAssignmentDO>) q.getResultList();
				if (empAssignmentList != null && empAssignmentList.size() > 0) {
					empassigndo = empAssignmentList.get(0);
				}
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empAssignmentList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpAssignmentDO> retriveByProjectId(long id) throws AppException {
		@SuppressWarnings("unused")
		EmpAssignmentDO empassigndo = null;
		List<EmpAssignmentDO> empAssignmentList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpAssignmentDO.FIND_BY_PROJ_ID);
				q.setParameter(CommonConstants.PROJECT_ID, id);
				empAssignmentList = (List<EmpAssignmentDO>) q.getResultList();
				if (empAssignmentList != null && empAssignmentList.size() > 0) {
					empassigndo = empAssignmentList.get(0);
				}
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empAssignmentList;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmpAssignmentDO> retriveByEmpId(long id) throws AppException {
		@SuppressWarnings("unused")
		EmpAssignmentDO empassigndo = null;
		List<EmpAssignmentDO> empAssignmentList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmpAssignmentDO.FIND_BY_EMP_ID);
				q.setParameter(CommonConstants.EMP_ID, id);
				empAssignmentList = (List<EmpAssignmentDO>) q.getResultList();
				if (empAssignmentList != null && empAssignmentList.size() > 0) {
					empassigndo = empAssignmentList.get(0);
				}
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return empAssignmentList;
	}
	
	public boolean update(EmpAssignmentDO empassignmentDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empassignmentDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(empassignmentDO);
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

	public boolean delete(EmpAssignmentDO empassignmentDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && empassignmentDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				empassignmentDO = em.merge(empassignmentDO);
				em.remove(empassignmentDO);
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
