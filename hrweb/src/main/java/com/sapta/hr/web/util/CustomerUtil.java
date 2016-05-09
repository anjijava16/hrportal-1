package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.util.CommonConstants;


public class CustomerUtil {
	
	private CustomerUtil() {}
	public static JSONObject getCustomerListGrid(List<CustomerDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = empList.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (CustomerDO customer : empList) {
				resultJSONArray.put(getCustomerDetailsObjectgrid(customer));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getCustomerDetailsObjectgrid(CustomerDO customer)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(customer.getCustomercode()));
		result.put(customer.getName());
		result.put(String.valueOf(customer.getEmail()));
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(customer.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getCustomerList(List<CustomerDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			JSONArray resultJSONArray = new JSONArray();
			for (CustomerDO customer : empList) {
				resultJSONArray.put(getCustomerDetailObject(customer));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getCustomerDetailObject(CustomerDO customer)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(customer.getId()));
		result.put(CommonConstants.CUSTOMER_NAME, String.valueOf(customer.getName()));
		result.put(CommonConstants.CUSTOMER_CODE, String.valueOf(customer.getCustomercode()));
		result.put(CommonConstants.ADDRESS, String.valueOf(customer.getAddress()));
		result.put(CommonConstants.PIN_CODE, customer.getPincode());
		result.put(CommonConstants.PHONENO, customer.getPhoneno());
		result.put(CommonConstants.FAX, customer.getFax());
		result.put(CommonConstants.MOBILENO, customer.getMobileno());
		result.put(CommonConstants.EMAIL,customer.getEmail());
		
		return result;
	}
	
	public static JSONObject getCustomerDataTableList(List<CustomerDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (empList != null) {

				for (CustomerDO customer : empList) {
					resultJSONArray.put(getCustomerDetailDataTableObject(customer));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getCustomerDetailDataTableObject(CustomerDO customer)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(customer.getId()));
		result.put(customer.getCustomercode());
		result.put(String.valueOf(customer.getName()));
		result.put(customer.getEmail());
		return result;
	}

}
