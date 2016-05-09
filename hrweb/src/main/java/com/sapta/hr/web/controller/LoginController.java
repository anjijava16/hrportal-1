package com.sapta.hr.web.controller;

import java.util.List;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.AppException;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.form.User;
import com.sapta.hr.service.UserService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;

@Controller
@RequestMapping(value = "/login")
@SessionAttributes("session")
public class LoginController {
	
	String validation = null; 
	static Cipher cipher;
	
	static Logger logger = Logger.getLogger(LoginController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		try{
			model.addAttribute("user", new User());
			if(request.getSession() != null){
				request.getSession().invalidate();
			}
		}catch(Exception e) { }
    	return CommonConstants.JSP_LOGIN;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(@ModelAttribute User user, Model model, HttpServletRequest request) throws Exception {
		String pageName = CommonConstants.JSP_LOGIN_FORWARD;	
		try {
			//int count = 0;
			List<UserDO> userList = new UserService().retriveUserByName(user.getUsername());
			if(userList != null && userList.size() > 0 ) {
				UserDO userDO = userList.get(0);
				String decryptpassword = CommonUtil.decrypt(userDO.getPassword());
				if(decryptpassword != null && decryptpassword.equalsIgnoreCase(request.getServletContext().getInitParameter("SALT") + user.getPassword()) && user.getUsername().equalsIgnoreCase(userDO.getUsername())){
					request.getSession().setAttribute(CommonConstants.SESSION, userDO);
					pageName = CommonConstants.JSP_LOGIN_SUCCESS;  
				}
			}else{
				model.addAttribute("errorMsg", ExceptionConstant.LOGIN_ERROR);
				pageName = CommonConstants.JSP_LOGIN_FORWARD;
			}
		} catch (AppException e) {
			e.printStackTrace();
		}
		return pageName;
	}
	
	@RequestMapping(value = "/persist/{username}/{password}/{groupname}", method = RequestMethod.GET)
	public @ResponseBody String persistUser(@PathVariable String username, @PathVariable String password, @PathVariable String groupname, Model model, HttpServletRequest request) {
		try {			
			String encryptstring = CommonUtil.encrypt(password,request.getServletContext().getInitParameter("SALT"));
			new UserService().persistUser(username, encryptstring, groupname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return CommonConstants.SUCCESS;
	}
	
}
