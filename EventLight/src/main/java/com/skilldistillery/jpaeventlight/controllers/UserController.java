package com.skilldistillery.jpaeventlight.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpaeventlight.data.UserDAO;
import com.skilldistillery.jpaeventlight.entities.Address;
import com.skilldistillery.jpaeventlight.entities.Event;
import com.skilldistillery.jpaeventlight.entities.User;
import com.skilldistillery.jpaeventlight.entities.Venue;

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

	@RequestMapping("login.do")
	public String userLogin(Model model, HttpSession session, @RequestParam("username") String userName,
			@RequestParam("password") String password) {
		User user = userDao.findByUsernameAndPassword(userName, password);
		session.setAttribute("user", user);
		model.addAttribute("user", user);
		if (user != null) {
			if (user.getRole().equals("att")) {
				return "User-att-home";
			} else if (user.getRole().equals("vo")) {
				return "User-vo-home";
			}
		}
		return "SignInFailiure";

	}

	@RequestMapping(path = "loginpage.do")
	public String signInPage() {
		return "SignIn";
	}
	@RequestMapping(path = "updateVenuePage.do")
	public String updateVenuePage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Venue venue = user.getVenue();
		session.setAttribute("venue", venue);
		return "UpdateVenue";
	}
	@RequestMapping(path = "goHome.do")
	public String goToHome(HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		if (user != null) {
			if (user.getRole().equals("att")) {
				return "User-att-home";
			} else if (user.getRole().equals("vo")) {
				return "User-vo-home";
			}
		}
		return "home";
	}

	@GetMapping(path = "logout.do")
	public String userLogOut(HttpSession session) {
		session.removeAttribute("user");
		return "home";
	}
	
	@RequestMapping(path = "SignUpPage.do")
	public String signUpPage() {
		return "SignUp";
	}
	
	@RequestMapping(path = "signUp.do")
	public String signUp(HttpSession session, Model model,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("role") String role,
			@RequestParam("firstName") String fName,
			@RequestParam("lastName") String lName,
			@RequestParam("profilePicture") String profilePicture,
			@RequestParam("aboutMe") String aboutMe,
			@RequestParam("street") String street,
			@RequestParam("city") String city,
			@RequestParam("state") String state,
			@RequestParam("zip") String zip){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setRole(role);
		user.setFirstName(fName);
		user.setLastName(lName);
		user.setProfilePicture(profilePicture);
		user.setAboutMe(aboutMe);
		user.setCreatedAt(LocalDateTime.now());
		user.setEnabled(true);

		
		Address address = new Address();
		address.setCity(city);
		address.setState(state);
		address.setStreet(street);
		address.setZip(zip);
		
		user.setAddress(address);

		user = userDao.signUp(user, address);
		session.setAttribute("user", user);
		
		//CREATE A PAGE TELLING THE USER THAT THE USERNAME WAS CREATED!!!!

		return "home";
	}
	
	@PostMapping(path = "createVenue.do")
	public String createVenue(HttpSession session, 
			@RequestParam("name") String name,
			@RequestParam("description") String description,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("picture") String picture,
			@RequestParam("logo") String logo,
			@RequestParam("street") String street,
			@RequestParam("city") String city,
			@RequestParam("state") String state,
			@RequestParam("zip") String zip) {
		
		Venue venue = new Venue();
		venue.setName(name);
		venue.setDescription(description);
		venue.setPhoneNumber(phoneNumber);
		venue.setPicture(picture);
		venue.setPictureLogo(logo);
		
		Address address = new Address();
		address.setStreet(street);
		address.setCity(city);
		address.setState(state);
		address.setZip(zip);
		
		venue.setAddress(address);
		
		User user = (User) session.getAttribute("user");
		venue.setUser(user);

		venue = userDao.createVenue(venue, address);
		
		session.setAttribute("venue", venue);
		return "User-vo-home";
	}
	
	
	@PostMapping(path = "updateVenue.do")
	public String updateVenue(HttpSession session,
			@RequestParam("name") String name,
			@RequestParam("description") String description,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("picture") String picture,
			@RequestParam("logo") String logo,
			@RequestParam("street") String street,
			@RequestParam("city") String city,
			@RequestParam("state") String state,
			@RequestParam("zip") String zip) {
		Venue existingVenue = (Venue) session.getAttribute("venue");
		existingVenue.setName(name);
		existingVenue.setDescription(description);
		existingVenue.setPhoneNumber(phoneNumber);
		existingVenue.setPicture(picture);
		existingVenue.setPictureLogo(logo);
		
		Address existingAddress = existingVenue.getAddress();
		existingAddress.setStreet(street);
		existingAddress.setCity(city);
		existingAddress.setState(state);
		existingAddress.setZip(zip);
		
		userDao.updateAddress(existingAddress);
		userDao.updateVenue(existingVenue);
		return "User-vo-home";
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


	@GetMapping(path = "filter.do")
	public ModelAndView filterBy() {
		return null;
	}

}
