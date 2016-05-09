package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.AssetTypeDAO;
import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.exception.AppException;

public class AssetTypeService {

	static Logger logger = Logger.getLogger(AssetTypeService.class.getName());
	
	public AssetTypeDO persist(AssetTypeDO assetTypeDO) throws AppException {
		return new AssetTypeDAO().persist(assetTypeDO);
	}

	public List<AssetTypeDO> retrive() throws AppException {
		return new AssetTypeDAO().retrive();
	}

	public List<AssetTypeDO> retriveById(long id) throws AppException {
		return new AssetTypeDAO().retriveById(id);
	}
	
	public boolean update(AssetTypeDO assetTypeDO) throws AppException {
		return new AssetTypeDAO().update(assetTypeDO);
	}

	public boolean delete(AssetTypeDO assetTypeDO) throws AppException {
		return new AssetTypeDAO().delete(assetTypeDO);
	}

}
