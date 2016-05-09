package com.sapta.hr.web.util;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sapta.hr.domainobject.EmpAssignmentDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.util.CommonConstants;

public class EmpAssignmentUtil {
	
	public static JSONObject getAsignListGrid(List<EmpAssignmentDO> assignList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			int total = assignList.size()/5;
			responseJSON.put(CommonConstants.TOTAL, String.valueOf(total));
			responseJSON.put(CommonConstants.PAGE, String.valueOf(1));
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpAssignmentDO empassdo : assignList) {
				resultJSONArray.put(getAssignDetailObjectGrid(empassdo));
			}
			responseJSON.put(CommonConstants.ROWS, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getAssignDetailObjectGrid(EmpAssignmentDO assigndo) throws JSONException, AppException {
		JSONArray result = new JSONArray();
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		for(EmployeeDO employee : employeeList){
			if(employee.getId() == assigndo.getEmpid()){
				result.put(employee.getFname());
			}
		}
		List<ProjectDO> projectList = new ProjectService().retriveProject();
		for(ProjectDO project : projectList){
			if(project.getId() == assigndo.getProjectid()){
				result.put(project.getDispname());
			}else{
				
			}
		}
		result.put(CommonUtil.convertDateToStringWithOutTime(assigndo.getStartdate()));
		result.put(CommonUtil.convertDateToStringWithOutTime(assigndo.getEnddate()));
		if(String.valueOf(assigndo.getStatus()).equalsIgnoreCase("a")){
			result.put("Active");
		} else if(String.valueOf(assigndo.getStatus()).equalsIgnoreCase("i")){
			result.put("Closed");
		}else if(String.valueOf(assigndo.getStatus()).equalsIgnoreCase("")){
			result.put("-");
		}
		
		JSONObject resp = new JSONObject();
		resp.put(CommonConstants.ID, String.valueOf(assigndo.getId()));
		resp.put(CommonConstants.CELL, result);
		
		return resp;
	}
	
	public static JSONObject getAsignList(List<EmpAssignmentDO> assigList) throws AppException {
		JSONObject responseJSON = new JSONObject();
		JSONObject resultJSON = new JSONObject();
		try {
			resultJSON.put(CommonConstants.SUCCESS_FLAG, CommonConstants.TRUE);
			resultJSON.put(CommonConstants.ERRORS, "");
			
			JSONArray resultJSONArray = new JSONArray();
			for (EmpAssignmentDO empassdo : assigList) {
				resultJSONArray.put(getAssignDetailObject(empassdo));
			}
			resultJSON.put(CommonConstants.RESULTS, resultJSONArray);
			responseJSON.put(CommonConstants.RESPONSE, resultJSON);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	private static JSONObject getAssignDetailObject(EmpAssignmentDO assigndo) throws JSONException, AppException {
		JSONObject result = new JSONObject();
		result.put(CommonConstants.ID, String.valueOf(assigndo.getId()));
		result.put(CommonConstants.EMP_ID, String.valueOf(assigndo.getEmpid()));
		result.put(CommonConstants.PROJECT_ID, String.valueOf(assigndo.getProjectid()));
		result.put(CommonConstants.START_DATE, CommonUtil.convertDateToStringWithOutTime(assigndo.getStartdate()));
		result.put(CommonConstants.END_DATE, CommonUtil.convertDateToStringWithOutTime(assigndo.getEnddate()));
		result.put(CommonConstants.STATUS, String.valueOf(assigndo.getStatus()));
		result.put(CommonConstants.COMMENTS, assigndo.getComments());
		
		return result;
	}

	public static JSONObject getAssignDataTableList(List<EmpAssignmentDO> empList)throws AppException {
		JSONObject responseJSON = new JSONObject();
		try {
			JSONArray resultJSONArray = new JSONArray();
			if (empList != null) {
				for (EmpAssignmentDO assigndo : empList) {
					resultJSONArray.put(getAssigntDetailDataTableObject(assigndo));
				}
			}
			responseJSON.put(CommonConstants.DATA, resultJSONArray);
		} catch (JSONException e) {
			e.printStackTrace();
	    }	
		return responseJSON;
	}

	private static JSONArray getAssigntDetailDataTableObject(EmpAssignmentDO assigndo)throws JSONException, AppException {
		JSONArray result = new JSONArray();
		result.put(String.valueOf(assigndo.getId()));
		List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
		for(EmployeeDO employee : employeeList){
			if(String.valueOf(employee.getId()).equalsIgnoreCase(String.valueOf(assigndo.getEmpid()))){
				result.put(employee.getFname());
			}
		}
		List<ProjectDO> projectList = new ProjectService().retriveProject();
		for(ProjectDO project : projectList){
			if(String.valueOf(project.getId()).equalsIgnoreCase(String.valueOf(assigndo.getProjectid()))){
				result.put(project.getDispname());
			}
		}
		result.put(CommonUtil.convertDateToStringWithOutTime(assigndo.getStartdate()));
		if(assigndo.getEnddate() != null){
			result.put(CommonUtil.convertDateToStringWithOutTime(assigndo.getEnddate()));
		}else{
			result.put("-");
		}
		if(String.valueOf(assigndo.getStatus()).equalsIgnoreCase("a")){
			result.put(CommonConstants.ACTIVE);
		} else if(String.valueOf(assigndo.getStatus()).equalsIgnoreCase("i")){
			result.put(CommonConstants.CLOSED);
		}
		
		return result;
	}
}
