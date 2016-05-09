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
@Table(name = "empskillset")
@TableGenerator(name ="empskillset", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpSkillSetDO.findAll", query = "SELECT ed FROM EmpSkillSetDO ed"),
		@NamedQuery(name = "EmpSkillSetDO.findbyId", query = "SELECT ed FROM EmpSkillSetDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpSkillSetDO.findbyEmpId", query = "SELECT ed FROM EmpSkillSetDO ed where ed.empid =:empid")
})
public class EmpSkillSetDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpSkillSetDO.findAll";

	public static final String FIND_BY_ID = "EmpSkillSetDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpSkillSetDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empskillset")
	private Long id;
	
	private Long empid;
	
	private String name;

	private char level;

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

	public char getLevel() {
		return level;
	}

	public void setLevel(char level) {
		this.level = level;
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
