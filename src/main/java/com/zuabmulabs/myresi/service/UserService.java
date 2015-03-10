package com.zuabmulabs.myresi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zuabmulabs.myresi.controller.dao.UserDAO;
import com.zuabmulabs.myresi.model.User;

@Service
public class UserService {
	
	@Autowired
	UserDAO userDao;
	
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
	
	public User userSearch(User user) {
		return userDao.userSearch(user);
	}
}
