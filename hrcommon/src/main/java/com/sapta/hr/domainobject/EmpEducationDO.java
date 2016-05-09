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
@Table(name = "empeducation")
@TableGenerator(name ="empeducation", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpEducationDO.findAll", query = "SELECT ed FROM EmpEducationDO ed"),
		@NamedQuery(name = "EmpEducationDO.findbyId", query = "SELECT ed FROM EmpEducationDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpEducationDO.findbyEmpId", query = "SELECT ed FROM EmpEducationDO ed where ed.empid =:empid")
})
public class EmpEducationDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpEducationDO.findAll";

	public static final String FIND_BY_ID = "EmpEducationDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpEducationDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empeducation")
	private Long id;
	
	private Long empid;
	
	private String institutionname;

	private String degree;
	
	private String specialization;

	private String rankscholarship;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date edufrom;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date eduto;

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

	public String getInstitutionname() {
		return institutionname;
	}

	public void setInstitutionname(String institutionname) {
		this.institutionname = institutionname;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getRankscholarship() {
		return rankscholarship;
	}

	public void setRankscholarship(String rankscholarship) {
		this.rankscholarship = rankscholarship;
	}

	public Date getEdufrom() {
		return edufrom;
	}

	public void setEdufrom(Date edufrom) {
		this.edufrom = edufrom;
	}

	public Date getEduto() {
		return eduto;
	}

	public void setEduto(Date eduto) {
		this.eduto = eduto;
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
