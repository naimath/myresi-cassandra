package com.zuabmulabs.myresi.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zuabmulabs.myresi.model.User;
import com.zuabmulabs.myresi.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	@RequestMapping(value="/users/profile", method = RequestMethod.GET)
	public ModelAndView getProfile(HttpServletRequest request) {		
	
		User user= userService.getProfile((String)request.getSession().getAttribute("email"));		
		ModelAndView modelAndView = new ModelAndView("profile");		
		modelAndView.addObject("user", user); 
		return modelAndView;		
	}
	
	@RequestMapping(value = "/users/firstlogin", method = RequestMethod.GET)
	public String firstlogin(ModelMap map) {
		// Rendered only if user has logged in for the first time, this is used to collect and validate users information. 
		// Will also be displayed if a user clicks on the link in the registration 
		// mail they were sent to validate registration.
		// Each slide on this page does a post to the server to save information and will need success confirmation from server to display next slide. 
		return "firstlogin";
	}
	
	@RequestMapping(value = "/users/firstLoginCompleted", method = RequestMethod.GET)
	public String firstLoginCompleted(HttpServletRequest request) {
		 String email = (String)request.getSession().getAttribute("email");
		
		 userService.profileCompleted(email);
		
		return "redirect:/users/profile";
	}
	
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public @ResponseBody String userLogin(@RequestParam String username,@RequestParam String password,ModelMap map,HttpServletRequest request) {
		User user = new User();
		user.setPassword(password);
		user.setEmail(username);
		user = userService.verifyUser(user);
		if(user !=null){
			request.getSession().setAttribute("email", username);
			if(user.getProfileadded()!=null && "Y".equals(user.getProfileadded())){
				return "{\"redirect\":\"/SpringCassandra/users/profile\"}";		
			}else{
				return "{\"redirect\":\"/SpringCassandra/users/firstlogin\"}";		
			}
		}else{						
			return "{\"failed\":\" Login failed either wrong password or not active\"}";
		}
	}
	
	
	@RequestMapping(value = "/users/editprofile", method = RequestMethod.POST)
	public @ResponseBody String editProfile(HttpServletRequest request,@RequestParam String firstName,@RequestParam String lastName,@RequestParam String aboutMe,@RequestParam String city,@RequestParam  String state,@RequestParam  String country, ModelMap map) {
		User user = new User();
		user.setEmail((String)request.getSession().getAttribute("email"));
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setAboutMe(aboutMe);
		user.setCity(city);
		user.setState(state);
		user.setCountry(country);
		if(userService.editProfile(user)){			
			return "{\"success\":\"Modificaion Successfull\"}";
		}else{						
			return "{\"error\":\"Error in Edit Profile\"}";
		}		
	}
	
	
	@RequestMapping(value = "/users/editwork", method = RequestMethod.POST)
	public @ResponseBody String editWork(HttpServletRequest request,@RequestParam String position,@RequestParam String currentWorkplace,@RequestParam  String workField,@RequestParam  String educationalQualification) {
		User user = new User();
		user.setEmail((String)request.getSession().getAttribute("email"));
		user.setPosition(position);
		user.setCurrentWorkplace(currentWorkplace);
		user.setWorkField(workField);
		user.setEducationalQualification(educationalQualification);
		
		if(userService.editWork(user)){			
			return "{\"success\":\"Modificaion Successfull\"}";
		}else{						
			return "{\"error\":\"Error in Edit Word\"}";
		}	
		
	}
	
	@RequestMapping(value = "/users/editSkills", method = RequestMethod.POST)
	public @ResponseBody String editSkills(HttpServletRequest request,@RequestParam String expertSkills,@RequestParam String intermediateSkills,@RequestParam  String familiarSkills) {
		logger.info("Editing Skills");
		User user = new User();
		user.setEmail((String)request.getSession().getAttribute("email"));
		user.setExpertSkills(expertSkills);
		user.setIntermediateSkills(intermediateSkills);
		user.setFamiliarSkills(familiarSkills);
			
		if(userService.editSkills(user)){			
			return "{\"success\":\"Modificaion Successfull\"}";
		}else{						
			return "{\"error\":\"Error in Edit Skills\"}";
		}	
		
	}
	
	
}