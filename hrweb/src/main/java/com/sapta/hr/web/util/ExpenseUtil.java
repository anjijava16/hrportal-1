package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.ExpTypeDO;
import com.sapta.hr.domainobject.ExpenseDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.ExpTypeService;
import com.sapta.hr.util.CommonConstants;

public class ExpenseUtil {

	private ExpenseUtil(){
	}
		
	public static JSONObject getExpenceListGrid(List<ExpenseDO> expenseList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = expenseList.size()/5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));
			
			JSONArray resultJSONArray = new JSONArray();
			for (ExpenseDO intExpenseDO : expenseList) {
				resultJSONArray.put(getExpenseDetailsObjectGrid(intExpenseDO));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getExpenseDetailsObjectGrid(ExpenseDO expenseDO) throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(CommonUtil.convertDateToStringWithOutTime(expenseDO.getExpdate()));
		result.put(expenseDO.getCategory());
		List<ExpTypeDO> expenseTypeList = new ExpTypeService().retrive();
		for(ExpTypeDO expenseType : expenseTypeList){
			if(expenseType.getId() == expenseDO.getExptypeid()){
				result.put(String.valueOf(expenseType.getDispname()));
			}
		}
		
		result.put(expenseDO.getDescription());
		result.put(expenseDO.getAmount());
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(expenseDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}
	
	public static JSONObject getExpenseList(List<ExpenseDO> expList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (ExpenseDO expenseDO : expList) {
				resultJSONArray.put(getExpenseDetailObject(expenseDO));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getExpenseDetailObject(ExpenseDO expenseDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(expenseDO.getId()));
		result.put(CommonConstants.DATE, CommonUtil.convertDateToStringWithOutTime(expenseDO.getExpdate()));
		if(expenseDO.getExptypeid() > 0){
			List<ExpTypeDO> expenseTypeList = new ExpTypeService().retriveById(expenseDO.getExptypeid());
			if(expenseTypeList != null && expenseTypeList.size() > 0){
				result.put(CommonConstants.EXP_TYPE, expenseTypeList.get(0).getDispname());
			}
		}
		result.put(CommonConstants.EXP_TYPE_ID, expenseDO.getExptypeid());
		result.put(CommonConstants.DESCRIPTION, expenseDO.getDescription());
		result.put(CommonConstants.MODE_PAY, String.valueOf(expenseDO.getModeofpay()));
		result.put(CommonConstants.CATEGORY, expenseDO.getCategory());
		result.put(CommonConstants.AMOUNT, CommonUtil.convertfloatValueWithTwoDecimalPoints(expenseDO.getAmount()));
		result.put(CommonConstants.BILL_NO, expenseDO.getBillno());
		result.put(CommonConstants.BANK_NAME, expenseDO.getBankname());
		result.put(CommonConstants.CARD_OR_CHEQUE_NO, expenseDO.getCardno());
		return result;
	}
	public static JSONObject getExpenseDataTableList(List<ExpenseDO> expenseList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (expenseList.size() > 0) {
				for (ExpenseDO expdo : expenseList) {
					resultJSONArray.put(getExpenseDetailDataTableObject(expdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getExpenseDetailDataTableObject(ExpenseDO expdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(expdo.getId()));
		result.put(String.valueOf(CommonUtil.convertDateToStringWithOutTime(expdo.getExpdate())));
		result.put(expdo.getCategory());
		if(expdo.getExptypeid() > 0){
			List<ExpTypeDO> expenseTypeList = new ExpTypeService().retriveById(expdo.getExptypeid());
			if(expenseTypeList != null && expenseTypeList.size() > 0){
				result.put(expenseTypeList.get(0).getDispname());
			}
		}
		result.put(String.valueOf(expdo.getDescription()));
		result.put(CommonUtil.convertnumberValueWithcomma(expdo.getAmount()));
		
		return result;
	}
	
	
}
