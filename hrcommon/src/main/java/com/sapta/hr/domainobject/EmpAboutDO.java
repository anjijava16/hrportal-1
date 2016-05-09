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
@Table(name = "empabout")
@TableGenerator(name ="empabout", initialValue =100101, allocationSize =1)
@NamedQueries({
	
		@NamedQuery(name = "EmpAboutDO.findAll", query = "SELECT e FROM EmpAboutDO e"),
		@NamedQuery(name = "EmpAboutDO.findbyId", query = "SELECT e FROM EmpAboutDO e where e.id =:empid"),
		@NamedQuery(name = "EmpAboutDO.findbyEmpId", query = "SELECT ed FROM EmpAboutDO ed where ed.empid =:empid")

})
public class EmpAboutDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpAboutDO.findAll";

	public static final String FIND_BY_ID = "EmpAboutDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpAboutDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empabout")
	private Long id;

	private Long empid;

	private String strength;

	private String weakness;
	
	private String totalexp;
	
	private String relexp;
	
	private Long presentsalary;
	
	private Long expectedsalary;

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

	public String getStrength() {
		return strength;
	}

	public void setStrength(String strength) {
		this.strength = strength;
	}

	public String getWeakness() {
		return weakness;
	}

	public void setWeakness(String weakness) {
		this.weakness = weakness;
	}

	public String getTotalexp() {
		return totalexp;
	}

	public void setTotalexp(String totalexp) {
		this.totalexp = totalexp;
	}

	public String getRelexp() {
		return relexp;
	}

	public void setRelexp(String relexp) {
		this.relexp = relexp;
	}

	public Long getPresentsalary() {
		return presentsalary;
	}

	public void setPresentsalary(Long presentsalary) {
		this.presentsalary = presentsalary;
	}

	public Long getExpectedsalary() {
		return expectedsalary;
	}

	public void setExpectedsalary(Long expectedsalary) {
		this.expectedsalary = expectedsalary;
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
