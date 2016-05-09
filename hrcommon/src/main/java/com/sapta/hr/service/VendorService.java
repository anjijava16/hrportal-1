package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.VendorDAO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.AppException;

public class VendorService {
	static Logger logger = Logger.getLogger(VendorService.class.getName());
	
	public VendorDO persist(VendorDO vendorDO) throws AppException {
		return new VendorDAO().persist(vendorDO);
	}

	public List<VendorDO> retrive() throws AppException {
		return new VendorDAO().retrive();
	}

	public List<VendorDO> retriveById(long id) throws AppException {
		return new VendorDAO().retriveById(id);
	}
	
	public List<VendorDO> retriveByName(String name) throws AppException {
		return new VendorDAO().retriveByName(name);
	}

	public boolean delete(VendorDO vendorDO) throws AppException {
		return new VendorDAO().delete(vendorDO);
	}
	
	public boolean update(VendorDO vendorDO) throws AppException {
		return new VendorDAO().update(vendorDO);
	}

}
