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
@Table(name = "empfamilbackground")
@TableGenerator(name ="empfamilbackground", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpFamilyBackgroundDO.findAll", query = "SELECT ed FROM EmpFamilyBackgroundDO ed"),
		@NamedQuery(name = "EmpFamilyBackgroundDO.findbyId", query = "SELECT ed FROM EmpFamilyBackgroundDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpFamilyBackgroundDO.findbyEmpId", query = "SELECT ed FROM EmpFamilyBackgroundDO ed where ed.empid =:empid")
})
public class EmpFamilyBackgroundDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpFamilyBackgroundDO.findAll";

	public static final String FIND_BY_ID = "EmpFamilyBackgroundDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpFamilyBackgroundDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empfamilbackground")
	private Long id;
	
	private Long empid;
	
	private String relationship;
	
	private String name;
	
	private Integer age;
	
	private String education;
	
	private String occupation;

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

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
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
