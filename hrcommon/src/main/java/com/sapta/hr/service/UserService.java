package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.UserDAO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.AppException;

public class UserService {
	
	static Logger logger = Logger.getLogger(UserService.class.getName());
	
	public List<UserDO> authenticate(String username, String password) throws AppException {
		return new UserDAO().authenticate(username, password);
	}
	
	public List<UserDO> retriveUser() throws AppException {
		return new UserDAO().retriveUser();
	}
	
	public UserDO retriveUserById(long id) throws AppException {
		return new UserDAO().retriveUserById(id);
	}
	
	public boolean persistUser(String username, String password, String groupname) throws AppException {
		return new UserDAO().persistUser(username, password, groupname);
	}
	
	public boolean deleteUser(UserDO userDO) throws AppException {
		return new UserDAO().deleteUser(userDO);
	}
	
	public boolean updateUser(UserDO userDO) throws AppException {
		return new UserDAO().updateUser(userDO);
	}

	public List<UserDO> retriveUserByName(String name) throws AppException {
		return new UserDAO().retriveUserByName(name);
	}
}
