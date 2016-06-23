package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpTDSDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

public class EmpTdsUtil {

	
	public static JSONObject gettdsList(List<EmpTDSDO> tdList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (EmpTDSDO emptds : tdList) {
				resultJSONArray.put(gettdsObject(emptds));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject gettdsObject(EmpTDSDO tdsdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(tdsdo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(tdsdo.getEmpid()));
		result.put(CommonConstants.TDMONTH, CommonUtil.convertDateToStringWithdatetime(tdsdo.getTdsmonth()));
		result.put(CommonConstants.TDS_DATE_MONTH, CommonUtil.convertDateToStringWithOutTime(tdsdo.getTdsmonth()));
		result.put(CommonConstants.AMOUNT, tdsdo.getTds());
		result.put(CommonConstants.COMMENTS, tdsdo.getComments());
		return result;
	}
	
	public static JSONObject gettdsDataTableList(List<EmpTDSDO> tdList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (tdList.size() > 0) {
				for(EmpTDSDO tdsdo : tdList) {
					resultJSONArray.put(gettdsDataTableObject(tdsdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray gettdsDataTableObject(EmpTDSDO tdsdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(tdsdo.getEmpid()));
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		if(employeeList.size() > 0){
			for (EmployeeDO employeeDO : employeeList) {
				if(employeeDO.getId().equals(tdsdo.getEmpid())){
					result.put(String.valueOf(employeeDO.getFname() +" "+employeeDO.getLname()));
				}
			}
		}
		
		result.put(CommonUtil.convertnumberValueWithcomma(tdsdo.getTds()));
		result.put(CommonUtil.convertDateToStringWithdatetime(tdsdo.getTdsmonth()));
		if(tdsdo.getPaidon() != null){
			result.put(String.valueOf(tdsdo.getPaidon()));
		}else{
			result.put(String.valueOf("-"));
		}
		if(tdsdo.getComments() != null){
			result.put(String.valueOf(tdsdo.getComments()));
		}else{
			result.put(String.valueOf("-"));
		}
		result.put("");
		/*result.put(String.valueOf(tdsdo.getId()));*/
		
		return result;
	}
}
