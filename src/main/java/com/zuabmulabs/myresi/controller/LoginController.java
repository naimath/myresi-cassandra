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
import org.springframework.web.servlet.ModelAndView;

import com.zuabmulabs.myresi.model.User;
import com.zuabmulabs.myresi.service.LoginService;
import com.zuabmulabs.myresi.util.Helper;

@Controller
public class LoginController {

	private static final Logger logger = Logger
			.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	// -----------------------------------------------------------------------Routing
	// for myResi
	// UI----------------------------------------------------------------

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String welcome(ModelMap map) {
		// Mostly static home page.
		return "home";
	}

	@RequestMapping(value = "/user/{url}", method = RequestMethod.GET)
	public String profileurl(ModelMap map) {
		// Rendered only if user is logged in. Can see profile of the person
		// whose URL matches.
		// The URL will be auto generated for that user on registration, but
		// they can edit that URL so it can be what they want.
		return "profile";
	}

	@RequestMapping(value = "/profilepartial", method = RequestMethod.GET)
	public String profilepartial(ModelMap map) {
		// Rendered only if user is NOT logged in.
		// Also this template will be used to display the search results if a
		// user searches the site for other users.
		return "profilepartial";
	}


    @RequestMapping(value = "/header", method = RequestMethod.GET)
    public String header(ModelMap map) {
        // Header Template.
        return "header";
    }

    @RequestMapping(value = "/loggedinheader", method = RequestMethod.GET)
    public String loggedinheader(ModelMap map) {
        // Header Template.
        return "loggedinheader";
    }

    @RequestMapping(value = "/footer", method = RequestMethod.GET)
    public String footer(ModelMap map) {
        // footer Template.
        return "footer";
    }

    @RequestMapping(value = "/sidebar", method = RequestMethod.GET)
    public String sidebar(ModelMap map) {
        // Rendered only if user is NOT logged in.
        // Also this template will be used to display the search results if a user searches the site for other users.
        return "sidebar";
    }

    @RequestMapping(value = "/lightboxes", method = RequestMethod.GET)
    public String lightboxes(ModelMap map) {
        // Rendered only if user is NOT logged in.
        // Also this template will be used to display the search results if a user searches the site for other users.
        return "lightboxes";
    }

    @RequestMapping(value = "/myaccount", method = RequestMethod.GET)
    public String myaccount(ModelMap map) {
        // My Account Page.
        return "myaccount";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String userhome(ModelMap map) {
        // My Account Page.
        return "welcome";
    }

	// -----------------------------------------------------------------------End
	// routing for myResi
	// UI----------------------------------------------------------------

	@RequestMapping(value = { "/logoutPage", "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("otherEmail");
		request.getSession().removeAttribute("email");

		request.getSession().invalidate();
		return "logout";
	}

	/*
	 * @RequestMapping(value="/{name}", method = RequestMethod.GET) public
	 * String getMovie(@PathVariable String name, ModelMap model) {
	 * model.addAttribute("movie", name); return "list"; /loginPage }
	 */

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView getLoginPage(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("home");
		String auth = (String) request.getParameter("auth");
		if ("fail".equals(auth)) {
			modelAndView.addObject("fail", "Y");
		}

		modelAndView.addObject("userLoggedIn", "N");
		return modelAndView;
	}

	@RequestMapping(value = "/registration/{token}", method = RequestMethod.GET)
	public ModelAndView validateRegistration(@PathVariable String token,
			HttpServletRequest request) {
		User user = loginService.validateRegistration(token);
		ModelAndView modelAndView = new ModelAndView("firstlogin");
		if (user != null) {
			request.getSession().setAttribute("email", user.getEmail());
			modelAndView.addObject("user", user);
		} else {
			modelAndView.addObject("user", null);
		}
		return modelAndView;

	}

	@RequestMapping(value = "/users/register", method = RequestMethod.POST)
	public @ResponseBody
	String userRegistraion(HttpServletRequest request,
			@RequestParam String firstName, @RequestParam String lastName,
			@RequestParam String email, @RequestParam String password,
			ModelMap map) {
		User user = new User();
		String uuid = UUID.randomUUID().toString();
		if (firstName != null) {
			user.setFirstName(firstName.toLowerCase());
		}
		if (lastName != null) {
			user.setLastName(lastName.toLowerCase());
		}
		if (firstName != null && lastName != null) {
			user.setFullName(firstName + " " + lastName);
		}

		

		user.setPassword(Helper.getMd5String(password));
		
		user.setEmail(email);
		user.setActivationToken(uuid);
		user.setActivate("N");

		if (loginService.resisterUser(user)) {
			if (loginService
					.sendEmail(
							user,
							request.getServerName(),
							request.getServerPort(),
							request.getContextPath(),
							request.getSession()
									.getServletContext()
									.getRealPath(
											"/WEB-INF/pages/UserContactEmail.html"))) {
				return "{\"success\":\"You've just taken the first step towards building your career!  In order to complete the setup of your account, please check your email for a confirmation link to start using MyResi\"}";
			} else {
				return "{\"error\":\"Error in sending mail\"}";
			}

		} else {
			return "{\"error\":\"Error in registration\"}";
		}
	}

}