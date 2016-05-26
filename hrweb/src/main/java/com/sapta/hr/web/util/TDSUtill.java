package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class TDSUtill {
	
	public static JSONObject gettdsListGrid(List<TDSDO> tdsLIst)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = tdsLIst.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (TDSDO tdsdo : tdsLIst) {
				resultJSONArray.put(gettdsObjectgrid(tdsdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	private static JSONObject gettdsObjectgrid(TDSDO tdsdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		String empid = "-";
		if(tdsdo.getEmpid() != 0){
			empid = String.valueOf(tdsdo.getEmpid());
		}
		result.put(empid);
		result.put(tdsdo.getRefer());
		result.put(CommonUtil.convertDateToStringWithdatetime(tdsdo.getTdsmonth()));
		result.put(tdsdo.getAmount());

		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(tdsdo.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject gettdsList(List<TDSDO> tdList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (TDSDO tdsdo : tdList) {
				resultJSONArray.put(gettdsObject(tdsdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject gettdsObject(TDSDO tdsdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(tdsdo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(tdsdo.getEmpid()));
		result.put(CommonConstants.TDMONTH, CommonUtil.convertDateToStringWithdatetime(tdsdo.getTdsmonth()));
		result.put(CommonConstants.TDS_DATE_MONTH, CommonUtil.convertDateToStringWithOutTime(tdsdo.getTdsmonth()));
		result.put(CommonConstants.AMOUNT, tdsdo.getAmount());
		result.put(CommonConstants.REFERENCES, tdsdo.getRefer());
		result.put(CommonConstants.COMMENTS, tdsdo.getComments());
		return result;
	}
	
	public static JSONObject gettdsDataTableList(List<TDSDO> tdList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (tdList.size() > 0) {
				for (TDSDO tdsdo : tdList) {
					resultJSONArray.put(gettdsDataTableObject(tdsdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray gettdsDataTableObject(TDSDO tdsdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(tdsdo.getId()));
		if(tdsdo.getEmpid() != null){
			result.put(String.valueOf(tdsdo.getEmpid()));
		}else{
			result.put(String.valueOf("-"));
		}
		if(tdsdo.getRefer() != null){
			result.put(String.valueOf(tdsdo.getRefer()));
		}else{
			result.put(String.valueOf("-"));
		}
		result.put(CommonUtil.convertDateToStringWithdatetime(tdsdo.getTdsmonth()));
		result.put(CommonUtil.convertnumberValueWithcomma(tdsdo.getAmount()));
		return result;
	}
	
}