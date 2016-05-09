package com.sapta.hr.web.controller;

import java.util.Calendar;
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

import com.sapta.hr.domainobject.AssetDO;
import com.sapta.hr.domainobject.AssetTypeDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.domainobject.VendorDO;
import com.sapta.hr.service.AssetService;
import com.sapta.hr.service.AssetTypeService;
import com.sapta.hr.service.VendorService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.AssetUtil;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/asset")
public class AssetController {
	
	String validation = null;
	
	static Logger logger = Logger.getLogger(AssetController.class.getName());

	@RequestMapping(method = RequestMethod.GET)
	public String onLoad(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ASSET;
			}
		} catch (Exception e) {
		}
		return pagename;
	}
	
	@RequestMapping(value = "/addasset", method = RequestMethod.GET)
	public String addAsset(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
				if (assetTypeList != null && assetTypeList.size() > 0) {
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST, assetTypeList);
				}				
				List<VendorDO> vendorList = new VendorService().retrive();
				if (vendorList != null && vendorList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
				}
				pagename = CommonConstants.JSP_ADD_ASSET;
			}
		} catch (Exception e) {	}
		return pagename;
	}
	
	@RequestMapping(value = "/viewasset", method = RequestMethod.GET)
	public String viewCustomer(Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) {
				pagename = CommonConstants.JSP_ASSET_VIEW;
				List<AssetDO> assetList = null;
				assetList = new AssetService().retrive();
				if (assetList != null && assetList.size() > 0) {
					model.addAttribute(CommonConstants.ASSET_LIST, assetList);
					model.addAttribute(CommonConstants.ASSET_LIST_SIZE, assetList.size());
				}
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
				if (assetTypeList != null && assetTypeList.size() > 0) {
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST, assetTypeList);
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST_SIZE, assetTypeList.size());
				}
				List<VendorDO> vendorList = new VendorService().retrive();
				if (vendorList != null && vendorList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
					model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, vendorList.size());
				}
			}
		} catch (Exception e) {	}
		return pagename;
	}
	@RequestMapping(value = "/viewfyasset/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_ASSET_VIEW;
				List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
				if (assetTypeList != null && assetTypeList.size() > 0) {
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST, assetTypeList);
					model.addAttribute(CommonConstants.ASSET_TYPE_LIST_SIZE, assetTypeList.size());
				}
				List<VendorDO> vendorList = new VendorService().retrive();
				if (vendorList != null && vendorList.size() > 0) {
					model.addAttribute(CommonConstants.VENDOR_LIST, vendorList);
					model.addAttribute(CommonConstants.VENDOR_LIST_SIZE, vendorList.size());
				}
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
				
			}
		} catch (Exception e) { }
		return pagename;
	}

	
	@RequestMapping(value = "/add/{name}/{assettypeid}/{dateofpurchased}/{vendorid}/{warrantyofexpired}/{price}/{guranteeofexpired}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable String name,	@PathVariable long assettypeid,
			@PathVariable String dateofpurchased, @PathVariable long vendorid, @PathVariable String warrantyofexpired, 
			@PathVariable double price,@PathVariable String guranteeofexpired, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				AssetDO assetDO = new AssetDO();
				assetDO.setName(name);
				assetDO.setAssettypeid(assettypeid);
				assetDO.setDateofpurchased(CommonUtil.convertStringToDate(dateofpurchased));
				assetDO.setVendorid(vendorid);
				assetDO.setWarrantyofexpired(CommonUtil.convertStringToDate(warrantyofexpired));
				assetDO.setGuranteeofexpired(CommonUtil.convertStringToDate(guranteeofexpired));
				assetDO.setPrice(price);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				assetDO.setUpdatedby(user.getUsername());
				assetDO.setUpdatedon(new Date());
				
				new AssetService().persist(assetDO);
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<AssetDO> assetList = new AssetService().retrive();
			if (assetList != null) {
				Collections.reverse(assetList);
				respJSON = AssetUtil.getAssetDataTableList(assetList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/gettotalamount", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmount(Model model) {
		JSONObject respJSON = null;
		try {
			List<AssetDO> assetList = new AssetService().retrive();
			if (assetList != null) {
				respJSON = AssetUtil.getAssetList(assetList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGrid(@PathVariable long id, Model model) {
		JSONObject respJSON = null;
		try {
			List<AssetDO> assetList = new AssetService().retriveById(id);
			if (assetList!= null) {
				respJSON = AssetUtil.getAssetDataTableList(assetList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveUser(@PathVariable long id, Model model,HttpServletRequest request) {
		String respJSON = null;
		try {
			List<AssetDO> assetList = new AssetService().retriveById(id);
			respJSON = AssetUtil.getAssetList(assetList).toString();
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/update/{id}/{name}/{assettypeid}/{dateofpurchased}/{vendorid}/{warrantyofexpired}/{price}/{guranteeofexpired}", method = RequestMethod.GET)
	public @ResponseBody String update(@PathVariable long id, @PathVariable String name,	@PathVariable long assettypeid,
		@PathVariable String dateofpurchased, @PathVariable long vendorid, @PathVariable String warrantyofexpired, 
		 @PathVariable double price, @PathVariable String guranteeofexpired, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				AssetDO assetDO = new AssetDO();
				assetDO.setId(id);
				assetDO.setName(name);
				assetDO.setAssettypeid(assettypeid);
				assetDO.setDateofpurchased(CommonUtil.convertStringToDate(dateofpurchased));
				assetDO.setVendorid(vendorid);
				assetDO.setWarrantyofexpired(CommonUtil.convertStringToDate(warrantyofexpired));
				assetDO.setGuranteeofexpired(CommonUtil.convertStringToDate(guranteeofexpired));
				assetDO.setPrice(price);
				
				UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
				assetDO.setUpdatedby(user.getUsername());
				assetDO.setUpdatedon(new Date());
		
				new AssetService().update(assetDO);
			}	
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable long id, Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				List<AssetDO> assetList = new AssetService().retriveById(id);
				for(AssetDO assetDO : assetList){
					new AssetService().delete(assetDO);
				}
			}
		}catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/viewassettype/{id}", method = RequestMethod.GET)
	public String viewAssetTypeById(@PathVariable String id, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_ASSET_TYPE;
				if(id != null){
					model.addAttribute(CommonConstants.ID, 	id);
					List<AssetTypeDO> assetTypeList = new AssetTypeService().retrive();
					if (assetTypeList != null && assetTypeList.size() > 0) {
						model.addAttribute(CommonConstants.ASSET_TYPE_LIST, 	assetTypeList);
						model.addAttribute(CommonConstants.ASSET_TYPE_LIST_SIZE, 	assetTypeList.size());
					}
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@RequestMapping(value = "/getbymonth/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getByIdDate(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String sDate = ptmonth;		   
			Date startDate = CommonUtil.convertStringToDate(sDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(startDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date endDate= c.getTime();
			List<AssetDO> assetList = new AssetService().getAssetReport(startDate, endDate);
			if (assetList != null) {
				respJSON = AssetUtil.getAssetDataTableList(assetList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getbydatetotalamount/{ptmonth}", method = RequestMethod.GET)
	public @ResponseBody String getTotalAmountByDate(@PathVariable String ptmonth, Model model) {
		JSONObject respJSON = null;
		try {
			String sDate = ptmonth;		   
			Date startDate = CommonUtil.convertStringToDate(sDate);
		    Calendar c = Calendar.getInstance();      
		    c.setTime(startDate);
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date endDate= c.getTime();
			List<AssetDO> assetList = new AssetService().getAssetReport(startDate, endDate);
			if (assetList != null) {
				respJSON = AssetUtil.getAssetList(assetList);
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/viewvendor/{id}", method = RequestMethod.GET)
	public String viewVendorById(@PathVariable String id, Model model, HttpServletRequest request) {
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
		} catch (Exception e) {
		}
		return pagename;
	}
}
