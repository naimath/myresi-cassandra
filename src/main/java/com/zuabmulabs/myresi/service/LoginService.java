package com.zuabmulabs.myresi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zuabmulabs.myresi.controller.dao.LoginDAO;
import com.zuabmulabs.myresi.email.EmailSender;
import com.zuabmulabs.myresi.model.User;

@Service
public class LoginService {
	
	@Autowired
	LoginDAO loginDao;
	
	@Autowired
	EmailSender emailSender;
	



	public boolean resisterUser(User user) {
		if(loginDao.insertUser(user)){
		
			return true;
		}
		return false;
	}
	

	public boolean sendEmail(User user, String serverName, int port, String contextPath){
		String text = "Please click on below link to register ... "+"https://"+serverName+contextPath+"/registration/"+user.getActivationToken();
		emailSender.sendEmail("welcome@myresi.com",user.getEmail(), "Registration Request ...", text);
		return true;
	}
	
	public boolean validateRegistration(String token) {
		if(loginDao.validateRegistration(token)){
			return true;
		}
		return false;
		
	}

}
