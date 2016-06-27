package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.util.CommonConstants;

public final class ProfessionalTaxUtil {
	
	public static JSONObject getProfessionalTaxGrid(List<ProfessionalTaxDO> taxLIst)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = taxLIst.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (ProfessionalTaxDO ptdo : taxLIst) {
				resultJSONArray.put(getProfessionalTaxObjectgrid(ptdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getProfessionalTaxObjectgrid(ProfessionalTaxDO ptdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(ptdo.getEmpid());
		result.put(CommonUtil.convertDateToStringWithdatetime(ptdo.getPtmonth()));
		result.put(ptdo.getAmount());

		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(ptdo.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getProfessionalTaxList(List<ProfessionalTaxDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (ProfessionalTaxDO ptdo : empList) {
				resultJSONArray.put(getProfessionalTaxObject(ptdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getProfessionalTaxObject(ProfessionalTaxDO ptdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(ptdo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(ptdo.getEmpid()));
		result.put(CommonConstants.PT_COMPLETE_MONTH, CommonUtil.convertDateToStringWithOutTime(ptdo.getPtmonth()));
		result.put(CommonConstants.PT_MONTH, ptdo.getPtmonth());
		result.put(CommonConstants.AMOUNT, String.valueOf(ptdo.getAmount()));
		return result;
	}
	
	public static JSONObject getptDataTableList(List<ProfessionalTaxDO> ptList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (ptList.size() > 0) {
				for (ProfessionalTaxDO ptLists : ptList) {
					resultJSONArray.put(getptDataTableObject(ptLists));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getptDataTableObject(ProfessionalTaxDO ptList)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(ptList.getEmpid()));
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		if(employeeList.size() > 0){
			for (EmployeeDO employeeDO : employeeList) {
				if(employeeDO.getId().equals(ptList.getEmpid())){
					result.put(String.valueOf(employeeDO.getFname() +" "+employeeDO.getLname()));
				}
			}
		}
		result.put(CommonUtil.convertDateToStringWithdatetime(ptList.getPtmonth()));
		result.put(CommonUtil.convertfloatValueWithTwoDecimalPoints(ptList.getAmount()));
		return result;
	}
}