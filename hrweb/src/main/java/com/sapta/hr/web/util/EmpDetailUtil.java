package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class EmpDetailUtil {
	
	@SuppressWarnings("unused")
	private static JSONObject getEmployeeDetailsObjectgrid(EmpDetailDO empdetailDO) throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(empdetailDO.getId()));
		result.put(empdetailDO.getDob());
		result.put(empdetailDO.getAge());
		result.put(String.valueOf(empdetailDO.getGender()));
		result.put(empdetailDO.getDept());
		result.put(empdetailDO.getJdate());
		result.put(empdetailDO.getRdate());
		result.put(String.valueOf(empdetailDO.getMarital()));
		result.put(empdetailDO.getBloodgroup());
		result.put(empdetailDO.getJoininglocation());
		result.put(empdetailDO.getEmergencyno());
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(empdetailDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}
	
	public static JSONObject getEmployeeDetailList(List<EmpDetailDO> empDetailList) throws Exception{
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpDetailDO empdetaildo : empDetailList) {
				resultJSONArray.put(getEmpDetailObject(empdetaildo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getEmpDetailObject(EmpDetailDO empdetaildo) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.DOB, CommonUtil.convertDateToStringWithOutTime(empdetaildo.getDob()));
		result.put(CommonConstants.AGE, String.valueOf(empdetaildo.getAge()));
		result.put(CommonConstants.GENDER, String.valueOf(empdetaildo.getGender()));
		result.put(CommonConstants.POST_APPLIED_FOR, empdetaildo.getPostapplied());
		result.put(CommonConstants.DEPARTMENT, empdetaildo.getDept());
		result.put(CommonConstants.JDATE, CommonUtil.convertDateToStringWithOutTime(empdetaildo.getJdate()));
		result.put(CommonConstants.RDATE, CommonUtil.convertDateToStringWithOutTime(empdetaildo.getRdate()));
		result.put(CommonConstants.EMERGENCY_NO, empdetaildo.getEmergencyno());
		result.put(CommonConstants.MARITAL_STATUS, String.valueOf(empdetaildo.getMarital()));
		result.put(CommonConstants.DATE_OF_ANNIVERSARY, CommonUtil.convertDateToStringWithOutTime(empdetaildo.getDoa()));
		result.put(CommonConstants.B_GROUP, empdetaildo.getBloodgroup());
		result.put(CommonConstants.POSSESS_VEHICLE, String.valueOf(empdetaildo.getPossessvehicle()));
		result.put(CommonConstants.JOINING_LOCATION, empdetaildo.getJoininglocation());
		result.put(CommonConstants.ACCIDENT_ILLNESS, String.valueOf(empdetaildo.getIllnessaccident()));
		result.put(CommonConstants.ILLNESS_DESCRIPTION, empdetaildo.getDescription());
		return result;
	}
}
