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
@Table(name = "project")
@TableGenerator(name ="project", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "ProjectDO.findAll", query = "SELECT u FROM ProjectDO u"),
		@NamedQuery(name = "ProjectDO.findbyId", query = "SELECT u FROM ProjectDO u where u.id =:id"),
		@NamedQuery(name = "ProjectDO.customerId", query = "SELECT u FROM ProjectDO u where u.customerid =:customerid and u.status=:status"),
		@NamedQuery(name = "ProjectDO.status", query = "SELECT u FROM ProjectDO u where u.status =:status")
		
		})
public class ProjectDO implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "ProjectDO.findAll";
	public static final String FIND_BY_ID = "ProjectDO.findbyId";
	public static final String FIND_BY_CUSTOMER_ID = "ProjectDO.customerId";
	public static final String ACTIVE_PROJECT = "ProjectDO.status";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "project")
	private Long id;

	private Long customerid;

	private String name;

	private String dispname;
	
	private String projectcode;

	private String description;

	private String type;

	private char status;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date startdate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date enddate;

	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDispname() {
		return dispname;
	}

	public void setDispname(String dispname) {
		this.dispname = dispname;
	}

	public String getProjectcode() {
		return projectcode;
	}

	public void setProjectcode(String projectcode) {
		this.projectcode = projectcode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
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
