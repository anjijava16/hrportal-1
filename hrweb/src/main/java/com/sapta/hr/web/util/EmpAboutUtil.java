package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpAboutDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpAboutUtil {
	
	public static JSONObject getEmpAboutList(List<EmpAboutDO> empAboutList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpAboutDO accDetailList : empAboutList) {
				resultJSONArray.put(getEmpAboutObject(accDetailList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpAboutObject(EmpAboutDO empAboutDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID,String.valueOf(empAboutDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empAboutDO.getEmpid()));
		result.put(CommonConstants.STRENGTH, empAboutDO.getStrength());
		result.put(CommonConstants.WEAKNESS, empAboutDO.getWeakness());
		result.put(CommonConstants.TOTAL_EXPERIENCE, empAboutDO.getTotalexp());
		result.put(CommonConstants.RELEVENT_EXPERIENCE, empAboutDO.getRelexp());
		result.put(CommonConstants.PRESENT_SALARY, String.valueOf(empAboutDO.getPresentsalary()));
		result.put(CommonConstants.EXPECTED_SALARY, String.valueOf(empAboutDO.getExpectedsalary()));
		return result;
	}

}
