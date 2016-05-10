package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.PayrollData;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;


public class PayrollUtil {
	
	private PayrollUtil() {}
	public static JSONObject getPayrollListGrid(List<PayrollData> payrollList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = payrollList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (PayrollData payroll : payrollList) {
				resultJSONArray.put(getPayrollObjectgrid(payroll));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getPayrollObjectgrid(PayrollData payrollDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(payrollDO.getEmpid()));
		result.put(payrollDO.getEmpname());
		result.put(String.valueOf(payrollDO.getMonthctc()));
		result.put(payrollDO.getSalstatus());
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(payrollDO.getEmpid()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getPayrollList(List<PayrollData> payList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (PayrollData paylist : payList) {
				resultJSONArray.put(getPayrollDetailObject(paylist));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getPayrollDetailObject(PayrollData payrollDO)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put("empid",String.valueOf(payrollDO.getEmpid()));
		result.put("empname",payrollDO.getEmpname());
		result.put("monthctc",CommonUtil.convertfloatValueWithTwoDecimalPoints(payrollDO.getMonthctc()));
		result.put("salstatus",payrollDO.getSalstatus());
			if(payrollDO.getMonthctc() == 0){
				
			}
		
		return result;
	}
	
	public static JSONObject getPayrollDetailsList(List<PayrollDO> payrollList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (PayrollDO payroll : payrollList) {
				resultJSONArray.put(getPayrollDetailListObject(payroll));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getPayrollDetailListObject(PayrollDO payrollDO)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(payrollDO.getId()));
		result.put(CommonConstants.EMP_ID, payrollDO.getEmpid());
		result.put(CommonConstants.NETPAYABLE_AMOUNT, payrollDO.getNetpayableamount());
		result.put(CommonConstants.PAYROLL_MONTH, CommonUtil.convertDateToStringWithOutTime(payrollDO.getPayrollmonth()));
		
		return result;
	}
	
	public static JSONObject getPayrollList1(List<PayrollData> payList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (payList.size() > 0) {
				for (PayrollData paylist : payList) {
					resultJSONArray.put(getPayrollDetailObject1(paylist));
				}
			}
			responseJSON.put("data", resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONArray getPayrollDetailObject1(PayrollData payrollDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(payrollDO.getEmpid()));
		result.put(payrollDO.getEmpname());
		if(payrollDO.getMonthctc() == 0){
			result.put("");
		}
		else{
			result.put(CommonUtil.convertnumberValueWithcomma(payrollDO.getMonthctc()));
		}
		if(payrollDO.getPaidon() == ""){
			result.put("");
		}
		else{
			result.put(payrollDO.getPaidon());
		}
		if(payrollDO.getSalstatus() == "Paid"){
			result.put(CommonConstants.PAID);
		}else{
			result.put(CommonConstants.PENDING);
		}
		
		return result;
	}
	
	public static JSONObject getPayrollListDetails(List<PayrollDO> payrollList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (PayrollDO payrolldo : payrollList) {
				resultJSONArray.put(getPayrollListDetailsObject(payrolldo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getPayrollListDetailsObject(PayrollDO payrollDO) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, payrollDO.getId());
		result.put(CommonConstants.EMP_ID, payrollDO.getEmpid());
		result.put(CommonConstants.BASIC_PAY, payrollDO.getBasic());
		result.put(CommonConstants.HRA, payrollDO.getHra());
		result.put(CommonConstants.PERSONAL_ALLOWANCES, payrollDO.getPersonal());
		result.put(CommonConstants.CONVEYANCE_ALLOWANCES, payrollDO.getConveyance());
		result.put(CommonConstants.PROFESSIONAL_TAX, payrollDO.getPt());
		result.put(CommonConstants.LOSS_OF_PAY, payrollDO.getLop());
		result.put(CommonConstants.PROVIDENT_FUND, payrollDO.getPf());
		result.put(CommonConstants.TAX_DEDUCTION_SOURCE, payrollDO.getTds());
		result.put(CommonConstants.TDMONTH, payrollDO.getPt());
		result.put(CommonConstants.TOTAL_EARNINGS, payrollDO.getTotalearnings());
		result.put(CommonConstants.TOTAL_DEDUCTION, payrollDO.getTotaldeduction());
		result.put(CommonConstants.NETPAYABLE_AMOUNT, payrollDO.getNetpayableamount());
		result.put(CommonConstants.EMP_MONTHLY_CTC, payrollDO.getEmpmonthlyctc());
		result.put(CommonConstants.DAYS_PAYABLE, payrollDO.getDayspayable());
		return result;
	}
	
	
}
