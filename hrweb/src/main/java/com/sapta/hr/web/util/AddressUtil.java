package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.AddressDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class AddressUtil {
	
	@SuppressWarnings("unused")
	private static JSONObject getAddressdetailObjectgrid(AddressDO addressdo) throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(addressdo.getId()));
		result.put(addressdo.getStreet());
		result.put(addressdo.getCity());
		result.put(addressdo.getState());
		result.put(addressdo.getCountry());
		result.put(addressdo.getPin());
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(addressdo.getId()));
		resp.put(CommonConstants.CELL, result);
		
		return resp;
	}

	public static JSONObject getCurrentAddressList(List<AddressDO> addressList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (AddressDO addressdo : addressList) {
				resultJSONArray.put(getCurrentAddressObject(addressdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getCurrentAddressObject(AddressDO addressdo) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		
		result.put(CommonConstants.C_ID, String.valueOf(addressdo.getId()));
		result.put(CommonConstants.A_STREET,addressdo.getStreet());
		result.put(CommonConstants.A_CITY , addressdo.getCity());
		result.put(CommonConstants.A_STATE , addressdo.getState());
		result.put(CommonConstants.A_COUNTRY , addressdo.getCountry());
		result.put(CommonConstants.A_PINCODE , String.valueOf(addressdo.getPin()));
		result.put(CommonConstants.A_TYPE ,String.valueOf(addressdo.getType()));
		
		result.put(CommonConstants.P_ID, String.valueOf(addressdo.getId()));
		result.put(CommonConstants.P_STREET,addressdo.getStreet());
		result.put(CommonConstants.P_CITY , addressdo.getCity());
		result.put(CommonConstants.P_STATE , addressdo.getState());
		result.put(CommonConstants.P_COUNTRY , addressdo.getCountry());
		result.put(CommonConstants.P_PINCODE , String.valueOf(addressdo.getPin()));
		result.put(CommonConstants.P_TYPE ,String.valueOf(addressdo.getType()));
		
		return result;
	}

}
