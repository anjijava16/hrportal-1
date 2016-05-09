package com.sapta.hr.web.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sapta.hr.domainobject.CustomerDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.CustomerService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.CustomerUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(CustomerController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_CUSTOMER;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/viewcustomer", method = RequestMethod.GET)
	public String viewCustomer(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VIEW_CUSTOMER;
				List<CustomerDO> customerList = null;
				String id = request.getParameter("id");
				if(id != null){
					customerList = new CustomerService().retriveById(Integer.parseInt(id));
				}else{
					customerList = new CustomerService().retrive();
				}
				if (customerList != null && customerList.size() > 0) {
					model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
					model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
				}
				List<CustomerDO> custList = new CustomerService().retrive();
				
				if (custList != null && custList.size() > 0) {
					model.addAttribute(CommonConstants.CUSTOMER_LIST, custList);
				}
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/viewcustomer/{id}", method = RequestMethod.GET)
	public String viewCustomerById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_CUSTOMER;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
					List<CustomerDO> customerList = new CustomerService().retrive();
					
					if (customerList != null && customerList.size() > 0) {
						model.addAttribute(CommonConstants.CUSTOMER_LIST, 	customerList);
						model.addAttribute(CommonConstants.CUSTOMER_LIST_SIZE, 	customerList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}

	@RequestMapping(value = "/addcustomer", method = RequestMethod.GET)
	public String addCustomer(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_CUSTOMER;
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	@RequestMapping(value = "/add/{name}/{address}/{phoneno}/{mobileno}/{email}/{pincode}/{fax}/{customercode}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String name,@PathVariable String address,
			@PathVariable  String phoneno, @PathVariable String  mobileno,@PathVariable String email,
			@PathVariable String pincode, @PathVariable String fax, @PathVariable String customercode, Model model, HttpServletRequest request) {
			
		try {
			if (WebManager.authenticateSession(request)) {
				CustomerDO customerdo = new CustomerDO();
				customerdo.setName(name);
				address = address.replace("=", "#");
				address = address.replace("*", "/");
				customerdo.setAddress(address);
				
				//customerdo.setPincode(pincode);
				customerdo.setCustomercode(customercode);
				
				if (!pincode.equalsIgnoreCase("null")) 
					customerdo.setPincode(pincode);
				
			    if (!fax.equalsIgnoreCase("null")) 
			    	customerdo.setFax(fax);
			    if (!phoneno.equalsIgnoreCase("null")) 
			    	customerdo.setPhoneno(phoneno);
			    if (!mobileno.equalsIgnoreCase("null")) 
			    	customerdo.setMobileno(mobileno);
			    if (!email.equalsIgnoreCase("null")) 
			    	customerdo.setEmail(email);
			    UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				customerdo.setUpdatedby(user.getUsername());
				customerdo.setUpdatedon(new Date());
				new CustomerService().persist(customerdo);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<CustomerDO> customerList = new CustomerService().retriveById(id);
				for(CustomerDO customerDO: customerList){
					
					boolean status = new CustomerService().delete(customerDO);
					if(status){
						respJSON = CommonWebUtil.buildSuccessResponse();
					}else{
						respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
					}
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return respJSON != null ? respJSON.toString() : "";
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<CustomerDO> customerList = new CustomerService().retrive();
			if (customerList != null) {
				Collections.reverse(customerList);
				respJSON = CustomerUtil.getCustomerDataTableList(customerList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<CustomerDO> customerList = new CustomerService().retriveById(id);

			if (customerList!= null) {
				respJSON = CustomerUtil.getCustomerDataTableList(customerList);
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}

	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<CustomerDO> customerList = new CustomerService().retriveById(id);
			respJSON = CustomerUtil.getCustomerList(customerList).toString();
		} catch (Exception e) {}
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{name}/{addr}/{pincode}/{phoneno}/{fax}/{emailid}/{mobileno}/{customercode}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id ,@PathVariable String name, @PathVariable String addr, @PathVariable String pincode,
			@PathVariable String phoneno, @PathVariable String fax, @PathVariable String mobileno,
			@PathVariable String emailid, @PathVariable String customercode, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				CustomerDO cusromer = new CustomerDO();
				cusromer.setId(id);
				cusromer.setName(name);
				addr = addr.replace("=", "#");
				addr = addr.replace("*", "/"); 
				cusromer.setAddress(addr);
				/*cusromer.setEmail(emailid);*/
				//cusromer.setPincode(pincode);
				cusromer.setCustomercode(customercode);
				if (!pincode.equalsIgnoreCase("null")) 
					cusromer.setPincode(pincode);
				if (!mobileno.equalsIgnoreCase("null"))
					cusromer.setMobileno(mobileno);
				if (!phoneno.equalsIgnoreCase("null"))
					cusromer.setPhoneno(phoneno);
				if (!fax.equalsIgnoreCase("null"))
					cusromer.setFax(fax);
			    if (!emailid.equalsIgnoreCase("null")) 
			    	cusromer.setEmail(emailid);

				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				cusromer.setUpdatedby(user.getUsername());
				cusromer.setUpdatedon(new Date());

				new CustomerService().update(cusromer);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
}