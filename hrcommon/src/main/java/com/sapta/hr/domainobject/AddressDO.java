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
@Table(name = "address")
@TableGenerator(name ="address", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "AddressDO.findAll", query = "SELECT a FROM AddressDO  a"),
		@NamedQuery(name = "AddressDO.findbyId", query = "SELECT a FROM AddressDO  a where a.id =:id"),
		@NamedQuery(name = "AddressDO.findbyEmpId", query = "SELECT a FROM AddressDO  a where a.empid =:empid")
})

public class AddressDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "AddressDO.findAll";

	public static final String FIND_BY_ID = "AddressDO.findbyId";
	
	public static final String FIND_BY_EMPID = "AddressDO.findbyEmpId";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY,  generator = "address")
	private Long id;

	private Long empid;
	
	private char type;
	
	private String street;
	
	private String city;
	
	private String state;
	 
	private String country; 
	
	private Long pin;
	
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

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Long getPin() {
		return pin;
	}

	public void setPin(Long pin) {
		this.pin = pin;
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
