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
@Table(name = "vendor")
@TableGenerator(name ="vendor", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "VendorDO.findAll", query = "SELECT u FROM VendorDO u"),
		@NamedQuery(name = "VendorDO.findbyId", query = "SELECT u FROM VendorDO u where u.id =:id"),
		@NamedQuery(name = "VendorDO.findbyIdName", query = "SELECT u FROM VendorDO u where u.name =:name")
})

public class VendorDO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String FIND_ALL = "VendorDO.findAll";
	
	public static final String FIND_BY_ID = "VendorDO.findbyId";
	
	public static final String FIND_BY_NAME = "VendorDO.findbyIdName";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "vendor")
	private Long id;
	
	private String name;
	
	private String vendorcode;
	
	private String address;
	
	private String phoneno;
	
	private String mobileno;
	
	private String email;
	
	private String pincode;
	
	private String fax;
	
	private String updatedby;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;
	
	public VendorDO() {

	}

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

	public String getVendorcode() {
		return vendorcode;
	}

	public void setVendorcode(String vendorcode) {
		this.vendorcode = vendorcode;
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