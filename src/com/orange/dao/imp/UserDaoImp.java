package com.orange.dao.imp;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.orange.dao.UserDao;
import com.orange.domain.User;
import com.orange.utils.C3P0Util;

public class UserDaoImp implements UserDao {

	/*
	 * 添加用户
	 * @see com.orange.dao.UserDao#addUser(com.orange.domain.User)
	 */
	@Override
	public void addUser(User user) throws SQLException {
		
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		qr.update("INSERT INTO USER VALUES(?, ?, ?, ?, ?)", user.getUserId(), user.getUsername(), user.getPassword(), user.getEmail(), user.getRole());
		
	}

	@Override
	public User findUserByUserNameAndPassword(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from user where username=? and password=?",
				new BeanHandler<User>(User.class), user.getUsername(), user.getPassword());

	}

	@Override
	public User findUserByUserId(String userId) throws SQLException {

		QueryRunner qr = new QueryRunner(C3P0Util.getDataSource());
		return qr.query("select * from user where userId=?", new BeanHandler<User>(User.class), userId);
	}
	
	

}
