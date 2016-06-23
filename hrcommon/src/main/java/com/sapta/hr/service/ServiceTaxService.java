package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.ServiceTaxDAO;
import com.sapta.hr.domainobject.ServiceTaxDO;
import com.sapta.hr.exception.AppException;

public class ServiceTaxService {

	
static Logger logger = Logger.getLogger(TDSService.class.getName());
	
	public ServiceTaxDO persistTds(ServiceTaxDO servicetaxDO) throws AppException {
		return new ServiceTaxDAO().persist(servicetaxDO);
	}

	public List<ServiceTaxDO> retriveTds() throws AppException {
		return new ServiceTaxDAO().retrive();
	}

	public List<ServiceTaxDO> getFinancialYearservicetaxReport(Date stdate, Date eddate) throws AppException {
		return new ServiceTaxDAO().getFinancialYearServicetaxReport(stdate, eddate);
	}
	
	public List<ServiceTaxDO> retriveTdsById(long id) throws AppException {
		return new ServiceTaxDAO().retriveById(id);
	}
	
	public List<ServiceTaxDO> retriveTdsByEmpId(long id) throws AppException {
		return new ServiceTaxDAO().retriveByEmpId(id);
	}
	
	public List<ServiceTaxDO> retriveTdsByEmpIdMonth(long empid,Date tdsdate) throws AppException {
		return new ServiceTaxDAO().retriveTDSByEmpIdMonth(empid,tdsdate);
	}
	
	public List<ServiceTaxDO> retriveTdsByTDMONTH(String tdsmonth) throws AppException {
		return new ServiceTaxDAO().retriveByTDMONTH(tdsmonth);
	}
	
	public List<ServiceTaxDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new ServiceTaxDAO().FindAllEvents(stdate,eddate);
	}
	
	public List<ServiceTaxDO> FindByEmpIdAndDate(Long empid,Date tdsdate) throws AppException {
		return new ServiceTaxDAO().FindByEmpIdAndDate(empid,tdsdate);
	}
	
	public boolean update(ServiceTaxDO servicetaxDO) throws AppException {
		return new ServiceTaxDAO().update(servicetaxDO);
	}

	public boolean delete(ServiceTaxDO servicetaxDO) throws AppException {
		return new ServiceTaxDAO().delete(servicetaxDO);
	}
	
}
