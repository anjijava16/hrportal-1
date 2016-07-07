package com.sapta.hr.web.controller;

import java.util.ArrayList;
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

import com.sapta.hr.domainobject.EmpAccDetailDO;
import com.sapta.hr.domainobject.EmpAssignmentDO;
import com.sapta.hr.domainobject.EmpCTCDO;
import com.sapta.hr.domainobject.EmpDetailDO;
import com.sapta.hr.domainobject.EmpFamilyBackgroundDO;
import com.sapta.hr.domainobject.EmpPFDO;
import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.domainobject.PayrollDO;
import com.sapta.hr.domainobject.PayrollData;
import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.domainobject.ProjectDO;
import com.sapta.hr.domainobject.TDSDO;
import com.sapta.hr.domainobject.UserDO;
import com.sapta.hr.service.EmpAccDetailService;
import com.sapta.hr.service.EmpAssignmentService;
import com.sapta.hr.service.EmpCTCService;
import com.sapta.hr.service.EmpDetailService;
import com.sapta.hr.service.EmpFamilyBackgroundService;
import com.sapta.hr.service.EmpPFService;
import com.sapta.hr.service.EmployeeService;
import com.sapta.hr.service.PayrollService;
import com.sapta.hr.service.ProfessionalTaxService;
import com.sapta.hr.service.ProjectService;
import com.sapta.hr.service.TDSService;
import com.sapta.hr.util.CommonConstants;
import com.sapta.hr.web.util.CommonUtil;
import com.sapta.hr.web.util.CommonWebUtil;
import com.sapta.hr.web.util.EmpAccDetailUtil;
import com.sapta.hr.web.util.EmpAssignmentUtil;
import com.sapta.hr.web.util.EmpCtcUtil;
import com.sapta.hr.web.util.EmpDetailUtil;
import com.sapta.hr.web.util.EmpFamilyBackgroundUtil;
import com.sapta.hr.web.util.EmpPFUtil;
import com.sapta.hr.web.util.EmployeeUtil;
import com.sapta.hr.web.util.PayrollUtil;
import com.sapta.hr.web.util.ProfessionalTaxUtil;
import com.sapta.hr.web.util.ProjectUtil;
import com.sapta.hr.web.util.TDSUtill;
import com.sapta.hr.web.util.WebManager;

@Controller
@RequestMapping(value = "/payroll")
public class PayrollController {
	
	static Logger logger = Logger.getLogger(PayrollController.class.getName());
	 @RequestMapping(method = RequestMethod.GET)
     public String onLoad(Model model, HttpServletRequest request) {
          String pagename = CommonConstants.JSP_LOGIN_FORWARD;
           try {
              if (WebManager.authenticateSession(request)) {
                 Calendar c = Calendar.getInstance();
                 int payrollmonth = (c.get(Calendar.MONTH) + 1) ;
                 int payrollyear = c.get(Calendar.YEAR);
                 int payrolldate =  01;
                 Date startDate = CommonUtil.convertStringToDate(payrolldate+"- "+payrollmonth+"-"+payrollyear);
                 c.setTime(startDate);
     
             	 List<EmpDetailDO> empdetailList = new EmpDetailService().retrive();
                 List<EmpAccDetailDO> empaccdetail = new EmpAccDetailService().retrive();
                 List<TDSDO> tdslist = new TDSService().retriveTds();
                 model.addAttribute(CommonConstants.EMP_DET_LIST, empdetailList);
                 model.addAttribute(CommonConstants.EMP_ACC_LIST, empaccdetail);
                 model.addAttribute(CommonConstants.TDS_LIST, tdslist);
                 
                 List<PayrollData> payedlist = new ArrayList<PayrollData>();
                 List<ProjectDO> projectList = null;
                 double totalamount = 0;
                 List<PayrollDO> payrolldata = new PayrollService().retriveByMonth(startDate);        
                     for (PayrollDO payrollDO : payrolldata) {
                         totalamount = totalamount + payrollDO.getNetpayableamount();
                     }
                 projectList = new ProjectService().retriveProject();
                 if(projectList.size() > 0){
                     model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
                     model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
                 }
                 if(payedlist.size() > 0){
                	 Collections.reverse(payedlist);
                     model.addAttribute(CommonConstants.PAYED_LIST, payedlist);
                     model.addAttribute(CommonConstants.PAYED_LIST_SIZE, payedlist.size());
                 }
                 if(totalamount != 0){
                	 model.addAttribute(CommonConstants.TOTALSALPERMONTH, CommonUtil.convertfloatValueWithTwoDecimalPoints(totalamount));
                 }else{
                	 model.addAttribute(CommonConstants.TOTALSALPERMONTH, "0.00");
                 }
                 pagename = CommonConstants.JSP_PAYROLL;
                 }
             } catch (Exception e) {
             }
             return pagename;
     }
	
