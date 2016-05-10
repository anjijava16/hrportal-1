package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.ExternalInvoiceDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public class ExternalInvoiceUtil {

	



	public static JSONObject getinvoiceList(List<ExternalInvoiceDO> invList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (ExternalInvoiceDO invodo : invList) {
				resultJSONArray.put(getInvoicebject(invodo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getInvoicebject(ExternalInvoiceDO invodo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(invodo.getId()));
		result.put(CommonConstants.INVOICE_NUMBER, invodo.getInvoiceno());
		result.put(CommonConstants.INVOICE_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getInvoicedate()));
		result.put(CommonConstants.DUE_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getDuedate()));
		result.put(CommonConstants.INVOICE_AMOUNT, String.valueOf(invodo.getInvoiceamount()));
		result.put(CommonConstants.AMOUNT_TYPE, String.valueOf(invodo.getAmounttype()));
		result.put(CommonConstants.STATUS, String.valueOf(invodo.getInvoicestatus()));
		result.put(CommonConstants.PROJECT_ID, String.valueOf(invodo.getProjectid()));
		result.put(CommonConstants.CUSTOMER_ID, String.valueOf(invodo.getCustomerid()));
		result.put(CommonConstants.RECEIVED_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getReceiveddate()));
		if(invodo.getReceivedamount() != null){
			result.put(CommonConstants.RECEIVED_AMOUNT, String.valueOf(invodo.getReceivedamount()));
		}else{
			result.put(CommonConstants.RECEIVED_AMOUNT, 0.00);
		}
		result.put(CommonConstants.RECEIVED_AMOUNTTYPE, String.valueOf(invodo.getReceivedamounttype()));
		result.put(CommonConstants.RECEIVED_COMMENTS, String.valueOf(invodo.getReceivedcomments()));
		//result.put(CommonConstants.TOTAL_AMOUNT, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invodo.getTotalamount()));
		/*if(String.valueOf(invodo.getServicetax()).equalsIgnoreCase("null")){
			result.put(CommonConstants.SERVICE_TAX, "");
		}else{
			result.put(CommonConstants.SERVICE_TAX, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invodo.getServicetax()));
		}*/
//		result.put(CommonConstants.AMOUNT_IN_INR, String.valueOf(invodo.getAmountininr()));
//		result.put(CommonConstants.INVOICE_TYPE, String.valueOf(invodo.getTypeofinvoice()));
		
		return result;
	}
	
	public static JSONObject getInvoiceDataTableList(List<ExternalInvoiceDO> extinvoiceList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if(extinvoiceList.size() > 0){
				for (ExternalInvoiceDO invdo : extinvoiceList) {
					resultJSONArray.put(getInvoiceDetailDataTableObject(invdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getInvoiceDetailDataTableObject(ExternalInvoiceDO invdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		String status = "";
		String receivedamount = "";
		if(invdo.getInvoicestatus() == 'i' ){
			status = CommonConstants.PAID;
			receivedamount = CommonUtil.convertnumberValueWithcomma(invdo.getReceivedamount());
		}else{
			status = CommonConstants.PENDING;
			receivedamount = "";
		}
		
		result.put(String.valueOf(invdo.getInvoiceno()));
		result.put(status);
		result.put(receivedamount);
	
		return result;
	}
	
}
