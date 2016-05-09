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
@Table(name = "empsports")
@TableGenerator(name ="empsports", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpSportsDO.findAll", query = "SELECT ed FROM EmpSportsDO ed"),
		@NamedQuery(name = "EmpSportsDO.findbyId", query = "SELECT ed FROM EmpSportsDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpSportsDO.findbyEmpId", query = "SELECT ed FROM EmpSportsDO ed where ed.empid =:empid")
})
public class EmpSportsDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpSportsDO.findAll";

	public static final String FIND_BY_ID = "EmpSportsDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpSportsDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empsports")
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
