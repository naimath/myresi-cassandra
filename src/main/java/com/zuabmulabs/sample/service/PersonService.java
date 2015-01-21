package com.zuabmulabs.sample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zuabmulabs.sample.controller.dao.PersonDAO;

@Service
public class PersonService {
	
	@Autowired
	PersonDAO personDao;
	
	public void getPerson() {		
		personDao.getPerson();
	}

	public void insertPerson() {		
		personDao.insertPerson();
	}

	public void createPerson() {
		personDao.createPerson();
		
	}

}
