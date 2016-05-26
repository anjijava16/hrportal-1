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
@Table(name = "commonconstants")
@TableGenerator(name ="commonconstants", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "CommonConstantsDO.findAll", query = "SELECT e FROM CommonConstantsDO e")
})
public class CommonConstantsDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "CommonConstantsDO.findAll";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "commonconstants")
	private Long id;
	
	private Float personalallowance;
	
	private Float conveyanceallowance;
	
	private String updatedby;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Float getPersonalallowance() {
		return personalallowance;
	}

	public void setPersonalallowance(Float personalallowance) {
		this.personalallowance = personalallowance;
	}

	public Float getConveyanceallowance() {
		return conveyanceallowance;
	}

	public void setConveyanceallowance(Float conveyanceallowance) {
		this.conveyanceallowance = conveyanceallowance;
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

