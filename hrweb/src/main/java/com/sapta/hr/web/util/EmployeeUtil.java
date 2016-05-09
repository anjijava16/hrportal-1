package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class EmployeeUtil {

	private EmployeeUtil(){		
	}
	
	public static JSONObject getEmployeeList(List<EmployeeDO> employeeList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmployeeDO employeedo : employeeList) {
				resultJSONArray.put(getEmployeeObject(employeedo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getEmployeeObject(EmployeeDO employeedo) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.EMPLOYEE_ID, employeedo.getId());
		result.put(CommonConstants.FIRST_NAME, employeedo.getFname());
		result.put(CommonConstants.MIDDLE_NAME, employeedo.getMname());
		result.put(CommonConstants.LAST_NAME, employeedo.getLname());
		result.put(CommonConstants.EMAIL, employeedo.getEmail());
		result.put(CommonConstants.PERSONAL_EMAIL, employeedo.getPersonalemailid());
		result.put(CommonConstants.MOBILE, String.valueOf(employeedo.getMobileno()));
		if(employeedo.getPhone() != null)
			result.put(CommonConstants.PHONE, String.valueOf(employeedo.getPhone()));
		result.put(CommonConstants.STATUS, String.valueOf(employeedo.getStatus()));
		result.put(CommonConstants.PASSPORT, employeedo.getPassport());
		result.put(CommonConstants.PASSPORT_PLACE_OF_ISSUED, employeedo.getPplaceofissued());
		result.put(CommonConstants.PASSPORT_VALID_UPTO, CommonUtil.convertDateToStringWithOutTime(employeedo.getPvalidupto()));
		result.put(CommonConstants.DRIVING_LICENCE_NO, employeedo.getDlno());
		result.put(CommonConstants.PAN, employeedo.getPan());
		result.put(CommonConstants.AADHARNO, employeedo.getAadharno());
		result.put(CommonConstants.PFNO, employeedo.getPfno());
		return result;
	}
	public static JSONObject getEmployeeDataTableList(List<EmployeeDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (empList.size() > 0) {
				for (EmployeeDO employeedo : empList) {
					resultJSONArray.put(getEmployeeDetailDataTableObject(employeedo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}
	private static JSONArray getEmployeeDetailDataTableObject(EmployeeDO employeedo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		
		result.put(String.valueOf(employeedo.getId()));
		result.put(employeedo.getFname());
		result.put(employeedo.getLname());
		result.put(employeedo.getMobileno());
		result.put(employeedo.getEmail());
		if(String.valueOf(employeedo.getStatus()).equalsIgnoreCase("a")){
			result.put(CommonConstants.ACTIVE);
		} else if(String.valueOf(employeedo.getStatus()).equalsIgnoreCase("i")){
			result.put(CommonConstants.CLOSED);
		}
		return result;
	}

}

