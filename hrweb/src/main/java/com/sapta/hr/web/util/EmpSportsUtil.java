package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpSportsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpSportsUtil {
	
	public static JSONObject getEmpSportsList(List<EmpSportsDO> empSportsList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpSportsDO sportsList : empSportsList) {
				resultJSONArray.put(getEmpSportsObject(sportsList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpSportsObject(EmpSportsDO empSportsDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empSportsDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empSportsDO.getEmpid()));
		result.put(CommonConstants.EVENT_NAME, empSportsDO.getEventname());
		result.put(CommonConstants.ACHIEVEMENT_NAME, empSportsDO.getAchievement());
		return result;
	}

}
