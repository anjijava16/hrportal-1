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
@Table(name = "empreferences")
@TableGenerator(name ="empreferences", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpReferencesDO.findAll", query = "SELECT ed FROM EmpReferencesDO ed"),
		@NamedQuery(name = "EmpReferencesDO.findbyId", query = "SELECT ed FROM EmpReferencesDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpReferencesDO.findbyEmpId", query = "SELECT ed FROM EmpReferencesDO ed where ed.empid =:empid")
})
public class EmpReferencesDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpReferencesDO.findAll";

	public static final String FIND_BY_ID = "EmpReferencesDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpReferencesDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empreferences")
	private Long id;
	
	private Long empid;
	
	private String name;
	
	private String address;
	
	private Long phone;

	private Long mobile;

	private String skill;
	
	private String designation;
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
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
