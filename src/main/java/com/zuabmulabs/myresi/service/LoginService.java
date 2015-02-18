package com.zuabmulabs.myresi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zuabmulabs.myresi.controller.dao.LoginDAO;
import com.zuabmulabs.myresi.controller.dao.Person;
import com.zuabmulabs.myresi.email.EmailSender;
import com.zuabmulabs.myresi.model.User;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO loginDao;
	
	@Autowired
	EmailSender emailSender;
	
	public Person getPerson() {		
		return loginDao.getPerson();
	}

	public void insertPerson() {		
		loginDao.insertPerson();
	}

	public void createPerson() {
		loginDao.createPerson();
		
	}

	public boolean resisterUser(User user) {
		if(loginDao.insertUser(user)){
			String text = "Please click on below link to register ... "+"http://localhost:8080/SpringCassandra/registration/"+user.getActivationToken();
			emailSender.sendEmail("nullah@pdxinc.com",user.getEmail(), "Registration Request ...", text);
			return true;
		}
		return false;
	}
	
	public boolean verifyUser(User user) {
		if(loginDao.verifyUser(user)){
			return true;
		}
		return false;
	}

	public boolean validateRegistration(String token) {
		if(loginDao.validateRegistration(token)){
			return true;
		}
		return false;
		
	}

}
