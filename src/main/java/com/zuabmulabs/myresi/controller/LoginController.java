package com.zuabmulabs.myresi.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zuabmulabs.myresi.model.User;
import com.zuabmulabs.myresi.service.LoginService;




@Controller
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;
//-----------------------------------------------------------------------Routing for myResi UI----------------------------------------------------------------
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String welcome(ModelMap map) {
		// Mostly static home page.
		return "home";
	}
	
	
	@RequestMapping(value = "/user/{url}", method = RequestMethod.GET)
	public String profileurl(ModelMap map) {
		// Rendered only if user is logged in. Can see profile of the person whose URL matches.
		// The URL will be auto generated for that user on registration, but they can edit that URL so it can be what they want.
		return "profile";
	}
	
	
	@RequestMapping(value = "/profilepartial", method = RequestMethod.GET)
	public String profilepartial(ModelMap map) {
		// Rendered only if user is NOT logged in. 
		// Also this template will be used to display the search results if a user searches the site for other users.
		return "profilepartial";
	}
	
//-----------------------------------------------------------------------End routing for myResi UI----------------------------------------------------------------
	
	
	
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "logout";
	}

	@RequestMapping(value="/{name}", method = RequestMethod.GET)
	public String getMovie(@PathVariable String name, ModelMap model) {
		model.addAttribute("movie", name);
		return "list";

	}
	
	
	@RequestMapping(value="/registration/{token}", method = RequestMethod.GET)
	public @ResponseBody String validateRegistration(@PathVariable String token) {	
		loginService.validateRegistration(token);
		return "Successfully Validated";
	}
	
	@RequestMapping(value = "/users/register", method = RequestMethod.POST)
	public @ResponseBody String userRegistraion(HttpServletRequest request,@RequestParam String firstName,@RequestParam String lastName,@RequestParam String email,@RequestParam String password,ModelMap map) {
		User user = new User();
		String uuid = UUID.randomUUID().toString();

		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPassword(password);
		user.setEmail(email);
		user.setActivationToken(uuid);
		user.setActivate("N");
		
		
		if(loginService.resisterUser(user)){	
			if(loginService.sendEmail(user,request.getServerName(), request.getServerPort(),request.getContextPath())){
				return "{\"success\":\"Mail sent, Registration successfull\"}";
			}else{
				return "{\"error\":\"Error in sending mail\"}";
			}
			
		}else{						
			return "{\"error\":\"Error in registration\"}";
		}
	}
	
	
}