package com.sapta.hr.service;

import java.util.Date;
import java.util.List;

import com.sapta.hr.dao.ExternalInvoiceDAO;
import com.sapta.hr.domainobject.ExternalInvoiceDO;
import com.sapta.hr.exception.AppException;

public class ExternalInvoiceService {
	
	public ExternalInvoiceDO persist(ExternalInvoiceDO extInvoiceDO) throws AppException {
		return new ExternalInvoiceDAO().persist(extInvoiceDO);
	}
	
	public List<ExternalInvoiceDO> retrive() throws AppException {
		return new ExternalInvoiceDAO().retrive();
	}
	
	/*public List<ExternalInvoiceDO> retriveById(long id) throws AppException {
		return new InvoiceDAO().retriveById(id);
	}*/
	
	public List<ExternalInvoiceDO> retriveByInvoiceNo(String invoiceno) throws AppException {
		return new ExternalInvoiceDAO().retriveByInvoiceNo(invoiceno);
	}
	
	public List<ExternalInvoiceDO> getFinancialYearInvoiceReport(Date stdate, Date eddate, char status) throws AppException {
		return new ExternalInvoiceDAO().getFinancialYearInvoiceReport(stdate, eddate, status);
	}
	
	public boolean update(ExternalInvoiceDO extInvoiceDO) throws AppException {
		return new ExternalInvoiceDAO().update(extInvoiceDO);
	}
	
	public boolean delete(ExternalInvoiceDO extInvoiceDO)throws AppException{
		return new ExternalInvoiceDAO().delete(extInvoiceDO);
	}
	
	public List<ExternalInvoiceDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new ExternalInvoiceDAO().FindAllEvents(stdate,eddate);
	}
	
	
}
