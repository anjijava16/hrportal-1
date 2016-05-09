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
@Table(name = "empachievements")
@TableGenerator(name ="empachievements", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpAchievementsDO.findAll", query = "SELECT ed FROM EmpAchievementsDO ed"),
		@NamedQuery(name = "EmpAchievementsDO.findbyId", query = "SELECT ed FROM EmpAchievementsDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpAchievementsDO.findbyEmpId", query = "SELECT ed FROM EmpAchievementsDO ed where ed.empid =:empid")
})
public class EmpAchievementsDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpAchievementsDO.findAll";

	public static final String FIND_BY_ID = "EmpAchievementsDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpAchievementsDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empachievements")
	private Long id;
	
	private Long empid;
	
	private String companyname;

	private String achievement;

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

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
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
