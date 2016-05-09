package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpReferencesDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpReferencesUtil {
	
	public static JSONObject getEmpReferencesList(List<EmpReferencesDO> empReferencesList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpReferencesDO referencesList : empReferencesList) {
				resultJSONArray.put(getEmpReferencesObject(referencesList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpReferencesObject(EmpReferencesDO empReferencesDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empReferencesDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empReferencesDO.getEmpid()));
		result.put(CommonConstants.NAME, empReferencesDO.getName());
		result.put(CommonConstants.ADDRESS, empReferencesDO.getAddress());
		result.put(CommonConstants.PHONE, String.valueOf(empReferencesDO.getPhone()));
		result.put(CommonConstants.MOBILE, String.valueOf(empReferencesDO.getMobile()));
		result.put(CommonConstants.SKILL, empReferencesDO.getSkill());
		result.put(CommonConstants.DESIGNATION, empReferencesDO.getDesignation());
		return result;
	}

}
