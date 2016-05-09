package testing;

import java.util.List;

import javax.persistence.EntityManager;

import com.sapta.hr.domainobject.EmployeeDO;
import com.sapta.hr.service.EmployeeService;

public class Testing {

	static EntityManager em = null;

	public static void main(String[] args) {

		/*EmployeeDO employee = new EmployeeDO();
		employee.setFname("eyrksdf");
		employee.setMname("fdhgfth");
		employee.setLname("hdhfgdfsav");
		employee.setEmail("wfdhfghu@gmail.com");
		employee.setMobileno(3455756);
		employee.setLastupdatedby("gasghndhi");
		employee.setStatus('i');
		employee.setPassport("tg");
		employee.setPan("546gh5t");
		employee.setLastupdatedon(new Date());
		new EmployeeService().persistEmployee(employee);*/
try{
		List<EmployeeDO> employee = new EmployeeService().retriveById(1);
		String email = ((EmployeeDO) employee).getEmail();
}catch(Exception e)
{
}

		// boolean status = new EmployeeService().deleteEmployeeById(1);
		/*
		 * *
		 * * *
		 */
		/*EmpAccDetailDO empaccdetail = new EmpAccDetailDO();
		empaccdetail.setLastupdatedby("get");
		empaccdetail.setLastupdatedon(new Date());
		empaccdetail.setBankname("bankname");
		empaccdetail.setBranch("branch");
		empaccdetail.setAccountno(788986);
		empaccdetail.setAddress("ess");
		empaccdetail.setCity("city");
		empaccdetail.setState("state");
		empaccdetail.setPincode(7576);
		empaccdetail.setIfsc("ifsc");
		empaccdetail.setEmpid(1);
		EmpAccDetailDO empacc = new EmpAccDetailService().persistEmpAccdetail(empaccdetail);*/
		
	}

}
