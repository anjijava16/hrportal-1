/**
 * 
 */
package com.sapta.hr.dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class UserDAO {

	static Logger logger = Logger.getLogger(UserDAO.class.getName());

	private EntityManager em = null;

	@SuppressWarnings("unchecked")
	public List<UserDO> authenticate(String username, String password)
			throws AppException {
		List<UserDO> userList = null;
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(UserDO.FIND_BY_NAME);
				q.setParameter("username", username);
				q.setParameter("password", password);
				userList = (List<UserDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return userList;
	}

	@SuppressWarnings("unchecked")
	public UserDO retriveUserById(long id) throws AppException {
		List<UserDO> userList = null;
		UserDO user = null;
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(UserDO.FIND_BY_ID);
				q.setParameter(CommonConstants.USER_ID, id);
				userList = (List<UserDO>) q.getResultList();
				if (userList != null && userList.size() > 0) {
					user = userList.get(0);
				}

			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<UserDO> retriveUser() throws AppException {
		List<UserDO> userList = null;
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(UserDO.FIND_ALL);
				userList = (List<UserDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return userList;
	}

	public boolean deleteUser(UserDO userDO) throws AppException {
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				TransactionManager.beginTransaction(em);
				userDO = em.merge(userDO);
				em.remove(userDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

	public boolean persistUser(String username, String password,
			String groupname) throws AppException {
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);

				UserDO user = new UserDO();
				user.setGroupname(groupname);
				user.setPassword(password);
				user.setUsername(username);
				user.setUpdatedon(new Date());

				em.persist(user);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

	public boolean updateUser(UserDO userDO) throws AppException {
		try {
			em = SessionManager
					.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(userDO);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<UserDO> retriveUserByName(String name) throws AppException {
		List<UserDO> userList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(UserDO.FIND_BY_USER_NAME);
				q.setParameter(CommonConstants.USER_NAME, name);
				userList = (List<UserDO>) q.getResultList();
			}
		} catch (Exception eException) {
			logger.info(eException.getMessage());
			throw new AppException(
					ExceptionConstant._91010,
					CustomPropertyManager.getProperty(ExceptionConstant._91010),
					eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return userList;
	}

}
