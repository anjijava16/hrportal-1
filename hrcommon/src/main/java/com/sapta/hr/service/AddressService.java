package com.sapta.hr.service;

import java.util.List;
import com.sapta.hr.dao.AddressDAO;
import com.sapta.hr.domainobject.AddressDO;
import com.sapta.hr.exception.AppException;

public class AddressService {
	public AddressDO persist(AddressDO addressDO) throws AppException {
		return new AddressDAO().persist(addressDO);
	}
	
	public List<AddressDO> retrive() throws AppException {
		return new AddressDAO().retrive();
	}
	
	public List<AddressDO> retriveById(long id) throws AppException {
		return new AddressDAO().retriveById(id);
	}

	public List<AddressDO> retriveByEmpId(long id) throws AppException {
		return new AddressDAO().retriveByEmpId(id);
	}

	public boolean update(AddressDO addressDO) throws AppException {
		return new AddressDAO().update(addressDO);
	}

	public boolean delete(long id) throws AppException {
		return new AddressDAO().delete(id);
	}
	
}
