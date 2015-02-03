package com.zuabmulabs.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zuabmulabs.sample.controller.dao.Person;
import com.zuabmulabs.sample.service.PersonService;

@Controller
@RequestMapping("/person")
public class PersonController {

	
	@Autowired
	private PersonService personService;
//-----------------------------------------------------------------------Routing for myResi UI----------------------------------------------------------------
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String welcome(ModelMap map) {
		// Mostly static home page.
		return "index";
	}

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(ModelMap map) {
        // Mostly static home page.
        return "profile";
    }


	@RequestMapping(value = "/firstlogin", method = RequestMethod.GET)
	public String firstlogin(ModelMap map) {
		// Rendered only if user has logged in for the first time, this is used to collect and validate users information. 
		// Will also be displayed if a user clicks on the link in the registration 
		// mail they were sent to validate registration.
		// Each slide on this page does a post to the server to save information and will need success confirmation from server to display next slide. 
		return "firstlogin";
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(ModelMap map) {
		// Rendered only if user had logged in. Can see his own profile only.
		return "profile";
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
	
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public String getPerson(ModelMap map){
		Person person =personService.getPerson();
		map.addAttribute("person", person);
		return "list";
	}
	
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insertPerson(ModelMap map){
		personService.insertPerson();
		return "list";
	
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createPerson(ModelMap map){
		personService.createPerson();
		return "list";
	
	}
	

	@RequestMapping(value="/{name}", method = RequestMethod.GET)
	public String getMovie(@PathVariable String name, ModelMap model) {
		model.addAttribute("movie", name);
		return "list";

	}
	
}