package com.smsb.dao;

import java.util.List;

import com.smsb.entities.Employee;

public interface EmployeeDao {

	boolean addEmployee(Employee employee);

	List<Employee> viewAllEmployees();

	boolean updatEmployee(Employee employee);

	Employee getEmployeeById(Long eid);

	void deleteEmployee(Long eid);
	
	List<Employee> getEmployeesByUser(Long uid);
	
	
}
