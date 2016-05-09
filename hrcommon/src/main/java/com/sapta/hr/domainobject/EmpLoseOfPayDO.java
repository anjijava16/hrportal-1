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
@Table(name = "emplop")
@TableGenerator(name ="emplop", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpLoseOfPayDO.findAll", query = "SELECT a FROM EmpLoseOfPayDO  a"),
		@NamedQuery(name = "EmpLoseOfPayDO.findbyId", query = "SELECT a FROM EmpLoseOfPayDO  a where a.id =:id"),
		@NamedQuery(name = "EmpLoseOfPayDO.findbyEmpId", query = "SELECT a FROM EmpLoseOfPayDO  a where a.empid =:empid"),
		@NamedQuery(name = "EmpLoseOfPayDO.findbydate", query = "SELECT e FROM EmpLoseOfPayDO e WHERE e.empid =:empid  AND e.startdate <= :month"),
		@NamedQuery(name = "EmpLoseOfPayDO.findbyEmpidStartdateEnddate", query = "SELECT e FROM EmpLoseOfPayDO e WHERE e.empid =:empid AND e.startdate BETWEEN :startdate AND :enddate"),
})


public class EmpLoseOfPayDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpLoseOfPayDO.findAll";

	public static final String FIND_BY_ID = "EmpLoseOfPayDO.findbyId";
	
	public static final String FIND_BY_EMPID = "EmpLoseOfPayDO.findbyEmpId";
	
	public static final String FIND_BY_DATE = "EmpLoseOfPayDO.findbydate";
	
	public static final String FIND_ACTIVE = "EmpLoseOfPayDO.active";
	
	public static final String FIND_BY_EMPID_ACTIVE = "EmpLoseOfPayDO.findbyEmpIdActive";
	
	public static final String FIND_BY_EMPCTC_ACTIVE = "EmpLoseOfPayDO.findbyEmpctcActive";
	
	public static final String FIND_BY_EMP_ID_AND_START_DATE_END_DATE = "EmpLoseOfPayDO.findbyEmpidStartdateEnddate";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "emplop")
	private Long id;

	private Long empid;
	
	@Temporal(TemporalType.DATE)
	private Date startdate;

	@Temporal(TemporalType.DATE)
	private Date enddate;
	
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