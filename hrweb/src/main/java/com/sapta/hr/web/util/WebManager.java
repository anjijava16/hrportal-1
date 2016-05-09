package com.sapta.hr.web.util;

import javax.servlet.http.HttpServletRequest;

import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.util.CommonConstants;

public class WebManager {

	public static boolean authenticateSession(HttpServletRequest request){
		boolean authenticationStatus = false;
		try{
			if(request.getSession().getAttribute(CommonConstants.SESSION) != null){
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				if(user.getUsername() != null && user.getPassword() != null){
					authenticationStatus = true;
				}
			}
		}catch(Exception e) {
	    }
		return authenticationStatus;
	}
	
	/*public static boolean authenticateFinanceSession(HttpServletRequest request){
		boolean authenticationStatus = false;
		try{
			if(request.getSession().getAttribute(CommonConstants.SESSION) != null){
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				if(user.getUsername() != null && user.getPassword() != null 
						&& (user.getGroupname().equalsIgnoreCase(CommonConstants.SAPTA_LABS_AD) || user.getGroupname().equalsIgnoreCase(CommonConstants.SAPTA_LABS_FI))){
					authenticationStatus = true;
				}
			}
		}catch(Exception e) {
	    }
		return authenticationStatus;
	}
	
	public static boolean authenticateHRSession(HttpServletRequest request){
		boolean authenticationStatus = false;
		try{
			if(request.getSession().getAttribute(CommonConstants.SESSION) != null){
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				if(user.getUsername() != null && user.getPassword() != null 
						&& (user.getGroupname().equalsIgnoreCase(CommonConstants.SAPTA_LABS_AD) || user.getGroupname().equalsIgnoreCase(CommonConstants.SAPTA_LABS_HR))){
					authenticationStatus = true;
				}
			}
		}catch(Exception e) {
	    }
		return authenticationStatus;
	}*/

}