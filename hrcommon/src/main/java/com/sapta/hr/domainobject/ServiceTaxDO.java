package com.sapta.hr.domainobject;

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
@Table(name = "servicetax")
@TableGenerator(name ="servicetax", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "ServiceTaxDO.find", query = "SELECT u FROM ServiceTaxDO u"),
		@NamedQuery(name = "ServiceTaxDO.findbyId", query = "SELECT u FROM ServiceTaxDO u where u.id =:id"), 
		/*@NamedQuery(name = "ServiceTaxDO.findbyEmpId", query = "SELECT u FROM ServiceTaxDO u where u.empid =:empid"),*/
		@NamedQuery(name = "ServiceTaxDO.findbyTdmonth", query = "SELECT u FROM ServiceTaxDO u where u.taxmonth =:taxmonth"),
		@NamedQuery(name = "ServiceTaxDO.findbysteddate", query = "SELECT e FROM ServiceTaxDO e WHERE e.taxmonth BETWEEN :stdate AND :eddate"),
		/*@NamedQuery(name = "ServiceTaxDO.findbyempidtdsdate", query = "SELECT e FROM ServiceTaxDO e WHERE e.empid =:empid AND e.tdsmonth =:tdsdate"),*/
		@NamedQuery(name = "ServiceTaxDO.findbysteddatebyorder", query = "SELECT e FROM ServiceTaxDO e WHERE e.taxmonth BETWEEN :stdate AND :eddate order by e.taxmonth")
	})
public class ServiceTaxDO {

    private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "ServiceTaxDO.find";
	
	public static final String FIND_BY_ID = "ServiceTaxDO.findbyId";

	public static final String FIND_BY_EMPID = "ServiceTaxDO.findbyEmpId";
	
	public static final String FIND_BY_TDMONTH = "ServiceTaxDO.findbyTdmonth";
	
	public static final String FIND_BY_ST_ET_DATE = "ServiceTaxDO.findbysteddate";
	
	public static final String FIND_BY_EMPID_DATE = "ServiceTaxDO.findbyempidtdsdate";
	
	public static final String FIND_BY_ST_ET_DATE_BY_ORDER = "ServiceTaxDO.findbysteddatebyorder";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "servicetax")
	private Long id;
	
	@Temporal(TemporalType.DATE)
	private Date taxmonth;
	
	private Double amount;
	
	private String invoiceno;

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
	

	public Date getTaxmonth() {
		return taxmonth;
	}
	

	public void setTaxmonth(Date taxmonth) {
		this.taxmonth = taxmonth;
	}
	

	public Double getAmount() {
		return amount;
	}
	

	public void setAmount(Double amount) {
		this.amount = amount;
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
	
	public String getInvoiceno() {
		return invoiceno;
	}
	
	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno;
	}
	
	
	
}
