package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.InvoiceDetailsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class InvoiceDetailsUtil {
	
	public static JSONObject getinvoiceDetailList(List<InvoiceDetailsDO> invoiceDetailsList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (InvoiceDetailsDO invoiceDetailsDO : invoiceDetailsList) {
				resultJSONArray.put(getInvoiceDetailsObject(invoiceDetailsDO));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getInvoiceDetailsObject(InvoiceDetailsDO invoiceDetailsDO)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(invoiceDetailsDO.getId()));
		result.put(CommonConstants.INVOICE_NUMBER, invoiceDetailsDO.getInvoiceno());
		result.put(CommonConstants.REFERENCE, invoiceDetailsDO.getRefnumbername());
		result.put(CommonConstants.SERVICE_FROM, CommonUtil.convertDateToStringWithOutTime(invoiceDetailsDO.getServicefrom()));
		result.put(CommonConstants.SERVICE_TO, CommonUtil.convertDateToStringWithOutTime(invoiceDetailsDO.getServiceto()));
		result.put(CommonConstants.DUE_AMOUNT, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invoiceDetailsDO.getDueamount()));
		result.put(CommonConstants.NO_OF_DAYS, String.valueOf(invoiceDetailsDO.getNoofdays()));
		result.put(CommonConstants.TIME_PERIOD, String.valueOf(invoiceDetailsDO.getTimeperiod()));
		result.put(CommonConstants.RATE_OF_PERIOD, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invoiceDetailsDO.getRateofperiod()));
		if(invoiceDetailsDO.getTds() == null){
			result.put(CommonConstants.TDS,"");
		}else{
			result.put(CommonConstants.TDS,CommonUtil.convertDoubleValueWithTwoDecimalPoints(invoiceDetailsDO.getTds()));
		}
		return result;
	}
	
}