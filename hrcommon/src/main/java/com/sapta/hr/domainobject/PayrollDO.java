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
@Table(name = "payroll")
@TableGenerator(name ="payroll", initialValue =100101, allocationSize =1)
@NamedQueries({
	@NamedQuery(name = "PayrollDO.findAll", query = "SELECT e FROM PayrollDO e"),
	@NamedQuery(name = "PayrollDO.findbyEmpId", query = "SELECT e FROM PayrollDO e where e.empid =:empid"),
	@NamedQuery(name = "PayrollDO.findbypayrollmonthdate", query = "SELECT e FROM PayrollDO e where e.payrollmonth =:payrollmonthdate"),
	@NamedQuery(name = "PayrollDO.findbysteddate", query = "SELECT e FROM PayrollDO e WHERE e.payrollmonth BETWEEN :stdate AND :eddate"),
	@NamedQuery(name = "PayrollDO.findbyempiddate", query = "SELECT e FROM PayrollDO e WHERE e.empid =:empid AND e.payrollmonth =:payrollmonthdate")
	
})
public class PayrollDO implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String FIND_ALL = "PayrollDO.findAll";

	public static final String FIND_BY_ID = "PayrollDO.findbyEmpId";
	
	public static final String FIND_BY_PAYROLLMONTH_DATE = "PayrollDO.findbypayrollmonthdate";
	
	public static final String FIND_BY_ST_ET_DATE = "PayrollDO.findbysteddate";
	
	public static final String FIND_BY_EMPID_DATE = "PayrollDO.findbyempiddate";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "payroll")
	private Long id;
	
	private Long empid;
	
	private Double basic;
	
	private Double hra;
	
	private Double personal;
	
	private Double conveyance;
	
	private Double pt;
	
	private Double tds;
	
	private Double pf;
	
	private Double empmonthlyctc;
	
	private Long dayspayable;
	
	private Double totalearnings;
	
	private Double totaldeduction;
	
	private Double netpayableamount;
	
	private char payrolltype;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date paidon;
	
	@Temporal(TemporalType.DATE)
	private Date payrollmonth;
	
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

	public Double getBasic() {
		return basic;
	}

	public void setBasic(Double basic) {
		this.basic = basic;
	}

	public Double getHra() {
		return hra;
	}

	public void setHra(Double hra) {
		this.hra = hra;
	}

	public Double getPersonal() {
		return personal;
	}

	public void setPersonal(Double personal) {
		this.personal = personal;
	}

	public Double getConveyance() {
		return conveyance;
	}

	public void setConveyance(Double conveyance) {
		this.conveyance = conveyance;
	}

	public Double getPt() {
		return pt;
	}

	public void setPt(Double pt) {
		this.pt = pt;
	}

	public Double getTds() {
		return tds;
	}

	public void setTds(Double tds) {
		this.tds = tds;
	}
	
	
	public Double getPf() {
		return pf;
	}

	public void setPf(Double pf) {
		this.pf = pf;
	}

	public Double getEmpmonthlyctc() {
		return empmonthlyctc;
	}

	public void setEmpmonthlyctc(Double empmonthlyctc) {
		this.empmonthlyctc = empmonthlyctc;
	}

	public Long getDayspayable() {
		return dayspayable;
	}

	public void setDayspayable(Long dayspayable) {
		this.dayspayable = dayspayable;
	}

	public Double getTotalearnings() {
		return totalearnings;
	}

	public void setTotalearnings(Double totalearnings) {
		this.totalearnings = totalearnings;
	}

	public Double getTotaldeduction() {
		return totaldeduction;
	}

	public void setTotaldeduction(Double totaldeduction) {
		this.totaldeduction = totaldeduction;
	}

	public Double getNetpayableamount() {
		return netpayableamount;
	}

	public void setNetpayableamount(Double netpayableamount) {
		this.netpayableamount = netpayableamount;
	}

	public char getPayrolltype() {
		return payrolltype;
	}

	public void setPayrolltype(char payrolltype) {
		this.payrolltype = payrolltype;
	}

	public Date getPayrollmonth() {
		return payrollmonth;
	}

	public void setPayrollmonth(Date payrollmonth) {
		this.payrollmonth = payrollmonth;
	}
	
	public Date getPaidon() {
		return paidon;
	}

	public void setPaidon(Date paidon) {
		this.paidon = paidon;
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

