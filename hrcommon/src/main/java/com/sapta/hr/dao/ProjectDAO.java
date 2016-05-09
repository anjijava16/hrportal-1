package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class ProjectDAO {

	static Logger logger = Logger.getLogger(ProjectDAO.class.getName());

	private EntityManager em = null;
	
	public ProjectDO persist(ProjectDO projectDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(projectDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return projectDO;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProjectDO> retrive() throws AppException {
		List<ProjectDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProjectDO.FIND_ALL);
				userList = (List<ProjectDO>) q.getResultList();
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
	public List<ProjectDO> retriveById(long id) throws AppException {
		List<ProjectDO> projectList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProjectDO.FIND_BY_ID);
				q.setParameter(CommonConstants.ID, id);
				projectList = (List<ProjectDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return projectList;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProjectDO> retriveByCustId(long customerid) throws AppException {
		List<ProjectDO> projectList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProjectDO.FIND_BY_CUSTOMER_ID);
				q.setParameter(CommonConstants.CUSTOMER_ID, customerid);
				projectList = (List<ProjectDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return projectList;
	}

	public boolean delete(ProjectDO projectDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				projectDO = em.merge(projectDO);
				em.remove(projectDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			return false;
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

	public boolean update(ProjectDO projectDO) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(projectDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(ExceptionConstant._91010,CustomPropertyManager.getProperty(ExceptionConstant._91010),eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProjectDO> retriveActiveProject() throws AppException {
		List<ProjectDO> projectlist = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(ProjectDO.ACTIVE_PROJECT);
				q.setParameter(CommonConstants.STATUS, 'a');
				projectlist = (List<ProjectDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return projectlist;
	}

}
