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
@Table(name = "invoicedetails")
@TableGenerator(name ="invoicedetails", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "InvoiceDetailsDO.findAll", query = "SELECT u FROM InvoiceDetailsDO u"),
		@NamedQuery(name = "InvoiceDetailsDO.findbyId", query = "SELECT u FROM InvoiceDetailsDO u where u.id =:id"),
		@NamedQuery(name = "InvoiceDetailsDO.findbyInvoiceno", query = "SELECT u FROM InvoiceDetailsDO u where u.invoiceno =:invoiceno")
		})
public class InvoiceDetailsDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "InvoiceDetailsDO.findAll";
	public static final String FIND_BY_ID = "InvoiceDetailsDO.findbyId";
	public static final String FIND_BY_INVOICE_NO = "InvoiceDetailsDO.findbyInvoiceno";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "invoicedetails")
	private Long id;
	
	private String invoiceno;
	
	private String refnumbername;
	
	@Temporal(TemporalType.DATE)
	private Date servicefrom;

	@Temporal(TemporalType.DATE)
	private Date serviceto;
	
	private Double dueamount;
	
	private Long timeperiod;
	
	private Double rateofperiod;
	
	private Long noofdays;
	
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

	public String getRefnumbername() {
		return refnumbername;
	}

	public void setRefnumbername(String refnumbername) {
		this.refnumbername = refnumbername;
	}

	public Date getServicefrom() {
		return servicefrom;
	}

	public void setServicefrom(Date servicefrom) {
		this.servicefrom = servicefrom;
	}

	public Date getServiceto() {
		return serviceto;
	}

	public void setServiceto(Date serviceto) {
		this.serviceto = serviceto;
	}

	public Double getDueamount() {
		return dueamount;
	}

	public void setDueamount(Double dueamount) {
		this.dueamount = dueamount;
	}

	public Long getTimeperiod() {
		return timeperiod;
	}

	public void setTimeperiod(Long timeperiod) {
		this.timeperiod = timeperiod;
	}
	
	public Long getNoofdays() {
		return noofdays;
	}

	public void setNoofdays(Long noofdays) {
		this.noofdays = noofdays;
	}

	public Double getRateofperiod() {
		return rateofperiod;
	}

	public void setRateofperiod(Double rateofperiod) {
		this.rateofperiod = rateofperiod;
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
