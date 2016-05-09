package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpFamilyBackgroundDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpFamilyBackgroundUtil {
	
	public static JSONObject getEmpFamilyBackgroundList(List<EmpFamilyBackgroundDO> empFamilyBackgroundList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpFamilyBackgroundDO empFamilyList : empFamilyBackgroundList) {
				resultJSONArray.put(getEmpFamilyBackgroundObject(empFamilyList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpFamilyBackgroundObject(EmpFamilyBackgroundDO empFamilyBackgroundDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empFamilyBackgroundDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empFamilyBackgroundDO.getEmpid()));
		result.put(CommonConstants.EMP_FAMILY_BACKGROUND_RELATIONSHIP, empFamilyBackgroundDO.getRelationship());
		result.put(CommonConstants.EMP_FAMILY_BACKGROUND_NAME, empFamilyBackgroundDO.getName());
		result.put(CommonConstants.EMP_FAMILY_BACKGROUND_AGE, String.valueOf(empFamilyBackgroundDO.getAge()));
		result.put(CommonConstants.EMP_FAMILY_BACKGROUND_EDUCATION, empFamilyBackgroundDO.getEducation());
		result.put(CommonConstants.EMP_FAMILY_BACKGROUND_OCCUPATION, empFamilyBackgroundDO.getOccupation());
		return result;
	}

}