	@RequestMapping(value = "/viewfypayroll/{month}", method = RequestMethod.GET)
	public String viewFyBills(@PathVariable String month, Model model, HttpServletRequest request) {
		String pagename = CommonConstants.JSP_LOGIN_FORWARD;
		List<ProjectDO> projectList = null;
		try {
			if (WebManager.authenticateSession(request)) { 
				pagename = CommonConstants.JSP_PAYROLL;
				projectList = new ProjectService().retriveProject();
                if(projectList.size() > 0){
	                model.addAttribute(CommonConstants.PROJECT_LIST, projectList);
	                model.addAttribute(CommonConstants.PROJECT_LIST_SIZE, projectList.size());
                }
				if(month != null){
					model.addAttribute(CommonConstants.FY_MONTH, month);
				}
			}
		} catch (Exception e) { }
		return pagename;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/add/{empid}/{basic}/{hra}/{personal}/{conveyance}/{bonus}/{pt}/{tds}/{pf}/{lop}/{totalearnings}/{totaldeduction}/{empmonthlyctc}/{netpayableamount}/{payrollmonth}/{dayspayable}/{payrolltype}", method = RequestMethod.GET)
	public @ResponseBody String add(@PathVariable long empid,@PathVariable String basic, @PathVariable String hra, @PathVariable String personal, 
			@PathVariable String conveyance, @PathVariable double bonus, @PathVariable double pt, @PathVariable double tds, @PathVariable double pf, @PathVariable double lop, @PathVariable String totalearnings, 
			@PathVariable double totaldeduction, @PathVariable String empmonthlyctc, @PathVariable String netpayableamount, @PathVariable String payrollmonth, 
			@PathVariable long dayspayable, @PathVariable char payrolltype,Model model, HttpServletRequest request) {
		try {
			if (WebManager.authenticateSession(request)) {
				String sDate = payrollmonth;                  
                Date startDate = CommonUtil.convertStringToDate(sDate);
	            Calendar c = Calendar.getInstance();      
	            c.setTime(startDate);
	            c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
	            Date edate= c.getTime();
	            int monthenddate = edate.getDate();
                if(dayspayable == 0){
                    dayspayable = monthenddate;
                }
                if(dayspayable > monthenddate){
                    return CommonWebUtil.buildErrorResponse("enter valid days").toString();
                }
                
                PayrollDO payrollDO = new PayrollDO();
                payrollDO.setEmpid(empid);
                payrollDO.setBasic(Double.parseDouble(basic));
                payrollDO.setHra(Double.parseDouble(hra));
                payrollDO.setPersonal(Double.parseDouble(personal));
                payrollDO.setConveyance(Double.parseDouble(conveyance));
                if(pt != 0){
                	payrollDO.setPt(pt);
                }
                if(pf != 0){
                	payrollDO.setPf(pf);
                }	
                if(tds != 0){
                	payrollDO.setTds(tds);
                }
                
                if(totaldeduction != 0){
                	payrollDO.setTotaldeduction(totaldeduction);
                }
                
                payrollDO.setDayspayable(dayspayable);
                payrollDO.setPayrollmonth(CommonUtil.convertStringToDate(payrollmonth));
                payrollDO.setTotalearnings(Double.parseDouble(totalearnings));
                
                payrollDO.setNetpayableamount(Double.parseDouble(netpayableamount));
                payrollDO.setEmpmonthlyctc(Double.parseDouble(empmonthlyctc));
                UserDO user = (UserDO) request.getSession().getAttribute(CommonConstants.SESSION);
                payrollDO.setPaidon(new Date());
                payrollDO.setUpdatedby(user.getUsername());
                payrollDO.setUpdatedon(new Date());
                payrollDO.setPayrolltype(payrolltype);
                new PayrollService().persist(payrollDO);
                
                if(pt > 0){
	                ProfessionalTaxDO ptdo = new ProfessionalTaxDO();
	                ptdo.setEmpid(empid);
	                ptdo.setPtmonth(CommonUtil.convertStringToDate(payrollmonth));
	                ptdo.setAmount(pt);
	                ptdo.setUpdatedby(user.getUsername());
	                ptdo.setUpdatedon(new Date());
	                new ProfessionalTaxService().persistProfessionalTax(ptdo);
                }
                
               /* if(tds > 0){
	                TDSDO tdsdo = new TDSDO();
					tdsdo.setAmount(tds);
					tdsdo.setTdsmonth(CommonUtil.convertStringToDate(payrollmonth));
					tdsdo.setComments("TDS for the month of"+" "+payrollmonth);
					tdsdo.setRefer("TDS for the month of"+" "+payrollmonth);
					tdsdo.setUpdatedby(user.getUsername());
					tdsdo.setUpdatedon(new Date());
					new TDSService().persistTds(tdsdo);
                }*/
                
                if(pf > 0){
					EmpPFDO pfdo = new EmpPFDO();
					pfdo.setEmpid(empid);
					pfdo.setPfamount(pf);
					pfdo.setPfmonth(CommonUtil.convertStringToDate(payrollmonth));
					pfdo.setUpdatedby(user.getUsername());
					pfdo.setUpdatedon(new Date());
					new EmpPFService().persist(pfdo);
                }
                return CommonWebUtil.buildSuccessResponse().toString();
			}
		} catch (Exception e) {
			return CommonWebUtil.buildErrorResponse("").toString();
		}
		return CommonWebUtil.buildSuccessResponse().toString();
	}
	
	@RequestMapping(value = "/retrivebymonth", method = RequestMethod.GET)
    public @ResponseBody String retriveUser( Model model,HttpServletRequest request) {
            JSONObject respJSON = null;
            try {
                Calendar c = Calendar.getInstance();
                int payrollmonth = (c.get(Calendar.MONTH) + 1) ;
                int payrollyear = c.get(Calendar.YEAR);
                int payrollday =  01;
                Date payrollDate = CommonUtil.convertStringToDate(payrollday+"- "+payrollmonth+"-"+payrollyear);
                c.setTime(payrollDate);
                List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
    			
    			List<PayrollData> payrollList = new ArrayList<PayrollData>();
    			double mctc = 0;
    			String enterDate = "";
    			for(int i = 0; i < employeeList.size(); i++){
    				EmployeeDO employeeDO = employeeList.get(i);
    				String status = "Pending";
    				PayrollData payrollData = new PayrollData();
    				
    				List<EmpDetailDO> empDetailDo = new EmpDetailService().retriveByEmpId(employeeDO.getId());
    				if(empDetailDo != null && empDetailDo.size() > 0){
    					Calendar cal = c;
    					cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
    					if(empDetailDo.get(0).getJdate().before(cal.getTime()) || empDetailDo.get(0).getJdate().equals(cal.getTime())) {
    						
    						if(empDetailDo.get(0).getRdate() != null) {
    							if(empDetailDo.get(0).getRdate().before(payrollDate)){
	    						
	    						}else{
	    							
	    							payrollData.setEmpid(employeeDO.getId());
	    							if(employeeDO.getMname() != null && employeeDO.getMname().length() > 0){
		    							payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getMname()+"&nbsp"+employeeDO.getLname());
		    						}else{
		    							payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getLname());
		    						}
		    						
		    						List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeDO.getId(), payrollDate);
		    						if(payrolldata != null && payrolldata.size() > 0){
		    							status = "Paid";
		    							mctc = (payrolldata.get(0).getNetpayableamount());
		    							mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
		    							enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
		    						}else{
		    							status = "Pending";
		    							try {
		    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
		    								enterDate = "";
		    								if(empctcList != null && empctcList.size() > 0){
		    									if(empctcList.get(0).getEmpctc() != null){
		    										mctc = empctcList.get(0).getEmpctc() / 12;
		    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
		    									}
		    								}else{
		    									mctc =0;
												mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
												
		    								}
		    							} catch (Exception e) { }
		    						}
		    						
		    						payrollData.setSalstatus(status);
		    						payrollData.setMonthctc(mctc);
		    						payrollData.setPaidon(enterDate);
		    						payrollList.add(payrollData);
	    						}
    						}else{
    							
    							payrollData.setEmpid(employeeDO.getId());
    							if(employeeDO.getMname() != null && employeeDO.getMname().length() > 0){
	    							payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getMname()+"&nbsp"+employeeDO.getLname());
	    						}else{
	    							payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getLname());
	    						}
	    						
	    						List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeDO.getId(), payrollDate);
	    						if(payrolldata != null && payrolldata.size() > 0){
	    							status = "Paid";
	    							mctc = (payrolldata.get(0).getNetpayableamount());
	    							mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
	    							enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
	    						}else{
	    							status = "Pending";
	    							try {
	    								enterDate = "";
	    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
	    								if(empctcList != null && empctcList.size() > 0){
	    									if(empctcList.get(0).getEmpctc() != null){
	    										mctc = empctcList.get(0).getEmpctc() / 12;
	    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
	    										
	    									}
	    								}else{
	    									mctc =0;
											mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
											
	    								}
	    							} catch (Exception e) { }
	    						}
	    						
	    						payrollData.setSalstatus(status);
	    						payrollData.setMonthctc(mctc);
	    						payrollData.setPaidon(enterDate);
	    						payrollList.add(payrollData);
    						}
    					}
    				}
    			} 
				if (payrollList != null) {
					Collections.reverse(payrollList);
					respJSON = PayrollUtil.getPayrollList1(payrollList);
				}
            }catch (Exception e) { }

            return respJSON != null ? respJSON.toString() : "";
    }
	
	@RequestMapping(value = "/retrivebymonth/{payrollmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveByMonth(@PathVariable String payrollmonth, Model model, HttpServletRequest request) {
		JSONObject respJSON = null;
		try {
			String strtDate = payrollmonth;
			Date payrollDate = CommonUtil.convertStringToDate(strtDate);
			Calendar c = Calendar.getInstance();
			c.setTime(payrollDate);
			List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
			
			List<PayrollData> payrollList = new ArrayList<PayrollData>();
			double mctc = 0;
			String enterDate="";
			for(int i = 0; i < employeeList.size(); i++){
				EmployeeDO employeeDO = employeeList.get(i);
				String status = "Pending";
				PayrollData payrollData = new PayrollData();
				payrollData.setEmpid(employeeDO.getId());
				List<EmpDetailDO> empDetailDO = new EmpDetailService().retriveByEmpId(employeeDO.getId());
				if(empDetailDO != null && empDetailDO.size() > 0){
					Calendar cal = c;
					cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
					
					if(empDetailDO.get(0).getJdate().before(cal.getTime()) || empDetailDO.get(0).getJdate().equals(cal.getTime())) {  
						
						if(empDetailDO.get(0).getRdate() != null) {
							if(empDetailDO.get(0).getRdate().before(payrollDate)){
    						
    						}else{
								if(employeeDO.getMname() != null && employeeDO.getMname().length() > 0){
									payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getMname()+"&nbsp"+employeeDO.getLname());
								}else{
									payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getLname());
								}
								
								List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeDO.getId(), payrollDate);
								if(payrolldata != null && payrolldata.size() > 0){
									status = "Paid";
									mctc = (payrolldata.get(0).getNetpayableamount());
									mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
									enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
								}else{
									status = "Pending";
									try {
	    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
	    								enterDate="";
	    								if(empctcList != null && empctcList.size() > 0){
	    									if(empctcList.get(0).getEmpctc() != null){
	    										mctc = empctcList.get(0).getEmpctc() / 12;
	    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
	    									}
	    								}else{
	    									mctc =0;
											mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
	    								}
	    							} catch (Exception e) { }
								}
								
								payrollData.setSalstatus(status);
								payrollData.setMonthctc(mctc);
								payrollList.add(payrollData);
    						}
						}else{
							if(employeeDO.getMname() != null && employeeDO.getMname().length() > 0){
								payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getMname()+"&nbsp"+employeeDO.getLname());
							}else{
								payrollData.setEmpname(employeeDO.getFname()+"&nbsp"+employeeDO.getLname());
							}
							
							List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeDO.getId(), payrollDate);
							if(payrolldata != null && payrolldata.size() > 0){
								status = "Paid";
								mctc = (payrolldata.get(0).getNetpayableamount());
								mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
								enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
							}else{
								status = "Pending";
								
								try {
    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
    								enterDate = "";
    								if(empctcList != null && empctcList.size() > 0){
    									if(empctcList.get(0).getEmpctc() != null){
    										mctc = empctcList.get(0).getEmpctc() / 12;
    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
    									}
    								}else{
    									mctc =0;
										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
    								}
    							} catch (Exception e) { }
							}
							
							payrollData.setSalstatus(status);
							payrollData.setMonthctc(mctc);
							payrollData.setPaidon(enterDate);
							payrollList.add(payrollData);
						}
					}
				}
			}
			if (payrollList != null) {
				Collections.reverse(payrollList);
				respJSON = PayrollUtil.getPayrollList1(payrollList);
			}
		} catch (Exception e) { }
	
		return respJSON != null ? respJSON.toString() : "";
	}

    @RequestMapping(value = "/retrivebymnth/{payrollmonth}", method = RequestMethod.GET)
    public @ResponseBody String retriveBymnth(@PathVariable String payrollmonth, Model model,HttpServletRequest request) {
            JSONObject respJSON = null;
            try {
                String strtDate = payrollmonth;                  
                Date startDate = CommonUtil.convertStringToDate(strtDate);
                Calendar c = Calendar.getInstance();      
                c.setTime(startDate);
                List<EmployeeDO> employeeList = new EmployeeService().retriveEmployee();
                List<PayrollData> payrollList = new ArrayList<PayrollData>();
                double mctc = 0;
                String enterDate = "";
                for(int i = 0; i < employeeList.size(); i++){
                	EmployeeDO employeeDO = employeeList.get(i);
                    String status = "Pending";
                    PayrollData payrollData = new PayrollData();
                    List<EmpDetailDO> empDetailDO = new EmpDetailService().retriveByEmpId(employeeDO.getId());
                    if(empDetailDO != null && empDetailDO.size() > 0){
    					Calendar cal = c;
    					cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
    					
    					if(empDetailDO.get(0).getJdate().before(cal.getTime()) || empDetailDO.get(0).getJdate().equals(cal.getTime())) {  
    						
    						if(empDetailDO.get(0).getRdate() != null) {
    							if(empDetailDO.get(0).getRdate().before(startDate)){
        						
        						}else{
									payrollData.setEmpid(employeeList.get(i).getId());
				                    if(employeeList.get(i).getMname() == null){
				                		payrollData.setEmpname(employeeList.get(i).getFname()+"&nbsp"+employeeList.get(i).getLname());
				                	}
				                	else{
				                		payrollData.setEmpname(employeeList.get(i).getFname()+"&nbsp"+employeeList.get(i).getMname()+"&nbsp"+employeeList.get(i).getLname());
				                	}
				                    List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeList.get(i).getId(),startDate);
				                        if(payrolldata.size() > 0){
					                        status = "Paid";
					                        mctc = (payrolldata.get(0).getNetpayableamount());
					                        mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
					                        enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
				                        }else{
				                            status = "Pending";
				                            try {
			    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
			    								enterDate = "";
			    								if(empctcList != null && empctcList.size() > 0){
			    									if(empctcList.get(0).getEmpctc() != null){
			    										mctc = empctcList.get(0).getEmpctc().doubleValue() / 12;
			    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
			    									}
			    								}else{
			    									mctc =0;
													mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
			    								}
			    							} catch (Exception e) { }
				                        }
				                    payrollData.setSalstatus(status);
				                    payrollData.setMonthctc(mctc);
				                    payrollData.setPaidon(enterDate);
				                    payrollList.add(payrollData);
        						}
    						}else{
    							payrollData.setEmpid(employeeList.get(i).getId());
			                    if(employeeList.get(i).getMname() == null){
			                		payrollData.setEmpname(employeeList.get(i).getFname()+"&nbsp"+employeeList.get(i).getLname());
			                	}
			                	else{
			                		payrollData.setEmpname(employeeList.get(i).getFname()+"&nbsp"+employeeList.get(i).getMname()+"&nbsp"+employeeList.get(i).getLname());
			                	}
			                    List<PayrollDO> payrolldata = new PayrollService().retriveByEmpidMonth(employeeList.get(i).getId(),startDate);
			                        if(payrolldata.size() > 0){
				                        status = "Paid";
				                        mctc = (payrolldata.get(0).getNetpayableamount());
				                        mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
				                        enterDate = CommonUtil.convertDateToStringWithOutTime(payrolldata.get(0).getUpdatedon());
			                        }else{
			                            status = "Pending";
			                            try {
		    								List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(employeeDO.getId());
		    								enterDate = "";
		    								if(empctcList != null && empctcList.size() > 0){
		    									if(empctcList.get(0).getEmpctc() != null){
		    										mctc = empctcList.get(0).getEmpctc().doubleValue() / 12;
		    										mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
		    									}
		    								}else{
		    									mctc =0;
												mctc = CommonUtil.convertFloatWithDoublePrecision(mctc);
		    								}
		    							} catch (Exception e) { }
			                        }
			                    payrollData.setSalstatus(status);
			                    payrollData.setMonthctc(mctc);
			                    payrollData.setPaidon(enterDate);
			                    payrollList.add(payrollData);
    						}
    					}
                    }
                }
                if (payrollList != null) {
                	Collections.reverse(payrollList);
                    respJSON = PayrollUtil.getPayrollList(payrollList);
                }
            } catch (Exception e) { }

            return respJSON != null ? respJSON.toString() : "";
    }
	
	@RequestMapping(value = "/retrivebyempid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmp(@PathVariable long id, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmployeeDO> empList = new EmployeeService().retriveById(id);
			if(empList.size() > 0){
				respJSON = EmployeeUtil.getEmployeeList(empList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retriveempdetailsbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpDetails(@PathVariable long id, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmpDetailDO> empDetailsList = new EmpDetailService().retriveByEmpId(id);
			if(empDetailsList.size() > 0){
				respJSON = EmpDetailUtil.getEmployeeDetailList(empDetailsList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	@RequestMapping(value = "/retriveempaccbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpAcc(@PathVariable long id, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmpAccDetailDO> empAccDetailList = new EmpAccDetailService().retriveByEmpId(id);
			if(empAccDetailList.size() > 0){
				respJSON = EmpAccDetailUtil.getEmpAccDetailList(empAccDetailList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retriveempfamilyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpFam(@PathVariable long id, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmpFamilyBackgroundDO> empFamilyBackgroundList = new EmpFamilyBackgroundService().retriveByEmpId(id);
			if(empFamilyBackgroundList.size() > 0){
				respJSON = EmpFamilyBackgroundUtil.getEmpFamilyBackgroundList(empFamilyBackgroundList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivetdsbyempidandcurrentmonth/{empid}/{tdsdate}", method = RequestMethod.GET)
	public @ResponseBody String retriveTdsByEmpIdMonth(@PathVariable long empid, @PathVariable String tdsdate, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <TDSDO> tdsList = new TDSService().retriveTdsByEmpIdMonth(empid, CommonUtil.convertStringToDate(tdsdate));
			if(tdsList.size() > 0){
				respJSON = TDSUtill.gettdsList(tdsList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retriveemppfbyempidandcurrentmonth/{empid}/{pfmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveemppfbyempidandcurrentmonth(@PathVariable long empid, @PathVariable String pfmonth, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmpPFDO> emppfList = new EmpPFService().retriveByEmpIdMonth(empid, CommonUtil.convertStringToDate(pfmonth));
			if(emppfList.size() > 0){
				respJSON = EmpPFUtil.getPFList(emppfList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyempidandcurrentmonth/{empid}/{selectedmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmployeePayrollByIDAndMonth(@PathVariable long empid, @PathVariable String selectedmonth, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <PayrollDO> payList = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(selectedmonth));
			if(payList.size() > 0){
				respJSON = PayrollUtil.getPayrollListDetails(payList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getempctc/{empid}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpCtc(@PathVariable long empid, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <EmpCTCDO> empctcList = new EmpCTCService().retriveByEmpIdActive(empid);
			if(empctcList != null && empctcList.size() > 0){
				respJSON = EmpCtcUtil.getCtcList(empctcList).toString();
			}else{
				respJSON = CommonWebUtil.buildErrorResponse("").toString();
			}
			
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/retrivebyprojectid/{id}", method = RequestMethod.GET)
	public @ResponseBody String retriveproj(@PathVariable long id, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List <ProjectDO> proList = new ProjectService().retriveById(id);
			if(proList.size() > 0){
				respJSON = ProjectUtil.getProjectList(proList).toString();
			}
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getEmp/{eid}", method = RequestMethod.GET)
	public @ResponseBody String getByIdForGridEmp(@PathVariable long eid, Model model) {
		JSONObject respJSON = null;
		try {
			List<EmpAssignmentDO> assgList = new EmpAssignmentService().retriveByEmpId(eid);
			if (assgList != null && assgList.size() > 0) {
				respJSON = EmpAssignmentUtil.getAsignList(assgList);
			}else{
				respJSON = CommonWebUtil.buildErrorResponse(" ");
			}
		} catch (Exception e) { }

		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/getempmonth/{empid}/{month}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpidMonth(@PathVariable long empid,@PathVariable String month, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			List<PayrollDO> payrollList = new PayrollService().retriveByEmpidMonth(empid, CommonUtil.convertStringToDate(month));
			if(payrollList != null && payrollList.size() > 0){
				respJSON = "1";
			}else{
				respJSON = "0";
			}
		} catch (Exception e) { }
		return respJSON != null ? respJSON.toString() : "";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public @ResponseBody String get(Model model) {
		JSONObject respJSON = null;
		try {
			List<ProfessionalTaxDO> taxList = new ProfessionalTaxService().retriveProfessionalTax();
			if (taxList != null && taxList.size() > 0) {
				respJSON = ProfessionalTaxUtil.getProfessionalTaxGrid(taxList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
	/*@RequestMapping(value = "/getconstnt", method = RequestMethod.GET)
	public @ResponseBody String getconst(Model model) {
		JSONObject respJSON = null;
		try {
			List<CommonConstantsDO> constList = new CommonConstantsService().retrive();
			if (constList != null && constList.size() > 0) {
				respJSON = CommonConstantsUtil.getConstantList(constList);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
		
	}*/

	@RequestMapping(value = "/getempctc/{empid}/{selectedmonth}", method = RequestMethod.GET)
	public @ResponseBody String retriveEmpCtcMonth(@PathVariable long empid, @PathVariable String selectedmonth, Model model, HttpServletRequest request) {
		String respJSON = null;
		int eyear = 0 ;
		int emonth = 0;
		Calendar c = Calendar.getInstance();
		try {
			String selectemonth = selectedmonth;
			Date sendingmonth = CommonUtil.convertStringToDate(selectemonth);
			c.setTime(sendingmonth);
		    int sndyear = c.get(Calendar.YEAR);
		    int sndmonth = (c.get(Calendar.MONTH) + 1);
			List<EmpCTCDO> empctcList = new EmpCTCService().retriveByDate(empid, sendingmonth);
			List<EmpCTCDO> ctcList = new ArrayList<EmpCTCDO>();
			for(int i = 0; i < empctcList.size(); i++){
				Date  stdate = empctcList.get(i).getStartdate();
				Date  eddate = empctcList.get(i).getEnddate();
			
			    c.setTime(stdate);
			    int syear = c.get(Calendar.YEAR);
			    int smonth = (c.get(Calendar.MONTH) + 1);
			    
			    if(eddate != null){
				    c.setTime(eddate);
				    eyear = c.get(Calendar.YEAR);
				     emonth = (c.get(Calendar.MONTH) + 1);

				   if( (syear < sndyear) || (syear == sndyear && smonth <= sndmonth)){
					 if( (sndyear < eyear) || (eyear == sndyear && sndmonth <= emonth)){
						 ctcList.add(empctcList.get(i));	
					   }
				   }
			    }
			   if(eddate == null){
				   if( (syear < sndyear) || (syear == sndyear && smonth <= sndmonth)){
					   ctcList.add(empctcList.get(i));
				   }
			   }
			}
			if(ctcList != null && ctcList.size() > 0){
				respJSON = EmpCtcUtil.getCtcList(ctcList).toString();
			}else{
				respJSON = CommonWebUtil.buildErrorResponse("").toString();
			}
			
		} catch (Exception e) { }
		
		return respJSON != null ? respJSON.toString() : "";
	}	
	
	@RequestMapping(value = "/gettotalamount/{selectedmonth}", method = RequestMethod.GET)
	public @ResponseBody String gettotalamount(@PathVariable String selectedmonth, Model model, HttpServletRequest request) {
		String respJSON = null;
		try {
			if (WebManager.authenticateSession(request)) {
				Calendar c = Calendar.getInstance();
				String selectemonth = selectedmonth;
				Date sendingmonth = CommonUtil.convertStringToDate(selectemonth);
				c.setTime(sendingmonth);
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
				Date edate= c.getTime();
				double mctc = 0;
				List<PayrollDO> payrolldata = new PayrollService().FindByStartAndEndDate(sendingmonth ,edate);
				if(payrolldata.size() > 0){
					for (PayrollDO payrollDO : payrolldata) {
						mctc = mctc + (payrollDO.getNetpayableamount());
					}
				}
				double totalamount = mctc;
				respJSON = String.valueOf(totalamount);
			}
		} catch (Exception e) {
		}
		return respJSON != null ? respJSON.toString() : "";
	}
	
}
