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
@Table(name = "saptaprofile")
@TableGenerator(name ="saptaprofile", initialValue =100101, allocationSize =1)
@NamedQueries({@NamedQuery(name = "SaptaProfileDO.findAll", query = "SELECT e FROM SaptaProfileDO e")})

public class SaptaProfileDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "SaptaProfileDO.findAll";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "saptaprofile")
	private Long id;

	private String companyname;
	
	private String city;
	
	private Long pincode;
	
	private String State;
	
	private String country;
	
	private Long officephno;
	
	private String emailid;
	
	private String address;
	
	private String tan;
	
	private String pan;
	
	private String cin;
	
	private String st;
	
	private String accntname;
	
	private Long accntnum;
	
	private String bankname;
	
	private String bankbranch;
	
	private String ifsccode;
	
	private String swiftcode;
	
	private String branchaddress;
	
	private String website;
	
	private Long mobilenum;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	private String updatedby;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Long getPincode() {
		return pincode;
	}

	public void setPincode(Long pincode) {
		this.pincode = pincode;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Long getOfficephno() {
		return officephno;
	}

	public void setOfficephno(Long officephno) {
		this.officephno = officephno;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTan() {
		return tan;
	}

	public void setTan(String tan) {
		this.tan = tan;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getSt() {
		return st;
	}

	public void setSt(String st) {
		this.st = st;
	}
	
	public String getAccntname() {
		return accntname;
	}

	public void setAccntname(String accntname) {
		this.accntname = accntname;
	}

	public Long getAccntnum() {
		return accntnum;
	}

	public void setAccntnum(Long accntnum) {
		this.accntnum = accntnum;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getBankbranch() {
		return bankbranch;
	}

	public void setBankbranch(String bankbranch) {
		this.bankbranch = bankbranch;
	}

	public String getIfsccode() {
		return ifsccode;
	}

	public void setIfsccode(String ifsccode) {
		this.ifsccode = ifsccode;
	}

	public String getSwiftcode() {
		return swiftcode;
	}

	public void setSwiftcode(String swiftcode) {
		this.swiftcode = swiftcode;
	}

	public String getBranchaddress() {
		return branchaddress;
	}

	public void setBranchaddress(String branchaddress) {
		this.branchaddress = branchaddress;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Long getMobilenum() {
		return mobilenum;
	}

	public void setMobilenum(Long mobilenum) {
		this.mobilenum = mobilenum;
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
