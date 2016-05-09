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
@Table(name = "emplanguageknown")
@TableGenerator(name ="emplanguageknown", initialValue =100101, allocationSize =1)
@NamedQueries({
		@NamedQuery(name = "EmpLanguageKnownDO.findAll", query = "SELECT ed FROM EmpLanguageKnownDO ed"),
		@NamedQuery(name = "EmpLanguageKnownDO.findbyId", query = "SELECT ed FROM EmpLanguageKnownDO ed where ed.id =:id"),
		@NamedQuery(name = "EmpLanguageKnownDO.findbyEmpId", query = "SELECT ed FROM EmpLanguageKnownDO ed where ed.empid =:empid")
})
public class EmpLanguageKnownDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "EmpLanguageKnownDO.findAll";

	public static final String FIND_BY_ID = "EmpLanguageKnownDO.findbyId";
	
	public static final String FIND_BY_EMP_ID = "EmpLanguageKnownDO.findbyEmpId";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "emplanguageknown")
	private Long id;
	
	private Long empid;
	
	private String languagename;

	private char languageread;

	private char languagewrite;
	
	private char languagespeak;
	
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

	public String getLanguagename() {
		return languagename;
	}

	public void setLanguagename(String languagename) {
		this.languagename = languagename;
	}

	public char getLanguageread() {
		return languageread;
	}

	public void setLanguageread(char languageread) {
		this.languageread = languageread;
	}

	public char getLanguagewrite() {
		return languagewrite;
	}

	public void setLanguagewrite(char languagewrite) {
		this.languagewrite = languagewrite;
	}

	public char getLanguagespeak() {
		return languagespeak;
	}

	public void setLanguagespeak(char languagespeak) {
		this.languagespeak = languagespeak;
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
