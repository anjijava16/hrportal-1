package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpEmploymentHistoryDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpEmploymentHistoryUtil {
	
	public static JSONObject getEmpEmploymentHistoryList(List<EmpEmploymentHistoryDO> empEmploymentHistoryList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpEmploymentHistoryDO employmentHistoryList : empEmploymentHistoryList) {
				resultJSONArray.put(getEmpEmploymentHistoryObject(employmentHistoryList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpEmploymentHistoryObject(EmpEmploymentHistoryDO empEmploymentHistoryDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empEmploymentHistoryDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empEmploymentHistoryDO.getEmpid()));
		result.put(CommonConstants.NAME, empEmploymentHistoryDO.getName());
		result.put(CommonConstants.ADDRESS, empEmploymentHistoryDO.getAddress());
		result.put(CommonConstants.FROM_DATE, CommonUtil.convertDateToStringWithOutTime(empEmploymentHistoryDO.getFromdate()));
		result.put(CommonConstants.TO_DATE, CommonUtil.convertDateToStringWithOutTime(empEmploymentHistoryDO.getTodate()));
		result.put(CommonConstants.STARTING_SALARY, String.valueOf(empEmploymentHistoryDO.getStartingsalary()));
		result.put(CommonConstants.LAST_SALARY, String.valueOf(empEmploymentHistoryDO.getLastsalary()));
		result.put(CommonConstants.DESIGNATION, empEmploymentHistoryDO.getDesignation());
		result.put(CommonConstants.RESPONSIBILITY, empEmploymentHistoryDO.getResponsibility());
		return result;
	}

}
