package com.cgm.sdata.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cgm.sdata.domain.User;
import com.cgm.sdata.dto.ServiceResponse;
import com.cgm.sdata.repository.UserDAO;

@RestController
public class UserController {

	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	protected ModelAndView getUser(@PathVariable Long id, HttpServletRequest request) throws Exception {
		User loggedUser = userDAO.findByName(((User)request.getSession().getAttribute("LOGGEDIN_USER")).getUsername());
		User followedUser = userDAO.findById(id);
		List<User> friendsList = loggedUser.getFriends();
		friendsList.add(followedUser);
		loggedUser.setFriends(friendsList);
		userDAO.update(loggedUser);
		return new ModelAndView("redirect:/friends");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView getLogin() {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public User Login(@RequestBody User user, HttpServletRequest request) {
		User foundUser = null;
		foundUser = userDAO.findByName(user.getUsername());
		
		if(foundUser.getPassword().equals(user.getPassword())) {
			request.getSession().setAttribute("LOGGEDIN_USER", user);
		}
		return foundUser;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView Logout(HttpServletRequest request) {
		request.getSession().setAttribute("LOGGEDIN_USER", null);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/getfriends", method = RequestMethod.GET)
	@ResponseBody
	public List<User> getFriends() throws Exception {
		return userDAO.findAll();
	}
	
	@RequestMapping(value = "/friends", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView friends() throws Exception {
		return new ModelAndView("friends");
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	@ResponseBody
	public ServiceResponse findUser(@RequestBody String username) {
		ServiceResponse sr = new ServiceResponse();
		
		String un = username.substring(1, username.length() - 1);
		User user = userDAO.findByName(un);
		if(user.getUsername() != null) {
			sr.setMessage("User found!");
		} 
		return sr;
	}
	
	@RequestMapping(value = "/getmain", method = RequestMethod.GET)
	@ResponseBody
	public List<User> friendList(HttpServletRequest request){
		User user = userDAO.findByName(((User)request.getSession().getAttribute("LOGGEDIN_USER")).getUsername());
		List<User> friends = user.getFriends();
		return friends;
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView main() throws Exception {
		return new ModelAndView("main");
	}
}
