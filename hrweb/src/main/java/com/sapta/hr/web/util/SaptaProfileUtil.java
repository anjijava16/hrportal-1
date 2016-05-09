package com.sapta.hr.web.util;



public class SaptaProfileUtil {
	
	/*private SaptaProfileUtil() {	
	}
	
	public static JSONObject getSaptaProfileListGrid(List<SaptaProfileDO> saptaprofileList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = saptaprofileList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (SaptaProfileDO saptaprofile : saptaprofileList) {
				resultJSONArray.put(getSaptaProfileObjectgrid(saptaprofile));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getSaptaProfileObjectgrid(SaptaProfileDO saptaprofile)throws JSONException, AppException {
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
		result.put(CommonConstants.EMAIL, String.valueOf(vendor.getEmail()));
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
		result.put(String.valueOf(vendo.getAddress()));
		result.put(String.valueOf(vendo.getEmail()));
		return result;
	}*/
}
