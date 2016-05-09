package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpLanguageKnownDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpLanguageKnownUtil {
	
	public static JSONObject getEmpLanguageKnownList(List<EmpLanguageKnownDO> empLanguageKnownList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpLanguageKnownDO languageKnownList : empLanguageKnownList) {
				resultJSONArray.put(getEmpLanguageKnownObject(languageKnownList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpLanguageKnownObject(EmpLanguageKnownDO empLanguageKnownDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empLanguageKnownDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empLanguageKnownDO.getEmpid()));
		result.put(CommonConstants.NAME, empLanguageKnownDO.getLanguagename());
		result.put(CommonConstants.READ, String.valueOf(empLanguageKnownDO.getLanguageread()));
		result.put(CommonConstants.WRITE, String.valueOf(empLanguageKnownDO.getLanguagewrite()));
		result.put(CommonConstants.SPEAK, String.valueOf(empLanguageKnownDO.getLanguagespeak()));
		return result;
	}

}
