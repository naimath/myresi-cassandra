package com.zuabmulabs.myresi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zuabmulabs.myresi.model.User;
import com.zuabmulabs.myresi.service.LoginService;
import com.zuabmulabs.myresi.service.UserService;
import com.zuabmulabs.myresi.util.Helper;

@Controller
public class UserController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/users/profile", method = RequestMethod.GET)
	public ModelAndView getProfile(HttpServletRequest request) {
		logger.info("Inside getProfile ..."
				+ request.getSession().getAttribute("email"));
		User user = userService.getProfile((String) request.getSession()
				.getAttribute("email"));
		ModelAndView modelAndView = new ModelAndView("profile");
		modelAndView.addObject("user", user);
		modelAndView.addObject("visibility", "inline");
		return modelAndView;
	}

	@RequestMapping(value = "/users/profile/{token:.+}", method = RequestMethod.GET)
	public ModelAndView getOthersProfile(HttpServletRequest request,	@PathVariable("token") String token) {

		User user = loginService.validateRegistration(token);

		request.getSession().setAttribute("otherEmail", user.getEmail());
		logger.info("Inside getOthersProfile ..." + user.getEmail());
		user= userService.getProfile(user.getEmail());
		ModelAndView modelAndView = new ModelAndView("profile");
		modelAndView.addObject("user", user);
		modelAndView.addObject("visibility", "none");

		return modelAndView;
	}

	@RequestMapping(value = "/users/mail", method = RequestMethod.POST)
	public @ResponseBody
	String sendUserMail(HttpServletRequest request,
			@RequestParam String subject, @RequestParam String message) {

		logger.info("Inside getOthersProfile ..."
				+ request.getSession().getAttribute("otherEmail"));
		try {
			userService.sendEmail(
					(String) request.getSession().getAttribute("otherEmail"),
					subject, message);
		} catch (Exception e) {
			logger.error(e);
			return "{\"error\":\"Error While Sending email\"}";
		}
		return "{\"success\":\"You've just taken the first step towards building your career!  In order to complete the setup of your account, please check your email for a confirmation link to start using MyResi.\"}";

	}

	@RequestMapping(value = "/users/firstlogin", method = RequestMethod.GET)
	public ModelAndView firstlogin(HttpServletRequest request) {
		// Rendered only if user has logged in for the first time, this is used
		// to collect and validate users information.
		// Will also be displayed if a user clicks on the link in the
		// registration
		// mail they were sent to validate registration.
		// Each slide on this page does a post to the server to save information
		// and will need success confirmation from server to display next slide.
		logger.info("Inside getProfile ..."
				+ request.getSession().getAttribute("email"));
		User user = userService.getProfile((String) request.getSession()
				.getAttribute("email"));
		ModelAndView modelAndView = new ModelAndView("firstlogin");
		modelAndView.addObject("user", user);
		return modelAndView;

	}

	@RequestMapping(value = "/users/firstLoginCompleted", method = RequestMethod.GET)
	public String firstLoginCompleted(HttpServletRequest request) {
		logger.info("Inside firstLoginCompleted ..."
				+ request.getSession().getAttribute("email"));
		String email = (String) request.getSession().getAttribute("email");

		userService.profileCompleted(email);

		return "redirect:/users/profile";
	}
	@RequestMapping(value = "/users/loginSuccess", method = RequestMethod.GET)
	public @ResponseBody String userLoginSuccess(HttpServletRequest request) {
		request.getSession().removeAttribute("otherEmail");
		
		if("Y".equals(request.getSession().getAttribute("profile"))){
			return "{\"redirect\":\"/SpringCassandra/users/firstlogin\"}";
		}else{
			return "{\"redirect\":\"/SpringCassandra/users/profile\"}";
		}
		
		
	}

	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public @ResponseBody
	String userLogin(@RequestParam String username,	@RequestParam String password,HttpServletRequest request) {
		logger.info("Inside userLogin ..."
				+ request.getSession().getAttribute("email"));
		User user = new User();
	
		user.setPassword(Helper.getMd5String(password));		
		user.setEmail(username);
		user = userService.verifyUser(user);
		if (user != null) {
			request.getSession().setAttribute("email", username);
			if (user.getProfileadded() != null	&& "Y".equals(user.getProfileadded())) {
				return "{\"redirect\":\"/SpringCassandra/users/profile\"}";
			} else {
				return "{\"redirect\":\"/SpringCassandra/users/firstlogin\"}";
			}
		} else {
			return "{\"failed\":\" Login failed either wrong password or not active\"}";
		}
	}

	@RequestMapping(value = "/users/editProfileInfo", method = RequestMethod.POST)
	public @ResponseBody
	String editProfile(HttpServletRequest request,
			@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String aboutMe, @RequestParam String city,
			@RequestParam String state, @RequestParam String country,
			@RequestParam String dateOfBirth, @RequestParam String position,
			@RequestParam String currentWorkplace, @RequestParam String workField,
			@RequestParam String educationalQualification, @RequestParam String otherEmail) {
		logger.info("Inside editProfile ..."
				+ request.getSession().getAttribute("email"));
		User user = new User();
		user.setEmail((String) request.getSession().getAttribute("email"));
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setAboutMe(aboutMe);
		user.setCity(city);
		user.setState(state);
		user.setCountry(country);
		user.setDateOfBirth(dateOfBirth);
		user.setPosition(position);
		user.setCurrentWorkplace(currentWorkplace);
		user.setWorkField(workField);
		user.setEducationalQualification(educationalQualification);
		
		if (userService.editProfile(user)) {
			return "{\"success\":\"Modificaion Successfull\"}";
		} else {
			return "{\"error\":\"Error in Edit Profile\"}";
		}
	}

	@RequestMapping(value = "/users/editprofile", method = RequestMethod.POST)
	public @ResponseBody String editProfile(HttpServletRequest request,@RequestParam String firstName,@RequestParam String lastName,@RequestParam String aboutMe,@RequestParam String city,@RequestParam  String state,@RequestParam  String country, ModelMap map) {
		logger.info("Inside editProfile ..."+request.getSession().getAttribute("email"));
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
	public @ResponseBody
	String editWork(HttpServletRequest request, @RequestParam String position,
			@RequestParam String currentWorkplace,
			@RequestParam String workField,
			@RequestParam String educationalQualification) {
		logger.info("Inside editWork ..."
				+ request.getSession().getAttribute("email"));
		User user = new User();
		user.setEmail((String) request.getSession().getAttribute("email"));
		user.setPosition(position);
		user.setCurrentWorkplace(currentWorkplace);
		user.setWorkField(workField);
		user.setEducationalQualification(educationalQualification);

		if (userService.editWork(user)) {
			return "{\"success\":\"Modificaion Successfull\"}";
		} else {
			return "{\"error\":\"Error in Edit Word\"}";
		}

	}

	@RequestMapping(value = "/users/editSkills", method = RequestMethod.POST)
	public @ResponseBody
	String editSkills(HttpServletRequest request,
			@RequestParam String expertSkills,
			@RequestParam String intermediateSkills,
			@RequestParam String familiarSkills) {
		logger.info("Editing Skills .."
				+ request.getSession().getAttribute("email"));
		User user = new User();
		user.setEmail((String) request.getSession().getAttribute("email"));
		user.setExpertSkills(expertSkills);
		user.setIntermediateSkills(intermediateSkills);
		user.setFamiliarSkills(familiarSkills);

		if (userService.editSkills(user)) {
			firstLoginCompleted(request);
			return "{\"success\":\"Modificaion Successfull\"}";
		
		} else {
			return "{\"error\":\"Error in Edit Skills\"}";
		}

	}

	@RequestMapping(value = "/users/search", method = RequestMethod.POST)
	public ModelAndView userSearch(HttpServletRequest request,
			@RequestParam String usersearchterm) {
		logger.info("Editing Skills .."
				+ request.getSession().getAttribute("email"));

		List<User> users = userService.userSearch(usersearchterm);
		ModelAndView modelAndView = new ModelAndView("searchResult");
		modelAndView.addObject("users", users);
		return modelAndView;

	}

	@RequestMapping(value = "/users/imageupload", method = RequestMethod.POST)
	public @ResponseBody
	String imageUpload(HttpServletRequest request,
			@RequestParam("file") MultipartFile file) throws IOException {
		logger.info("Editing Skills .."
				+ request.getSession().getAttribute("email"));
		User user = new User();
		user.setEmail((String) request.getSession().getAttribute("email"));
		user.setImage(file.getBytes());
		userService.imageUpload(user);

		// ByteBuffer fileByteBuffer = ByteBuffer.wrap( file.getBytes()) ;
		return "{\"success\":\"Modificaion Successfull\"}";

		/*
		 * if(userService.userSearch(user)==null){ return
		 * "{\"success\":\"Modificaion Successfull\"}"; }else{ return
		 * "{\"error\":\"Error in Edit Skills\"}"; }
		 */

	}
	
	
	@RequestMapping(value = "/users/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody String sendForgetPasswordEmail(@RequestParam  String forgetPasswordEmailAddress, HttpServletRequest request)	throws IOException {
		User user = userService.getProfile(forgetPasswordEmailAddress);
		if (user != null) {	
			userService.sendForgetPasswordEmail(user,request.getServerName(), request.getServerPort(),request.getContextPath());
			return "{\"success\":\"Forgot Password email sent\"}";		
		} else {
			return "{\"error\":\"Entered email is not valid\"}";
		}
		
	}
	
	
	@RequestMapping(value = "/users/forgotPassword/{token:.+}", method = RequestMethod.GET)
	public ModelAndView processForgotPassword(HttpServletRequest request,	@PathVariable("token") String token) {		
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("forgotPassword", "Y");
		modelAndView.addObject("token", token);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/users/setPassword", method = RequestMethod.POST)
	public @ResponseBody String setForgotPassword(@RequestParam  String newPassword, @RequestParam  String newPasswordConfirm ,@RequestParam  String token , HttpServletRequest request)	throws IOException {
		User user = loginService.validateRegistration(token);

		if (user != null) {	
			if(newPassword != null && newPasswordConfirm != null && newPasswordConfirm.equals(newPassword)){
				user.setPassword(Helper.getMd5String(newPassword));		
				userService.setPassword(user);
				return "{\"success\":\"Password Successfully Changed. Please login. \"}";	
			}else{
				return "{\"error\":\" New Password and Confirm Password do not match \"}";
			}
				
		} else {
			return "{\"error\":\"Error in setting the password \"}";
		}
		
	}
	
	@RequestMapping(value = "/users/image", method = RequestMethod.GET)
	public @ResponseBody
	void getImage(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
	
	
		String email = (String)request.getSession().getAttribute("otherEmail");
		if(email == null){
			email = (String) request.getSession().getAttribute("email");
		}
		logger.info("Getting Image .."+ email);
		User user = new User();
		user.setEmail(email);
		byte[] image = userService.getImage(user);

		response.setContentType("image/png"); // or whatever file type you want
												// to send.
		try {
			response.getOutputStream().write(image);
			response.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}

		/*
		 * InputStream in = new ByteArrayInputStream(image); BufferedImage
		 * bImageFromConvert = ImageIO.read(in);
		 * ImageIO.write(bImageFromConvert, "jpg", new
		 * File("c:/new-darksouls.jpg"));
		 */

		// ByteBuffer fileByteBuffer = ByteBuffer.wrap( file.getBytes()) ;
		// return "{\"success\":\"Modificaion Successfull\"}";

		/*
		 * if(userService.userSearch(user)==null){ return
		 * "{\"success\":\"Modificaion Successfull\"}"; }else{ return
		 * "{\"error\":\"Error in Edit Skills\"}"; }
		 */

	}

}