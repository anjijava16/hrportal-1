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
@Table(name = "tds")
@TableGenerator(name ="tds", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "TdsDO.find", query = "SELECT u FROM TDSDO u"),
		@NamedQuery(name = "TdsDO.findbyId", query = "SELECT u FROM TDSDO u where u.id =:id"), 
		@NamedQuery(name = "TdsDO.findbyEmpId", query = "SELECT u FROM TDSDO u where u.empid =:empid"),
		@NamedQuery(name = "TdsDO.findbyTdmonth", query = "SELECT u FROM TDSDO u where u.tdsmonth =:tdsmonth"),
		@NamedQuery(name = "TDSDO.findbysteddate", query = "SELECT e FROM TDSDO e WHERE e.tdsmonth BETWEEN :stdate AND :eddate"),
		@NamedQuery(name = "TDSDO.findbyempidtdsdate", query = "SELECT e FROM TDSDO e WHERE e.empid =:empid AND e.tdsmonth =:tdsdate"),
		@NamedQuery(name = "TDSDO.findbysteddatebyorder", query = "SELECT e FROM TDSDO e WHERE e.tdsmonth BETWEEN :stdate AND :eddate order by e.tdsmonth")
	})

     public class TDSDO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "TdsDO.find";
	
	public static final String FIND_BY_ID = "TdsDO.findbyId";

	public static final String FIND_BY_EMPID = "TdsDO.findbyEmpId";
	
	public static final String FIND_BY_TDMONTH = "TdsDO.findbyTdmonth";
	
	public static final String FIND_BY_ST_ET_DATE = "TDSDO.findbysteddate";
	
	public static final String FIND_BY_EMPID_DATE = "TDSDO.findbyempidtdsdate";
	
	public static final String FIND_BY_ST_ET_DATE_BY_ORDER = "TDSDO.findbysteddatebyorder";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "tds")
	private Long id;

	private Long empid;
	
	@Temporal(TemporalType.DATE)
	private Date tdsmonth;
	
	private Double amount;
	
	private String refer;
	
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

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getRefer() {
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
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
