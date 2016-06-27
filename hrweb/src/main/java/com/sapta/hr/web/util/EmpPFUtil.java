package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpPFDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

public class EmpPFUtil {


	private static JSONArray getProjectDetailObjectgrid(EmpPFDO emppfDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		
		result.put(String.valueOf(emppfDO.getId()));
		result.put(String.valueOf(emppfDO.getEmpid()));
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		if(employeeList.size() > 0){
			for (EmployeeDO employeeDO : employeeList) {
				if(employeeDO.getId().equals(emppfDO.getEmpid())){
					result.put(String.valueOf(employeeDO.getFname() +" "+employeeDO.getLname()));
				}
			}
		}
		result.put(String.valueOf(emppfDO.getPfamount()));
		result.put(CommonUtil.convertDateToStringWithdatetime(emppfDO.getPfmonth()));
		return result;
	}
	
	public static JSONObject gettdsDataTableList(List<EmpPFDO> emppfList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (emppfList.size() > 0) {
				for (EmpPFDO emppfDO : emppfList) {
					resultJSONArray.put(getProjectDetailObjectgrid(emppfDO));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	public static JSONObject  getPFList(List<EmpPFDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (EmpPFDO pfdo : empList) {
				resultJSONArray.put(getProjectDetailObject(pfdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getProjectDetailObject(EmpPFDO pfdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.EMPLOYEE_ID, pfdo.getEmpid());
		List<EmployeeDO>  employeeList= new EmployeeService().retriveEmployee();
		if(employeeList.size() > 0){
			for (EmployeeDO employeeDO : employeeList) {
				if( employeeDO.getId().equals(pfdo.getEmpid())){
					result.put(CommonConstants.NAME,String.valueOf(employeeDO.getFname() +" "+employeeDO.getLname()));
				}
			}
		}    
		result.put(CommonConstants.EMPLOYEE_PFAMOUNT, String.valueOf(pfdo.getPfamount()));
		result.put(CommonConstants.EMPLOYEE_PFMONTH, CommonUtil.convertDateToStringWithOutTime(pfdo.getPfmonth()));
		return result;
	}
	
	
}
