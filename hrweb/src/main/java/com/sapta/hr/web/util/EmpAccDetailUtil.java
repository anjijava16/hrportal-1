package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpAccDetailUtil {
	
	public static JSONObject getEmpAccDetailList(List<EmpAccDetailDO> empAccDetailList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpAccDetailDO empAccDetailDO : empAccDetailList) {
				resultJSONArray.put(getEmpAccDetailObject(empAccDetailDO));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpAccDetailObject(EmpAccDetailDO empAccDetailDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.BANK_NAME,empAccDetailDO.getBankname());
		result.put(CommonConstants.ACCOUNT_NO, String.valueOf(empAccDetailDO.getAccountno()));
		result.put(CommonConstants.BRANCH, empAccDetailDO.getBranch());
		result.put(CommonConstants.ADDRESS, empAccDetailDO.getAddress());
		result.put(CommonConstants.CITY, empAccDetailDO.getCity());
		result.put(CommonConstants.STATE, empAccDetailDO.getState());
		result.put(CommonConstants.PIN_CODE, String.valueOf(empAccDetailDO.getPincode()));
		result.put(CommonConstants.IFS_CODE, empAccDetailDO.getIfsc());
		return result;
	}

}
