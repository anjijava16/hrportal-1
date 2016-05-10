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
@Table(name = "empassignment")
@TableGenerator(name ="empassignment", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpAssignmentDO.findAll", query = "SELECT e FROM EmpAssignmentDO e"),
		@NamedQuery(name = "EmpAssignmentDO.findbyId", query = "SELECT e FROM EmpAssignmentDO e where e.id =:empid"),
		@NamedQuery(name = "EmpAssignmentDO.findbyEmpId", query = "SELECT e FROM EmpAssignmentDO e where e.empid =:empid")

})
public class EmpAssignmentDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "EmpAssignmentDO.findAll";

	public static final String FIND_BY_ID = "EmpAssignmentDO.findbyId";
	public static final String FIND_BY_EMP_ID = "EmpAssignmentDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "empassignment")
	private Long id;

	private Long empid;

	private Long projectid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date startdate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date enddate;

	private String comments;

	private char status;
	
	private String po_wo;

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

	public Long getProjectid() {
		return projectid;
	}

	public void setProjectid(Long projectid) {
		this.projectid = projectid;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
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
	public String getPo_wo() {
		return po_wo;
	}
	
	public void setPo_wo(String po_wo) {
		this.po_wo = po_wo;
	}
	
}
