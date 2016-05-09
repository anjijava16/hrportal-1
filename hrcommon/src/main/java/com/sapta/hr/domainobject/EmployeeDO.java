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
@Table(name = "employee")
@TableGenerator(name ="employee", initialValue =100101, allocationSize =1)
@NamedQueries({
	
		@NamedQuery(name = "EmployeeDO.findAll", query = "SELECT e FROM EmployeeDO e"),
		@NamedQuery(name = "EmployeeDO.findbyId", query = "SELECT e FROM EmployeeDO e where e.id =:empid"),
		@NamedQuery(name = "EmployeeDO.findAllActiveEmployee", query = "SELECT e FROM EmployeeDO e where e.status =:status")

})
public class EmployeeDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmployeeDO.findAll";
	
	public static final String FIND_ALL_ACTIVE_EMPLOYEE = "EmployeeDO.findAllActiveEmployee";
	

	public static final String FIND_BY_ID = "EmployeeDO.findbyId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "employee")
	private Long id;

	private String fname;

	private String mname;

	private String lname;

	private String email;
	
	private char status;
	
	private Long mobileno;

	private Long phone;

	private String pan;
	
	private String aadharno;
	
	private String pfno;
	
	private String passport;
	
	private String pplaceofissued;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date pvalidupto;
	
	private String personalemailid;
	
	private String dlno;

	private String updatedby;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;


	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Long getMobileno() {
		return mobileno;
	}

	public void setMobileno(Long mobileno) {
		this.mobileno = mobileno;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getAadharno() {
		return aadharno;
	}

	public void setAadharno(String aadharno) {
		this.aadharno = aadharno;
	}

	public String getPfno() {
		return pfno;
	}

	public void setPfno(String pfno) {
		this.pfno = pfno;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getPplaceofissued() {
		return pplaceofissued;
	}

	public void setPplaceofissued(String pplaceofissued) {
		this.pplaceofissued = pplaceofissued;
	}

	public Date getPvalidupto() {
		return pvalidupto;
	}

	public void setPvalidupto(Date pvalidupto) {
		this.pvalidupto = pvalidupto;
	}

	public String getDlno() {
		return dlno;
	}

	public void setDlno(String dlno) {
		this.dlno = dlno;
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
	
	public String getPersonalemailid() {
		return personalemailid;
	}

	public void setPersonalemailid(String personalemailid) {
		this.personalemailid = personalemailid;
	}

}
