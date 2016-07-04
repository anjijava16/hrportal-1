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
@Table(name = "empaccdetail")
@TableGenerator(name ="empaccdetail", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpAccDetailDO.findAll", query = "SELECT e FROM EmpAccDetailDO e"),
		@NamedQuery(name = "EmpAccDetailDO.findbyId", query = "SELECT e FROM EmpAccDetailDO e where e.id =:id"),
		@NamedQuery(name = "EmpAccDetailDO.findbyEmpId", query = "SELECT a FROM EmpAccDetailDO  a where a.empid =:empid")

})
public class EmpAccDetailDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "EmpAccDetailDO.findAll";

	public static final String FIND_BY_ID = "EmpAccDetailDO.findbyId";
	
	public static final String FIND_BY_EMPID = "EmpAccDetailDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empaccdetail")
	private Long id;

	private Long empid;

	private String bankname;
	
	private String accountno;

	private String branch;

	private String address;
	
	private String city;
	
	private String state;
	
	private Long pincode;
	
	private String ifsc;

	private String updatedby;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;
	
	

	public EmpAccDetailDO() {
	}

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

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getPincode() {
		return pincode;
	}

	public void setPincode(Long pincode) {
		this.pincode = pincode;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
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
	
	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
}
