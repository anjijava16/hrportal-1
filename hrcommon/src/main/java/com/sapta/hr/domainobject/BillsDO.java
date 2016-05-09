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
@Table(name = "bills")
@TableGenerator(name ="bills", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "BillsDO.findAll", query = "SELECT u FROM BillsDO u"),
		@NamedQuery(name = "BillsDO.findbyId", query = "SELECT u FROM BillsDO u where u.id =:id"),
		@NamedQuery(name = "BillsDO.findbyBillno", query = "SELECT u FROM BillsDO u where u.billno =:billno"),
		@NamedQuery(name = "BillsDO.findbysteddate", query = "SELECT e FROM BillsDO e where e.billdate BETWEEN :stdate AND :eddate"),
		@NamedQuery(name = "BillsDO.findbysteddatebyorder", query = "SELECT e FROM BillsDO e where e.billdate BETWEEN :stdate AND :eddate order by e.billdate"),
		@NamedQuery(name = "BillsDO.findbysteddatebystatus", query = "SELECT e FROM BillsDO e where e.billdate BETWEEN :stdate AND :eddate AND e.status =:status order by e.billdate"),
		@NamedQuery(name = "BillsDO.findbystatus", query = "SELECT e FROM BillsDO e where e.status =:status"),
		@NamedQuery(name = "BillsDO.findbyVendorId", query = "SELECT u FROM BillsDO u where u.vendorid =:vendorid")})
public class BillsDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "BillsDO.findAll";
	public static final String FIND_BY_ID = "BillsDO.findbyId";
	public static final String FIND_BY_BILL_NO = "BillsDO.findbyBillno";
	public static final String FIND_BY_VENDOR_ID = "BillsDO.findbyVendorId";
	public static final String FIND_BY_ST_ET_DATE = "BillsDO.findbysteddate";
	public static final String FIND_BY_ST_ET_DATE_BY_ORDER = "BillsDO.findbysteddatebyorder";
	public static final String FIND_BY_ST_ET_DATE_BY_STATUS = "BillsDO.findbysteddatebystatus";
	public static final String FIND_BY_STATUS = "BillsDO.findbystatus";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "bills")
	private Long id;

	private String billno;

	@Temporal(TemporalType.DATE)
	private Date billdate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date duedate;
	
	private Double dueamount;

	private char amounttype;
	
	private char status;
	
	private String comments;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date paidon;

	public Date getPaidon() {
		return paidon;
	}

	public void setPaidon(Date paidon) {
		this.paidon = paidon;
	}

	private Long vendorid;
	
	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBillno() {
		return billno;
	}

	public void setBillno(String billno) {
		this.billno = billno;
	}

	public Date getBilldate() {
		return billdate;
	}

	public void setBilldate(Date billdate) {
		this.billdate = billdate;
	}

	public Date getDuedate() {
		return duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}

	public Double getDueamount() {
		return dueamount;
	}

	public void setDueamount(Double dueamount) {
		this.dueamount = dueamount;
	}

	public char getAmounttype() {
		return amounttype;
	}

	public void setAmounttype(char amounttype) {
		this.amounttype = amounttype;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Long getVendorid() {
		return vendorid;
	}

	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
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
