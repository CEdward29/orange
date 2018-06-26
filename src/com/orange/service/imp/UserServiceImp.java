package com.orange.service.imp;

import java.sql.SQLException;

import com.orange.dao.UserDao;
import com.orange.dao.imp.UserDaoImp;
import com.orange.domain.User;
import com.orange.exception.UserException;
import com.orange.service.UserService;

public class UserServiceImp implements UserService{

	UserDao ud = new UserDaoImp();
	
	@Override
	public void register(User user) throws UserException{
		try {
			ud.addUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("添加用户失败");
		}
	}

	@Override
	public User login(User user) throws UserException {
		try {
			return ud.findUserByUserNameAndPassword(user);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("用户名或密码错误");
		}
	}

	@Override
	public User findUserByUserId(String userId) {
		
		try {
			return ud.findUserByUserId(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}









