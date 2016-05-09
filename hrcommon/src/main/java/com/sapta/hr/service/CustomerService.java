package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.CustomerDAO;
import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.exception.AppException;

public class CustomerService {
	static Logger logger = Logger.getLogger(CustomerService.class.getName());
	
	public CustomerDO persist(CustomerDO customerDO) throws AppException {
		return new CustomerDAO().persist(customerDO);
	}

	public List<CustomerDO> retrive() throws AppException {
		return new CustomerDAO().retrive();
	}

	public List<CustomerDO> retriveById(long id) throws AppException {
		return new CustomerDAO().retriveById(id);
	}

	public boolean delete(CustomerDO customerDO) throws AppException {
		return new CustomerDAO().delete(customerDO);
	}

	public boolean update(CustomerDO customerDO) throws AppException {
		return new CustomerDAO().update(customerDO);
	}

}
