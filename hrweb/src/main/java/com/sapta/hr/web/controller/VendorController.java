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

import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.exception.ExceptionConstant;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.VendorUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/vendordetails")
public class VendorController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(VendorController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VENDOR;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/addvendor", method = RequestMethod.GET)
	public String addCustomer(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_VENDOR;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{name}/{address}/{phoneno}/{mobileno}/{email}/{pincode}/{fax}/{vendorcode}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String name,@PathVariable String address,
		@PathVariable  String phoneno, @PathVariable String  mobileno,@PathVariable String email,
		@PathVariable String pincode, @PathVariable String fax, @PathVariable String vendorcode, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				VendorDO vendorDO = new VendorDO();
				vendorDO.setName(name);
				address = address.replace("=","#");
				address = address.replace("*","/");
				vendorDO.setAddress(address);
				
				vendorDO.setPincode(pincode);
				vendorDO.setVendorcode(vendorcode);
				
			    if (!fax.equalsIgnoreCase("null")) 
			    	vendorDO.setFax(fax);
			    if (!phoneno.equalsIgnoreCase("null")) 
			    	vendorDO.setPhoneno(phoneno);
			    if (!mobileno.equalsIgnoreCase("null")) 
			    	vendorDO.setMobileno(mobileno);
			    if (!email.equalsIgnoreCase("null")) 
			    	vendorDO.setEmail(email);
			    
			    UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
			    vendorDO.setUpdatedby(user.getUsername());
			    vendorDO.setUpdatedon(new Date());
				new VendorService().persist(vendorDO);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/viewvendor", method = RequestMethod.GET)
	public String viewVendor(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_VIEW_VENDOR;
				List<VendorDO> vendorList = null;
				String id = request.getParameter("id");
				if(id != null){
					vendorList = new VendorService().retriveById(Integer.parseInt(id));
				}else{
					vendorList = new VendorService().retrive();
				}
				if (vendorList != null && vendorList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, 	vendorList);
					model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, 	vendorList.size());
				}
				List<VendorDO> vendList = new VendorService().retrive();
				if (vendList != null && vendList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, vendList);
				}
			}
		} catch (Exception e) {
		}
		return pagename;
	}

	
	@RequestMapping(value = "/viewvendor/{id}", method = RequestMethod.GET)
	public String viewCustomerById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_VENDOR;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
					List<VendorDO> vendorList = new VendorService().retrive();
					if (vendorList != null && vendorList.size() > 0) {
						model.addAttribute(CommonConstants.VENDOR_LIST, 	vendorList);
						model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, 	vendorList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/viewvendorName/{name}", method = RequestMethod.GET)
	public String viewCustomerByName(@PathVariable String name, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_VIEW_VENDOR;
				if(name != null){
					model.addAttribute(CommonConstants.NAME, name);
					List<VendorDO> vendorList = new VendorService().retrive();
					if (vendorList != null && vendorList.size() > 0) {
						model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
						model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, vendorList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<VendorDO> vendorList = new VendorService().retrive();
			if (vendorList != null) {
				Collections.reverse(vendorList);
				respJSON = VendorUtil.getVendorDataTableList(vendorList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<VendorDO> vendorList = new VendorService().retriveById(id);

			if (vendorList!= null) {
				respJSON = VendorUtil.getVendorDataTableList(vendorList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getName/{name}", method = RequestMethod.GET)
	public @ResponseBody String viewGetByName(@PathVariable String name, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) { 
				if(name != null){
					model.addAttribute(CommonConstants.NAME, name);
					List<VendorDO> vendorList = new VendorService().retriveByName(name);
					if (vendorList!= null) {
						respJSON = VendorUtil.getVendorDataTableList(vendorList);
					}
				}
			}
		}  catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<VendorDO> vendorList = new VendorService().retriveById(id);
			respJSON = VendorUtil.getVendorList(vendorList).toString();
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	
	@RequestMapping(value = "/update/{id}/{name}/{addr}/{pincode}/{phoneno}/{fax}/{emailid}/{mobileno}/{vendorcode}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id ,@PathVariable String name, @PathVariable String addr, @PathVariable String pincode,
		@PathVariable String phoneno, @PathVariable String fax, @PathVariable String mobileno,
		@PathVariable String emailid, @PathVariable String vendorcode, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				VendorDO vendor = new VendorDO();
				vendor.setId(id);
				vendor.setName(name);
				addr = addr.replace("=","#");
				addr = addr.replace("*","/");
				vendor.setAddress(addr);
				
				vendor.setPincode(pincode);
				vendor.setVendorcode(vendorcode);

				if (!mobileno.equalsIgnoreCase("null"))
					vendor.setMobileno(mobileno);
				if (!phoneno.equalsIgnoreCase("null"))
					vendor.setPhoneno(phoneno);
				if (!fax.equalsIgnoreCase("null"))
					vendor.setFax(fax);
				if (!emailid.equalsIgnoreCase("null"))
					vendor.setEmail(emailid);

				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				vendor.setUpdatedby(user.getUsername());
				vendor.setUpdatedon(new Date());
				new VendorService().update(vendor);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				List<VendorDO> vendorList = new VendorService().retriveById(id);
				boolean status = false;
				for(VendorDO vendorDO : vendorList){
					status = new VendorService().delete(vendorDO);
				}
				if(status){
					respJSON = CommonWebUtil.buildSuccessResponse();
				}else{
					respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
				}
			}else{
				respJSON = CommonWebUtil.buildErrorResponse(ExceptionConstant._91001);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return respJSON != null ? respJSON.toString() : "";
	}
}