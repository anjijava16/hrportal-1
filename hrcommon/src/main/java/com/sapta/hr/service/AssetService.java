package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.AssetDAO;
import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.exception.AppException;

public class AssetService {

	static Logger logger = Logger.getLogger(AssetService.class.getName());
	
	public AssetDO persist(AssetDO assetDO) throws AppException {
		return new AssetDAO().persist(assetDO);
	}

	public List<AssetDO> retrive() throws AppException {
		return new AssetDAO().retrive();
	}

	public List<AssetDO> retriveById(long id) throws AppException {
		return new AssetDAO().retriveById(id);
	}
	public List<AssetDO> getAssetReport(Date stdate, Date eddate) throws AppException {
		return new AssetDAO().getAssetReport(stdate, eddate);
	}
	public List<AssetDO> getFinancialYearAssetReport(Date stdate, Date eddate) throws AppException {
		return new AssetDAO().getFinancialYearAssetReport(stdate, eddate);
	}
	public boolean update(AssetDO assetDO) throws AppException {
		return new AssetDAO().update(assetDO);
	}

	public boolean delete(AssetDO assetDO) throws AppException {
		return new AssetDAO().delete(assetDO);
	}

}
