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
@Table(name = "empdetail")
@TableGenerator(name ="empdetail", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpDetailDO.findAll", query = "SELECT ed FROM EmpDetailDO ed"),
		@NamedQuery(name = "EmpDetailDO.findbyId", query = "SELECT ed FROM EmpDetailDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpDetailDO.findbyEmpId", query = "SELECT ed FROM EmpDetailDO ed where ed.empid =:empid")
})
public class EmpDetailDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpDetailDO.findAll";

	public static final String FIND_BY_ID = "EmpDetailDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpDetailDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empdetail")
	private Long id;
	
	private Long empid;
    
	@Temporal(TemporalType.TIMESTAMP)
	private Date dob;

	private Integer age;

	private char gender;
	
	private String postapplied;
	
	private String joininglocation;
	
	private String dept;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date jdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date rdate;

	private char marital;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date doa;
	
	private char possessvehicle;

	private String bloodgroup;
	
	private String emergencyno;
	
	private char illnessaccident;
	
	private String description;

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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getPostapplied() {
		return postapplied;
	}

	public void setPostapplied(String postapplied) {
		this.postapplied = postapplied;
	}

	public String getJoininglocation() {
		return joininglocation;
	}

	public void setJoininglocation(String joininglocation) {
		this.joininglocation = joininglocation;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public Date getJdate() {
		return jdate;
	}

	public void setJdate(Date jdate) {
		this.jdate = jdate;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public char getMarital() {
		return marital;
	}

	public void setMarital(char marital) {
		this.marital = marital;
	}

	public Date getDoa() {
		return doa;
	}

	public void setDoa(Date doa) {
		this.doa = doa;
	}

	public char getPossessvehicle() {
		return possessvehicle;
	}

	public void setPossessvehicle(char possessvehicle) {
		this.possessvehicle = possessvehicle;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getEmergencyno() {
		return emergencyno;
	}

	public void setEmergencyno(String emergencyno) {
		this.emergencyno = emergencyno;
	}

	public char getIllnessaccident() {
		return illnessaccident;
	}

	public void setIllnessaccident(char illnessaccident) {
		this.illnessaccident = illnessaccident;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
