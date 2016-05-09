package com.sapta.hr.service;

import java.util.List;
import com.sapta.hr.dao.EmployeeDAO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;

public class EmployeeService {
	public EmployeeDO persist(EmployeeDO employee) throws AppException {
		return new EmployeeDAO().persist(employee);
	}

	public List<EmployeeDO> retriveById(long id) throws AppException {
		return new EmployeeDAO().retriveById(id);
	}

	public List<EmployeeDO> retriveEmployee() throws AppException {
		return new EmployeeDAO().retriveEmployee();
	}
	
	public EmployeeDO retriveEmpID() throws AppException {
		return new EmployeeDAO().retriveEmpID();
	}

	public boolean update(EmployeeDO employeeDO) throws AppException {
		return new EmployeeDAO().update(employeeDO);
	}

	public boolean deleteById(long id) throws AppException {
		return new EmployeeDAO().deleteById(id);
	}

	public List<EmployeeDO> retriveEmployeeActive() throws AppException {
		return new EmployeeDAO().retriveEmployeeActive();
	}
	
}
