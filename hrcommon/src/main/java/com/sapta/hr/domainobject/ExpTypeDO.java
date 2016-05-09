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
@Table(name = "exptype")
@TableGenerator(name ="exptype", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "ExpTypeDO.findAll", query = "SELECT c FROM ExpTypeDO c"),
	@NamedQuery(name = "ExpTypeDO.findById", query = "SELECT c FROM ExpTypeDO c where c.id =:expenseid") })

public class ExpTypeDO implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "ExpTypeDO.findAll";
	public static final String FIND_BY_ID = "ExpTypeDO.findById";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "exptype")
	private Long id;
	
	private String name;
	
	private String dispname;
	
	private String updatedby;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

