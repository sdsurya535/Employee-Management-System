package com.smsfrontend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.smsb.dao.EmployeeDao;
import com.smsb.dao.UserDao;
import com.smsb.entities.Employee;
import com.smsb.entities.User;
import com.smsb.helper.Message;

@Controller
public class EmpController {
	@Autowired
	private EmployeeDao employeeDao;

	@Autowired
	private UserDao userDao;

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {

			session.removeAttribute("user");
			session.setAttribute("msg", new Message("Logout Successfully", "alert-success"));

		}
		return "redirect:/login";
	}

	@GetMapping("/addEmp")
	public String addEmp(Model model) {
		model.addAttribute("employee", new Employee());

		model.addAttribute("title", "Add Employee");

		return "addemp";
	}

	@PostMapping("/addedemp")
	public String empAdded(@Valid @ModelAttribute("employee") Employee employee, BindingResult result,
			HttpSession session, HttpServletRequest request, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("nameClass", result.hasFieldErrors("name") ? "form-control is-invalid" : "form-control");
			model.addAttribute("emailClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			model.addAttribute("phoneClass",
					result.hasFieldErrors("phone") ? "form-control is-invalid" : "form-control");
			model.addAttribute("jobClass",
					result.hasFieldErrors("jobTitle") ? "form-control is-invalid" : "form-control");
			model.addAttribute("departmentClass",
					result.hasFieldErrors("department") ? "form-control is-invalid" : "form-control");

			return "addemp";
		}
		session = request.getSession();
		User user = (User) session.getAttribute("user");
		employee.setUser(user);
		boolean addEmployee = employeeDao.addEmployee(employee);

		if (addEmployee) {
			session.setAttribute("msg", new Message("Employee Added Successfully", "alert-success"));
			return "redirect:/addEmp";
		} else {
			session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
			return "redirect:/addEmp";
		}

	}

	@GetMapping("/viewEmp/{id}")
	public String viewEmp(@PathVariable("id") Long id, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Employee> viewAllEmployees = employeeDao.getEmployeesByUser(id);
		if (user.getId() == id) {
			model.addAttribute("emp", viewAllEmployees);
		}

		model.addAttribute("title", "View Employees");

		return "viewemp";
	}

	@GetMapping("/deleteEmp/{eid}")
	public String deleteEmp(@PathVariable("eid") Long eid) {

		employeeDao.deleteEmployee(eid);

		User user = (User) session.getAttribute("user");
		Long idLong = user.getId();

		return "redirect:/viewEmp/" + idLong;

	}

	@GetMapping("/updateEmp/{eid}")
	public String updateEmp(@PathVariable("eid") Long eid, Model model) {

		Employee employeeById = employeeDao.getEmployeeById(eid);

		model.addAttribute("employee", employeeById);
		model.addAttribute("title", "Update Employee");

		return "updateEmp";

	}

	@PostMapping("/updated")
	public String updatedEmp(@Valid @ModelAttribute("employee") Employee employee, BindingResult result, Model model,
			HttpServletRequest request, HttpSession session) {

		if (result.hasErrors()) {
			model.addAttribute("nameClass", result.hasFieldErrors("name") ? "form-control is-invalid" : "form-control");
			model.addAttribute("emailClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			model.addAttribute("phoneClass",
					result.hasFieldErrors("phone") ? "form-control is-invalid" : "form-control");
			model.addAttribute("jobClass",
					result.hasFieldErrors("jobTitle") ? "form-control is-invalid" : "form-control");
			model.addAttribute("departmentClass",
					result.hasFieldErrors("department") ? "form-control is-invalid" : "form-control");

			return "updateEmp";
		}

		session = request.getSession();
		User user = (User) session.getAttribute("user");
		employee.setUser(user);
		boolean updatEmployee = employeeDao.updatEmployee(employee);

		if (updatEmployee) {
			session.setAttribute("msg", new Message("Employee Updated Successfully", "alert-success"));
			return "redirect:/addEmp";
		} else {
			session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
			return "redirect:/addEmp";
		}
	}

	@GetMapping("/oneemp/{eid}")
	public String viewOneEmp(@PathVariable("eid") Long eid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Employee employeeById = employeeDao.getEmployeeById(eid);

		if (user.getId() == employeeById.getUser().getId()) {
			model.addAttribute("employee", employeeById);
		}

		model.addAttribute("title", "One Emp");

		return "oneemp";

	}
}
