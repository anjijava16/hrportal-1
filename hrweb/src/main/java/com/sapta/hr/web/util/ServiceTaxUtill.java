package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.ServiceTaxDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class ServiceTaxUtill {

	public static JSONObject getservicetaxList(List<ServiceTaxDO> taxList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (ServiceTaxDO servicetaxDO : taxList) {
				resultJSONArray.put(getservicetaxObject(servicetaxDO));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getservicetaxObject(ServiceTaxDO servicetaxDO)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(servicetaxDO.getId()));
		result.put(CommonConstants.INVOICE_NO, String.valueOf(servicetaxDO.getInvoiceno()));
		result.put(CommonConstants.TAXMONTH, CommonUtil.convertDateToStringWithdatetime(servicetaxDO.getTaxmonth()));
		result.put(CommonConstants.TAX_DATE_MONTH, CommonUtil.convertDateToStringWithOutTime(servicetaxDO.getTaxmonth()));
		result.put(CommonConstants.AMOUNT, servicetaxDO.getAmount());
		result.put(CommonConstants.COMMENTS, servicetaxDO.getComments());
		return result;
	}
	
	public static JSONObject getservicetaxDataTableList(List<ServiceTaxDO> taxList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (taxList.size() > 0) {
				for (ServiceTaxDO servicetaxDO : taxList) {
					resultJSONArray.put(getservicetaxDataTableObject(servicetaxDO));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getservicetaxDataTableObject(ServiceTaxDO servicetaxDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(servicetaxDO.getId()));
		if(servicetaxDO.getInvoiceno() == null || servicetaxDO.getInvoiceno() == ""){
			result.put("-");
		}else{
			result.put(servicetaxDO.getInvoiceno());
		}
		result.put(CommonUtil.convertDateToStringWithdatetime(servicetaxDO.getTaxmonth()));
		result.put(CommonUtil.convertnumberValueWithcomma(servicetaxDO.getAmount()));
		result.put(servicetaxDO.getComments());
		return result;
	}
}
