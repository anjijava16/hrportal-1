package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpCulturalsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpCulturalsUtil {
	
	public static JSONObject getEmpCulturalsList(List<EmpCulturalsDO> empCulturalsList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpCulturalsDO culturalsList : empCulturalsList) {
				resultJSONArray.put(getEmpCulturalsObject(culturalsList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpCulturalsObject(EmpCulturalsDO empCulturalsDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empCulturalsDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empCulturalsDO.getEmpid()));
		result.put(CommonConstants.EVENT_NAME, empCulturalsDO.getEventname());
		result.put(CommonConstants.ACHIEVEMENT_NAME , empCulturalsDO.getAchievement());
		return result;
	}

}
