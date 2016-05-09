package com.sapta.hr.domainobject;

import java.sql.Date;

public class PayrollData { 
	
	private Long empid;
	
	private String empname;
	
	private String salstatus;
	
	private String paidon;
	
	private Double monthctc;

	public Long getEmpid() {
		return empid;
	}

	public void setEmpid(Long empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getSalstatus() {
		return salstatus;
	}

	public void setSalstatus(String salstatus) {
		this.salstatus = salstatus;
	}

	public Double getMonthctc() {
		return monthctc;
	}

	public void setMonthctc(Double monthctc) {
		this.monthctc = monthctc;
	}

	public String getPaidon() {
		return paidon;
	}
	

	public void setPaidon(String paidon) {
		this.paidon = paidon;
	}
	

	
	

}
