package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpBonusDO;
import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

public class EmpBounsUtill {

	
	public static JSONObject getBounsList(List<EmpBonusDO> bonusList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (EmpBonusDO empbouns : bonusList) {
				resultJSONArray.put(getBounsObject(empbouns));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getBounsObject(EmpBonusDO empbounsdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(empbounsdo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(empbounsdo.getEmpid()));
		result.put(CommonConstants.BONUS_DATE_MONTH, CommonUtil.convertDateToStringWithOutTime(empbounsdo.getBonusmonth()));
		result.put(CommonConstants.PAIDON, CommonUtil.convertDateToStringWithOutTime(empbounsdo.getPaidon()));
		result.put(CommonConstants.COMMENTS, empbounsdo.getComments());
		result.put(CommonConstants.AMOUNT, empbounsdo.getBonusamount());
		return result;
	}
	
	public static JSONObject gettdsDataTableList(List<EmpBonusDO> bonusList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (bonusList.size() > 0) {
				for(EmpBonusDO empbounsdo : bonusList) {
					resultJSONArray.put(gettdsDataTableObject(empbounsdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray gettdsDataTableObject(EmpBonusDO empbounsdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(empbounsdo.getEmpid()));
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		if(employeeList.size() > 0){
			for (EmployeeDO employeeDO : employeeList) {
				if(employeeDO.getId().equals(empbounsdo.getEmpid())){
					result.put(String.valueOf(employeeDO.getFname() +" "+employeeDO.getLname()));
				}
			}
		}
		result.put(CommonUtil.convertnumberValueWithcomma(empbounsdo.getBonusamount()));
		result.put(CommonUtil.convertDateToStringWithdatetime(empbounsdo.getBonusmonth()));
		if(empbounsdo.getPaidon() != null){
			result.put(String.valueOf(empbounsdo.getPaidon()));
		}else{
			result.put(String.valueOf("-"));
		}
		if(empbounsdo.getComments() != null){
			result.put(String.valueOf(empbounsdo.getComments()));
		}else{
			result.put(String.valueOf("-"));
		}
		result.put(String.valueOf(""));
		return result;
	}
}
