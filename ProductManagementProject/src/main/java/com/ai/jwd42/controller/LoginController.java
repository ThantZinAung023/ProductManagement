package com.ai.jwd42.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {

		User user = new User();
		if (request.getSession().getAttribute("message") == null) {
			request.getSession().setAttribute("message", "Welcome");
			if (request.getCookies() != null) {
				for (Cookie ck : request.getCookies()) {
					if (ck.getName().equals("rememberUser")) {
						user.setEmail(ck.getValue());
						request.setAttribute("back", " back !");
					}
				}
			}
		} else {
			if (request.getCookies() != null) {
				for (Cookie ck : request.getCookies()) {
					if (ck.getName().equals("rememberUser")) {
						user.setEmail(ck.getValue());
					}
				}
			}
		}

		user.setLoginDateTime(new java.util.Date().toString());
		return new ModelAndView("login", "command", user);
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("SpringWeb") User user, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		if (userService.checkEmailandPassword(user.getEmail(), user.getPassword())) {

			if (user.isRememberMe()) {
				Cookie ck = new Cookie("rememberUser", user.getEmail());
				response.addCookie(ck);
			}

			request.getSession().setAttribute("loginDateTime", user.getLoginDateTime());
			request.getSession().setAttribute("username", user.getEmail());
			return "home";
		} else {
			request.getSession().setAttribute("error", "Username and Password are Incorrect!");
			return "redirect:/login";
		}
	}

	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		request.getSession().invalidate();
		request.getSession().setAttribute("message", "Bye !");
		return "redirect:/login";
	}

}
