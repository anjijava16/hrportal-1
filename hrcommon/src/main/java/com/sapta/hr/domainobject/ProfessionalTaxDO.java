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
@Table(name = "professionaltax")
@TableGenerator(name ="professionaltax", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "ProfessionalTaxDO.findAll", query = "SELECT a FROM ProfessionalTaxDO  a"),
		@NamedQuery(name = "ProfessionalTaxDO.findbyId", query = "SELECT a FROM ProfessionalTaxDO  a where a.id =:id"),
		@NamedQuery(name = "ProfessionalTaxDO.findbyEmpId", query = "SELECT a FROM ProfessionalTaxDO  a where a.empid =:empid"),
		@NamedQuery(name = "ProfessionalTaxDO.findbysteddate", query = "SELECT e FROM ProfessionalTaxDO e WHERE e.ptmonth BETWEEN :stdate AND :eddate"),
		@NamedQuery(name = "ProfessionalTaxDO.findbysteddatebyorder", query = "SELECT e FROM ProfessionalTaxDO e WHERE e.ptmonth BETWEEN :stdate AND :eddate order by e.ptmonth"),
		@NamedQuery(name = "ProfessionalTaxDO.findbyMonth", query = "SELECT a FROM ProfessionalTaxDO  a where a.ptmonth =:ptmonth")
})

public class ProfessionalTaxDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "ProfessionalTaxDO.findAll";

	public static final String FIND_BY_ID = "ProfessionalTaxDO.findbyId";
	
	public static final String FIND_BY_EMPID = "ProfessionalTaxDO.findbyEmpId";
	
	public static final String FIND_BY_MONTH = "ProfessionalTaxDO.findbyMonth";
	
	public static final String FIND_BY_ST_ET_DATE = "ProfessionalTaxDO.findbysteddate";
	
	public static final String FIND_BY_ST_ET_DATE_ORDER = "ProfessionalTaxDO.findbysteddatebyorder";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "professionaltax")
	private Long id;

	private Long empid;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date ptmonth;
	
	private Double amount;
	
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

	public Date getPtmonth() {
		return ptmonth;
	}

	public void setPtmonth(Date ptmonth) {
		this.ptmonth = ptmonth;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
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
