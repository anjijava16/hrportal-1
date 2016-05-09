package com.sapta.hr.domainobject;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class CtcList {
	
	private Long id;
	
	private Long empid;
	
	private String empname;
	
	private char status;
	
	private Long empctc;
	
	@Temporal(TemporalType.DATE)
	private Date startdate;

	@Temporal(TemporalType.DATE)
	private Date enddate;
	
	private String empstatus;
	
	public Long getEmpid() {
		return empid;
	}

	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Long getEmpctc() {
		return empctc;
	}

	public void setEmpctc(Long empctc) {
		this.empctc = empctc;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getEmpstatus() {
		return empstatus;
	}

	public void setEmpstatus(String empstatus) {
		this.empstatus = empstatus;
	}

	
}
