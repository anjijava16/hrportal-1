package com.sapta.hr.web.util;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class EmpCtcUtil {
	
	public static JSONObject getEmpCTCListGrid(List<EmpCTCDO> empctcList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = empctcList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (EmpCTCDO ctcdo : empctcList) {
				resultJSONArray.put(getProjectDetailObjectgrid(ctcdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getProjectDetailObjectgrid(EmpCTCDO empctcDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(empctcDO.getEmpid());
		result.put(empctcDO.getEmpctc());
		result.put(CommonUtil.convertDateToStringWithdatetime(empctcDO.getStartdate()));
		result.put(CommonUtil.convertDateToStringWithdatetime(empctcDO.getEnddate()));
		if(String.valueOf(empctcDO.getStatus()).equalsIgnoreCase("a")){
			result.put("Active");
		}else if(String.valueOf(empctcDO.getStatus()).equalsIgnoreCase("i")){
			result.put("In-Active");
		}

		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(empctcDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getCtcList(List<EmpCTCDO> empctcList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (EmpCTCDO ctcdo : empctcList) {
				resultJSONArray.put(getCtcDetailObject(ctcdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getCtcDetailObject(EmpCTCDO ctcdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(ctcdo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(ctcdo.getEmpid()));
		result.put(CommonConstants.EMP_CTC, String.valueOf(ctcdo.getEmpctc()));
		result.put(CommonConstants.START_DATE, CommonUtil.convertDateToStringWithOutTime(ctcdo.getStartdate()));
		result.put(CommonConstants.END_DATE, CommonUtil.convertDateToStringWithOutTime(ctcdo.getEnddate()));
		result.put(CommonConstants.STATUS, ctcdo.getStatus());
		return result;
	}
	
	public static JSONObject getCustomerDataTableList(List<EmpCTCDO> empctcDO, HttpServletRequest request)throws AppException, MalformedURLException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (empctcDO != null) {
				int len = empctcDO.size();
				for (EmpCTCDO ctcdetail : empctcDO) {
					
					resultJSONArray.put(getCustomerDetailDataTableObject(ctcdetail, request,len,resultJSONArray));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getCustomerDetailDataTableObject(EmpCTCDO ctcdetail, HttpServletRequest request,int len,JSONArray resultJSONArray)throws JSONException, AppException, MalformedURLException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(ctcdetail.getEmpid()));
		result.put(ctcdetail.getEmpctc());
		result.put(CommonUtil.convertDateToStringWithOutTime(ctcdetail.getStartdate()));
		result.put(CommonUtil.convertDateToStringWithOutTime(ctcdetail.getEnddate()));
		if(ctcdetail.getStatus() == 'i'){
			result.put(CommonConstants.CLOSED);
		}else{
			result.put(CommonConstants.ACTIVE);
		}
		if((len-1) == resultJSONArray.length()){
			result.put("");
		}else{
			result.put("<img src='http://" + new URL(request.getRequestURL().toString()).getHost() + ":" + request.getLocalPort() + "" + request.getContextPath() + "/resources/icons/pdf.png' style='cursor : pointer; width: 17%;'/>");
		}
		
		return result;
	}

}