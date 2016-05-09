package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.ProjectDAO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.exception.AppException;

public class ProjectService {
	static Logger logger = Logger.getLogger(ProjectService.class.getName());
	
	public ProjectDO persistProject(ProjectDO projectDO) throws AppException {
		return new ProjectDAO().persist(projectDO);
	}

	public List<ProjectDO> retriveProject() throws AppException {
		return new ProjectDAO().retrive();
	}

	public List<ProjectDO> retriveByCustId(long customerid) throws AppException {
		return new ProjectDAO().retriveByCustId(customerid);
	}
	
	public List<ProjectDO> retriveById(long id) throws AppException {
		return new ProjectDAO().retriveById(id);
	}

	public boolean delete(ProjectDO projectDO) throws AppException {
		return new ProjectDAO().delete(projectDO);
	}

	public boolean update(ProjectDO projectDO) throws AppException {
		return new ProjectDAO().update(projectDO);
	}
	
	public List<ProjectDO> retriveActiveProject() throws AppException {
		return new ProjectDAO().retriveActiveProject();
	}

}
