package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;


public class VendorUtil {
	
	private VendorUtil() {	
	}
	
	public static JSONObject getVendorListGrid(List<VendorDO> vendorList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = vendorList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (VendorDO vendor : vendorList) {
				resultJSONArray.put(getVendorDetailsObjectgrid(vendor));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getVendorDetailsObjectgrid(VendorDO vendor)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(vendor.getVendorcode()));
		result.put(vendor.getName());
		result.put(vendor.getAddress());
		result.put(String.valueOf(vendor.getEmail()));
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(vendor.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getVendorList(List<VendorDO> vendorList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (VendorDO vendor : vendorList) {
				resultJSONArray.put(getVendorDetailObject(vendor));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getVendorDetailObject(VendorDO vendor)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(vendor.getId()));
		result.put(CommonConstants.VENDOR_NAME, String.valueOf(vendor.getName()));
		result.put(CommonConstants.VENDOR_CODE, String.valueOf(vendor.getVendorcode()));
		result.put(CommonConstants.ADDRESS, String.valueOf(vendor.getAddress()));
		result.put(CommonConstants.PIN_CODE, vendor.getPincode());
		result.put(CommonConstants.PHONENO, vendor.getPhoneno());
		result.put(CommonConstants.FAX, vendor.getFax());
		result.put(CommonConstants.MOBILENO, vendor.getMobileno());
		result.put(CommonConstants.EMAIL, vendor.getEmail());
		return result;
	}
	
	public static JSONObject getVendorDataTableList(List<VendorDO> vendorList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (vendorList.size() > 0) {
				for (VendorDO vendo : vendorList) {
					resultJSONArray.put(getVendorDetailDataTableObject(vendo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getVendorDetailDataTableObject(VendorDO vendo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(vendo.getId()));
		result.put(String.valueOf(vendo.getVendorcode()));
		result.put(String.valueOf(vendo.getName()));
		result.put(vendo.getEmail());
		return result;
	}
}
