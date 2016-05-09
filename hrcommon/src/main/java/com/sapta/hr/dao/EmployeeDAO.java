package com.sapta.hr.dao;

import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;
import com.sapta.hr.util.TransactionManager;

public class EmployeeDAO {
	
	static Logger logger = Logger.getLogger(EmployeeDAO.class.getName());
	
	private EntityManager em = null;

	public EmployeeDO persist(EmployeeDO employee) throws AppException {
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && employee != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.persist(employee);
				TransactionManager.commitTransaction();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return employee;
	}
	
	@SuppressWarnings("unchecked")
	public List<EmployeeDO> retriveEmployee() throws AppException {
		List<EmployeeDO> employeeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmployeeDO.FIND_ALL);
				employeeList = (List<EmployeeDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return employeeList;
	}

	@SuppressWarnings("unchecked")
	public List<EmployeeDO> retriveById(long id) throws AppException {
		List<EmployeeDO> employeeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmployeeDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
			    employeeList = (List<EmployeeDO>) q.getResultList();
				if (employeeList != null && employeeList.size() > 0) {
					employeeList.get(0);
				}
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return employeeList;
	}
	@SuppressWarnings("unchecked")
	public EmployeeDO retriveEmpID() throws AppException {
		EmployeeDO employeeDO = null;
		List<EmployeeDO> employeeList;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmployeeDO.FIND_ALL);
			    employeeList = (List<EmployeeDO>) q.getResultList();
				if (employeeList != null && employeeList.size() > 0) {
					Collections.reverse(employeeList);
					for(int i =0; i<employeeList.size();i++){
						employeeDO = employeeList.get(0);
					}
					
				}
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return employeeDO;
	}

	public boolean update(EmployeeDO employeeDO) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && employeeDO != null) {
				logger.info("Entity Manager is not null");
				TransactionManager.beginTransaction(em);
				em.merge(employeeDO);
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
	public boolean deleteById(long id) throws AppException {
		boolean status = false;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null && id > 0) {
				TransactionManager.beginTransaction(em);
				Query q = em.createNamedQuery(EmployeeDO.FIND_BY_ID);
				q.setParameter(CommonConstants.EMPLOYEE_ID, id);
				List<EmployeeDO> employeeList = (List<EmployeeDO>) q.getResultList();
				if (employeeList != null && employeeList.size() > 0) {
					em.remove(employeeList.get(0));
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
	public List<EmployeeDO> retriveEmployeeActive() throws AppException {
		List<EmployeeDO> employeeList = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(EmployeeDO.FIND_ALL_ACTIVE_EMPLOYEE);
				q.setParameter(CommonConstants.STATUS, 'a');
				employeeList = (List<EmployeeDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return employeeList;
	}
	
}
