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
@Table(name = "expense")
@TableGenerator(name ="expense", initialValue =100101, allocationSize =1)
@NamedQueries({
	
		@NamedQuery(name = "ExpenseDO.findAll", query = "SELECT e FROM ExpenseDO e"),
		@NamedQuery(name = "ExpenseDO.findbyId", query = "SELECT e FROM ExpenseDO e where e.id =:expenseid"),
		@NamedQuery(name = "ExpenseDO.findbysteddate", query = "SELECT e FROM ExpenseDO e where e.expdate BETWEEN :stdate AND :eddate"),
		@NamedQuery(name = "ExpenseDO.findbysteddatebyorder", query = "SELECT e FROM ExpenseDO e where e.expdate BETWEEN :stdate AND :eddate order by e.expdate"),
		@NamedQuery(name = "ExpenseDO.findbyType", query = "SELECT e FROM ExpenseDO e where e.category =:type")

})
public class ExpenseDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "ExpenseDO.findAll";

	public static final String FIND_BY_ID = "ExpenseDO.findbyId";
	
	public static final String FIND_BY_TYPE = "ExpenseDO.findbyType";
	
	public static final String FIND_BY_ST_ET_DATE = "ExpenseDO.findbysteddate";
	
	public static final String FIND_BY_ST_ET_DATE_ORDER_BY = "ExpenseDO.findbysteddatebyorder";
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "expense")
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date expdate;
	
	private String category;
	
	private String description;
	
	private String billno;
	
	private char modeofpay;
	
	private String cardno;
	
	private String bankname;
	
	private Double amount;
	
	private Long exptypeid;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	private String updatedby;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getExpdate() {
		return expdate;
	}

	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBillno() {
		return billno;
	}

	public void setBillno(String billno) {
		this.billno = billno;
	}

	public char getModeofpay() {
		return modeofpay;
	}

	public void setModeofpay(char modeofpay) {
		this.modeofpay = modeofpay;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Long getExptypeid() {
		return exptypeid;
	}

	public void setExptypeid(Long exptypeid) {
		this.exptypeid = exptypeid;
	}

	public Date getUpdatedon() {
		return updatedon;
	}

	public void setUpdatedon(Date updatedon) {
		this.updatedon = updatedon;
	}

	public String getUpdatedby() {
		return updatedby;
	}

	public void setUpdatedby(String updatedby) {
		this.updatedby = updatedby;
	}

}
