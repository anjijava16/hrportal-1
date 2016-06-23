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
@Table(name = "empbonus")
@TableGenerator(name ="empbonus", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "EmpBonusDO.findAll", query = "SELECT a FROM EmpBonusDO  a"),
	@NamedQuery(name = "EmpBonusDO.findbyEmpId", query = "SELECT a FROM EmpBonusDO  a where a.empid =:empid"),
	@NamedQuery(name = "EmpBonusDO.findbyId", query = "SELECT a FROM EmpBonusDO  a where a.id =:id"),
	@NamedQuery(name = "EmpBonusDO.findbysteddate", query = "SELECT a FROM EmpBonusDO a WHERE a.bonusmonth BETWEEN :stdate AND :eddate"),
	@NamedQuery(name = "EmpBonusDO.findbyEmpIdMonth", query = "SELECT a FROM EmpBonusDO  a where a.empid =:empid and a.bonusmonth =:month"),
	@NamedQuery(name = "EmpBonusDO.findbysteddatebyorder", query = "SELECT a FROM EmpBonusDO a WHERE a.bonusmonth BETWEEN :stdate AND :eddate order by a.bonusmonth")
})

public class EmpBonusDO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "EmpBonusDO.findAll";
	
	public static final String FIND_BY_EMPID = "EmpBonusDO.findbyEmpId";
	
	public static final String FIND_BY_ID = "EmpBonusDO.findbyId";
	
	public static final String FIND_BY_EMPID_MONTH = "EmpBonusDO.findbyEmpIdMonth";
	
	public static final String FIND_BY_ST_ET_DATE_BY_ORDER = "EmpBonusDO.findbysteddatebyorder";
	
	public static final String FIND_BY_ST_ET_DATE = "EmpBonusDO.findbysteddate";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "empbonus")
	private Long id;

	private Long empid;
	
	private Long bonusamount;
	
	@Temporal(TemporalType.DATE)
	private Date bonusmonth;

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

	public Long getBonusamount() {
		return bonusamount;
	}

	public void setBonusamount(Long bonusamount) {
		this.bonusamount = bonusamount;
	}

	public Long getEmpid() {
		return empid;
	}
	

	public void setEmpid(Long empid) {
		this.empid = empid;
	}
	

	public Date getBonusmonth() {
		return bonusmonth;
	}
	

	public void setBonusmonth(Date bonusmonth) {
		this.bonusmonth = bonusmonth;
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
