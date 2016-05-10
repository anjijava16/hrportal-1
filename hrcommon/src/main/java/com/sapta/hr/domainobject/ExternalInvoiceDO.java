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
@Table(name = "externalinvoice")
@TableGenerator(name ="externalinvoice", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "ExternalInvoiceDO.findAll", query = "SELECT u FROM ExternalInvoiceDO u"),
		@NamedQuery(name = "ExternalInvoiceDO.findbyId", query = "SELECT u FROM ExternalInvoiceDO u where u.id =:id"),
		@NamedQuery(name = "ExternalInvoiceDO.findbyInvoiceno", query = "SELECT u FROM ExternalInvoiceDO u where u.invoiceno =:invoiceno"),
//		@NamedQuery(name = "ExternalInvoiceDO.inactive", query = "SELECT a FROM ExternalInvoiceDO  a where a.invoicestatus =:status"),
//		@NamedQuery(name = "ExternalInvoiceDO.findbyStatus", query = "SELECT a FROM ExternalInvoiceDO  a where a.invoicestatus =:status and a.invoiceno =:invoiceno"),
		@NamedQuery(name = "ExternalInvoiceDO.findbysteddate", query = "SELECT e FROM ExternalInvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate"),
//		@NamedQuery(name = "ExternalInvoiceDO.findbysteddatebyorder", query = "SELECT e FROM ExternalInvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate order by e.invoicedate"),
		@NamedQuery(name = "ExternalInvoiceDO.findbysteddatebystatus", query = "SELECT e FROM ExternalInvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate AND e.invoicestatus =:status order by e.invoicedate"),
//		@NamedQuery(name = "ExternalInvoiceDO.findbyProjectAndCustomerId", query = "SELECT u FROM ExternalInvoiceDO u where u.projectid =:projectid and u.customerid =:customerid")
	})
public class ExternalInvoiceDO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public static final String FIND_ALL = "ExternalInvoiceDO.findAll";
	
	public static final String FIND_BY_ID = "ExternalInvoiceDO.findbyId";
	
	public static final String FIND_BY_INVOICE_NO = "ExternalInvoiceDO.findbyInvoiceno";
//	
//	public static final String FIND_INACTIVE = "ExternalInvoiceDO.inactive";
//	
//	public static final String FIND_BY_STATUS = "ExternalInvoiceDO.findbyStatus";
//	
//	public static final String FIND_BY_PROJECT_CUSTOMER_ID = "ExternalInvoiceDO.findbyProjectAndCustomerId";
//	
	public static final String FIND_BY_ST_ET_DATE = "ExternalInvoiceDO.findbysteddate";
//	
//	public static final String FIND_BY_ST_ET_DATE_ORDER_BY = "ExternalInvoiceDO.findbysteddatebyorder";
//	
	public static final String FIND_BY_ST_ET_DATE_BY_STATUS = "ExternalInvoiceDO.findbysteddatebystatus";
//	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "externalinvoice")
	private Long id;

	private String invoiceno;

	@Temporal(TemporalType.DATE)
	private Date invoicedate;
	
	@Temporal(TemporalType.DATE)
	private Date duedate;
	
	private Double invoiceamount;

	private char amounttype;
	
	private char invoicestatus;
	
	private Long projectid;
	
	private Long customerid;
	
	@Temporal(TemporalType.DATE)
	private Date receiveddate;
	
	private Double receivedamount;
	
	private String receivedamounttype;

	private String receivedcomments;
	
	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}
	

	public void setId(Long id) {
		this.id = id;
	}
	

	public String getInvoiceno() {
		return invoiceno;
	}
	

	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno;
	}
	

	public Date getInvoicedate() {
		return invoicedate;
	}
	

	public void setInvoicedate(Date invoicedate) {
		this.invoicedate = invoicedate;
	}
	

	public Date getDuedate() {
		return duedate;
	}
	

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}
	

	public Double getInvoiceamount() {
		return invoiceamount;
	}
	

	public void setInvoiceamount(Double invoiceamount) {
		this.invoiceamount = invoiceamount;
	}
	

	public char getAmounttype() {
		return amounttype;
	}
	

	public void setAmounttype(char amounttype) {
		this.amounttype = amounttype;
	}
	

	public char getInvoicestatus() {
		return invoicestatus;
	}
	

	public void setInvoicestatus(char invoicestatus) {
		this.invoicestatus = invoicestatus;
	}
	

	public Long getProjectid() {
		return projectid;
	}
	

	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}
	

	public Long getCustomerid() {
		return customerid;
	}
	

	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}
	

	public Date getReceiveddate() {
		return receiveddate;
	}
	

	public void setReceiveddate(Date receiveddate) {
		this.receiveddate = receiveddate;
	}
	

	public Double getReceivedamount() {
		return receivedamount;
	}
	

	public void setReceivedamount(Double receivedamount) {
		this.receivedamount = receivedamount;
	}
	

	public String getReceivedamounttype() {
		return receivedamounttype;
	}
	

	public void setReceivedamounttype(String receivedamounttype) {
		this.receivedamounttype = receivedamounttype;
	}
	

	public String getReceivedcomments() {
		return receivedcomments;
	}
	

	public void setReceivedcomments(String receivedcomments) {
		this.receivedcomments = receivedcomments;
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
