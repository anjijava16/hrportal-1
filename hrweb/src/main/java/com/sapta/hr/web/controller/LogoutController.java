package com.sapta.hr.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sapta.hr.util.CommonConstants;

@Controller
@RequestMapping(value = "/logout")
public class LogoutController {

	static Logger logger = Logger.getLogger(LogoutController.class.getName());
	
	@RequestMapping(method = RequestMethod.GET)
	public String logoutGet(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try{
			if(request != null && request.getSession() != null){
				request.getSession().invalidate();
			}
		}catch(Exception e) { }
		return pagename;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String logoutPost(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try{
			if(request != null && request.getSession() != null){
				request.getSession().invalidate();
			}
		}catch(Exception e) { }
		return pagename;
	}
}
