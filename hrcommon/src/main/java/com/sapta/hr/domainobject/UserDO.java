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
@Table(name="user")
@TableGenerator(name ="user", initialValue =100101, allocationSize =1)
@NamedQueries({
    @NamedQuery(name = "UserDO.findAll", query = "SELECT u FROM UserDO u"),
    @NamedQuery(name = "UserDO.findById", query = "SELECT u FROM UserDO u where u.id =:userid"),
    @NamedQuery(name = "UserDO.findByName", query = "SELECT u FROM UserDO u where u.username =:username and u.password =:password"),
    @NamedQuery(name = "UserDO.findByUserName", query = "SELECT u FROM UserDO u where u.username =:username")
})
public class UserDO implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "UserDO.findAll";
	
	public static final String FIND_BY_ID = "UserDO.findById";
	
	public static final String FIND_BY_NAME = "UserDO.findByName";
	
	public static final String FIND_BY_USER_NAME = "UserDO.findByUserName";
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY, generator = "user")
	private Long id;
	
	private String username;

	private String groupname;

	private String password;
	
	private String updatedby;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedon;
	
	public UserDO() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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