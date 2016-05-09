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
@Table(name = "assettype")
@TableGenerator(name ="assettype", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "AssetTypeDO.findAll", query = "SELECT c FROM AssetTypeDO c"),
	@NamedQuery(name = "AssetTypeDO.findById", query = "SELECT c FROM AssetTypeDO c where c.id =:assetid") })

public class AssetTypeDO implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "AssetTypeDO.findAll";
	public static final String FIND_BY_ID = "AssetTypeDO.findById";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "assettype")
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

