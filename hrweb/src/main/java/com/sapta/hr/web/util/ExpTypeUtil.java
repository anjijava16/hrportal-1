package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class ExpTypeUtil {
	
	public static JSONObject getExpenseTypeListGrid(List<ExpTypeDO> ExpTypeList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = ExpTypeList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (ExpTypeDO expTypeDO : ExpTypeList) {
				resultJSONArray.put(getExpenseTypeDetailObjectgrid(expTypeDO));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getExpenseTypeDetailObjectgrid(ExpTypeDO expTypeDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(expTypeDO.getId()));
		result.put(expTypeDO.getName());
		result.put(expTypeDO.getDispname());

		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(expTypeDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getExpenseTypeList(List<ExpTypeDO> expenseTypeList) throws JSONException, AppException  {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
				
			for(ExpTypeDO expensetypedo : expenseTypeList){
				resultJSONArray.put(getExpenseTypeDetailObject(expensetypedo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		return responseJSON;
	}

	private static JSONObject getExpenseTypeDetailObject(ExpTypeDO expensetypedo) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(expensetypedo.getId()));
		result.put(CommonConstants.DISPLAY_NAME, expensetypedo.getDispname());
		return result;
	}

}