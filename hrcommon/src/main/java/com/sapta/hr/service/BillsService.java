package com.sapta.hr.service;

import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.sapta.hr.dao.BillsDAO;
import com.sapta.hr.domainobject.BillsDO;
import com.sapta.hr.domainobject.InvoiceDO;
import com.sapta.hr.exception.AppException;

public class BillsService {
	static Logger logger = Logger.getLogger(BillsService.class.getName());
	
	public BillsDO persistbills(BillsDO billsDO) throws AppException {
		return new BillsDAO().persist(billsDO);
	}

	public List<BillsDO> retrivebills() throws AppException {
		return new BillsDAO().retrive();
	}
	
	public List<BillsDO> getFinancialYearBillsReport(Date stdate, Date eddate, char status) throws AppException {
		return new BillsDAO().getFinancialYearBillsReport(stdate, eddate, status);
	}

	public List<BillsDO> retriveById(long id) throws AppException {
		return new BillsDAO().retriveById(id);
	}
	
	public List<BillsDO> retriveByBillNo(String billno) throws AppException {
		return new BillsDAO().retriveByBillNo(billno);
	}
	
	public List<BillsDO> retriveVendor(long vendorid) throws AppException {
		return new BillsDAO().retriveVendor(vendorid);
	}


	public boolean update(BillsDO billsDO) throws AppException {
		return new BillsDAO().update(billsDO);
	}
	
	public boolean delete(BillsDO billsDO)throws AppException{
		return new BillsDAO().delete(billsDO);
	}
	
	public List<BillsDO> FindAllEvents(Date stdate,Date eddate) throws AppException {
		return new BillsDAO().FindAllEvents(stdate,eddate);
	}
	
	public List<BillsDO> retrivebystatus(char status) throws AppException {
		return new BillsDAO().retrivebystatus(status);
	}
	
	public List<InvoiceDO> retrive() {
		// TODO Auto-generated method stub
		return null;
	}

}
