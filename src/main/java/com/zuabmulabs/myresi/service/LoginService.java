package com.zuabmulabs.myresi.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zuabmulabs.myresi.controller.LoginController;
import com.zuabmulabs.myresi.controller.dao.LoginDAO;
import com.zuabmulabs.myresi.email.EmailSender;
import com.zuabmulabs.myresi.model.User;

@Service
public class LoginService {
	private static final Logger logger = Logger.getLogger(LoginController.class);
	
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
	

	public boolean sendEmail(User user, String serverName, int port, String contextPath, String filepath){
		String linkMessage = "You are just a click away from building your new profile on MyResi!  Please click the confirmation link below to complete your account creation.<br/>"+"http://"+serverName+":"+port+contextPath+"/registration/"+user.getActivationToken();
		logger.info(filepath);
		
		try {
			String fileContent = IOUtils.toString(new FileInputStream(new File(filepath)), "UTF-8");
			fileContent= fileContent.replaceFirst("req.body.firstName", user.getFirstName());	
			//fileContent= fileContent.replaceFirst("req.body.lastName", user.getLastName());
			fileContent= fileContent.replaceFirst("req.body.message",linkMessage);
			
			return emailSender.sendEmail("welcome@myresi.com",user.getEmail(), "MyResi Account Confirmation", fileContent);
		} catch (FileNotFoundException e) {
			logger.error(e);
		} catch (IOException e) {
			logger.error(e);
		}
		
		return false;
		
	}
	

	public User validateRegistration(String token) {
		return loginDao.validateRegistration(token) ;
		
	}

}
