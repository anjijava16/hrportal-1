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
@Table(name = "emptds")
@TableGenerator(name ="emptds", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "EmpTDSDO.findAll", query = "SELECT a FROM EmpTDSDO  a"),
	@NamedQuery(name = "EmpTDSDO.findbyEmpId", query = "SELECT a FROM EmpTDSDO  a where a.empid =:empid"),
	@NamedQuery(name = "EmpTDSDO.findbyId", query = "SELECT a FROM EmpTDSDO  a where a.id =:id"),
	@NamedQuery(name = "EmpTDSDO.findbysteddate", query = "SELECT e FROM EmpTDSDO e WHERE e.tdsmonth BETWEEN :stdate AND :eddate"),
	@NamedQuery(name = "EmpTDSDO.findbyEmpIdMonth", query = "SELECT a FROM EmpTDSDO  a where a.empid =:empid and a.tdsmonth =:month"),
	@NamedQuery(name = "EmpTDSDO.findbysteddatebyorder", query = "SELECT e FROM EmpTDSDO e WHERE e.tdsmonth BETWEEN :stdate AND :eddate order by e.tdsmonth")
})

public class EmpTDSDO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "EmpTDSDO.findAll";
	
	public static final String FIND_BY_EMPID = "EmpTDSDO.findbyEmpId";
	
	public static final String FIND_BY_ID = "EmpTDSDO.findbyId";
	
	public static final String FIND_BY_EMPID_MONTH = "EmpTDSDO.findbyEmpIdMonth";
	
	public static final String FIND_BY_ST_ET_DATE_BY_ORDER = "EmpTDSDO.findbysteddatebyorder";
	
	public static final String FIND_BY_ST_ET_DATE = "EmpTDSDO.findbysteddate";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "emptds")
	private Long id;

	private Long empid;
	
	private Long tds;
	
	@Temporal(TemporalType.DATE)
	private Date tdsmonth;

	@Temporal(TemporalType.DATE)
	private Date paidon;
	
	private String comments;
	
	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}
	

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTds() {
		return tds;
	}

	public void setTds(Long tds) {
		this.tds = tds;
	}

	public Long getEmpid() {
		return empid;
	}
	

	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	

	public Date getTdsmonth() {
		return tdsmonth;
	}
	

	public void setTdsmonth(Date tdsmonth) {
		this.tdsmonth = tdsmonth;
	}
	

	public Date getPaidon() {
		return paidon;
	}
	

	public void setPaidon(Date paidon) {
		this.paidon = paidon;
	}
	

	public String getComments() {
		return comments;
	}
	

	public void setComments(String comments) {
		this.comments = comments;
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
