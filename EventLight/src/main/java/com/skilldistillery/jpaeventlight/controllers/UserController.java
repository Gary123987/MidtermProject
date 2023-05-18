package com.skilldistillery.jpaeventlight.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.jpaeventlight.data.UserDAO;
import com.skilldistillery.jpaeventlight.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do"})
	private String home(Model model) {
		User TEST= userDao.findByUsernameAndPassword("admin", "1234");
		model.addAttribute("SMOKETEST", TEST);
		return "home";
	}
}
