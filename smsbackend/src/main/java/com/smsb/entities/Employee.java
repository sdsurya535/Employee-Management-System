package com.smsb.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long eid;
	@NotBlank(message = "Name is required")
	private String name;
	@NotBlank(message = "email is required")
	@Email(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "Invalid Email Address")
	private String email;
	@NotBlank(message = "phone is required")
	@Pattern(regexp="(^$|[0-9]{10})", message = "number is invalid")
	private String phone;
	@NotBlank(message = "job title is required")
	private String jobTitle;
	@NotBlank(message = "department is required")
	private String department;

	@ManyToOne
	@JsonIgnore
	private User user;

	public Employee(Long eid, String name, String email, String phone, String jobTitle, String department, User user) {
		super();
		this.eid = eid;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.jobTitle = jobTitle;
		this.department = department;
		this.user = user;
	}

	public Employee() {
		super();

	}

	public Long getEid() {
		return eid;
	}

	public void setEid(Long eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
