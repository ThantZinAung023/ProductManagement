package com.ai.jwd42.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ai.jwd42.dto.User;
import com.ai.jwd42.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView user(ModelMap model, HttpServletRequest request) throws IOException {

		if (request.getSession().getAttribute("username") == null) {
			return new ModelAndView("redirect:/login");
		} else {
			User user = new User();
			model.addAttribute("users", userService.findAllUser());
			return new ModelAndView("user", "command", user);
		}
	}

	@RequestMapping(value = { "/updateUser" }, method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("SpringWeb") User user, HttpServletRequest request) throws IOException {

		if (userService.checkEmailAlreadyExistAtUpdate(user.getEmail(), user.getId())) {
			request.getSession().setAttribute("message", "Email is Already exists!");
			return "redirect:/user";
		} else if (userService.checkPhoneNumberAlreadyExistAtUpdate(user.getPhoneNumber(), user.getId())) {
			request.getSession().setAttribute("message", "Phone Number is Already Exist!");
			return "redirect:/user";
		} else {
			userService.updateUser(user);
			request.getSession().setAttribute("message", "Success User Update !");
			return "redirect:/user";
		}
	}

	@RequestMapping(value = { "/deleteUser" }, method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute("SpringWeb") User user, HttpServletRequest request) throws IOException {

		userService.deleteUser(user.getId());
		request.getSession().setAttribute("message", "Delete User Success!");
		return "redirect:/user";
	}

	@RequestMapping(value = { "/changeUser" }, method = RequestMethod.POST)
	public String changeUser(@ModelAttribute("SpringWeb") User user, HttpServletRequest request) throws IOException {

		if (!user.getNewPassword().equals(user.getComfirmPassword())) {
			request.getSession().setAttribute("message", "New Password and Comfirm Password are not match!");
			return "redirect:/user";
		} else {
			if (userService.checkPassword(user.getPassword(), user.getId())) {

				userService.changePassword(user.getNewPassword(), user.getId());
				request.getSession().setAttribute("message", "Success Change Password!");
				return "redirect:/user";
			} else {
				request.getSession().setAttribute("message", "Old Password is not correct!");
				return "redirect:/user";
			}
		}
	}

	@RequestMapping(value = { "/addUser" }, method = RequestMethod.POST)
	public String addUser(@ModelAttribute("SpringWeb") User user, HttpServletRequest request) throws IOException {

		if (!user.getPassword().equals(user.getComfirmPassword())) {
			request.getSession().setAttribute("registerMessage", "Password and Comfirm Password are not match!");
			return "redirect:/login";
		} else if (userService.checkEmailAlreadyExist(user.getEmail())) {
			request.getSession().setAttribute("registerMessage", "Register Email is Already Exist!");
			return "redirect:/login";
		} else if (userService.checkPhoneNumberAlreadyExist(user.getPhoneNumber())) {
			request.getSession().setAttribute("registerMessage", "Register Phone Number is Already Exist!");
			return "redirect:/login";
		} else {
			userService.insertUser(user);
			request.getSession().setAttribute("registerMessage", "Registration Success!");
			return "redirect:/login";
		}
	}
}
