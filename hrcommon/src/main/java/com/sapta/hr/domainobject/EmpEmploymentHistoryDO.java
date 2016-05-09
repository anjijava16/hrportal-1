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
@Table(name = "empemploymenthistory")
@TableGenerator(name ="empemploymenthistory", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpEmploymentHistoryDO.findAll", query = "SELECT ed FROM EmpEmploymentHistoryDO ed"),
		@NamedQuery(name = "EmpEmploymentHistoryDO.findbyId", query = "SELECT ed FROM EmpEmploymentHistoryDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpEmploymentHistoryDO.findbyEmpId", query = "SELECT ed FROM EmpEmploymentHistoryDO ed where ed.empid =:empid")
})
public class EmpEmploymentHistoryDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpEmploymentHistoryDO.findAll";

	public static final String FIND_BY_ID = "EmpEmploymentHistoryDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpEmploymentHistoryDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empemploymenthistory")
	private Long id;
	
	private Long empid;

	private String name;
	
	private String address;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date fromdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date todate;
	
	private Long startingsalary;
	
	private Long lastsalary;
	
	private String designation;
	
	private String responsibility;
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getFromdate() {
		return fromdate;
	}

	public void setFromdate(Date fromdate) {
		this.fromdate = fromdate;
	}

	public Date getTodate() {
		return todate;
	}

	public void setTodate(Date todate) {
		this.todate = todate;
	}

	public Long getStartingsalary() {
		return startingsalary;
	}

	public void setStartingsalary(Long startingsalary) {
		this.startingsalary = startingsalary;
	}

	public Long getLastsalary() {
		return lastsalary;
	}

	public void setLastsalary(Long lastsalary) {
		this.lastsalary = lastsalary;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
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
