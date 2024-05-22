package com.smsb.dao;

import com.smsb.entities.User;

public interface UserDao {
	
	boolean registerUser(User user);
	User getUserByEmailAndPassword(String email, String password);
}
