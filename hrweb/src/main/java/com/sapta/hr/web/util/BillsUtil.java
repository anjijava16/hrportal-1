package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;

public final class BillsUtil {
	
	public static JSONObject getbillsListGrid(List<BillsDO> billsLIst)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = billsLIst.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (BillsDO billsdo : billsLIst) {
				resultJSONArray.put(getBillsbjectgrid(billsdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getBillsbjectgrid(BillsDO billsDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(billsDO.getBillno());
		result.put(billsDO.getDueamount());
		result.put(CommonUtil.convertDateToStringWithOutTime(billsDO.getDuedate()));
		String status = "Pending";
		if(billsDO.getStatus() != 'a'){
			status="Paid";
		}
		result.put(status);
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(billsDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getbillsList(List<BillsDO> bilList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (BillsDO billsdo : bilList) {
				resultJSONArray.put(getBillsbject(billsdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getBillsbject(BillsDO billsdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(billsdo.getId()));
		result.put(CommonConstants.VENDOR_ID, String.valueOf(billsdo.getVendorid()));
		result.put(CommonConstants.BILLS_NO, billsdo.getBillno());
		result.put(CommonConstants.DUE_AMOUNT, billsdo.getDueamount());
		result.put(CommonConstants.AMOUNT_TYPE, String.valueOf(billsdo.getAmounttype())); 
		result.put(CommonConstants.COMMENTS, billsdo.getComments());
		result.put(CommonConstants.STATUS, String.valueOf(billsdo.getStatus()));
		result.put(CommonConstants.BillDate, CommonUtil.convertDateToStringWithOutTime(billsdo.getBilldate()));
		result.put(CommonConstants.DUE_DATE, CommonUtil.convertDateToStringWithOutTime(billsdo.getDuedate()));
		result.put(CommonConstants.PAIDON, CommonUtil.convertDateToStringWithOutTime(billsdo.getPaidon()));
		return result;
	}
	public static JSONObject getBillDataTableList(List<BillsDO> billList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (billList.size() > 0 ) {
				for (BillsDO billdo : billList) {
					resultJSONArray.put(getBillDetailDataTableObject(billdo));
				}
			}	
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getBillDetailDataTableObject(BillsDO billdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		String status = "";
		result.put(String.valueOf(billdo.getId()));
		result.put(String.valueOf(billdo.getBillno()));
		result.put(CommonUtil.convertnumberValueWithcomma(billdo.getDueamount()));
		result.put(CommonUtil.convertDateToStringWithOutTime(billdo.getDuedate()));
		result.put(String.valueOf(billdo.getComments()));
		if(billdo.getStatus() == 'i' ){
			status = CommonConstants.PAID;
		}else{
			status = CommonConstants.PENDING;
		}
		result.put(status);
		
		return result;
	}
	
}
