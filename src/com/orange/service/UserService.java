package com.orange.service;

import com.orange.domain.User;
import com.orange.exception.UserException;

public interface UserService {

	public void register(User user) throws UserException;

	public User login(User user) throws UserException;
	
	public User findUserByUserId(String userId);
	
}
