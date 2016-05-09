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
@Table(name = "emppf")
@TableGenerator(name ="emppf", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "EmpPFDO.findAll", query = "SELECT a FROM EmpPFDO  a"),
	@NamedQuery(name = "EmpPFDO.findbyId", query = "SELECT a FROM EmpPFDO  a where a.id =:id"),
	@NamedQuery(name = "EmpPFDO.findbyEmpId", query = "SELECT a FROM EmpPFDO  a where a.empid =:empid"),
	@NamedQuery(name = "EmpPFDO.findbyempidpfdate", query = "SELECT e FROM EmpPFDO e WHERE e.empid =:empid AND e.pfmonth =:pfdate"),
	@NamedQuery(name = "EmpPFDO.findbydate", query = "SELECT e FROM EmpPFDO e WHERE e.empid =:empid  AND e.pfmonth = :pfmonth"),
})
public class EmpPFDO implements Serializable{
	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpPFDO.findAll";

	public static final String FIND_BY_ID = "EmpPFDO.findbyId";
	
	public static final String FIND_BY_EMPID = "EmpPFDO.findbyEmpId";
	
	public static final String FIND_BY_EMPID_MONTH = "EmpPFDO.findbydate";
	
	public static final String FIND_BY_EMPID_DATE = "EmpPFDO.findbyempidpfdate";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "emppf")
	private Long id;

	private Long empid;
	
	private Double pfamount;
	
	@Temporal(TemporalType.DATE)
	private Date pfmonth;
	
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

	public Double getPfamount() {
		return pfamount;
	}

	public void setPfamount(Double pfamount) {
		this.pfamount = pfamount;
	}

	public Date getPfmonth() {
		return pfmonth;
	}

	public void setPfmonth(Date pfmonth) {
		this.pfmonth = pfmonth;
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
