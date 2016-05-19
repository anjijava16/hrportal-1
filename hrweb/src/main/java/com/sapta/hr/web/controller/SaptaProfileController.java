package com.sapta.hr.web.controller;

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

import com.sapta.hr.domainobject.SaptaProfileDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.SaptaProfileService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.VendorUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/saptaprofile")
public class SaptaProfileController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(SaptaProfileController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				SaptaProfileDO saptaprofileLst = new SaptaProfileService().retrive();
				if (saptaprofileLst != null ) {
					model.addAttribute(CommonConstants.SAPTAPROFILE_LIST, saptaprofileLst);
				}
				pagename = CommonConstants.JSP_SAPTAPROFILE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/addsaptaprofile", method = RequestMethod.GET)
	public String addCustomer(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ADD_SAPTAPROFILE;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/add/{tan}/{pan}/{accountname}/{website}/{accntnum}/{bankname}/{bankbranch}/{ifsccode}/{swiftcode}/{branchaddress}/{companyname}/{address}/{city}/{pincode}/{state}/{country}/{officephno}/{emailid}/{mobilenum}/{cin}/{st}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String tan,@PathVariable String pan,@PathVariable String accountname,@PathVariable String website,@PathVariable Long accntnum,@PathVariable String bankname,
		@PathVariable  String bankbranch, @PathVariable String  ifsccode,@PathVariable String swiftcode,@PathVariable String branchaddress,@PathVariable String companyname,@PathVariable String address,@PathVariable String city,
		@PathVariable Long pincode,@PathVariable String state,@PathVariable String country,@PathVariable Long officephno, @PathVariable String emailid, @PathVariable Long mobilenum, String cin, String st, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				SaptaProfileDO saptaprofileDO = new SaptaProfileDO();
				saptaprofileDO.setTan(tan);
				saptaprofileDO.setPan(pan);
				saptaprofileDO.setCin(cin);
				saptaprofileDO.setSt(st);
				saptaprofileDO.setAccntname(accountname);
				saptaprofileDO.setWebsite(website);
				saptaprofileDO.setAccntnum(accntnum);
				saptaprofileDO.setBankname(bankname);
				saptaprofileDO.setBankbranch(bankbranch);
				saptaprofileDO.setIfsccode(ifsccode);
				saptaprofileDO.setSwiftcode(swiftcode);
				branchaddress = branchaddress.replace("=", "#");
				saptaprofileDO.setBranchaddress(branchaddress);
				saptaprofileDO.setCompanyname(companyname);
				address = address.replace("=", "#");
				saptaprofileDO.setAddress(address);
				saptaprofileDO.setCity(city);
				saptaprofileDO.setPincode(pincode);
				saptaprofileDO.setState(state);
				saptaprofileDO.setCountry(country);
				saptaprofileDO.setOfficephno(officephno);
				saptaprofileDO.setEmailid(emailid);
				saptaprofileDO.setMobilenum(mobilenum);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				saptaprofileDO.setUpdatedby(user.getUsername());
				saptaprofileDO.setUpdatedon(new Date());
				new SaptaProfileService().persist(saptaprofileDO);
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/viewsaptaprofile", method = RequestMethod.GET)
	public String viewVendor(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_SAPTAPROFILE;
				//List<SaptaProfileDO> saptaprofileList = null;
				String id = request.getParameter("id");
				SaptaProfileDO saptaprofileLst = new SaptaProfileService().retrive();
				if (saptaprofileLst != null) {
					model.addAttribute(CommonConstants.SAPTAPROFILE_LIST, saptaprofileLst);
				}
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<VendorDO> saptaprofileList = new VendorService().retrive();
			if (saptaprofileList != null) {
				respJSON = VendorUtil.getVendorDataTableList(saptaprofileList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{tan}/{pan}/{accntname}/{website}/{accntnum}/{bankname}/{bankbranch}/{ifsccode}/{swiftcode}/{branchaddress}/{companyname}/{address}/{city}/{pincode}/{state}/{country}/{officephno}/{emailid}/{mobilenum}/{cin}/{st}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id,@PathVariable String tan,@PathVariable String pan,@PathVariable String accntname,@PathVariable String website,@PathVariable Long accntnum,@PathVariable String bankname,
			@PathVariable  String bankbranch, @PathVariable String  ifsccode,@PathVariable String swiftcode,@PathVariable String branchaddress,@PathVariable String companyname,@PathVariable String address,@PathVariable String city,
			@PathVariable Long pincode,@PathVariable String state,@PathVariable String country,@PathVariable Long officephno, @PathVariable String emailid, @PathVariable Long mobilenum, @PathVariable String cin, @PathVariable String st, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				SaptaProfileDO saptaprofileDO = new SaptaProfileDO();
				saptaprofileDO.setId(id);
				saptaprofileDO.setTan(tan);
				saptaprofileDO.setPan(pan);
				saptaprofileDO.setCin(cin);
				saptaprofileDO.setSt(st);
				saptaprofileDO.setAccntname(accntname);
				saptaprofileDO.setWebsite(website);
				saptaprofileDO.setAccntnum(accntnum);
				saptaprofileDO.setBankname(bankname);
				saptaprofileDO.setBankbranch(bankbranch);
				saptaprofileDO.setIfsccode(ifsccode);
				saptaprofileDO.setSwiftcode(swiftcode);
				branchaddress = branchaddress.replace("=", "#");
				saptaprofileDO.setBranchaddress(branchaddress);
				saptaprofileDO.setCompanyname(companyname);
				address = address.replace("=", "#");
				saptaprofileDO.setAddress(address);
				saptaprofileDO.setCity(city);
				saptaprofileDO.setPincode(pincode);
				saptaprofileDO.setState(state);
				saptaprofileDO.setCountry(country);
				saptaprofileDO.setOfficephno(officephno);
				saptaprofileDO.setEmailid(emailid);
				saptaprofileDO.setMobilenum(mobilenum);

				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				saptaprofileDO.setUpdatedby(user.getUsername());
				saptaprofileDO.setUpdatedon(new Date());
				new SaptaProfileService().update(saptaprofileDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
}