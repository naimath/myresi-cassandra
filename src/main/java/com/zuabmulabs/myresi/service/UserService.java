package com.zuabmulabs.myresi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.zuabmulabs.myresi.controller.dao.UserDAO;
import com.zuabmulabs.myresi.email.EmailSender;
import com.zuabmulabs.myresi.model.User;

@Service
public class UserService {
	
	@Autowired
	UserDAO userDao;
	@Autowired
	EmailSender emailSender;
	
	public User verifyUser(User user) {
		return userDao.verifyUser(user);
		
	}

	public boolean editProfile(User user) {
		return userDao.editProfle(user);
		
	}

	public boolean editWork(User user) {
		return userDao.editWork(user);
		
	}

	public boolean editSkills(User user) {
		return userDao.editSkills(user);
	}

	public User getProfile(String email) {
		return userDao.getProfile(email);
		
	}

	public void profileCompleted(String email) {
		userDao.profileCompleted(email);
		
	}
	
	public List<User> userSearch(String usersearchterm) {
		return userDao.userSearch(usersearchterm);
	}

	public boolean imageUpload(User user) {		
		return userDao.imageUpload(user);
	}

	public byte[] getImage(User user) {
		return userDao.getImage(user);
	
	}
	
	public boolean sendEmail(String toAddress, String subject, String text){
		((JavaMailSenderImpl)emailSender.getMailSender()) .setUsername("welcome@myresi.com");
		((JavaMailSenderImpl)emailSender.getMailSender()) .setPassword("MyR351Activate!");
		emailSender.sendEmail("welcome@myresi.com",toAddress, subject, text);
		return true;
	}

	public boolean sendForgetPasswordEmail(User user, String serverName, int port, String contextPath) {
		String linkMessage = " Please click the forgot link below <br/>"+"http://"+serverName+":"+port+contextPath+"/users/forgotPassword/"+user.getActivationToken();
		((JavaMailSenderImpl)emailSender.getMailSender()) .setUsername("noreply@myresi.com");
		((JavaMailSenderImpl)emailSender.getMailSender()) .setPassword("MyR35!N0R3ply$");
		
		
		emailSender.sendEmail("noreply@myresi.com",user.getEmail(), "Forgot Pasword ", linkMessage);
		return true;
		
	}

	public boolean setPassword(User user) {
		return userDao.setPassword(user);
	}
}
