package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class InvoiceUtil {
	
	public static JSONObject getinvoiceListGrid(List<InvoiceDO> invoiceLIst)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = invoiceLIst.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (InvoiceDO invodo : invoiceLIst) {
				resultJSONArray.put(getInvoicebjectgrid(invodo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getInvoicebjectgrid(InvoiceDO invoiceDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(invoiceDO.getInvoiceno());
		String status = "Pending";
		if(invoiceDO.getInvoicestatus() != 'a'){
			status="Received";
		}
		result.put(status);
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(invoiceDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getinvoiceList(List<InvoiceDO> invList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (InvoiceDO invodo : invList) {
				resultJSONArray.put(getInvoicebject(invodo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getInvoicebject(InvoiceDO invodo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(invodo.getId()));
		result.put(CommonConstants.INVOICE_NUMBER, invodo.getInvoiceno());
		result.put(CommonConstants.PROJECT_ID, String.valueOf(invodo.getProjectid()));
		result.put(CommonConstants.CUSTOMER_ID, String.valueOf(invodo.getCustomerid()));
		result.put(CommonConstants.TOTAL_AMOUNT, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invodo.getTotalamount()));
		if(String.valueOf(invodo.getServicetax()).equalsIgnoreCase("null")){
			result.put(CommonConstants.SERVICE_TAX, "0.00");
		}else{
			result.put(CommonConstants.SERVICE_TAX, CommonUtil.convertDoubleValueWithTwoDecimalPoints(invodo.getServicetax()));
		}
		
		if(String.valueOf(invodo.getServicetaxper()).equalsIgnoreCase("null")){
			result.put(CommonConstants.SERVICE_TAX_PER, "");
		}else{
			result.put(CommonConstants.SERVICE_TAX_PER, invodo.getServicetaxper());
		}
		result.put(CommonConstants.DUE_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getDuedate()));
		result.put(CommonConstants.INVOICE_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getInvoicedate()));
		result.put(CommonConstants.AMOUNT_TYPE, String.valueOf(invodo.getAmounttype()));
		result.put(CommonConstants.AMOUNT_IN_INR, String.valueOf(invodo.getAmountininr()));
		result.put(CommonConstants.INVOICE_TYPE, String.valueOf(invodo.getTypeofinvoice()));
		result.put(CommonConstants.STATUS, String.valueOf(invodo.getInvoicestatus()));
		result.put(CommonConstants.RECEIVED_DATE, CommonUtil.convertDateToStringWithOutTime(invodo.getReceiveddate()));
		
		if(invodo.getReceivedamount() != null){
			result.put(CommonConstants.RECEIVED_AMOUNT, String.valueOf(invodo.getReceivedamount()));
		}else{
			result.put(CommonConstants.RECEIVED_AMOUNT, 0.00);
		}
		result.put(CommonConstants.RECEIVED_AMOUNTTYPE, String.valueOf(invodo.getReceivedamounttype()));
		result.put(CommonConstants.RECEIVED_COMMENTS, String.valueOf(invodo.getReceivedcomments()));
		return result;
	}
	
	public static JSONObject getInvoiceDataTableList(List<InvoiceDO> invoiceList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if(invoiceList.size() > 0){
				for (InvoiceDO invdo : invoiceList) {
					resultJSONArray.put(getInvoiceDetailDataTableObject(invdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getInvoiceDetailDataTableObject(InvoiceDO invdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		String status = "";
		String receivedamount = "";
		
		result.put(String.valueOf(invdo.getInvoiceno()));
		if(invdo.getInvoicestatus() == 'i' ){
			status = CommonConstants.PAID;
			receivedamount = CommonUtil.convertnumberValueWithcomma(invdo.getReceivedamount());
		}else{
			status = CommonConstants.PENDING;
			receivedamount = "";
		}
		result.put(status);
		result.put(receivedamount);
		
		return result;
	}
	
}