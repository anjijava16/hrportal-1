package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.InvoiceDAO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.exception.AppException;

public class InvoiceService {
	static Logger logger = Logger.getLogger(InvoiceService.class.getName());
	
	public InvoiceDO persistinvoice(InvoiceDO invoiceDO) throws AppException {
		return new InvoiceDAO().persist(invoiceDO);
	}

	public List<InvoiceDO> retriveinvoice() throws AppException {
		return new InvoiceDAO().retrive();
	}
	
	public List<InvoiceDO> retriveById(long id) throws AppException {
		return new InvoiceDAO().retriveById(id);
	}
	
	public List<InvoiceDO> retriveByInvoiceNo(String invoiceno) throws AppException {
		return new InvoiceDAO().retriveByInvoiceNo(invoiceno);
	}
	
	public List<InvoiceDO> retriveByCustAndProjct(long projectid, long customerid) throws AppException {
		return new InvoiceDAO().retriveByCustAndProjct(projectid, customerid);
	}

	public boolean update(InvoiceDO invoiceDO) throws AppException {
		return new InvoiceDAO().update(invoiceDO);
	}
	
	public boolean delete(InvoiceDO invoiceDO)throws AppException{
		return new InvoiceDAO().delete(invoiceDO);
	}
	
	public List<InvoiceDO> getFinancialYearInvoiceReport(Date stdate, Date eddate, char status) throws AppException {
		return new InvoiceDAO().getFinancialYearInvoiceReport(stdate, eddate, status);
	}
	
	public List<InvoiceDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new InvoiceDAO().FindAllEvents(stdate,eddate);
	}
	
	public List<InvoiceDO> retrivebystatus(char status) throws AppException {
		return new InvoiceDAO().retriveByStatus(status);
	}
}
