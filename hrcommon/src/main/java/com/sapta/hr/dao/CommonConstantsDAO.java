package com.sapta.hr.dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.sapta.hr.domainobject.CommonConstantsDO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.CustomPropertyManager;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.util.PersistenceUnitNames;
import com.sapta.hr.util.SessionManager;

public class CommonConstantsDAO {
	
	static Logger logger = Logger.getLogger(CommonConstantsDAO.class.getName());
	
	private EntityManager em = null;
	
	@SuppressWarnings("unchecked")
	public List<CommonConstantsDO> retrive() throws AppException {
		List<CommonConstantsDO> list = null;
		try {
			em = SessionManager.createManager(PersistenceUnitNames.PERSISTENCE_UNIT_NAME);
			if (em != null) {
				logger.info("Entity Manager is not null");
				Query q = em.createNamedQuery(CommonConstantsDO.FIND_ALL);
				list = (List<CommonConstantsDO>) q.getResultList();
			}
		} catch (Exception eException) {
			throw new AppException(ExceptionConstant._91010, CustomPropertyManager.getProperty(ExceptionConstant._91010), eException);
		} finally {
			SessionManager.closeEntityManager(em);
		}
		return list;
	}
}
