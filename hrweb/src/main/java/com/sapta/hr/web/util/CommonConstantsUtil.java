package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.CommonConstantsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;


public class CommonConstantsUtil {
	
	private CommonConstantsUtil() {}

	public static JSONObject getConstantList(List<CommonConstantsDO> constList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (CommonConstantsDO cnstlst : constList) {
				resultJSONArray.put(getConstntDetailObject(cnstlst));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getConstntDetailObject(CommonConstantsDO cnstntList)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put("callowance",String.valueOf(cnstntList.getConveyanceallowance()));
		result.put("mallowance",String.valueOf(cnstntList.getPersonalallowance()));
		
		return result;
	}
}
