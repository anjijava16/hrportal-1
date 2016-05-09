package com.sapta.hr.domainobject;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
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
@Table(name = "customer")
@TableGenerator(name ="customer", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "CustomerDO.findAll", query = "SELECT u FROM CustomerDO u"),
		@NamedQuery(name = "CustomerDO.findbyId", query = "SELECT u FROM CustomerDO u where u.id =:id")
})

public class CustomerDO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "CustomerDO.findAll";
	
	public static final String FIND_BY_ID = "CustomerDO.findbyId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "customer")
	private Long id;
	
	private String name;
	
	private String customercode;
	
	private String address;
	
	private String phoneno;
	
	private String mobileno;
	
	@Column(nullable = true)
	private String email;
	
	private String pincode;
	
	private String fax;
	
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

	public String getCustomercode() {
		return customercode;
	}

	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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
