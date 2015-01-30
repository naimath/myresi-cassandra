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