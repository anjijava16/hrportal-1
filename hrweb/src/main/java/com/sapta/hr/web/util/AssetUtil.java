package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.AssetTypeService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;


public class AssetUtil {
	
	private AssetUtil() {}
	public static JSONObject getAssetListGrid(List<AssetDO> assetList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = assetList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (AssetDO asset : assetList) {
				resultJSONArray.put(getAssetDetailsObjectgrid(asset));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getAssetDetailsObjectgrid(AssetDO assetDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(assetDO.getName());
		List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
		for(AssetTypeDO assettype : assetTypeList){
			if(assettype.getId() == assetDO.getAssettypeid()){
				result.put(assettype.getDispname());
			}
		}
		List<VendorDO> vendorList = new VendorService().retrive();
		for(VendorDO vendor : vendorList){
			if(vendor.getId() == assetDO.getVendorid()){
				result.put(vendor.getName());
			}
		}
		result.put(assetDO.getPrice());
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(assetDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getAssetList(List<AssetDO> assetDO)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (AssetDO asset : assetDO) {
				resultJSONArray.put(getAssetDetailObject(asset));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getAssetDetailObject(AssetDO assetDO)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(assetDO.getId()));
		result.put(CommonConstants.ASSET_NAME, String.valueOf(assetDO.getName()));
		result.put(CommonConstants.ASSET_TYPE_ID, assetDO.getAssettypeid());
		result.put(CommonConstants.DATE_OF_PURCHASE, CommonUtil.convertDateToStringWithOutTime(assetDO.getDateofpurchased()));
		result.put(CommonConstants.VENDORS_ID, assetDO.getVendorid());
		result.put(CommonConstants.WARRANTY_OF_ASSET, CommonUtil.convertDateToStringWithOutTime(assetDO.getWarrantyofexpired()));
		result.put(CommonConstants.GUARANTEE_OF_ASSET, CommonUtil.convertDateToStringWithOutTime(assetDO.getGuranteeofexpired()));
		result.put(CommonConstants.PRICE, CommonUtil.convertfloatValueWithTwoDecimalPoints(assetDO.getPrice()));
		
		return result;
	}
	
	public static JSONObject getAssetDataTableList(List<AssetDO> assetList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (assetList.size() > 0) {
				for (AssetDO astdo : assetList) {
					resultJSONArray.put(getAssetDetailDataTableObject(astdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getAssetDetailDataTableObject(AssetDO astdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(astdo.getId()));
		result.put(String.valueOf(astdo.getName()));
		
		List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
		for(AssetTypeDO assettype : assetTypeList){
			if(String.valueOf(assettype.getId()).equalsIgnoreCase(String.valueOf(astdo.getAssettypeid()))){
				result.put(assettype.getDispname());
			}
		}
		List<VendorDO> vendorList = new VendorService().retrive();
	
		for(VendorDO vendor : vendorList){
			if(String.valueOf(vendor.getId()).equalsIgnoreCase(String.valueOf(astdo.getVendorid()))){
				result.put(vendor.getName());
			}
			/*else{
				result.put("");
			}*/
		}
		result.put(CommonUtil.convertnumberValueWithcomma(astdo.getPrice()));
		return result;
	}
}
