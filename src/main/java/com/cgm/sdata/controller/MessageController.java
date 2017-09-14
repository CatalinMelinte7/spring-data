package com.cgm.sdata.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cgm.sdata.domain.Message;
import com.cgm.sdata.domain.User;
import com.cgm.sdata.repository.MessageDAO;
import com.cgm.sdata.repository.UserDAO;

@RestController
public class MessageController {

	@Autowired
	MessageDAO messageDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/getmessages", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List<Message>> getMessages() throws Exception {
		List<User> userList = userDAO.findAll();
		
		Map<String, List<Message>> messageMap = new HashMap<String, List<Message>>();
		for(User user : userList) {
			messageMap.put(user.getUsername(), user.getMessages());
		}
		return messageMap;
	}
	
	@RequestMapping(value = "/messages", method = RequestMethod.GET)
	public ModelAndView getMessagePage() throws Exception{
		return new ModelAndView("messages");
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public Message postMessage(@RequestBody String content, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("LOGGEDIN_USER");
		String message = content.substring(1, content.length() - 1);
		
		Message msg = new Message();
		msg.setTxt(message);
		msg.setUser(userDAO.findByName(user.getUsername()));
		
		messageDAO.update(msg);
		
		return msg;
	}
}
