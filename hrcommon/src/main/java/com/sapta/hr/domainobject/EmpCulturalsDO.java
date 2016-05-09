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
@Table(name = "empculturals")
@TableGenerator(name ="empculturals", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpCulturalsDO.findAll", query = "SELECT ed FROM EmpCulturalsDO ed"),
		@NamedQuery(name = "EmpCulturalsDO.findbyId", query = "SELECT ed FROM EmpCulturalsDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpCulturalsDO.findbyEmpId", query = "SELECT ed FROM EmpCulturalsDO ed where ed.empid =:empid")
})
public class EmpCulturalsDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpCulturalsDO.findAll";

	public static final String FIND_BY_ID = "EmpCulturalsDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpCulturalsDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empculturals")
	private Long id;
	
	private Long empid;
	
	private String eventname;

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

	public String getEventname() {
		return eventname;
	}

	public void setEventname(String eventname) {
		this.eventname = eventname;
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
