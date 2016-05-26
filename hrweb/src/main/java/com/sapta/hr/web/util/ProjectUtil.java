package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.util.CommonConstants;

public final class ProjectUtil {
	
	public static JSONObject getProjectListGrid(List<ProjectDO> projectLIst)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = projectLIst.size() / 5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));

			JSONArray resultJSONArray = new JSONArray();
			for (ProjectDO projdo : projectLIst) {
				resultJSONArray.put(getProjectDetailObjectgrid(projdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}

	private static JSONObject getProjectDetailObjectgrid(ProjectDO projectDO)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(projectDO.getProjectcode());
		result.put(projectDO.getName());
		result.put(projectDO.getDispname());
		if(String.valueOf(projectDO.getStatus()).equalsIgnoreCase("a")){
			result.put("Active");
		}else if(String.valueOf(projectDO.getStatus()).equalsIgnoreCase("i")){
			result.put("Closed");
		}
		result.put(CommonUtil.convertDateToStringWithOutTime(projectDO.getStartdate()));
		result.put(CommonUtil.convertDateToStringWithOutTime(projectDO.getEnddate()));

		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(projectDO.getId()));
		resp.put(CommonConstants.CELL, result);
		return resp;
	}

	public static JSONObject getProjectList(List<ProjectDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");

			JSONArray resultJSONArray = new JSONArray();
			for (ProjectDO projdo : empList) {
				resultJSONArray.put(getProjectDetailObject(projdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);

			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONObject getProjectDetailObject(ProjectDO projdo)throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(projdo.getId()));
		result.put(CommonConstants.PROJECT_CODE, projdo.getProjectcode());
		result.put(CommonConstants.CUSTOMER_ID, String.valueOf(projdo.getCustomerid()));
		result.put(CommonConstants.PROJECT_NAME, String.valueOf(projdo.getName()));
		result.put(CommonConstants.DISP_NAME, projdo.getDispname());
		result.put(CommonConstants.DESCRIPTION, projdo.getDescription());
		result.put(CommonConstants.STATUS, String.valueOf(projdo.getStatus()));
		result.put(CommonConstants.TYPE, String.valueOf(projdo.getType()));
		result.put(CommonConstants.START_DATE, CommonUtil.convertDateToStringWithOutTime(projdo.getStartdate()));
		result.put(CommonConstants.END_DATE, CommonUtil.convertDateToStringWithOutTime(projdo.getEnddate()));
		return result;
	}
	
	public static JSONObject getProjectDataTableList(List<ProjectDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (empList != null) {
			
				for (ProjectDO projdo : empList) {
					resultJSONArray.put(getProjectDetailDataTableObject(projdo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getProjectDetailDataTableObject(ProjectDO projdo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(projdo.getId()));
		result.put(projdo.getProjectcode());
		result.put(projdo.getDispname());
		List<CustomerDO> customerList = new CustomerService().retrive();
		for(CustomerDO cust : customerList){
			if(String.valueOf(cust.getId()).equalsIgnoreCase(String.valueOf(projdo.getCustomerid()))){
				result.put(cust.getName());
			}
		}
		if(String.valueOf(projdo.getStatus()).equalsIgnoreCase("a")){
			result.put(CommonConstants.ACTIVE);
		} else if(String.valueOf(projdo.getStatus()).equalsIgnoreCase("i")){
			result.put(CommonConstants.CLOSED);
		}
		return result;
	}

}