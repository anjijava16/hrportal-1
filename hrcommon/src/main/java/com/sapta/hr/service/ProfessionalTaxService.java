package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.ProfessionalTaxDAO;
import com.sapta.hr.domainobject.ProfessionalTaxDO;
import com.sapta.hr.exception.AppException;

public class ProfessionalTaxService {
	static Logger logger = Logger.getLogger(ProfessionalTaxService.class.getName());
	
	public ProfessionalTaxDO persistProfessionalTax(ProfessionalTaxDO professionaltaxDO) throws AppException {
		return new ProfessionalTaxDAO().persist(professionaltaxDO);
	}

	public List<ProfessionalTaxDO> retriveProfessionalTax() throws AppException {
		return new ProfessionalTaxDAO().retrive();
	}
	
	public List<ProfessionalTaxDO> getFinancialYearProfessionalTaxReport(Date stdate, Date eddate) throws AppException {
		return new ProfessionalTaxDAO().getFinancialYearProfessionalTaxReport(stdate, eddate);
	}

	public List<ProfessionalTaxDO> retriveProfessionalTaxById(long id) throws AppException {
		return new ProfessionalTaxDAO().retriveById(id);
	}
	
	public List<ProfessionalTaxDO> retriveProfessionalTaxByEmpId(long id) throws AppException {
		return new ProfessionalTaxDAO().retriveByEmpId(id);
	}
	
	public List<ProfessionalTaxDO> retriveProfessionalTaxByMonth(String ptmonth) throws AppException {
		return new ProfessionalTaxDAO().retriveByMonth(ptmonth);
	}
	
	public List<ProfessionalTaxDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new ProfessionalTaxDAO().FindAllEvents(stdate,eddate);
	}

}
