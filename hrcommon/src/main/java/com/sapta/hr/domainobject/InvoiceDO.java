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
@Table(name = "invoice")
@TableGenerator(name ="invoice", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "InvoiceDO.findAll", query = "SELECT u FROM InvoiceDO u"),
		@NamedQuery(name = "InvoiceDO.findbyId", query = "SELECT u FROM InvoiceDO u where u.id =:id"),
		@NamedQuery(name = "InvoiceDO.findbyInvoiceno", query = "SELECT u FROM InvoiceDO u where u.invoiceno =:invoiceno"),
		@NamedQuery(name = "InvoiceDO.inactive", query = "SELECT a FROM InvoiceDO  a where a.invoicestatus =:status"),
		@NamedQuery(name = "InvoiceDO.findbyStatus", query = "SELECT a FROM InvoiceDO  a where a.invoicestatus =:status and a.invoiceno =:invoiceno"),
		@NamedQuery(name = "InvoiceDO.findbysteddate", query = "SELECT e FROM InvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate"),
		@NamedQuery(name = "InvoiceDO.findbysteddatebyorder", query = "SELECT e FROM InvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate order by e.invoicedate"),
		@NamedQuery(name = "InvoiceDO.findbysteddatebystatus", query = "SELECT e FROM InvoiceDO e where e.invoicedate BETWEEN :stdate AND :eddate AND e.invoicestatus =:status order by e.invoicedate"),
		@NamedQuery(name = "InvoiceDO.findbyProjectAndCustomerId", query = "SELECT u FROM InvoiceDO u where u.projectid =:projectid and u.customerid =:customerid")
	})
public class InvoiceDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "InvoiceDO.findAll";
	public static final String FIND_BY_ID = "InvoiceDO.findbyId";
	public static final String FIND_BY_INVOICE_NO = "InvoiceDO.findbyInvoiceno";
	public static final String FIND_INACTIVE = "InvoiceDO.inactive";
	public static final String FIND_BY_STATUS = "InvoiceDO.findbyStatus";
	public static final String FIND_BY_PROJECT_CUSTOMER_ID = "InvoiceDO.findbyProjectAndCustomerId";
	public static final String FIND_BY_ST_ET_DATE = "InvoiceDO.findbysteddate";
	public static final String FIND_BY_ST_ET_DATE_ORDER_BY = "InvoiceDO.findbysteddatebyorder";
	public static final String FIND_BY_ST_ET_DATE_BY_STATUS = "InvoiceDO.findbysteddatebystatus";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "invoice")
	private Long id;

	private String invoiceno;

	@Temporal(TemporalType.DATE)
	private Date invoicedate;
	
	@Temporal(TemporalType.DATE)
	private Date duedate;
	
	private Double totalamount;

	private String amounttype;
	
	private char invoicestatus;
	
	private char typeofinvoice;
	
	private Long projectid;
	
	private Double servicetax;
	
	private Double amountininr;
	
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

	public Double getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(Double totalamount) {
		this.totalamount = totalamount;
	}

	public String getAmounttype() {
		return amounttype;
	}

	public void setAmounttype(String amounttype) {
		this.amounttype = amounttype;
	}

	public char getInvoicestatus() {
		return invoicestatus;
	}

	public void setInvoicestatus(char invoicestatus) {
		this.invoicestatus = invoicestatus;
	}

	public char getTypeofinvoice() {
		return typeofinvoice;
	}

	public void setTypeofinvoice(char typeofinvoice) {
		this.typeofinvoice = typeofinvoice;
	}

	public Long getProjectid() {
		return projectid;
	}

	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}

	public Double getServicetax() {
		return servicetax;
	}

	public void setServicetax(Double servicetax) {
		this.servicetax = servicetax;
	}

	public Double getAmountininr() {
		return amountininr;
	}

	public void setAmountininr(Double amountininr) {
		this.amountininr = amountininr;
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
