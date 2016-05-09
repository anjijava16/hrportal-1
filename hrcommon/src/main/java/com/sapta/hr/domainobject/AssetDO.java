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
@Table(name = "asset")
@TableGenerator(name ="asset", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "AssetDO.findAll", query = "SELECT c FROM AssetDO c"),
	@NamedQuery(name = "AssetDO.findById", query = "SELECT c FROM AssetDO c where c.id =:assetid"), 
	@NamedQuery(name = "AssetDO.findbysteddate", query = "SELECT e FROM AssetDO e where e.dateofpurchased BETWEEN :stdate AND :eddate"),
	@NamedQuery(name = "AssetDO.findbysteddatebyorder", query = "SELECT e FROM AssetDO e where e.dateofpurchased BETWEEN :stdate AND :eddate order by  e.dateofpurchased ")
	})

public class AssetDO implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "AssetDO.findAll";
	public static final String FIND_BY_ID = "AssetDO.findById";
	public static final String FIND_BY_ST_ET_DATE = "AssetDO.findbysteddate";
	public static final String FIND_BY_ST_ET_DATE_ORDER_BY = "AssetDO.findbysteddatebyorder";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "asset")
	private Long id;
	
	private String name;
	
	private Long assettypeid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dateofpurchased;
	
	private Long vendorid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date warrantyofexpired;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date guranteeofexpired;
	
	private Double price;
	
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

	public Long getAssettypeid() {
		return assettypeid;
	}

	public void setAssettypeid(Long assettypeid) {
		this.assettypeid = assettypeid;
	}

	public Date getDateofpurchased() {
		return dateofpurchased;
	}

	public void setDateofpurchased(Date dateofpurchased) {
		this.dateofpurchased = dateofpurchased;
	}

	public Long getVendorid() {
		return vendorid;
	}

	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
	}

	public Date getWarrantyofexpired() {
		return warrantyofexpired;
	}

	public void setWarrantyofexpired(Date warrantyofexpired) {
		this.warrantyofexpired = warrantyofexpired;
	}

	public Date getGuranteeofexpired() {
		return guranteeofexpired;
	}

	public void setGuranteeofexpired(Date guranteeofexpired) {
		this.guranteeofexpired = guranteeofexpired;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
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

