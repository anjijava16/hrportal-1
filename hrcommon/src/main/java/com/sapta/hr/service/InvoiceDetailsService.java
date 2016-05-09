package com.sapta.hr.service;

import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.InvoiceDetailsDAO;
import com.sapta.hr.domainobject.InvoiceDetailsDO;
import com.sapta.hr.exception.AppException;

public class InvoiceDetailsService {
	static Logger logger = Logger.getLogger(InvoiceDetailsService.class.getName());
	
	public InvoiceDetailsDO persistinvoice(InvoiceDetailsDO invoiceDetailsDO) throws AppException {
		return new InvoiceDetailsDAO().persist(invoiceDetailsDO);
	}

	public List<InvoiceDetailsDO> retriveinvoice() throws AppException {
		return new InvoiceDetailsDAO().retrive();
	}
	
	public List<InvoiceDetailsDO> retriveById(long id) throws AppException {
		return new InvoiceDetailsDAO().retriveById(id);
	}
	
	public List<InvoiceDetailsDO> retriveByInvoiceNo(String invoiceno) throws AppException {
		return new InvoiceDetailsDAO().retriveByInvoiceNo(invoiceno);
	}
	
	public boolean update(InvoiceDetailsDO invoiceDO) throws AppException {
		return new InvoiceDetailsDAO().update(invoiceDO);
	}
	
	public boolean delete(InvoiceDetailsDO invoiceDO)throws AppException{
		return new InvoiceDetailsDAO().delete(invoiceDO);
	}
}
