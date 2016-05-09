package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpSkillSetDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpSkillSetUtil {
	
	public static JSONObject getEmpSkillsetList(List<EmpSkillSetDO> empSkillSetList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpSkillSetDO skillSetList : empSkillSetList) {
				resultJSONArray.put(getEmpSkillsetObject(skillSetList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpSkillsetObject(EmpSkillSetDO empSkillSetDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empSkillSetDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empSkillSetDO.getEmpid()));
		result.put(CommonConstants.NAME, empSkillSetDO.getName());
		result.put(CommonConstants.LEVEL, String.valueOf(empSkillSetDO.getLevel()));
		return result;
	}

}
