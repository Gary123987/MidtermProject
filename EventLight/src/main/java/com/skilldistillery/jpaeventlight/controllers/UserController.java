package com.skilldistillery.jpaeventlight.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpaeventlight.data.UserDAO;
import com.skilldistillery.jpaeventlight.entities.Event;
import com.skilldistillery.jpaeventlight.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@GetMapping(path = { "/", "home.do" })
	private String home(Model model) {
		User TEST = userDao.findByUsernameAndPassword("admin", "1234");
		model.addAttribute("SMOKETEST", TEST);
//		model.addAttribute("eventList", userDao.findAllEvents());
		return "home";
	}

//	@GetMapping(path = {"/", "home.do"})
//	private String home(Model model) {
//		model.addAttribute("eventList", userDao.findAllEvents());
//		return "home";
//	}
	@GetMapping(path = "listAll.do")
	public String listAllEvents(Model model) {
		List<Event> events = userDao.findAllEvents();
		model.addAttribute(events);
		return "listAllEvents";
	}

	@GetMapping("login.do")
	public ModelAndView userLogin(String userName, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = userDao.findByUsernameAndPassword(userName, password);
		session.setAttribute("user", user);
		if (user.getRole().equals("att")) {
			mv.setViewName("User-att-home");
		}
		else if (user.getRole().equals("vo")) {
			mv.setViewName("User-vo-home");
		}
		else if (user == null) {
			mv.setViewName("SignInFailiure");
		}
		return mv;
	}

	@GetMapping(path = "logout.do")
	public ModelAndView userLogOut(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user");
		mv.setViewName("index");
		return mv;
	}

	@GetMapping(path = "favorites.do")
	public ModelAndView showByUserFavorites() {
		return null;
		// todo
	}

	@GetMapping(path = "createArtist.do")
	public ModelAndView createArtist() {
		return null;
	}

	@GetMapping(path = "createBand.do")
	public ModelAndView createBand() {
		return null;
	}

	@GetMapping(path = "createVenue.do")
	public ModelAndView createVenue() {
		return null;
	}

	@GetMapping(path = "createEvent.do")
	public ModelAndView createEvent() {
		return null;
	}

	@GetMapping(path = "updateArtist.do")
	public ModelAndView updateArtist() {
		return null;
	}

	@GetMapping(path = "updateBand.do")
	public ModelAndView updateBand() {
		return null;
	}

	@GetMapping(path = "updateVenue.do")
	public ModelAndView updateVenue() {
		return null;
	}

	@GetMapping(path = "updateEvent.do")
	public ModelAndView updateEvent() {
		return null;
	}

	@GetMapping(path = "deleteArtist.do")
	public ModelAndView deleteArtist() {
		return null;
	}

	@GetMapping(path = "deleteBand.do")
	public ModelAndView deleteBand() {
		return null;
	}

	@GetMapping(path = "deleteVenue.do")
	public ModelAndView deleteVenue() {
		return null;
	}

	@GetMapping(path = "deleteEvent.do")
	public ModelAndView deleteEvent() {
		return null;
	}

	@GetMapping(path = "signUp.do")
	public ModelAndView signUp() {
		return null;
	}

	@GetMapping(path = "filter.do")
	public ModelAndView filterBy() {
		return null;
	}

}
