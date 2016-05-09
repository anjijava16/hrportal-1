package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpEducationDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpEducationUtil {
	
	public static JSONObject getEmpEducationList(List<EmpEducationDO> empEducationList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpEducationDO educationList : empEducationList) {
				resultJSONArray.put(getEmpEducationObject(educationList));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmpEducationObject(EmpEducationDO empEducationDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empEducationDO.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empEducationDO.getEmpid()));
		result.put(CommonConstants.EMP_EDUCATION_INSTITUTIONNAME, empEducationDO.getInstitutionname());
		result.put(CommonConstants.EMP_EDUCATION_DEGREE, empEducationDO.getDegree());
		result.put(CommonConstants.EMP_EDUCATION_SPECIALIZATION, empEducationDO.getSpecialization());
		result.put(CommonConstants.EMP_EDUCATION_RANK_SCHOLARSHIP, empEducationDO.getRankscholarship());
		result.put(CommonConstants.EMP_EDUCATION_FROM, CommonUtil.convertDateToStringWithOutTime(empEducationDO.getEdufrom()));
		result.put(CommonConstants.EMP_EDUCATION_TO, CommonUtil.convertDateToStringWithOutTime(empEducationDO.getEduto()));
		return result;
	}

}
