package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpAchievementsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpAchievementsUtil {
	
	public static JSONObject getEmpAchievementsList(List<EmpAchievementsDO> empAchievementsList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpAchievementsDO achievementsList : empAchievementsList) {
				resultJSONArray.put(getEmpAchievementsObject(achievementsList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpAchievementsObject(EmpAchievementsDO empAchievementsDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empAchievementsDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empAchievementsDO.getEmpid()));
		result.put(CommonConstants.COMPANY_NAME, empAchievementsDO.getCompanyname());
		result.put(CommonConstants.ACHIEVEMENT_NAME, empAchievementsDO.getAchievement());
		return result;
	}

}
