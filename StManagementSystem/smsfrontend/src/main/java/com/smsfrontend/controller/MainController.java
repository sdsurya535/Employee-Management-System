package com.smsfrontend.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smsb.dao.UserDao;
import com.smsb.entities.User;
import com.smsb.helper.Message;
import com.smsb.helper.PasswordHashing;

@Controller
public class MainController {

	@Autowired
	private UserDao userDao;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("title", "Home Page");
		return "index";
	}

	@RequestMapping("/about")
	public String about(Model model) {
		model.addAttribute("title", "About Page");
		return "about";
	}

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("title", "Signup");

		return "register";
	}

	@RequestMapping(value = "/registered", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,
			Model model) {

		if (result.hasErrors()) {
			model.addAttribute("firstNameClass",
					result.hasFieldErrors("firstName") ? "form-control is-invalid" : "form-control");
			model.addAttribute("emailClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			model.addAttribute("lastNameClass",
					result.hasFieldErrors("lastName") ? "form-control is-invalid" : "form-control");
			model.addAttribute("passwordClass",
					result.hasFieldErrors("password") ? "form-control is-invalid" : "form-control");
			return "register";
		} else {
			PasswordHashing hashing = new PasswordHashing();
			user.setPassword(hashing.doHashing(user.getPassword()));
			boolean registerUser = userDao.registerUser(user);

			if (registerUser) {

				session.setAttribute("msg", new Message("Registered Successfully", "alert-success"));

				return "redirect:/register";

			} else {
				session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
				return "redirect:/register";
			}
		}

	}

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("title", "Login");
		return "login";
	}

	@RequestMapping("/contact")
	public String contact(Model model) {

		model.addAttribute("title", "Contact Us");

		return "contact";
	}

	@RequestMapping("/dashboard")
	public String dashBoard(Model model) {
		model.addAttribute("title", "Dashboard");
		return "dashboard";
	}

	@RequestMapping(value = "/loggedin", method = RequestMethod.POST)
	public String loginModule(@ModelAttribute("user") User user, HttpSession session, Model model) {

		PasswordHashing passwordHashing = new PasswordHashing();
		User userByEmailAndPassword = userDao.getUserByEmailAndPassword(user.getEmail(),
				passwordHashing.doHashing(user.getPassword()));

		if (userByEmailAndPassword != null) {

			session.setAttribute("user", userByEmailAndPassword);
			return "redirect:/dashboard";
		} else {
			session.setAttribute("msg", new Message("Invalid Username or Password", "alert-danger"));
			return "login";
		}
	}

}
