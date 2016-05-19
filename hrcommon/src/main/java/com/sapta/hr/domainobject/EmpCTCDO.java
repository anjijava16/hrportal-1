package com.sapta.hr.domainobject;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "empctc")
@TableGenerator(name ="empctc", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpCTCDO.findAll", query = "SELECT a FROM EmpCTCDO  a"),
		@NamedQuery(name = "EmpCTCDO.findbyId", query = "SELECT a FROM EmpCTCDO  a where a.id =:id"),
		@NamedQuery(name = "EmpCTCDO.findbyEmpId", query = "SELECT a FROM EmpCTCDO  a where a.empid =:empid"),
		@NamedQuery(name = "EmpCTCDO.findbyEmpIdActive", query = "SELECT a FROM EmpCTCDO  a where a.empid =:empid and a.status =:status"),
		@NamedQuery(name = "EmpCTCDO.findbyEmpctcActive", query = "SELECT a FROM EmpCTCDO  a where a.status =:status and a.empid =:empid"),
		@NamedQuery(name = "EmpCTCDO.active", query = "SELECT a FROM EmpCTCDO  a where a.status =:status"),
		@NamedQuery(name = "EmpCTCDO.findbydate", query = "SELECT e FROM EmpCTCDO e WHERE e.empid =:empid  AND e.startdate <= :month"),
})


public class EmpCTCDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpCTCDO.findAll";

	public static final String FIND_BY_ID = "EmpCTCDO.findbyId";
	
	public static final String FIND_BY_EMPID = "EmpCTCDO.findbyEmpId";
	
	public static final String FIND_BY_DATE = "EmpCTCDO.findbydate";
	
	public static final String FIND_ACTIVE = "EmpCTCDO.active";
	
	public static final String FIND_BY_EMPID_ACTIVE = "EmpCTCDO.findbyEmpIdActive";
	
	public static final String FIND_BY_EMPCTC_ACTIVE = "EmpCTCDO.findbyEmpctcActive";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "empctc")
	private Long id;

	private Long empid;
	
	private char status;
	
	private Long empctc;
	
	@Temporal(TemporalType.DATE)
	private Date startdate;

	@Temporal(TemporalType.DATE)
	private Date enddate;
	
	private String bandchange;
	
	private String designation;
	
	public String getBandchange() {
		return bandchange;
	}

	public void setBandchange(String bandchange) {
		this.bandchange = bandchange;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getEmpid() {
		return empid;
	}

	public void setEmpid(Long empid) {
		this.empid = empid;
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

	public String getUpdatedby() {
		return updatedby;
	}

	public void setUpdatedby(String updatedby) {
		this.updatedby = updatedby;
	}

	public Date getUpdatedon() {
		return updatedon;
	}

	public void setUpdatedon(Date updatedon) {
		this.updatedon = updatedon;
	}

}